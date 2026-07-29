---
flow: formulare-leads
domaene: Kontakt-/Demo-Formular, Weg einer Anfrage, Datenschutz-Bezug
entrypoints:
  - index.html        # Overlay-Markup + Absende-Skript
  - datenschutz.html  # Abschnitt zum Formular-Dienstleister
dienst: Web3Forms (api.web3forms.com)
---

# Flow: Formulare & Leads

## Ablauf
Jeder „Demo anfragen"-Knopf oeffnet dasselbe Overlay — nicht ueber eine eigene Seite, sondern ueber
das Attribut `data-contact` am Link. Das Formular sammelt die Felder, schickt sie per `fetch` als
`FormData` an **Web3Forms**, und Web3Forms mailt die Anfrage an die hinterlegte Adresse. Es gibt
**keinen eigenen Server und keine Datenbank** — deshalb funktioniert das auf einer rein statischen
Seite. Bei Erfolg wird das Formular ausgeblendet und eine Danke-Karte gezeigt (`bbd3dc0`); bei
Fehler erscheint ein Hinweis mit direkter E-Mail-Adresse als Ausweichweg.

## Stolperfallen (jede belegt)
- **Ein neuer CTA ohne `data-contact` ist ein toter Knopf.** Das Overlay haengt allein an diesem
  Attribut (`document.querySelectorAll('[data-contact]')`). Wer einen „Demo anfragen"-Link ergaenzt
  und das Attribut vergisst, bekommt einen Link, der nur zum Anker springt. Gegenprobe per Kommando
  unten: Zahl der `data-contact`-Vorkommen muss zur Zahl der Demo-Knoepfe passen.
- **Der `access_key` steht im Klartext im HTML** — das ist bei Web3Forms so vorgesehen (rein
  clientseitiger Dienst), heisst aber: der Schluessel ist oeffentlich und jeder kann darueber an
  dieselbe Empfaengeradresse senden. Er ist **kein Geheimnis**, das man schuetzen koennte, sondern
  bei Missbrauch (Spam-Welle) im Web3Forms-Konto zu tauschen — dann auch im HTML mitziehen.
- **Alle Felder sind Pflicht** (`5744e8e`). Wer ein Feld ergaenzt, entscheidet bewusst ueber
  `required` — ein optionales Feld faellt hier aus dem Muster.
- **Der Dienstleister steht in der Datenschutzerklaerung** (`634255e`). Ein Wechsel des
  Formulardienstes ohne Nachzug in `datenschutz.html` ist ein Datenschutzmangel, kein Schoenheits-
  fehler. Beides gehoert in denselben Commit.
- **Fehlversand ist stiller Verlust.** Es gibt keine serverseitige Kopie: schlaegt der Aufruf fehl,
  existiert die Anfrage nirgends. Darum steht im Fehlerfall die direkte Mailadresse im Text — dieser
  Ausweichweg darf beim Umbauen nicht wegfallen.

## Entscheidungen
- **Fremddienst statt eigenem Endpunkt** — passt zur statischen Seite ohne Backend.
- **Ein einziges Overlay fuer alle Einstiege** statt mehrerer Formularseiten.

## Zeiger — Kommando statt Kopf
- **Wohin geht die Anfrage, mit welchem Schluessel?**
  `grep -n 'api\.web3forms\.com\|name="access_key"' index.html`
- **Welche Felder hat das Formular, welche sind Pflicht?**
  `grep -o '<input[^>]*name="[^"]*"[^>]*>\|<textarea[^>]*name="[^"]*"' index.html`
- **Passen CTA-Knoepfe und Overlay zusammen?**
  `grep -c 'data-contact' index.html`
- **Erwaehnt die Datenschutzseite den Dienst noch?**
  `grep -n -i 'web3forms' datenschutz.html`
