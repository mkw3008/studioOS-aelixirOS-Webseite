# BACKLOG — clublane.one

Nur für diese Webseite. Der zentrale `aelixir-web/docs/AUFTRAGS-BACKLOG.md` bleibt davon
unberührt — dort wird nichts zu dieser Seite geführt (Stand 06.08.2026 geprüft: die fünf
`clublane.one`-Treffer dort betreffen ausschliesslich den Mail-Absendernamen).

Liegt bewusst unter `_flow/`: Jekyll überspringt Ordner mit führendem Unterstrich, die Datei
ist also **nicht öffentlich abrufbar**. Gegenprobe:
`curl -s -o /dev/null -w "%{http_code}\n" https://clublane.one/_flow/BACKLOG.md` muss 404 sein.
Das ist hier wesentlich, weil unten Wettbewerbs- und Preisdaten stehen.

Format: `#nn Stichwort — Fakt`. Nummern werden nie neu vergeben, neue Einträge unten anhängen.
Status: 🔲 offen · 🔨 in Arbeit · ✅ live · ⛔ verworfen.

---

## Befundlage (Audit 06.08.2026)

### Was gemessen wurde

| Prüfpunkt | Vorher (live) | Nachher (live seit 06.08. 22:24 UTC) |
|---|---|---|
| Technical-SEO-Score | 62 | **89** |
| Schema/Structured Data | 12 | **58** |
| GEO / AI-Suche | 29 | **41** |
| `robots.txt` / `sitemap.xml` / `llms.txt` | 3× 404 | 3× 200 |
| `rel=canonical` | 0 | 3 Seiten |
| Open Graph / Twitter Cards | 0 / 0 | 10 / 4, Bild 1200×630 |
| JSON-LD | 0 | 4 Knoten (Organization, WebSite, WebPage, SoftwareApplication) |
| Seitengewicht | > 10 MB | 303 KB |
| Bildgewicht | 10.059 KB | 150 KB (WebP) |

### Der eigentliche Befund — Seitenanzahl, nicht Seitenqualität

- **1 indexierbare URL.** `impressum`, `datenschutz`, `Version1/`, `Version2/` sind alle auf
  `noindex`. Wettbewerber liegen bei 259 bis 2.121 URLs.
- **Markensichtbarkeit null.** Suche nach „clublane" findet die Domain nicht.
- **Text zerfällt in Fragmente.** ~1.200 sichtbare Wörter, aber ein Standard-Extraktor
  (trafilatura, wie ihn KI-Pipelines nutzen) gewinnt daraus nur **67** — er verwirft Kacheln,
  Chips und Tabellenzellen und findet fast keine Fließtext-Absätze. Median-Satzlänge: 10 Wörter.
- **12 Alleinstellungsmerkmale stecken in Tabellenzellen** („★ Einzigartig"): Betriebsplanung,
  Website-Builder, Signage mit eigener Hardware, Onlineshop, 1:1-Training, MQTT-Monitoring,
  Szenensteuerung, CTI-Anrufsteuerung, KI-Migrationsassistent. Keines hat eine erklärende Seite.
- **13 Zielgruppen und 13 Module werden namentlich genannt** — keine davon hat eine Seite.

### Wettbewerbslage (recherchiert 06.08.2026)

| Suchfeld | Wer gewinnt | Folge für clublane |
|---|---|---|
| „Fitnessstudio Software", „Software Vergleich" | Vergleichsportale (Capterra, softwareabc24) | Nicht mit eigener Seite angreifbar → Listung nötig |
| „bsport Alternative", „Eversports Alternative" | **keine einzige deutschsprachige Seite** | Freies Feld |
| „Magicline Alternative" | Anbieter-Konterseiten (agilea, medo.check, OptiOffice, Eversports) | Muster validiert, Feld aber dicht |
| „Yogastudio Software", „Pilates Studio Software" | Anbieter-Landingpages, kaum Portale | Direkt gewinnbar |
| „Kursbuchungssystem Fitnessstudio" | kleine Anbieter, dünne Seiten | Schwächstes Feld der Recherche |
| „Digital Signage Fitnessstudio" | **nur reine Signage-Anbieter**, kein Studio-Software-Anbieter | Lücke, in die clublane.vision genau passt |

**Preistransparenz — die stärkste Positionierungsachse:**

| Anbieter | Öffentliche Preise | Transaktionsgebühren |
|---|---|---|
| bsport | **keine** (4 Stufen, nur „Get a quote"); Capterra füllt die Lücke mit 150 €/Mon. | nicht genannt |
| Eversports | 49 / 79 / 119 / 169 / 229 € + 99 € Onboarding einmalig | „kann variieren" — **nicht beziffert** |
| clublane | ab 120 €/Monat (im Roh-HTML, crawlbar) | **1,5 % + 0,6 % — beziffert** |

**Belegte Nutzerkritik an Eversports** (Capterra DE / GetApp AT): zu hohe Transaktionsgebühren,
**fehlende Vertretungstrainer**, fehlende Familienaccounts, unklare Logik „Trainings/Kurse/Klassen".
→ clublane führt „Betriebs- und Vertretungsplanung" als ★ Einzigartig. Dokumentierte Schwäche des
Marktführers, die das Produkt bereits schliesst.

**Offene Flanke:** Eversports trägt `FAQPage`-Schema nur auf Start- und Preisseite, **nicht** auf
den Branchenseiten.

**Vorbild-Muster:** Eversports hat die Fitogram-Abschaltung mit drei eigenen Seiten bespielt
(„offizieller Nachfolger", „über 200 Leute gewechselt") — die Migrations-Vorlage.

---

## Aufträge

| # | Auftrag | Status |
|---|---|---|
| **1** | **`/eversports-alternative` und `/bsport-alternative` auf Deutsch bauen.** Höchste Priorität: Es existiert **keine einzige deutschsprachige Alternativenseite** zu diesen beiden Anbietern — freies Feld. Für Magicline ist das Muster durch agilea, medo.check, OptiOffice und Eversports selbst als funktionierend belegt (Herausforderer bauen die Seite, Marktführer nicht). Argumentation liegt belegt vor: dokumentierte Capterra-Kritik an Eversports (Transaktionsgebühren, fehlende Vertretungstrainer, fehlende Familienaccounts), gegen die clublane mit „Betriebs- und Vertretungsplanung" (★ Einzigartig) und beziffertem Zahlungsaufschlag antritt. Produkt-Feature passt: KI-Migrationsassistent ist bereits gebaut. **Braucht:** Textfreigabe des Betreibers. | 🔲 offen |
| **2** | **`/preise` mit echten Zahlen — Preistransparenz als Waffe.** bsport nennt öffentlich **keine** Preise, Eversports beziffert seine Transaktionsgebühren nicht. clublane beziffert beides. Zweite Seite dazu: „Was kostet Studio-Software wirklich — inklusive Transaktionsgebühren und Onboarding". Schaltet zugleich `offers`-Schema frei (Schema 58 → ~68). **Braucht:** Preisfreigabe des Betreibers. | 🔲 offen |
| **3** | **Kostenlose Portal-Listungen — grösster Hebel pro Aufwand.** Ein einziges Gartner-Digital-Markets-Formular erzeugt Präsenz auf **Capterra DE + GetApp + Software Advice** gleichzeitig, inklusive gespiegelter Bewertungen. Dazu die kostenlose Selbsteintragung bei OMR Reviews. clublane ist dort **nicht** gelistet, bsport und Eversports sind es. Die generischen Suchbegriffe werden von genau diesen Portalen dominiert — dort gewinnt man nicht mit eigener Seite, nur mit Listung. **Braucht:** Betreiber-Zugang/Anmeldung. | 🔲 offen |
| **4** | **`/digital-signage-fitnessstudio` bauen.** Den Begriff besetzen ausschliesslich reine Signage-Anbieter (slidehow, TVlokal, dsshow, FLYERALARM). **Kein einziger Studio-Software-Anbieter** konkurriert dort. clublane.vision sitzt exakt in der Lücke: Kursplan-Screens aus derselben Buchungsdatenbank statt Export/Import. Aufhänger „Kursplan ohne Pflegeaufwand". **Ohne Zuarbeit baubar** (Inhalt existiert auf der Startseite). | 🔲 offen |
| **5** | **`/yogastudio-software` und `/pilates-studio-software` bauen.** Hier gewinnen Anbieterseiten, nicht Portale — anders als bei den Head-Terms. Bei Pilates ist der Aufhänger spitz und belegt: **geräteweise Reformer-Platzreservierung** wird in Kaufratgebern als Entscheidungskriterium genannt. Die Startseite nennt 13 Zielgruppen in einem Laufband, ohne dass eine davon eine Seite hätte. **Braucht:** Textentwurf zum Gegenlesen. | 🔲 offen |
| **6** | **`/kursbuchungssystem` bauen.** Schwächstes Wettbewerbsfeld der gesamten Recherche — dort ranken kleine Anbieter mit dünnen Seiten. | 🔲 offen |
| **7** | **Kostenrechner crawlbar machen.** Das stärkste Inhaltsstück der Seite rendert komplett per JavaScript (`innerHTML`, Anbieter-Karten und Preisbalken) und ist für Extraktoren unsichtbar. Statischen Standardzustand vorrendern, JS reichert danach progressiv an. Hebt Technical 89 → ~95. ⚠️ Greift in die Rechnerlogik ein — **vor der Umsetzung Freigabe einholen**. | 🔲 offen |
| **8** | **13 Modulseiten aus den ★-Merkmalen bauen.** Zwölf Alleinstellungsmerkmale stecken heute in Tabellenzellen und haben keine Seite, die sie erklärt. Macht aus 1 indexierbarer URL 14. **Braucht:** Modultexte bzw. Entwürfe zum Gegenlesen. | 🔲 offen |
| **9** | **Kundenstimmen beschaffen und einbauen.** Eversports betreibt eine „Wall of Love" mit Namen und Studios (Yoga Mio Leipzig, Vienna Heels, Fame Boxing Wien). clublane hat **null** Vertrauenssignale — keine Referenz, keine Zahl, keine Stimme. Zugleich Voraussetzung für legitimes `aggregateRating`-Schema (ohne echte Bewertungen wäre das Schema-Betrug). **Braucht:** Kunden des Betreibers. | 🔲 offen |
| **10** | **FAQ-Blöcke plus `FAQPage`-Schema auf den neuen Seiten.** Eversports trägt `FAQPage` nur auf Start- und Preisseite, nicht auf den Branchenseiten — offene Flanke. Belegte Kauffragen: „Was kostet die Software wirklich?", „Welche Software für Reformer?", „Wie aufwendig ist der Wechsel?", „Ist die Software DSGVO-konform?". ⚠️ Google zeigt seit Mai 2026 **keine** FAQ-Rich-Results mehr — der Nutzen liegt allein in der Extraktion durch ChatGPT, Perplexity und AI Overviews. **Braucht:** Textfreigabe. | 🔲 offen |

---

## Nachgelagert / bewusst nicht getan

| Thema | Warum |
|---|---|
| Antwortabsätze 134–167 Wörter, Frage-Headings | Erfordert neuen Text; Betreiber hatte Textänderungen ausgeschlossen. Wäre GEO 41 → ~47. |
| `aggregateRating`, Preis-`offers` im Schema | Braucht echte Bewertungen bzw. Preisseite → hängt an #2 und #9. |
| `email` im JSON-LD | Die Seite baut die Adresse per JS zusammen (Anti-Crawl). Ein Klartext-Eintrag im JSON-LD würde genau diesen Schutz aushebeln. |
| Security-Header (HSTS, CSP, nosniff) | GitHub Pages kann keine eigenen Header senden. Ginge nur mit Cloudflare davor = DNS-Umstellung. Wäre Technical +6. |
| Rechtstext aus den `<template>`-Blöcken per `fetch()` auslagern | `fetch` scheitert unter `file://` — und genau dort wird vor dem Push geprüft. Nebenwirkung: einfache Extraktoren lesen den Rechtstext als Seiteninhalt mit. |
| PNG-Originale löschen | `Version1/` und `Version2/` verlinken sie noch; unverlinkte Dateien werden nicht gecrawlt. |
| IndexNow | Ohne Ping-Automatik wirkungslos, bei einer selten geänderten Seite vernachlässigbar. |
| `Version1/`/`Version2/` entfernen | Wäre Löschen bestehender Seiten — nicht beauftragt. |

---

## Offene Punkte zum Gegenlesen

- **Anschrift.** Live steht seit 06.08. *Parsdorfer Str. 17b, 85599 Hergolding*, übernommen aus den
  neuen Rechtsdokumenten. Vorher stand dort *Otto-Heilmann-Str. 18a, 82031 Grünwald*. Nichts im Repo
  konnte entscheiden, welche stimmt. Pflichtangabe nach § 5 DDG — **bitte bestätigen**.
- **`og-image.png`.** Neu angelegt, erscheint bei jedem geteilten Link. Mechanisch aus der
  vorhandenen Wortmarke auf `--deep` (#0A1730) zusammengesetzt, kein neues Design.
- **Brevo** steht in Ziffer 5 der Datenschutzerklärung und in der Auftragsverarbeiter-Tabelle,
  taucht im Seitencode aber nicht auf (Formular läuft über Web3Forms). Unverändert aus der Vorlage
  übernommen — **bitte bestätigen oder streichen lassen**.
- **Web3Forms-AVV** fehlt noch; nachgetragen in
  `clublane Verträge und Unterlagen Kopie/clublane_pruefhinweise_und_offene_punkte.md` (Teil C).
  Die dortige PDF-Fassung ist dadurch veraltet.

---

## Stolperfalle aus dieser Sitzung

**Pages-Build-Status nie über `builds/latest` beurteilen.** Am 06.08. schlugen ab 15:35 alle Builds
mit „Page build failed" fehl (GitHub-Störung, Pages + Actions `major_outage`). Weil nach jedem
manuellen Anstoss der frisch eingereihte Build als `building` erschien, wurde die Lage über Stunden
als „Warteschlange" fehlgedeutet. Richtig ist die **Historie**:

```
gh api repos/mkw3008/studioOS-aelixirOS-Webseite/pages/builds \
  --jq '.[0:8][] | "\(.created_at)  \(.status)  \(.commit[0:7])  \(.error.message // "-")"'
```

Gelöst hat es ein erneuter Anstoss, nachdem die Störung nachliess — der Inhalt war nie die Ursache
(ein leerer Commit mit identischem Stand baute durch).
