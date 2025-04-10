install.packages(
  "pak",
  repos = sprintf(
    "https://r-lib.github.io/p/pak/stable/%s/%s/%s",
    .Platform$pkgType,
    R.Version()$os,
    R.Version()$arch
  )
)

if (Sys.info()["sysname"] != "Linux") {
  # Windows and macOS
  pak::repo_add(CRAN = "https://cloud.r-project.org")
  pak::repo_add(universe = "https://mrcieu.r-universe.dev")
  pak::pkg_install("TwoSampleMR", dependencies = TRUE, upgrade = TRUE)
} else if (Sys.info()["machine"] != "arm64") {
  # Linux x86_64
  pak::repo_add(CRAN = "https://mrcieu.r-universe.dev/bin/linux/noble/4.4/")
  pak::repo_add(universe = "https://p3m.dev/cran/__linux__/noble/latest")
  pak::pkg_install("TwoSampleMR", dependencies = TRUE, upgrade = TRUE)
} else if (Sys.info()["machine"] != "arm64") {
  # Linux arm64
  options(
    repos = c(
      CRAN = "https://cloud.r-project.org",
      universe = "https://mrcieu.r-universe.dev"
    )
  )
  install.packages("TwoSampleMR", dependencies = TRUE)
}
