# ROUTER — Einstieg fuer jede Aufgabe (clublane.one Webseite)

Diese Datei wird beim Sitzungsstart automatisch geladen. Sie ist die **Karte, nicht das Gebiet**:
sie nennt WO etwas steht und WELCHE Regeln gelten — nie das Detail. Detail steht im jeweiligen
Flow-Blatt (bei Bedarf laden). **Kommando statt Kopf**: Blaetter halten keine volatilen Fakten
(Versionsnummern, Preise, Dateilisten), sondern das Kommando, das die frische Wahrheit liefert.

## Invarianten (Volltext woanders — hier nur Verweis, keine Kopie)
- **Scope-Lock** — nur Beauftragtes; keine eigenmaechtigen Aenderungen, Cleanups oder Entfernungen;
  bestehende sichtbare Abschnitte bleiben. Volltext: `../CLAUDE.md` (Ordner „aelixir Personal Training").
- **Push = Live** — es gibt keine Staging-Stufe. `git push origin main` veroeffentlicht sofort auf
  der Kundendomain. Details: `_flow/deploy.md`.
- **Position ≠ Groesse** — eine Anweisung wie „hochrutschen"/„verschieben" aendert NUR die Position.
  Groessen nur auf ausdruecklichen Auftrag.
- **Kein Build, kein Framework** — reines HTML/CSS/JS, alle Skripte inline. Nichts kompilieren,
  nichts einfuehren, was einen Build-Schritt braucht.

## Prozess-Router — Aufgabe betrifft X? Lies das Blatt.

| Aufgabe betrifft | Blatt |
|---|---|
| Seitenaufbau, Abschnitte, Texte, Layout, CSS, die drei Fassungen (Root / Version1 / Version2) | `_flow/seiten-inhalte.md` |
| Veroeffentlichen, Domain, Cache, warum eine Aenderung nicht sichtbar wird | `_flow/deploy.md` |
| Kontakt-/Demo-Formular, Anfragen, wo Leads landen | `_flow/formulare-leads.md` |
| Favicon, Google-Darstellung, Meta-Angaben, Schriften, Bilder, Indexierung | `_flow/seo-assets.md` |
| Kostenrechner, Vergleichstabelle, Preisannahmen, Wettbewerbsangaben | `_flow/kostenrechner-vergleich.md` |
| Was als Naechstes ansteht, Wettbewerbslage, SEO-Befunde, offene Betreiber-Fragen | `_flow/BACKLOG.md` |

Ein noch fehlendes Blatt = das Ziel ist bekannt, der Inhalt wird beim ersten Bedarf geschrieben.

**Der Backlog gilt nur fuer clublane.one.** Der zentrale `aelixir-web/docs/AUFTRAGS-BACKLOG.md`
fuehrt nichts zu dieser Seite — nicht dort nachschlagen und nicht dorthin schreiben.

**Offene Nachzuege:** Der Stop-Hook notiert in `_flow/OFFEN.md`, wenn eine Datei geaendert wurde, die
im `entrypoints:` eines Blatts steht, ohne dass das Blatt nachgezogen wurde. Stand:
`cat _flow/OFFEN.md 2>/dev/null || echo "nichts offen"`

## Grosse Dateien — nie ganz lesen, nur per Kommando anfassen
Bilder ueber ~500 KB sind in `.claude/settings.json` unter `permissions.deny` gesperrt (ein `Read`
darauf verbrennt Kontext ohne Nutzen). Frische Liste:
`find . -type f -size +500k -not -path "./.git/*" | sort`

Ebenfalls nie ganz lesen, sondern gezielt greppen: `index.html`, `Version1/index.html`,
`Version2/index.html` (je einige hundert Zeilen mit langen Inline-Skripten).

## Warum `_flow/` und nicht `docs/`
GitHub Pages liefert dieses Repo **aus dem Root** aus (`gh api repos/mkw3008/studioOS-aelixirOS-Webseite/pages`).
Ein normaler Ordner waere unter `clublane.one/<ordner>/…` oeffentlich abrufbar — beweisbar daran,
dass `curl -s -o /dev/null -w "%{http_code}" https://clublane.one/Version1/` **200** liefert.
Jekyll ueberspringt Ordner mit fuehrendem Unterstrich, darum `_flow/`. Gegenprobe:
`curl -s -o /dev/null -w "%{http_code}\n" https://clublane.one/_flow/ROUTER.md` muss **404** sein.
