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
- **`Version1/` ist oeffentlich UND ohne `noindex`** — nachweisbar: `curl` auf `/Version1/` liefert
  200, `grep -c noindex Version1/index.html` liefert 0. Damit ist die komplette alte Seite als
  Dublette indexierbar. **Offen, bewusst nicht eigenmaechtig geaendert** (Scope-Lock); Entscheidung
  des Betreibers noetig: `noindex` ins Archiv, `robots.txt`, oder so lassen.
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
- **Welche Fassungen tragen `noindex`?**
  `for f in index.html Version1/index.html Version2/index.html; do printf '%-24s %s\n' "$f" "$(grep -c noindex "$f")"; done`
- **Gibt es robots.txt/sitemap.xml?** `ls robots.txt sitemap.xml 2>/dev/null || echo keine`
- **Externe Ressourcen (sollte nur bewusst Gewolltes zeigen):**
  `grep -oE '(src|href)="https?://[^"]+"' index.html | sort -u`
- **Grosse Dateien:** `find . -type f -size +500k -not -path "./.git/*" | sort`
