if(!(require(microbiome))) install.packages("microbiome")
if(!(require(bioformat))) install.packages("bioformat")
if(!(require(ape))) install.packages("ape")
if(!(require(ggplot2))) install.packages("ggplot2")
if(!(require(phyloseq))) install.packages("phyloseq")

library(microbiome)
library(biomformat)
library(ape)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  pfix = prefix()

  parameters <- read.table(inputfile, as.is=T);
  rownames(parameters) <- parameters[,1]
  print(parameters["OTU", 2])
  otu_file <- paste(pfix, toString(parameters["OTU", 2]), sep="/")
  tax_file <- paste(pfix, toString(parameters["TAX", 2]), sep="/")
  sample_file <- paste(pfix, toString(parameters["META", 2]), sep="/")
  p0 <<- read_csv2phyloseq(otu.file = otu_file, taxonomy.file = tax_file, metadata.file = sample_file, sep=",")
}

run <- function() {
  m0 <<- make_biom(data=data.frame(otu_table(p0)), sample_metadata=data.frame(sample_data(p0)), observation_metadata=data.frame(tax_table(p0)))
}

output <- function(outputfile) {
write_biom(m0, paste(outputfile, "biom", sep="."))#"mystuff.biom")
random_tree = rtree(ntaxa(p0), rooted=TRUE, tip.label=taxa_names(p0))
p1 = merge_phyloseq(p0, random_tree)
write.tree(phy_tree(p1), paste(outputfile, "tre", sep="."), tree.names=TRUE)
}
