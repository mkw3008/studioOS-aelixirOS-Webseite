---
flow: seiten-inhalte
domaene: Seitenaufbau, Abschnitte, Layout/CSS und die drei parallelen Fassungen der Seite
entrypoints:
  - index.html            # die LIVE-Seite
  - style.css             # das LIVE-Stylesheet
  - Version2/index.html   # Quellfassung des aktuellen Designs (mit ../-Pfaden, noindex)
  - Version2/style.css
  - Version1/index.html   # archivierte Vorgaengerseite
  - Version1/style.css
  - impressum.html
  - datenschutz.html
fassungen: [root=live, Version2=quelle-aktuelles-design, Version1=archiv-altes-design]
---

# Flow: Seiten & Inhalte

## Ablauf
Eine einzelne statische Seite: `index.html` + `style.css` im Root sind das, was Besucher unter
clublane.one sehen. Kein Framework, kein Build, keine Abhaengigkeiten — alle Skripte stehen als
`<script>`-Bloecke am Ende von `index.html` (Kontakt-Overlay, Kostenrechner, Modul-Rad,
Reveal-beim-Scrollen). Rechtsseiten (`impressum.html`, `datenschutz.html`) liegen daneben.

Daneben liegen **zwei weitere Fassungen derselben Seite**, beide oeffentlich erreichbar:
`Version1/` ist die archivierte Vorgaengerseite (altes Design), `Version2/` ist die Quellfassung
des heutigen Designs. Die Root-Dateien sind eine **Kopie** von `Version2/` mit angepassten Pfaden —
es gibt keinerlei Automatik dazwischen.

## Stolperfallen (jede belegt)
- **Root und `Version2/` laufen auseinander.** Beim Umzug (`3ea463d`) wurde `Version2/index.html`
  nach Root kopiert und dabei angepasst: `../`-Pfade entfernt, `noindex` geloescht, Cache-Buster
  erhoeht. Wer spaeter nur eine der beiden Dateien aendert, hat zwei divergierende Fassungen. Vor
  jeder Aenderung entscheiden, WELCHE Fassung gemeint ist — im Zweifel die Root-Fassung (= live).
- **`Version1/` und `Version2/` sind live abrufbar**, nicht nur lokale Ordner (`curl` auf
  `/Version1/` liefert 200). Aenderungen dort sind also auch oeffentlich. SEO-Folge: `_flow/seo-assets.md`.
- **Die Nav-Pille darf nicht `position:sticky` sein.** Sticky belegt Hoehe im Seitenfluss, dadurch
  rutschte der dunkle Hero nach unten und hinter der schwebenden Leiste blitzte der helle
  Seitenhintergrund durch. Behoben in `3ea463d`: `position:fixed` plus Innenabstand oben am Hero.
  Wer am Hero-Padding dreht, muss die Leiste mitdenken.
- **Das Modul-Rad wird per JS positioniert**, nicht per CSS: die Modul-Knoten werden kreisfoermig
  gesetzt und die Speichen als SVG erzeugt — die Anzahl ergibt sich aus dem Markup (Kommando unten;
  sie hat sich schon geaendert, `e10998c`: 14 → 13). Die Einblend-Animation startet erst beim Sichtbarwerden
  (`e4f9b5b`) — im Screenshot einer nicht gescrollten Seite sieht das Rad daher u. U. leer aus.
- **Positionsauftraege aendern keine Groessen.** Beim Umbau der Vision-Karte wurde ein Foto beim
  Verschieben mitvergroessert und musste zurueckgesetzt werden (`a4ab07c`). Groesse nur auf
  ausdruecklichen Auftrag.
- **Der Rechtstext steht ZWEIMAL im Repo.** Impressum und Datenschutz gibt es als eigene Seite
  (`impressum.html`, `datenschutz.html`) UND als Hover-Karte in `index.html` (`<template
  id="legalTpl-impressum">` / `legalTpl-datenschutz` im Block `#legalCards`). Es gibt bewusst keine
  Automatik: `fetch()` aus der Nachbardatei scheitert unter `file://`, und genau dort wird vor dem
  Push geprueft. Wer eine Fassung aendert und die andere vergisst, liefert je nach aktivem
  JavaScript zwei verschiedene Pflichtangaben aus. Gegenprobe:
  `diff <(grep -o 'Parsdorfer Str. 17b' impressum.html) <(grep -o 'Parsdorfer Str. 17b' index.html)`
- **Die Fusszeilen-Links behalten ihr `href`.** Der Klick wird per `preventDefault()` abgefangen und
  oeffnet die Karte, aber `href="impressum.html"` bleibt stehen — ohne JavaScript und fuer den
  Direktaufruf muessen die Angaben nach § 5 DDG / Art. 13 DSGVO erreichbar bleiben. Das `href`
  darf nicht durch `href="#"` ersetzt werden.
- **Die Karte braucht `z-index` ueber 200.** Die Nav-Pille liegt auf `z-index:200`
  (`style.css`, `.nav-shell`); eine Karte darunter wird von der Leiste durchstossen. Deshalb liegt
  `.legal-layer` auf 300 — dieselbe Ebene wie das Kontakt-Overlay.

## Entscheidungen
- **Kein Framework, kein Build-Schritt** — die Seite muss per `file://` im Browser funktionieren.
  Alles inline, Schriften lokal (siehe `_flow/seo-assets.md`).
- **Alte Fassungen werden aufgehoben, nicht geloescht** (`3ea463d`): `Version1/` als Archiv,
  `Version2/` als Design-Quelle.
- Aenderungen werden vor dem Veroeffentlichen per Screenshot geprueft (headless Chrome auf die
  lokale Datei), nicht nur im Code gelesen.

## Zeiger — Kommando statt Kopf
- **Welche Abschnitte hat die Seite?**
  `grep -o '<section[^>]*class="[^"]*"' index.html`
- **Welche Sprungziele/Anker gibt es?** `grep -o 'id="[a-z-]*"' index.html | sort -u`
- **Wo stehen die Inline-Skripte?** `grep -n '<script' index.html`
- **Wie viele Modul-Knoten hat das Rad?** `grep -c 'class="mod"' index.html`
- **Weichen Root und Version2 voneinander ab?**
  `diff <(sed 's|\.\./||g' Version2/index.html) index.html | head -40`
- **Lokale Vorschau als Bild:**
  `"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --disable-gpu --window-size=1440,3000 --screenshot=/tmp/seite.png "file://$PWD/index.html"`
