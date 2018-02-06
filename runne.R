valids$new_Artist_Id <- sapply(
  1:length(valids[,1]),
  function(i) unique(
    collated_merged[collated_merged[,1] == valids[i,1], 2]
  )
  )

valids$`Total Number of Likes` <- sapply(
  1:length(valids[,1]),
  function(i) unique(
    collated_merged[collated_merged[,1] == valids[i,1], 3]
  )
  )

valids$`Total Number of Followers` <- sapply(
  1:length(valids[,1]),
  function(i) unique(
    collated_merged[collated_merged[,1] == valids[i,1], 4]
  )
  )

invalids <- valids[which(valids[,3] < valids[,4]),]
invalids[,1] <- as.character(invalids[,1])

row_adder <- function(collated_merged, i){
  vec <- c(
    invalids[i,1],
    invalids[i,5],
    invalids[i,6],
    invalids[i,7]
  )
  
  users <- unique(
    collated_merged[collated_merged[,1] == invalids[i,1], 5]
  )
  
  df <- do.call(
    rbind, 
    lapply(
      1:length(users),
      function(i) c(vec, users[i])
      )
  )
  
  df <- cbind(cbind(df, df[,2]), df[,1])
  
  df_class <- sapply(
    1:ncol(collated_merged),
    function(i) class(collated_merged[,i])
    )
  
  df <- cbind(
    cbind(
      df,
      "musician/band"
    ),
    1
  )
  
  df <- as.data.frame(df)
  
  names(df) <- names(collated_merged)
  
  for(j in length(df_class)){
    if(df_class[j] == "numeric"){
      df[,j] <- as.numeric(df[,j])
    } else {
      df[,j] <- as.character(df[,j])
    }
  }
  
  return(df)
}

list_added <- lapply(
  1:nrow(invalids),
  function(i) row_adder(collated_merged, i)
  )

df_added <- do.call(
  rbind,
  list_added
)

collated_merged <- rbind(collated_merged, df_added)
collated_merged <- unique(collated_merged)
collated_merged <- collated_merged[
  order(collated_merged[,1],
        collated_merged[,5],
        collated_merged[,6]
       ),
]

data <- sparse_Creator(collated_merged, 5, 6)
