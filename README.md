# webcounter – viikon 3 tehtävät 2–4

Ohtulaskuri (TKT20006 Ohjelmistotuotanto, viikko 3). Flask-sovellus, jonka
toiminnot:

- laskurin kasvatus ("Paina", `POST /increment`)
- laskurin nollaus ("Nollaa", `POST /reset`)
- laskurin asettaminen haluttuun arvoon ("Aseta", `POST /set`)

Lomakkeiden käsittelyssä käytetään Post/Redirect/Get-periaatetta.

## Käyttö

```bash
uv sync
uv run python3 src/index.py     # http://localhost:5001
```

## Testit (Robot Framework + Browser-kirjasto)

```bash
uv run rfbrowser install chromium        # testiselain projektin .venv:iin
bash run_robot_tests.sh                  # CI:n tapaan: käynnistää Flaskin, ajaa testit, sammuttaa
```

Testiajo valmiiksi käynnissä olevaa sovellusta vasten:

```bash
uv run robot src/tests                              # näkyvä selain
uv run robot --variable HEADLESS:true src/tests     # headless
```

Yksittäinen testitapaus: `uv run robot -t "When counter is set to 10 the value is ten" src/tests/set.robot`

| tiedosto | mitä testaa |
| --- | --- |
| `src/tests/increment.robot` | laskurin kasvatus |
| `src/tests/reset.robot` | nollaus |
| `src/tests/set.robot` | laskurin asettaminen arvoon |

Jokainen testitiedosto alkaa nollatilasta: `Test Setup` on `Reset Counter`
(`src/tests/resource.robot`), joka avaa etusivun ja painaa "Nollaa".

## CI

`.github/workflows/main.yaml` ajaa GitHub Actionissa saman
`run_robot_tests.sh`-skriptin kuin paikallisesti (testit headless-tilassa).
