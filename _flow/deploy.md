---
flow: deploy
domaene: Veroeffentlichen, Domain, Cache — warum eine Aenderung (nicht) sichtbar wird
entrypoints:
  - CNAME
  - index.html          # traegt den Cache-Buster ?v=N
kette: [git push origin main, GitHub Pages (Jekyll, Branch main, Pfad /), Cloudflare, Kundendomain]
---

# Flow: Deploy-Weg

## Ablauf
Es gibt **keinen Build und keine Staging-Stufe**. `git push origin main` ist der Deploy: GitHub Pages
baut den Repo-Root, Cloudflare liegt davor, die Domain steht in `CNAME`. Ein Push ist damit sofort
oeffentlich — es gibt keinen Zwischenschritt, in dem noch etwas geprueft wird. Pruefen deshalb
VORHER, lokal (Screenshot der `file://`-Fassung).

Wichtig zur Abgrenzung: der `wrangler`-Deploy, der in diesem Umfeld sonst vorkommt, gehoert zu
**anderen** Seiten (aelixir.de/R2FV in einem eigenen Repo). Fuer diese Seite hier ist er nie noetig.

## Stolperfallen (jede belegt)
- **Cache-Buster nicht vergessen.** `index.html` laedt das Stylesheet als `style.css?v=N`. Wird das
  CSS geaendert, ohne N zu erhoehen, sehen Besucher (und Cloudflare) weiter das alte CSS — die
  Aenderung „wirkt nicht", obwohl sie live ist. In dieser Sitzungsreihe mehrfach mitgezogen
  (`3ea463d` = v8, dann v9/v10/v11 mit jeder CSS-Aenderung). Aktueller Stand per Kommando unten.
- **Jekyll ist aktiv** (`build_type: legacy`, kein `.nojekyll`, kein `_config.yml`). Folge in beide
  Richtungen: Ordner mit fuehrendem Unterstrich (`_flow/`) werden NICHT ausgeliefert; alles andere
  schon — auch `Version1/` und `Version2/` (`curl` auf `/Version1/` liefert 200).
- **Die Live-Domain ist `clublane.one`,** nicht studioos.aelixir.de. Letztere antwortet mit **301**
  auf clublane.one (gemessen 2026-07-28 per `curl -sI`). Wer gegen die alte Adresse testet und
  Redirects nicht folgt (`curl` ohne `-L`), sieht leere Ergebnisse und haelt den Deploy faelschlich
  fuer kaputt.
- **Pages braucht ein bis zwei Minuten**, danach kommt ggf. noch Cloudflare-Cache dazu. Ein sofort
  nach dem Push abgerufener alter Stand ist kein Fehler.

## Entscheidungen
- **Push = Live, bewusst ohne Staging** — die Seite ist klein genug, die Absicherung ist die lokale
  Screenshot-Pruefung vor dem Commit.
- **`CNAME` ist die Wahrheit ueber die Domain** — nicht das Gedaechtnis, nicht der Repo-Name
  (das Repo heisst noch `studioOS-aelixirOS-Webseite`, die Seite laengst clublane.one).

## Zeiger — Kommando statt Kopf
- **Welche Domain ist live?** `cat CNAME`
- **Woraus baut Pages gerade?**
  `gh api repos/mkw3008/studioOS-aelixirOS-Webseite/pages --jq '{source,build_type,cname,status}'`
- **Aktueller Cache-Buster:** `grep -o 'style\.css?v=[0-9]*' index.html`
- **Ist der letzte Commit oben angekommen?**
  `git log --oneline -1 && git status -sb | head -1`
- **Ist die Live-Seite auf dem neuen Stand?**
  `curl -sL https://clublane.one/ | grep -o 'style\.css?v=[0-9]*'`
- **Sind die Blaetter wirklich nicht oeffentlich?**
  `curl -s -o /dev/null -w "%{http_code}\n" https://clublane.one/_flow/ROUTER.md`  (muss 404 sein)
