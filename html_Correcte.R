html_correcter <- function(vec){
  temp <- sapply(strsplit(vec, split = "facebook.com/"), "[", 2)
  temp <- paste0("https://www.facebook.com/", temp)
  return(temp)
}
