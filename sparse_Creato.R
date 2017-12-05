sparse_Creator <- function(data_frame, col_num_user, col_num_likes){
  data <- data_frame[,c(col_num_user, col_num_likes)]
  
  users <- unique(data[,1])
  likes <- unique(data[,2])
  
  dt <- as.data.frame(
    matrix(
      ncol = length(likes), 
      nrow = length(users), 
      0
    )
  )
  
  temp <- lapply(
    1:length(users), 
    function(i) (likes %in% data[data[,1] == users[i], 2])*1
    )
  print("Sparse Values generated")
  
  for(i in 1:length(users)){
    dt[i,] <- temp[[i]]
    rownames(dt)[i] <- users[i]
  print(".", i)
  }
  
  return(dt)
}
