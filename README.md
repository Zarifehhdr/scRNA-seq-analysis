# scRNA-seq Analysis Pipeline

This repository contains scripts and notebooks to process and analyze single-cell RNA sequencing (scRNA-seq) data. The goal is to identify cell types, states, and differentially expressed genes involved in aging.

## Overview

The pipeline includes the following stages:

- Raw Data Processing with Cell Ranger
The included SLURM job script  uses the 10x Genomics Cell Ranger tool (v7.0.0) to generate count matrices from raw FASTQ files.

- Quality Control and Filtering 
An R Markdown notebook processes Cell Ranger output using the Seurat package:

** Creates individual Seurat objects per sample

** Performs quality control

** Filters low-quality cells and low-abundance genes

** Normalizes and scales data

** Integrates samples (with optional Harmony correction)

** Clusters cells and performs UMAP for visualization

- Cell Type Annotation and Differential Expression

** Marker gene analysis is performed using FindAllMarkers and FindMarkers

** Cell identities are assigned based on known marker genes

** Dot plots, heatmaps, and feature plots visualize cluster-specific expression

** Reference-based cell type annotation is optionally supported using SingleR

## Requirements
 
Cluster: SLURM-based HPC cluster (for running Cell Ranger)

Software:

Cell Ranger ≥ 7.0.0

R ≥ 4.2.0

R packages: Seurat, harmony, SingleR, ggplot2, openxlsx, dplyr, patchwork, etc.

## Usage
Modify cellranger_count.sbatch:

Set correct paths to FASTQ data and transcriptome, as well as output paths in all files

Run the R notebook (scRNA_analysis.Rmd) in RStudio or from command line.
