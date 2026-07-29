#!/usr/bin/env bash
# =====================================================================
# pruefe-flows.sh — Sitzungsende-Pruefung fuer die Flow-Blaetter.
#
# Zweck: Wurde eine Datei geaendert, die im Frontmatter (entrypoints:) eines
# Blatts unter _flow/*.md steht, OHNE dass dieses Blatt selbst angefasst
# wurde, haengt das Skript eine datierte Zeile an _flow/OFFEN.md — als
# Erinnerung, das Blatt nachzuziehen.
#
# NIE blockierend: exit 0 auf jedem Pfad. Ein Hook, der Sitzungen stoert,
# wird abgeschaltet und nuetzt dann niemandem.
#
# Aufruf:
#   ohne Argument -> Terminal: Klartext | Pipe (Hook): JSON systemMessage
#   --json        -> JSON erzwingen
#   --trocken     -> nur anzeigen, nichts nach OFFEN.md schreiben
# =====================================================================
set +e
FLOW_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" || exit 0
ROOT="$(cd "$FLOW_DIR/.." && pwd)" || exit 0
OFFEN="$FLOW_DIR/OFFEN.md"

MODUS="auto"; TROCKEN=0
for arg in "$@"; do
  case "$arg" in
    --json) MODUS="json" ;;
    --trocken) TROCKEN=1 ;;
  esac
done
[ "$MODUS" = "auto" ] && { [ -t 1 ] && MODUS="text" || MODUS="json"; }

command -v git >/dev/null 2>&1 || exit 0
git -C "$ROOT" rev-parse --git-dir >/dev/null 2>&1 || exit 0

# Geaenderte Dateien (verfolgt-geaendert + unverfolgt), repo-relativ —
# genau das Format, in dem die entrypoints: der Blaetter notiert sind.
CHANGED="$(
  { git -C "$ROOT" -c core.quotepath=false diff --name-only HEAD -- 2>/dev/null
    git -C "$ROOT" -c core.quotepath=false ls-files --others --exclude-standard 2>/dev/null
  } | sort -u
)"
[ -z "$CHANGED" ] && { [ "$MODUS" = "text" ] && echo "Flow-Gate: nichts geaendert."; exit 0; }

NEU=0; TREFFER=""
for blatt in "$FLOW_DIR"/*.md; do
  [ -e "$blatt" ] || continue
  base="$(basename "$blatt")"
  case "$base" in OFFEN.md|ROUTER.md) continue ;; esac
  blatt_rel="_flow/$base"
  # Blatt selbst schon angefasst? Dann kein Hinweis fuer dieses Blatt.
  printf '%s\n' "$CHANGED" | grep -qxF -- "$blatt_rel" && continue
  # entrypoints: aus dem Frontmatter lesen (Listenzeilen bis zum naechsten Schluessel)
  eps="$(awk '
    /^entrypoints:/ {f=1; next}
    f && /^[a-zA-Z_]+:/ {f=0}
    f && /^[[:space:]]*-[[:space:]]/ { line=$0; sub(/^[[:space:]]*-[[:space:]]*/,"",line); sub(/[[:space:]]*#.*/,"",line); sub(/[[:space:]]+$/,"",line); if(line!="") print line }
  ' "$blatt")"
  [ -z "$eps" ] && continue
  while IFS= read -r ep; do
    [ -z "$ep" ] && continue
    if printf '%s\n' "$CHANGED" | grep -qxF -- "$ep"; then
      zeile="- $(date +%F) - ${base%.md} - $ep geaendert, Blatt nicht nachgezogen"
      TREFFER="$TREFFER$zeile"$'\n'
      if [ "$TROCKEN" -eq 0 ]; then
        if [ ! -f "$OFFEN" ] || ! grep -qxF -- "$zeile" "$OFFEN" 2>/dev/null; then
          printf '%s\n' "$zeile" >> "$OFFEN" 2>/dev/null && NEU=$((NEU+1))
        fi
      else
        NEU=$((NEU+1))
      fi
      break   # ein Hinweis je Blatt genuegt
    fi
  done <<< "$eps"
done

if [ "$NEU" -eq 0 ]; then
  [ "$MODUS" = "text" ] && echo "Flow-Gate: kein Blatt beruehrt ohne Nachzug."
  exit 0
fi
if [ "$MODUS" = "json" ]; then
  command -v jq >/dev/null 2>&1 && \
    jq -n --arg n "$NEU" '{systemMessage: ("Flow-Gate: " + $n + " Blatt/Blaetter beruehrt, ohne dass das Blatt nachgezogen wurde (siehe _flow/OFFEN.md). Kein Fehler - bitte pruefen.")}' 2>/dev/null
else
  echo "Flow-Gate: $NEU Blatt/Blaetter beruehrt ohne Nachzug:"
  printf '%s' "$TREFFER"
  [ "$TROCKEN" -eq 1 ] && echo "(trocken - nichts geschrieben)"
fi
exit 0
