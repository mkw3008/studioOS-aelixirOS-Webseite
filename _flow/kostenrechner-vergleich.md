---
flow: kostenrechner-vergleich
domaene: Kostenrechner und Wettbewerbsvergleich — Rechenlogik, Preisannahmen, Aussagenrisiko
entrypoints:
  - index.html            # Rechner-Markup, Rechenskript und Vergleichstabelle
  - Kosten-Vergleich.html # verwaiste Altseite, NICHT der Rechner (s. u.)
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
- **`Kosten-Vergleich.html` ist NICHT der Rechner.** Es ist eine verwaiste Altseite, die von keiner
  Seite verlinkt ist (Gegenprobe per Kommando unten) — aber ueber die Domain erreichbar bleibt. Wer
  „den Kostenvergleich" aendern soll, muss klaeren, welche der beiden Stellen gemeint ist; die
  gepflegte ist der Abschnitt in `index.html`.
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
- **Ist `Kosten-Vergleich.html` weiterhin unverlinkt?** (Anfuehrungszeichen noetig — zsh)
  `grep -rn "Kosten-Vergleich" --include='*.html' . | grep -v '^./Kosten-Vergleich.html'`
- **Historie der Preisannahmen:** `git log --oneline -S"studioMo" -- index.html`
