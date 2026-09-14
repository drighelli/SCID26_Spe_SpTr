# SCID 2026 SpatialExperiment + SpaceTrooper workshop
# IFB Biosphere RStudio Server deployment
#
# Base environment:
#   R 4.6.1
#   Bioconductor 3.23 release
#
# All Bioconductor packages are installed from release 3.23, except
# SpaceTrooper, which is installed explicitly from Bioconductor 3.24 devel.

options(
    repos=c(CRAN="https://cloud.r-project.org"),
    Ncpus=max(1L, parallel::detectCores() - 1L)
)

if (!requireNamespace("BiocManager", quietly=TRUE)) {
    install.packages("BiocManager")
}

cranPackages <- c(
    "ggplot2",
    "knitr",
    "rmarkdown",
    "quarto"
)

missingCran <- cranPackages[
    !vapply(
        cranPackages,
        requireNamespace,
        logical(1),
        quietly=TRUE
    )
]

if (length(missingCran) > 0L) {
    install.packages(missingCran)
}

releasePackages <- c(
    "SpatialExperiment",
    "SingleCellExperiment",
    "SummarizedExperiment",
    "S4Vectors",
    "BumpyMatrix",
    "ggspavis",
    "STexampleData",
    "OSTA.data",
    "SpatialExperimentIO",
    "SpatialFeatureExperiment",
    "MoleculeExperiment",
    "TENxIO",
    "VisiumIO",
    "XeniumIO"
)

BiocManager::install(
    releasePackages,
    version="3.23",
    ask=FALSE,
    update=FALSE
)

# Install only SpaceTrooper from Bioconductor devel.
# dependencies=FALSE avoids replacing Bioconductor 3.23 dependencies
# with their 3.24 devel versions.
develRepos <- BiocManager::repositories(version="3.24")

develPackages <- available.packages(
    repos=develRepos["BioCsoft"],
    type="source"
)

if (!"SpaceTrooper" %in% rownames(develPackages)) {
    stop(
        "SpaceTrooper was not found in the ",
        "Bioconductor 3.24 devel repository."
    )
}

expectedSpaceTrooperVersion <- develPackages[
    "SpaceTrooper",
    "Version"
]

install.packages(
    "SpaceTrooper",
    repos=develRepos["BioCsoft"],
    type="source",
    dependencies=FALSE
)

installedSpaceTrooperVersion <- as.character(
    utils::packageVersion("SpaceTrooper")
)

if (installedSpaceTrooperVersion != expectedSpaceTrooperVersion) {
    stop(
        "Wrong SpaceTrooper version installed. Expected ",
        expectedSpaceTrooperVersion,
        ", found ",
        installedSpaceTrooperVersion,
        "."
    )
}

requiredPackages <- c(
    cranPackages,
    releasePackages,
    "SpaceTrooper"
)

failedPackages <- requiredPackages[
    !vapply(
        requiredPackages,
        requireNamespace,
        logical(1),
        quietly=TRUE
    )
]

if (length(failedPackages) > 0L) {
    stop(
        "Workshop environment incomplete. Missing packages: ",
        paste(failedPackages, collapse=", ")
    )
}

message("SCID 2026 workshop environment installed successfully.")
message("R: ", R.version.string)
message("Bioconductor base: ", BiocManager::version())
message(
    "SpaceTrooper devel: ",
    installedSpaceTrooperVersion
)
