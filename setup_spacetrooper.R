# Install/check packages needed to render workshop_spacetrooper_v2.qmd

cran <- c("knitr", "rmarkdown", "remotes", "ggplot2")
missing <- cran[!vapply(cran, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) {
  install.packages(missing, repos = "https://cloud.r-project.org")
}

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager", repos = "https://cloud.r-project.org")
}

bioc <- c(
  "SpatialExperiment",
  "SummarizedExperiment",
  "S4Vectors"
)

missing_bioc <- bioc[!vapply(bioc, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing_bioc)) {
  BiocManager::install(missing_bioc, ask = FALSE, update = FALSE)
}

# Workshop is built against the development branch requested for SpaceTrooper.
# Reinstall when you want to sync the practical to the latest devel API.
remotes::install_github(
  "drighelli/SpaceTrooper",
  ref = "devel",
  upgrade = "never"
)

cat("\nReady.\n")
cat("Render with:\n")
cat("  quarto render workshop_spacetrooper_v2.qmd\n")
