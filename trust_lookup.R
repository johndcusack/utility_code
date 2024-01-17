#This creates a lookup-style table of shortened trust names for SE acute trusts and associates them with their ICS

org_code <- c('RHW','RTH','RXQ','RDU',
              'R1F','RHM','RHU','RN5',
              'RN7','RPA','RVV','RWF',
              'RA2','RTK','RTP','RPC',
              'RXC','RYR')

provider_short_name <- c('RBH','OUH','BHT','Frimley',
                         'IOW','UHS','PHU','HHFT',
                         'DGT','MFT','EKH','MTW',
                         'RSCH','ASP','SASH','QVH',
                         'ESH','UHSX')

ics_code <- c(rep('QU9',3),'RDU',rep('QRL',4),rep('QKS',4),rep('QXU',3),rep('QNX',3))

icb_short_name <- c(rep('BOB',3),'Frimley',rep('HIOW',4),rep('KM',4),rep('Surrey',3),rep('Sussex',3))



names_lookup <- data.frame(org_code,provider_short_name,ics_code,icb_short_name)

rm(org_code,provider_short_name,ics_code,icb_short_name)