options(
    repos=c(CRAN="https://cloud.r-project.org"),
    Ncpus=max(1L, parallel::detectCores() - 1L)
)

if (!requireNamespace("BiocManager", quietly=TRUE)) {
    install.packages("BiocManager")
}

cranPackages <- c(
    "arrow",
    "cowplot",
    "data.table",
    "dplyr",
    "e1071",
    "ggplot2",
    "ggpubr",
    "glmnet",
    "knitr",
    "quarto",
    "remotes",
    "rlang",
    "robustbase",
    "rmarkdown",
    "sf",
    "sfheaders"
)

BiocManager::install(
    cranPackages,
    version="3.23",
    ask=FALSE,
    update=FALSE
)

biocPackages <- c(
    "BumpyMatrix",
    "DropletUtils",
    "MoleculeExperiment",
    "OSTA.data",
    "rhdf5",
    "S4Vectors",
    "scater",
    "scuttle",
    "SingleCellExperiment",
    "SpatialExperiment",
    "SpatialExperimentIO",
    "SpatialFeatureExperiment",
    "STexampleData",
    "SummarizedExperiment",
    "TENxIO",
    "VisiumIO",
    "XeniumIO",
    "ggspavis"
)

BiocManager::install(
    biocPackages,
    version="3.23",
    ask=FALSE,
    update=FALSE
)

remotes::install_github(
    "drighelli/SpaceTrooper",
    ref="devel",
    dependencies=FALSE,
    upgrade="never",
    force=TRUE
)

requiredPackages <- c(
    cranPackages,
    biocPackages,
    "SpaceTrooper"
)

installed <- vapply(
    requiredPackages,
    requireNamespace,
    logical(1),
    quietly=TRUE
)

if (!all(installed)) {
    stop(
        "Missing packages: ",
        paste(requiredPackages[!installed], collapse=", ")
    )
}

message("Workshop packages installed successfully.")
message("R: ", R.version.string)
message("Bioconductor: ", BiocManager::version())
message(
    "SpaceTrooper: ",
    as.character(packageVersion("SpaceTrooper"))
)
