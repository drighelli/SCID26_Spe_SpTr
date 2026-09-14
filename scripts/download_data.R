library(OSTA.data)

datasetId <- "CosMx1k_MouseBrain2"

dataRoot <- "/opt/workshop-data"
dataDir <- file.path(dataRoot, datasetId)

dir.create(
    dataDir,
    recursive=TRUE,
    showWarnings=FALSE
)

archivePath <- OSTA.data_load(
    datasetId,
    pol=TRUE,
    mol=FALSE
)

unzip(
    archivePath,
    exdir=dataDir
)

message(
    "Dataset installed in: ",
    dataDir
)
