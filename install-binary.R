install.packages(
  "pak",
  repos = sprintf(
    "https://r-lib.github.io/p/pak/devel/%s/%s/%s",
    .Platform$pkgType,
    R.Version()$os,
    R.Version()$arch
  )
)

# Set HTTPUserAgent so that PPPM serves binary R packages for Linux
options(HTTPUserAgent = sprintf(
  "R/%s R (%s)", getRversion(),
  paste(
    getRversion(),
    R.version["platform"],
    R.version["arch"],
    R.version["os"]
  )
))

if (Sys.info()["sysname"] != "Linux") {
  # Windows and macOS
  pak::repo_add(CRAN = "https://cloud.r-project.org")
  pak::repo_add(universe = "https://mrcieu.r-universe.dev")
  pak::pkg_install(c("TwoSampleMR", "sessioninfo"), dependencies = TRUE)
} else if (Sys.info()["machine"] == "x86_64") {
  # Linux x86_64
  print(getRversion())
  if (getRversion() >= "4.6.0") {
    pak::repo_add(universe = "https://mrcieu.r-universe.dev/bin/linux/noble-x86_64/4.6/")
  } else if (getRversion() == '4.5.1') {
    pak::repo_add(universe = "https://mrcieu.r-universe.dev/bin/linux/noble-x86_64/4.5/")
  } else {
    pak::repo_add(universe = "https://mrcieu.r-universe.dev/")
  }
  pak::repo_add(CRAN = "https://p3m.dev/cran/__linux__/noble/latest")
  pak::repo_add(CRANbackup = "https://cloud.r-project.org")
  
  if (getRversion() >= '4.6.0') {
    install.packages(c("TwoSampleMR", "sessioninfo"), repos = c(universe = "https://mrcieu.r-universe.dev/bin/linux/noble-x86_64/4.6/", CRAN = "https://p3m.dev/cran/__linux__/noble/latest", CRANbackup = "https://cloud.r-project.org"), dependencies = TRUE)
  } else if (getRversion() >= "4.3.2") {
    pak::pkg_install(c("TwoSampleMR", "sessioninfo"), dependencies = TRUE)
  } else {
    pak::pkg_install(c("TwoSampleMR", "sessioninfo"), dependencies = NA)
  }
} else if (Sys.info()["machine"] == "aarch64") {
  # Linux aarch64
  if (getRversion() >= "4.6.0") {
    install.packages(c("TwoSampleMR", "sessioninfo"), repos = c(universe = "https://mrcieu.r-universe.dev/bin/linux/noble-aarch64/4.6/", CRAN = 'https://cloud.r-project.org'), dependencies = TRUE)
  } else if (getRversion() == "4.5.1") {
    install.packages(c("TwoSampleMR", "sessioninfo"), repos = c(universe = "https://mrcieu.r-universe.dev/bin/linux/noble-aarch64/4.5/", CRAN = "https://cloud.r-project.org"), dependencies = TRUE)
  }
}


library(TwoSampleMR)

sessioninfo::session_info(pkgs = "installed")
