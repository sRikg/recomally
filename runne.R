valids <- sapply(
  1:length(unique(collated_merged[,1])), 
  function(i) artist_validity_tester(
    collated_merged, 
    unique(collated_merged[,1])[i])
)

validation <- sum(sum(valids == "valid") == length(unique(collated_merged[,1])))
rm(valids)
# if(validation) == 1 {proceed} else {recheck data}
rm(valdiation)

data <- sparse_Creator(df, 5, 6)
