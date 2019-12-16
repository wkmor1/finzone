run <- function(){

  shinyTmpDir <- tempdir()

  setwd(shinyTmpDir)

  shinyUiDir <- system.file("examples", "01_hello", package = "shiny")
  shinyUiFiles <- list.files(path = shinyUiDir, full.names = TRUE)
  sapply(shinyUiFiles, function(x){
    file.copy(from = x, to = file.path(shinyTmpDir, basename(x)),
              overwrite = TRUE, recursive = TRUE)}
  )

  runApp(appDir = shinyTmpDir)

}
