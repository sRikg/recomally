artist_validity_tester <- function(data_frame, artist){
  temp <- data_frame[data_frame$Artist.Name == artist,]
  temp_num <- sum(temp$cleaned.likes %in% unique(temp$Artist.Id))
  if(temp_num == length(unique(temp$cleaned.User.Id))) {
    print("valid") 
  } else {
    print("invalid")
  }
}
