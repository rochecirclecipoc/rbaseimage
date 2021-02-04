#!/usr/bin/env Rscript

options(echo = TRUE)

source("/installation/install_functions.R")

install_packages_with_checks(c("askpass", "testthat", "RCurl", "openxlsx", "countrycode", "dplyr", "RMariaDB")) # needed for SAICE and for curateR
stopifnot(compareVersion(toString(packageVersion("dplyr")), "1.0.0") >= 0)
stopifnot(compareVersion(toString(packageVersion("testthat")), "2.1.0") >= 0)


devtools::install_github(
  repo = "jimhester/lintr",
  host = "api.github.com",
  ref = "adf35808bba23bf1459c3badb61bbe076237640f" # refers to master on Oct 25, 2019 (master still changes a lot)
)

devtools::install_github(
  repo = "hadley/strict",
  host = "api.github.com",
  ref = "446573bb7b4de73ea5cb4bac0ee1a8f8b5289228" # refers to current master which didn't change since Jun 2017
)

install_packages_with_checks(c("here", "ckanr", "BiocManager"))

BiocManager::install(
  c("Biobase", "BiocGenerics", "S4Vectors", "DESeq", "DESeq2",
    "MultiAssayExperiment", "NanoStringQCPro", "SummarizedExperiment",
    "VariantAnnotation")
)
