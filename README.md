# SpatialExperiment + SpaceTrooper workshop

Materials for the SCID 2026 workshop:

**SpatialExperiment and SpaceTrooper: Unified Infrastructure and Quality Control
Workflows for Spatial Omics Data**

The workshop introduces the Bioconductor infrastructure for spatial omics data,
with a focus on `SpatialExperiment`, and then moves to spatially aware quality
control of imaging-based spatial omics data using `SpaceTrooper`.

The practical material is written in Quarto and includes examples based on
sequencing- and imaging-based spatial transcriptomics technologies.

## Workshop overview

The workshop covers:

- the Bioconductor spatial omics ecosystem and OSTA;
- the `SpatialExperiment` data model;
- construction and inspection of `SpatialExperiment` objects;
- sequencing-based and imaging-based spatial experiments;
- molecule-level information and `BumpyMatrix`;
- visualization with `ggspavis`;
- spatial data import through the Bioconductor IO ecosystem;
- imaging-based spatial QC with `SpaceTrooper`;
- FOV structure and border effects;
- integration of multiple QC metrics through the `QScore`;
- spatial interpretation of low-quality cells and technical artifacts.

The slides introduce the main concepts, while the Quarto document contains the
hands-on analysis.

---

# Recommended setup: Docker

The easiest way to run the workshop locally is using the pre-built Docker image
published through the GitHub Container Registry.

The image already contains:

- R 4.6.1;
- Bioconductor 3.23;
- RStudio Server;
- all R/Bioconductor packages required by the workshop;
- the development version of `SpaceTrooper`;
- the workshop material;
- the datasets required for the practical.

No local R package installation is required.

## 1. Install Docker

Install Docker Desktop on macOS or Windows, or Docker Engine on Linux.

Check that Docker is available:

```bash
docker --version
````

## 2. Pull the workshop image

```bash
docker pull ghcr.io/drighelli/scid26_spe_sptr:latest
```

## 3. Start RStudio Server

On Linux or Intel-based macOS systems:

```bash
docker run \
    --rm \
    --name scid26-workshop \
    -p 8787:8787 \
    -e PASSWORD=scid2026 \
    ghcr.io/drighelli/scid26_spe_sptr:latest
```

The current image is built for `linux/amd64`.

On Apple Silicon Macs, use:

```bash
docker run \
    --rm \
    --platform linux/amd64 \
    --name scid26-workshop \
    -p 8787:8787 \
    -e PASSWORD=scid2026 \
    ghcr.io/drighelli/scid26_spe_sptr:latest
```

Then open:

```text
http://localhost:8787
```

and log in with:

```text
username: rstudio
password: scid2026
```

The workshop material is available inside the container at:

```text
/home/rstudio/workshop
```

## 4. Update the image

To make sure you are using the latest workshop environment:

```bash
docker pull ghcr.io/drighelli/scid26_spe_sptr:latest
```

Then start the container again.

## 5. Stop the container

If Docker is running in the foreground, press:

```text
Ctrl+C
```

If the container is running in the background:

```bash
docker stop scid26-workshop
```

---

# IFB Biosphere setup

For participants using the IFB virtual machines, the workshop repository is
already available at:

```text
/home/rstudio/ifbdata/scid2026/dario/SCID26_Spe_SpTr
```

Open a Terminal from RStudio Server and move to the workshop repository:

```bash
cd /home/rstudio/ifbdata/scid2026/dario/SCID26_Spe_SpTr
```

Install the required system dependencies:

```bash
chmod +x scripts/install_system_dependencies.sh
./scripts/install_system_dependencies.sh
```

Then install the R/Bioconductor packages:

```bash
Rscript scripts/install_packages.R
```

Finally, download and prepare the workshop data:

```bash
Rscript scripts/download_data.R
```

The complete setup is therefore:

```bash
cd /home/rstudio/ifbdata/scid2026/dario/SCID26_Spe_SpTr

chmod +x scripts/install_system_dependencies.sh
./scripts/install_system_dependencies.sh

Rscript scripts/install_packages.R
Rscript scripts/download_data.R
```

---

# Docker image

The workshop image is based on the official Bioconductor Docker image:

```text
ghcr.io/bioconductor/bioconductor:3.23-R-4.6.1
```

The main workshop environment therefore uses:

```text
R 4.6.1
Bioconductor 3.23
```

`SpaceTrooper` is installed from its GitHub development branch:

```text
drighelli/SpaceTrooper@devel
```

The image is automatically built by GitHub Actions and published to the GitHub
Container Registry.

---

# Repository structure

```text
SCID26_Spe_SpTr/
├── .github/
│   └── workflows/
│       └── build-workshop-image.yml
│
├── scripts/
│   ├── install_packages.R
│   ├── install_system_dependencies.sh
│   └── download_data.R
│
├── workshop/
│   ├── workshop.qmd
│   ├── _quarto.yml
│   └── ...
│
├── Dockerfile
└── README.md
```

## `workshop/`

Contains the Quarto source and the material used during the workshop.

## `scripts/install_packages.R`

Installs the CRAN and Bioconductor packages required by the workshop and the
development version of `SpaceTrooper`.

## `scripts/install_system_dependencies.sh`

Installs Linux system libraries required by packages such as `sf`, `units`,
`s2`, and `magick`.

This script is mainly needed when preparing the IFB virtual machines manually.

## `scripts/download_data.R`

Downloads and prepares the datasets used during the practical sessions.

## `Dockerfile`

Defines the complete reproducible workshop environment.

## `.github/workflows/build-workshop-image.yml`

Builds the Docker image with GitHub Actions and publishes it to the GitHub
Container Registry.

---

# Building the Docker image locally

The Docker image can also be built directly from the repository:

```bash
git clone https://github.com/drighelli/SCID26_Spe_SpTr.git
cd SCID26_Spe_SpTr
```

Build:

```bash
docker build -t scid26-workshop .
```

Run:

```bash
docker run \
    --rm \
    --name scid26-workshop \
    -p 8787:8787 \
    -e PASSWORD=scid2026 \
    scid26-workshop
```

Then open:

```text
http://localhost:8787
```

---

# Working directly with the Quarto source

Using Docker is recommended because it provides the complete reproducible
environment.

If you already have a compatible R/Bioconductor installation and want to work
directly with the workshop source, move to:

```bash
cd workshop
```

Render the workshop with:

```bash
quarto render workshop.qmd
```

Preview while editing:

```bash
quarto preview workshop.qmd
```

The rendered website is generated in the Quarto output directory.

---

# Main R/Bioconductor packages

The workshop uses packages including:

* `SpatialExperiment`
* `SingleCellExperiment`
* `SummarizedExperiment`
* `S4Vectors`
* `BumpyMatrix`
* `ggspavis`
* `STexampleData`
* `OSTA.data`
* `SpatialExperimentIO`
* `SpatialFeatureExperiment`
* `MoleculeExperiment`
* `TENxIO`
* `VisiumIO`
* `XeniumIO`
* `SpaceTrooper`

Additional CRAN and Bioconductor dependencies are installed automatically by
the workshop environment.

---

# Workshop data

The main imaging-based practical uses the OSTA CosMx mouse brain dataset:

```text
CosMx1k_MouseBrain2
```

The data are retrieved through `OSTA.data` and prepared automatically during
the Docker image build or through:

```bash
Rscript scripts/download_data.R
```

This avoids requiring participants to download the dataset during the workshop.

---

# Links

* [Bioconductor](https://bioconductor.org/)
* [OSTA — Orchestrating Spatial Transcriptomics Analysis with Bioconductor](https://lmweber.org/OSTA/)
* [SpatialExperiment](https://bioconductor.org/packages/SpatialExperiment/)
* [SpaceTrooper](https://github.com/drighelli/SpaceTrooper)
