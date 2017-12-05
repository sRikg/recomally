df1 <- puller(read_file_type = 3, readable = "Recomally_Data_Collator", sheetIndex = "Collated List")
df2 <- puller(read_file_type = 3, readable = "Recomally_Data_Collator", sheetIndex = "Collated List - 2")
df3 <- puller(read_file_type = 3, readable = "Recomally_Data_Collator", sheetIndex = "Collated List Lancers")

df <- rbind(rbind(df1, df2), df3)
rm(df1)
rm(df2)
rm(df3)

df <- df[,-1]
