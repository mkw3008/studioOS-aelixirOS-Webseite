---
flow: seo-assets
domaene: Auffindbarkeit, Google-Darstellung, Favicon, Schriften, Bilder, Indexierung
entrypoints:
  - index.html
  - favicon.ico
  - style.css        # @font-face-Bloecke
suchmaschine: keine robots.txt, keine sitemap.xml (Stand per Kommando pruefen)
---

# Flow: SEO & Assets

## Ablauf
Die Seite traegt ihre SEO-Angaben komplett im `<head>` von `index.html`: Titel, Beschreibung,
Favicon-Kette und Apple-Touch-Icon. Schriften werden **lokal aus `fonts/`** geladen, nicht von einem
CDN. Grosse Produktbilder liegen unkomprimiert im Root und werden direkt eingebunden.

## Stolperfallen (jede belegt)
- **Google zeigt nur Favicons ab 48 px** und erst nach dem naechsten Crawl. Die Seite hatte lange
  ein `favicon.ico` mit nur einer 64-px-Ebene im alten Markendesign — in den Suchergebnissen
  erschien kein Logo. Behoben in `cf6ce2d`: mehrstufiges ICO (16/32/48/64) aus dem aktuellen
  App-Icon plus expliziter 96-px-PNG-Verweis. Wirkung tritt erst mit dem Crawl ein, nicht mit dem
  Deploy — ueber die Search Console beschleunigbar.
- **Das Favicon muss echt am Root liegen** (`c853792`) — ein Verweis allein genuegt nicht, weil
  Crawler und Browser `/favicon.ico` direkt abfragen.
- **Keine externen Schriften einbauen.** Das Google-Fonts-Leck wurde bewusst geschlossen und die
  Schriften self-hosted (`b0d92ad`) — ein CDN-Font waere ein Datenschutzrueckschritt (IP-Abfluss
  ohne Einwilligung). Gilt auch fuer neu hinzugefuegte Abschnitte.
- **`noindex` reist beim Kopieren mit.** `Version2/index.html` traegt ein `noindex`, weil es die
  nicht-oeffentliche Design-Quelle ist. Bei der Uebernahme nach Root musste es entfernt werden
  (`3ea463d`/`20a4950`) — waere es mitgekommen, waere die Kundendomain aus dem Index geflogen.
  Umgekehrt beim naechsten Umzug wieder pruefen.
- **Alle Fassungen ausser der Live-Seite gehoeren auf `noindex`.** Betreiber-Entscheidung vom
  2026-07-29: die alte Seite darf nicht indexiert werden, die neue schon. `Version1/index.html`
  hat seither ein `noindex, nofollow` im Kopf; `Version2/` hatte es bereits. Der Root bleibt
  bewusst OHNE — er ist die Seite, die gefunden werden soll. Gegenprobe per Kommando unten.
- **`robots.txt` waere hier das falsche Werkzeug** fuer bereits indexierte Seiten: ein `Disallow`
  verhindert das erneute Crawlen und damit, dass Google das `noindex` ueberhaupt sieht. Darum
  Meta-`noindex` statt Sperre.
- **Aus der Auslieferung nehmen geht ohne Loeschen** — genau wie bei `_flow/`: ein fuehrender
  Unterstrich genuegt, Jekyll ueberspringt den Ordner. So geschehen am 2026-07-29 mit dem alten
  Sereno-Designexport (`export-sereno/` → `_export-sereno/`, Betreiber-Auftrag): die URL
  antwortet seither mit 404, die Dateien bleiben als Sicherung im Repo. Achtung: Pfade in
  `.claude/settings.json` (`permissions.deny`) muessen bei so einer Umbenennung mitgezogen werden.
- **`Kosten-Vergleich.html` ist weiterhin erreichbar und ohne `noindex`** — unverlinkt, aber ueber
  die Domain abrufbar. Bewusst nicht mitgeaendert (Scope-Lock, nicht beauftragt) — offene
  Betreiber-Entscheidung. Liste per Kommando unten.
- **Grosse Bilder nie mit `Read` oeffnen** — mehrere Dateien im MB-Bereich; sie sind in
  `.claude/settings.json` gesperrt. Groesse/Existenz per `find`/`ls` klaeren, Inhalt per Screenshot
  der Seite, nicht per Bildaufruf.

## Entscheidungen
- **Schriften lokal, keine Fremd-CDNs** (Datenschutz).
- **Keine robots.txt/sitemap.xml** — bewusst schlicht gehalten; falls das kippt, gehoert der
  Ausschluss von `Version1/`/`Version2/` in dieselbe Entscheidung.

## Zeiger — Kommando statt Kopf
- **Was steht im Kopf der Seite?** `sed -n '1,25p' index.html`
- **Welche Favicon-Ebenen hat die ICO-Datei wirklich?**
  `python3 -c "from PIL import Image; print(Image.open('favicon.ico').ico.sizes())"`
- **Welche HTML-Seite traegt `noindex` — und welche nicht?** (Root MUSS 0 sein, Archive 1)
  `find . -name '*.html' -not -path './.git/*' | sort | while read -r f; do printf '%-34s %s\n' "$f" "$(grep -c 'name="robots"' "$f")"; done`
- **Gibt es robots.txt/sitemap.xml?** `ls robots.txt sitemap.xml 2>/dev/null || echo keine`
- **Externe Ressourcen (sollte nur bewusst Gewolltes zeigen):**
  `grep -oE '(src|href)="https?://[^"]+"' index.html | sort -u`
- **Grosse Dateien:** `find . -type f -size +500k -not -path "./.git/*" | sort`
