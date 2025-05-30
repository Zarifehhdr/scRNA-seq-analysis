install.packages("rhdf5")
library(rhdf5)

######################

data <-h5ls("../outs/filtered_feature_bc_matrix.h5")
str(data)

##########################
library(utils)

# Open the gzipped file
gz_file <- gzfile("../outs/filtered_feature_bc_matrix/matrix.mtx.gz", "r")

# Read the contents of the file into a data frame
ft <- read.table(gz_file, sep="\t", header=TRUE)  # Change sep="\t" to whatever separator your TSV file uses

dim(ft)
# Now 'data' contains your data as a data frame
close(gz_file)

####################################################
##########################
####################################################
library(Seurat)
library(kableExtra)
library(ggplot2)
ids <- c("GEX_LAF6502A11", "GEX_LAF6502A9",
         "GEX_LAF6502A12", "GEX_LAF6502A10")


d10x.data <- Read10X_h5("/../outs/filtered_feature_bc_matrix.h5")
str(d10x.data)

info <- h5ls("../outs/molecule_info.h5")
experiment.data <- d10x.data

experiment.aggregate <- CreateSeuratObject(
  experiment.data,
  #project = aging,
  min.cells = 0,
  min.features =200,
  names.field = 2,
  names.delim = "\\-")

experiment.aggregate
str(experiment.aggregate)
#################meta data

