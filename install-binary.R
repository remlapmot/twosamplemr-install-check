if (Sys.info()['sysname'] != "Linux") {
  options(
    repos = c(
      CRAN = "https://cloud.r-project.org",
      universe = "https://mrcieu.r-universe.dev"
    )
  )
} else if (Sys.info()['machine'] != "arm64") {
  # Installation code for Ubuntu Noble Numbat users running R in the Terminal
  options(
    HTTPUserAgent = sprintf(
      "R/%s R (%s)",
      getRversion(),
      paste(
        getRversion(),
        R.version["platform"],
        R.version["arch"],
        R.version["os"]
      )
    ),
    repos = c(
      'https://mrcieu.r-universe.dev/bin/linux/noble/4.4/',
      'https://p3m.dev/cran/__linux__/noble/latest',
      'https://cloud.r-project.org'
    )
  )
}
install.packages("TwoSampleMR", dependencies = TRUE)
