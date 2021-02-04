default_r_repos <- "http://cran.rstudio.com"

install_packages_with_checks <- function(pkgs, repos = default_r_repos) {
  stopifnot(all(pkgs %in% utils::available.packages(repos = default_r_repos)[, "Package"]))
  utils::install.packages(pkgs, repos = repos, type = "source")
  stopifnot(all(pkgs %in% utils::installed.packages()[, "Package"]))
}