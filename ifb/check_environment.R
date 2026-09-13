# Quick pre-workshop validation

requiredPackages <- c(
    "SpatialExperiment",
    "SummarizedExperiment",
    "S4Vectors",
    "BumpyMatrix",
    "ggspavis",
    "STexampleData",
    "OSTA.data",
    "SpatialExperimentIO",
    "SpaceTrooper",
    "ggplot2"
)

status <- vapply(
    requiredPackages,
    requireNamespace,
    logical(1),
    quietly=TRUE
)

print(
    data.frame(
        package=requiredPackages,
        installed=unname(status)
    ),
    row.names=FALSE
)

cat("\n", R.version.string, "\n", sep="")

if (requireNamespace("BiocManager", quietly=TRUE)) {
    cat("Bioconductor ", BiocManager::version(), "\n", sep="")
}

if (!all(status)) {
    stop(
        "Missing packages: ",
        paste(requiredPackages[!status], collapse=", ")
    )
}

quartoPath <- Sys.which("quarto")

if (!nzchar(quartoPath)) {
    warning(
        "Quarto CLI was not found on PATH. ",
        "R packages are installed, but quarto render/preview will not work."
    )
} else {
    cat("Quarto: ", quartoPath, "\n", sep="")
    system("quarto --version")
}

cat("\nEnvironment ready for the workshop.\n")
