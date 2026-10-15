---
flow: kostenrechner-vergleich
domaene: Kostenrechner und Wettbewerbsvergleich — Rechenlogik, Preisannahmen, Aussagenrisiko
entrypoints:
  - index.html            # Rechner-Markup, Rechenskript und Vergleichstabelle
  - _Kosten-Vergleich.html # nicht ausgelieferte Arbeitsdatei mit demselben Rechner (s. u.)
  - Version1/index.html, Version2/index.html # oeffentliche Kopien der Startseite, gleicher Rechner
  - aelixiros-site/index.html # Seite aelixirOS (eigenes Repo, Zweig aelixiros), gleicher Rechner
anbieter: [clublane, bsport, Eversports, Stripe, Mollie]
---

# Flow: Kostenrechner & Vergleich

## Ablauf
Der Rechner im Abschnitt „Kosten" stellt Jahresgesamtkosten gegenueber: **Zahlungsgebuehren plus
Plattform-Abo**. Verglichen werden die drei Plattformen (clublane, bsport, Eversports) und zusaetzlich
die reinen Zahlungs-Rails (Stripe, Mollie) als Referenz — letztere ohne Buchungssystem, deshalb nie
als „Sieger" markiert. Eingaben sind Jahresumsatz, SEPA-/Kartenanteil, durchschnittlicher
Transaktionswert und die monatlichen Grundgebuehren je Anbieter; alle Parameter sind im
Aufklappbereich ueberschreibbar (`67e31ca`). Darunter steht die Feature-Vergleichstabelle mit dem
Stand-Hinweis und dem Haftungs-Disclaimer.

## Stolperfallen (jede belegt)
- **Das clublane-Satzfeld zeigt NUR den Aufschlag/die Provision, nicht den Gesamtsatz** (`bc63ebf`).
  Grund: die Stripe-Basisgebuehr wird bereits separat ausgewiesen — wer das Feld als Gesamtsatz
  liest und entsprechend rechnet, zaehlt die Zahlungsgebuehren doppelt und macht clublane kuenstlich
  teuer. Bei jeder Aenderung an der Rechenkette diese Trennung pruefen.
- **Die Grundgebuehren sind Startannahmen, keine Preisliste** (`fba6598`, `67e31ca`). Sie stehen im
  Skript als Vorgabewerte und sind vom Nutzer ueberschreibbar. Sie duerfen nicht als „unser Preis"
  oder „deren Preis" gelesen oder anderswo als Fakt zitiert werden.
- **Wettbewerbsangaben sind Aussagen ueber Dritte.** Tabelle und Rechner stuetzen sich auf oeffentlich
  verfuegbare Produkt-/Preisinformationen mit Stand-Angabe; der Disclaimer („keine Gewaehr,
  keine Kaufberatung, Marken gehoeren ihren Inhabern") gehoert zur Aussage dazu. Er ist **nicht**
  Dekoration und darf bei Umbauten nicht wegfallen. Wer Zahlen aktualisiert, zieht die Stand-Angabe
  mit.
- **Der Rechner steht in mehreren Dateien, die Vorlage ist `index.html`.** `_Kosten-Vergleich.html`
  wird nicht ausgeliefert (die Domain antwortet mit 404),
  ist von keiner Seite verlinkt (Gegenprobe per Kommando unten) und rechnet seit #563 wie die
  Startseite. Dieselbe Rechnung tragen `Version1/` und `Version2/` (beide oeffentlich), `Version3/`
  (liegt nur lokal, nicht im Repo) und die Seite aelixirOS. Wer den Rechner aendert, zieht alle
  Kopien nach; `index.html` zuerst.
- **Die 0,7-Kuerzung des Stripe-Balkens ist Absicht, kein Fehler** (Betreiber #563). Der Stripe-Anteil
  eines Balkens wird nur zu 70 % gezeichnet (Konstante `STRIPE_VISUAL`): in der Stripe-Zeile der ganze
  Balken, bei den Plattformen das blaue Anfangssegment, bei Mollie der Teil bis zur Hoehe von Stripe
  (liegt Mollie darunter, der ganze Balken); der Mollie-Ueberhang ueber Stripe bleibt 1:1. Massstab
  und alle anderen Segmente bleiben echt, deshalb endet der laengste Balken kuerzer als die volle
  Breite und die Proportion zwischen Stripe und dem Rest stimmt absichtlich nicht. Nicht „reparieren".
  Summen, Beschriftungen, Karten und Urteil rechnen mit den echten Werten.
- **Beschriftungen wurden bewusst entschaerft** (`9fabab9`, `42a25a8`): kein „Tarife anpassen", kein
  Versprechen im Panel-Titel, nur „Parameter". Reine Textkosmetik hier hat Aussagewirkung.

## Entscheidungen
- **Ehrliche Darstellung vor guenstigem Ergebnis** — Aufschlag getrennt ausweisen, statt ihn im
  Gesamtsatz verschwinden zu lassen (`bc63ebf`).
- **Zahlungs-Rails mitzeigen, aber nie als Gewinner** — sie loesen eine andere Aufgabe.
- **Alle Annahmen sichtbar und ueberschreibbar** statt fester Zahlen im Fliesstext.

## Zeiger — Kommando statt Kopf
- **Welche Anbieter und Vorgabewerte rechnet das Skript gerade?**
  `grep -n "providers=\[" -A 8 index.html`
- **Wo sitzt die Rechenkette?** `grep -n 'kvBars\|kvCards\|periodMonthly\|function calc' index.html`
- **Steht der Disclaimer noch?** `grep -n -i 'Kaufberatung\|Gewaehr\|Stand 20' index.html`
- **Ist `_Kosten-Vergleich.html` weiterhin unverlinkt?** (Anfuehrungszeichen noetig — zsh)
  `grep -rn "Kosten-Vergleich" --include='*.html' . | grep -v '^./_Kosten-Vergleich.html'`
- **Steht die Kuerzung in allen Kopien?** `grep -c "STRIPE_VISUAL" index.html Version1/index.html Version2/index.html _Kosten-Vergleich.html`
- **Historie der Preisannahmen:** `git log --oneline -S"studioMo" -- index.html`
