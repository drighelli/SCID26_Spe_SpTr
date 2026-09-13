# SpatialExperiment + SpaceTrooper workshop

This folder contains the current first-hour draft of the workshop and everything
needed to render it locally with Quarto.

## Files

- `workshop.qmd` — workshop source
- `_quarto.yml` — Quarto project configuration
- `setup.R` — installs/checks the R dependencies used by the current draft
- `render.sh` — one-command setup + render

## Requirements

You need:

1. a recent R installation;
2. Quarto installed and available on your `PATH`.

Check them with:

```bash
R --version
quarto --version
```

## First render

From this folder:

```bash
Rscript setup.R
quarto render workshop.qmd
```

The rendered file will be:

```text
_site/workshop.html
```

Alternatively:

```bash
./render.sh
```

## Preview while editing

```bash
quarto preview workshop.qmd --no-browser
```

or simply:

```bash
quarto preview workshop.qmd
```

## If RStudio / VS Code cannot find the same R

Check:

```bash
which R
which Rscript
```

and make sure Quarto is using the intended R installation.

## Current R/Bioconductor dependencies

The current draft uses:

- `SpatialExperiment`
- `S4Vectors`
- `knitr`
- `rmarkdown`

`setup.R` installs them if missing.

SpaceTrooper dependencies will be added when the second half of the workshop is
implemented.
# SCID26_Spe_SpTr
