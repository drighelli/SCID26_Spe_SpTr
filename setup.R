# Run once before rendering the workshop.
# Works with a recent R installation.

cran_packages <- c(
  "knitr",
  "rmarkdown",
  "BiocManager"
)

missing_cran <- cran_packages[
  !vapply(cran_packages, requireNamespace, logical(1), quietly = TRUE)
]

if (length(missing_cran)) {
  install.packages(missing_cran, repos = "https://cloud.r-project.org")
}

bioc_packages <- c(
  "SpatialExperiment",
  "S4Vectors"
)

missing_bioc <- bioc_packages[
  !vapply(bioc_packages, requireNamespace, logical(1), quietly = TRUE)
]

if (length(missing_bioc)) {
  BiocManager::install(missing_bioc, ask = FALSE, update = FALSE)
}

cat("\nPackage check:\n")
for (pkg in c(cran_packages, bioc_packages)) {
  cat(sprintf("  %-20s %s\n",
              pkg,
              if (requireNamespace(pkg, quietly = TRUE))
                as.character(packageVersion(pkg))
              else
                "NOT INSTALLED"))
}

cat("\nSetup complete.\n")
cat("Render with:\n  quarto render workshop.qmd\n")
