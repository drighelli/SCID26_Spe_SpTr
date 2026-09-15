# SpatialExperiment + SpaceTrooper

Materials for the SCID 2026 workshop:

**SpatialExperiment and SpaceTrooper: Unified Infrastructure and Quality Control
Workflows for Spatial Omics Data**

The workshop introduces the Bioconductor infrastructure for spatial omics data,
with a focus on `SpatialExperiment`, and spatially aware quality control of
imaging-based spatial omics data using `SpaceTrooper`.

## Requirements

### Minimum

- 4 CPU cores
- 8 GB RAM
- 20 GB free disk space
- a recent web browser
- internet access for the initial Docker image download

### Recommended

- 4 or more CPU cores
- 16 GB RAM
- 25 GB free disk space

The workshop environment is distributed as a Docker image and supports both:

```text
linux/amd64
linux/arm64
```

Docker automatically selects the appropriate architecture for your machine.

---

## Install Docker

Install a recent version of Docker:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
  on macOS or Windows
- [Docker Engine](https://docs.docker.com/engine/install/) or
  [Docker Desktop](https://docs.docker.com/desktop/setup/install/linux/)
  on Linux

After installation, start Docker Desktop if you are using macOS or Windows.

---

## Open a terminal

The commands below must be run from a terminal.

### macOS

Open the **Terminal** application.

You can find it in:

```text
Applications > Utilities > Terminal
```

### Windows

Open **PowerShell**.

You can search for:

```text
PowerShell
```

from the Windows Start menu.

### Linux

Open your usual terminal application.

---

## Check Docker

Run:

```bash
docker --version
```

You should see the installed Docker version.

---

## Download the workshop image

Run:

```bash
docker pull ghcr.io/drighelli/scid26_spe_sptr:latest
```

The first download may take several minutes because the image contains the
complete R/Bioconductor environment, all required packages, and the workshop
data.

---

## Start the workshop

Run:

```bash
docker run --rm --name scid26-workshop -p 8787:8787 -e PASSWORD=scid2026 ghcr.io/drighelli/scid26_spe_sptr:latest
```

The same command can be used on macOS, Windows PowerShell, and Linux.

Once the container has started, open a web browser and go to:

```text
http://localhost:8787
```

Log in with:

```text
username: rstudio
password: scid2026
```

The workshop material is available inside RStudio at:

```text
/home/rstudio/workshop
```

---

## Stop the workshop

If the container is running in the terminal, press:

```text
Ctrl+C
```

The container will be removed automatically because it was started with
`--rm`.

---

## Workshop environment

The Docker image is based on the official Bioconductor image:

```text
ghcr.io/bioconductor/bioconductor:3.23-R-4.6.1
```

and provides:

```text
R 4.6.1
Bioconductor 3.23
RStudio Server
```

The image also contains the R/Bioconductor packages and datasets required for
the practical sessions.

`SpaceTrooper` is installed from its development branch:

```text
drighelli/SpaceTrooper@devel
```

The main imaging-based example uses the OSTA dataset:

```text
CosMx1k_MouseBrain2
```

---

## Repository structure

```text
SCID26_Spe_SpTr/
├── slides/
├── workshop/
├── scripts/
├── Dockerfile
└── README.md
```

- `slides/` — Slides in pdf
- `workshop/` — Quarto workshop material
- `scripts/install_packages.R` — installs the required R/Bioconductor packages
- `scripts/download_data.R` — downloads and prepares the workshop data
- `Dockerfile` — defines the reproducible workshop environment

---

## Workshop website

The rendered workshop material is also available online:

```text
https://drighelli.github.io/SCID26_Spe_SpTr/
```

The website can be used to browse the workshop material without running Docker.
Docker is required to reproduce the analyses interactively.

---

## Links

- [Bioconductor](https://bioconductor.org/)
- [OSTA](https://lmweber.org/OSTA/)
- [SpatialExperiment](https://bioconductor.org/packages/SpatialExperiment/)
- [SpaceTrooper](https://github.com/drighelli/SpaceTrooper)