# depending on what is given choose the option
# 1 - CSV, 2 - XLSX, 3 - Google Sheets
puller <- function(read_file_type, readable, sheetIndex = NA, ...){
  if(read_file_type == 1){
    worthy <- read.csv(readable)
  } else if(read_file_type == 2){
    require(xlsx)
    if(sum(is.na(sheetIndex)) == 1) {
      print("Error, please provide Sheet Index")
    } else {
      worthy <- read.xlsx(readable, sheetIndex = sheetIndex)
    }
  } else if(read_file_type == 3) {
    require(googlesheets)
    temp <- gs_title(readable)
    if(sum(is.na(sheetIndex)) == 1) {
      print("Error, please provide Sheet Index")
    } else {
      worthy <- gs_read(temp, sheetIndex)
    }
    worthy <- as.data.frame(worthy)
  } else {
    print("Provide a valid read_file_type")
  }
}
