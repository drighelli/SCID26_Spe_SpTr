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
- internet access for the initial setup

### Recommended

- 4 or more CPU cores
- 16 GB RAM
- 25 GB free disk space

There are two ways to run the workshop:

1. **Docker** — recommended for local machines
2. **IFB Biosphere** — using the provided virtual machine

---

## Option 1 — Docker

Docker provides the complete workshop environment, including R, Bioconductor,
RStudio Server, required packages, and workshop data.

### Requirements
Install a recent version of Docker:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) on macOS or Windows
- [Docker Engine](https://docs.docker.com/engine/install/) or
  [Docker Desktop](https://docs.docker.com/desktop/setup/install/linux/) on Linux

Check that Docker is available:

```bash
docker --version
```

The image supports both `linux/amd64` and `linux/arm64`. Docker will
automatically select the correct architecture.

### Pull the image

```bash
docker pull ghcr.io/drighelli/scid26_spe_sptr:latest
```

The initial download may take several minutes.

### Start the workshop

```bash
docker run \
    --rm \
    --name scid26-workshop \
    -p 8787:8787 \
    -e PASSWORD=scid2026 \
    ghcr.io/drighelli/scid26_spe_sptr:latest
```

Open on your browser:

```text
http://localhost:8787
```

Login with:

```text
username: rstudio
password: scid2026
```

The workshop material is available at:

```text
/home/rstudio/workshop
```

To stop the container, press `Ctrl+C` in the terminal.

---

## Option 2 — IFB Biosphere

Participants using the IFB Biosphere virtual machine do not need Docker.

The workshop repository is available at:

```text
/home/rstudio/ifbdata/scid2026/dario/SCID26_Spe_SpTr
```
### IFB virtual machine

When creating the IFB Biosphere virtual machine, select:

```text
Flavor: ifb.tr.2xlarge
CPU:    16 vCPU
RAM:    16 GB
Disk:   200 GB
````

Once the virtual machine is available, open a Terminal from RStudio Server and
move to the workshop repository:

```bash
cd /home/rstudio/ifbdata/scid2026/dario/SCID26_Spe_SpTr

./scripts/install_system_dependencies.sh

Rscript scripts/install_packages.R
Rscript scripts/download_data.R
```

The setup requires:

- access to the assigned IFB virtual machine
- RStudio Server access
- terminal access
- `sudo` privileges during system dependency installation
- internet access during the initial setup

---

## Workshop environment

The Docker environment is based on:

```text
R 4.6.1
Bioconductor 3.23
```

using the official Bioconductor image:

```text
ghcr.io/bioconductor/bioconductor:3.23-R-4.6.1
```

`SpaceTrooper` is installed from:

```text
drighelli/SpaceTrooper@devel
```

which is the same version as in Bioconductor devel.

The main imaging-based example uses the OSTA dataset:

```text
CosMx1k_MouseBrain2
```

Required packages and data are prepared automatically in the Docker image.

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
- `scripts/install_packages.R` — installs required R/Bioconductor packages
- `scripts/install_system_dependencies.sh` — installs required system libraries
- `scripts/download_data.R` — downloads and prepares workshop data
- `Dockerfile` — defines the reproducible workshop environment

---

## Links

- [Bioconductor](https://bioconductor.org/)
- [OSTA](https://lmweber.org/OSTA/)
- [SpatialExperiment](https://bioconductor.org/packages/SpatialExperiment/)
- [SpaceTrooper](https://github.com/drighelli/SpaceTrooper)