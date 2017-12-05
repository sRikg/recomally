df1 <- puller(read_file_type = 3, readable = "Recomally_Data_Collator", sheetIndex = "Collated List")
df2 <- puller(read_file_type = 3, readable = "Recomally_Data_Collator", sheetIndex = "Collated List - 2")
df3 <- puller(read_file_type = 3, readable = "Recomally_Data_Collator", sheetIndex = "Collated List Lancers")

df <- rbind(rbind(df1, df2), df3)
rm(df1)
rm(df2)
rm(df3)

df <- df[,-1]
df <- unique(df)
df[,6] <- paste0("https://", df[,6])

df[,2] <- html_correcter(df[,2])
df[,5] <- html_correcter(df[,5])
df[,6] <- html_correcter(df[,6])

valids <- sapply(
  1:length(unique(df[,2])), 
  function(i) artist_validity_tester(
    df, 
    unique(df[,2])[i])
  )

validation <- sum(sum(valids == "valid") == length(unique(df[,1])))
rm(valids)
# if(validation) == 1 {proceed} else {recheck data}
rm(valdiation)

