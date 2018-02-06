artist_validity_tester <- function(data_frame, artist){
  temp <- data_frame[data_frame$`Artist Name` == artist,]
  temp_num <- sum(temp$page_Link %in% unique(temp$new_Artist_Id))
  if(temp_num == length(unique(temp$cleaned.User.Id))) {
    print("valid") 
  } else {
    print("invalid")
  }
}

valids <- as.data.frame(
  cbind(
    unique(collated_merged[,1]),
    valids
  )
)
names(valids) <- c("Artist Name", "valids")

artist_valid_num <- function(data_frame, artist){
  temp <- data_frame[data_frame$`Artist Name` == artist,]
  temp_num <- sum(temp$page_Link %in% unique(temp$new_Artist_Id))
  return(c(temp_num, length(unique(temp$cleaned.User.Id))))
}

valids[,3:4] <- t(
  sapply(
    1:length(valids[,1]),
    function(i) artist_valid_num(collated_merged, valids[i,1])
    )
)

