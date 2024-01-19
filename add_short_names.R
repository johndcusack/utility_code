#' Add short trust and ICB names
#' 
#' This function takes in a dataframe that has a column containing the 3 letter 
#' ODS trust codes and returns a dataframe with the original data together with 
#' columns giving a short provider name, the relevant ICS code for that trust, 
#' and a shortened ICS name/initials.
#' 
#' The idea is to make it easier to format charts and tables when producing 
#' reports.
#' 
#' Currently the scope is limited to acute trusts in the South East, 
#' however this could be expanded
#' 
#' @param df the dataframe that will have the columns appended to it
#' @param orgcode_field the name of the column that contains the 3-letter trust code
#' @returns the merged dataframe. Note that the column passed to the orgcode_field 
#' argument will have been coerced to character 
#' 

add_short_names <- function(df, orgcode_field) {

#create lookup table
names_lookup <- data.frame(
org_code = c('RHW','RTH','RXQ','RDU',
              'R1F','RHM','RHU','RN5',
              'RN7','RPA','RVV','RWF',
              'RA2','RTK','RTP','RPC',
              'RXC','RYR'),
provider_short_name = c('RBH','OUH','BHT','Frimley',
                         'IOW','UHS','PHU','HHFT',
                         'DGT','MFT','EKH','MTW',
                         'RSCH','ASP','SASH','QVH',
                         'ESH','UHSX'),
ics_code = c(rep('QU9',3),'QNQ',rep('QRL',4),
             rep('QKS',4),rep('QXU',3),rep('QNX',3)),
ics_short_name = c(rep('BOB',3),'Frimley',rep('HIOW',4),
                   rep('KM',4),rep('Surrey',3),rep('Sussex',3)))

#create a variable to pass to merge
merge_column <- orgcode_field

#ensure that the orgcode_field is character to match lookup data type
df[,orgcode_field] <- sapply(df[,orgcode_field],as.character)

result <- merge(df,names_lookup,by.x = merge_column , by.y = 'org_code', all.x = TRUE)

return(result)

}