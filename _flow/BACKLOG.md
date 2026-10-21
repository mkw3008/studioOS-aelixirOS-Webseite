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
| **11** | **Claim-Architektur „Boutique Fitness Platform" einziehen (Schritte 1–6).** Der heutige Claim „Die All-in-One Boutique Fitness Management Plattform" steht **10× im Repo** und muss geschlossen ersetzt werden, sonst widerspricht die Seite sich selbst: Hero-Pille `index.html:226` („Introducing clublane.one" → *The Boutique Fitness Platform*), Fusszeile `:720`, Meta/OG/Twitter-Description `:7,16,24`, JSON-LD-Beschreibungen `:72,81,98`, `llms.txt:3` — dazu neu `"slogan": "The Boutique Fitness Platform"` in den Knoten Organization und SoftwareApplication (haben heute **keinen** `slogan`). `Version2/index.html:7` und `:575` mitziehen, `Version1/` als Archiv nicht. **`<title>` bleibt unverändert** — „All-in-One Studio Management Software" ist der einzige Kategorie-Suchbegriff der Seite, der Claim ist Positionierung, kein Keyword. `og-image.png` geprüft: nur Wortmarke, kein Claim eingebrannt, kein Bild-Neubau nötig. **Braucht:** nur Freigabe, Texte liegen vor. | 🔲 offen |
| **12** | **Thai-Seite `/th/` plus ไทย-Button in der Kopfleiste.** Zielgruppe Thai-Massage-Studios in Deutschland — überwiegend von Muttersprachlern geführt, „Massage" steht bereits im Hero-Laufband. Wäre zugleich die **zweite indexierbare URL** der Domain (heute: eine). ⚠️ **Der Button gehört in `.nav-right` neben den Login, NICHT in `.nav-links`** — `style.css:87` blendet die Linkliste unter 860 px komplett aus, in der Liste wäre er auf jedem Handy unsichtbar. Beschriftung `ไทย` (Sprache in der Sprache, keine Flagge — Flaggen bezeichnen Länder). Seite braucht: `lang="th"`, **indexierbar** (anders als `Version1/`+`Version2/`, die auf `noindex` stehen), `hreflang` de↔th beidseitig, eigenes `canonical`, Eintrag in `sitemap.xml`, eigene Thai-Titel/Description (nicht die deutschen übersetzt), Rückweg-Link auf die deutsche Seite. **Braucht Betreiber-Entscheidung:** gibt es thailändischsprachigen Kontakt? Wenn ja, Kontaktweg prominent (in der Zielgruppe läuft viel über **LINE**, nicht über E-Mail-Formulare); wenn nein, muss die Seite offen sagen, dass Beratung auf Deutsch/Englisch läuft — sonst verspricht die Sprachwahl etwas, das der erste Anruf einlöst. Offen zusätzlich: Kostenrechner mit auf die Seite oder nicht. | 🔲 offen |

---

## Claim-Vorrat (Betreiber-Vorgabe 17.08.2026)

Positionierung: **Boutique Fitness Platform**. Alle vom Betreiber gelieferten Claims im Wortlaut —
auch die nicht empfohlenen, damit nichts verloren geht. Gehört zu Auftrag #11.

**Leitsatz:** Deutsch führt auf der Seite (Du-Form, deutsche Studio-Betreiber), Englisch führt die
Marke (Pille, `slogan`, Social). Und: **Claim ≠ Keyword** — „Boutique Fitness" wird auf Deutsch
praktisch nicht gesucht, gesucht wird „Fitnessstudio Software", „Yogastudio Software",
„Kursbuchungssystem". Darum bleibt der `<title>` keyword-geführt.

### Boutique Fitness

| Claim | Urteil | Platz |
|---|---|---|
| The Boutique Fitness Platform | ★ **Leitclaim EN** — kürzester, bestimmter Artikel = Kategorie-Anspruch | Hero-Pille + JSON-LD `slogan` |
| Die Plattform für erfolgreiche Boutique-Studios | ★ **Leitclaim DE** | Fusszeile, Meta/OG/Twitter, llms.txt, JSON-LD |
| Built for Boutique Fitness | Reserve — ehrlich, trägt das Kategoriewort | Pille „Für wen"; **verworfen für jetzt:** dritte Nennung auf einer Seite, und „Für wen" ist Wegweiser, kein Claim-Platz |
| Powering Boutique Fitness | Reserve — verbgetrieben, aber „Powering X" ist abgenutzt (Stripe u. a.) | Pille „Die Plattform"; gleiche Begründung wie oben |
| The Platform Behind Great Studios | Reserve | Social-Bio / Partner-Deck, nicht auf die Seite |
| Run Your Studio, Grow Your Community | **entfällt** | Die Hero-H1 *ist* dieser Claim bereits auf Deutsch („Du führst dein Studio. Den Rest übernimmt clublane") — doppelt schwächt beides |
| Designed for Exceptional Studios | **nicht empfohlen** | Eigenlob über den Kunden; inhaltlich = „Built for…", nur unschärfer |
| The Operating System for Modern Studios | **nicht empfohlen** | Holt die studioOS-Benennung zurück, von der die Marke weg ist (Domain = clublane.one). „OS" braucht selbst eine Erklärung. Intern/Pitch behalten |

### Branchenneutral — nicht auf clublane.one

Begründung: Das Hero-Laufband verspricht bereits 11 Branchen. Boutique-Fitness-Banner **plus**
branchenneutralem Claim verwässert beides — der Studio-Betreiber liest „ist das für mich?", der
Massage-Betrieb liest „ist das nicht nur Fitness?". Ebene: **Atvisory / Dachmarke**.

| Claim | Urteil |
|---|---|
| From Booking to Business | stärkster Neutraler — beschreibt die Spannweite. Dach-Claim |
| The Business Behind Every Booking | sagt „wir sind unsichtbare Infrastruktur"; der Studio-Betreiber will sichtbare Werkzeuge. Investoren-/Partner-Ebene |
| One Platform, Endless Experiences | „Experiences" zeigt zur Endkundenseite (App/Marketplace), nicht zum Studio-Betrieb |
| The Platform for Your Business / Die Plattform für dein Business / แพลตฟอร์มสำหรับธุรกิจของคุณ | trilinguale Dach-Klammer. Für die Thai-Zielgruppe **zu allgemein** → auf `/th/` (Auftrag #12) segmentgebunden formulieren |

### Thai — geprüft 17.08.2026

**แพลตฟอร์มสำหรับธุรกิจของคุณ ist sprachlich einwandfrei.** Zeichenweise gegen die Norm geprüft:
แพลตฟอร์ม ist die standardkonforme Umschrift von „platform" (Thanthakhat korrekt auf dem ร, also
stumm); สำหรับ „für", ธุรกิจ „Geschäft", ของคุณ „dein/Ihr" — kein Tippfehler, keine Fremdzeichen.
คุณ ist das höfliche „Sie/du", für B2B genau richtig. **Kein Missverständnis möglich.** Einziger
Einwand: klingt beschreibend wie ein Untertitel, nicht werbend.

Griffigere Fassungen (ครบวงจร ist die natürliche thailändische Entsprechung von „All-in-One"):

| Thai | Bedeutung |
|---|---|
| `แพลตฟอร์มเดียว จบทุกเรื่องธุรกิจ` | „eine Plattform, alles Geschäftliche erledigt" |
| `ระบบจัดการธุรกิจครบวงจร` | „das Rundum-Managementsystem fürs Geschäft" |
| `ระบบจัดการร้านนวดและสปา ครบวงจร` | „Rundum-Managementsystem für Massage- und Spa-Betriebe" — Segment |
| `ระบบจัดการร้านนวดไทย` | „Managementsystem für Thai-Massage-Studios" — enger, unmissverständlich |

**Technische Regeln für JEDEN Thai-Text auf dieser Seite** (sonst bricht die Darstellung):

- **Nie in eine Pille.** `.eyebrow-pill`, `.m-chip`, `.group-tag` nutzen IBM Plex Mono +
  `letter-spacing` + Uppercase. Letter-spacing zerreisst thailändische Zeichencluster optisch, und
  die woff2-Dateien in `fonts/` sind **nur latin/latin-ext** — Thai fällt auf die Systemschrift
  zurück (Thonburi / Leelawadee / Noto Sans Thai), also je Gerät ein anderes Bild.
- `lang="th"` setzen; `line-height` mindestens 1.4 (Tonzeichen oben, Vokale unten werden sonst
  abgeschnitten).
- **Nicht umbrechen lassen** — Thai hat keine Wortabstände, der Browser trennt sonst mitten im Wort.
- Eine *passende* Thai-Schrift hiesse: lokales woff2-Subset dazulegen (kein CDN, kein Build) —
  eigene Entscheidung, kein Nebeneffekt.
- Ausnahme unkritisch: `ไทย` (Button-Beschriftung, Auftrag #12) hat keine gestapelten Zeichen.

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
