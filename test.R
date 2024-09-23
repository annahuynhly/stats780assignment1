library(terra)
library(viridis)
library(dplyr)
library(stringr)
library(tidyverse)

# Turning the data into a .csv file so it's easier to use.

# SASKatchewan Data

SASK_2009 = "MapData/SASKatchewan/aci_2009_sk_v1.tif"
SASK_2010 = "MapData/SASKatchewan/aci_2010_sk_v1.tif"
SASK_2011 = "MapData/SASKatchewan/aci_2011_sk_v3.tif"
SASK_2012 = "MapData/SASKatchewan/aci_2012_sk_v3.tif"
SASK_2013 = "MapData/SASKatchewan/aci_2013_sk_v3.tif"

# MANItoba Data

MANI_2009 = "MapData/MANItoba/aci_2009_mb_v1.tif"
MANI_2010 = "MapData/MANItoba/aci_2010_mb_v1.tif"
MANI_2011 = "MapData/MANItoba/aci_2011_mb_v3.tif"
MANI_2012 = "MapData/MANItoba/aci_2012_mb_v3.tif"
MANI_2013 = "MapData/MANItoba/aci_2013_mb_v3.tif"

# Loading the data

SRCS_SASK_2009 = rast(SASK_2009)
SRCS_SASK_2009 = values(SRCS_SASK_2009[[1]])

SRCS_SASK_2010 = rast(SASK_2010)
SRCS_SASK_2010 = values(SRCS_SASK_2010[[1]])

SRCS_SASK_2011 = rast(SASK_2011)
SRCS_SASK_2011 = values(SRCS_SASK_2011[[1]])

SRCS_SASK_2012 = rast(SASK_2012)
SRCS_SASK_2012 = values(SRCS_SASK_2012[[1]])

SRCS_SASK_2013 = rast(SASK_2013)
SRCS_SASK_2013 = values(SRCS_SASK_2013[[1]])

SRCS_MANI_2009 = rast(MANI_2009)
SRCS_MANI_2009 = values(SRCS_MANI_2009[[1]])

SRCS_MANI_2010 = rast(MANI_2010)
SRCS_MANI_2010 = values(SRCS_MANI_2010[[1]])

SRCS_MANI_2011 = rast(MANI_2011)
SRCS_MANI_2011 = values(SRCS_MANI_2011[[1]])

SRCS_MANI_2012 = rast(MANI_2012)
SRCS_MANI_2012 = values(SRCS_MANI_2012[[1]])

SRCS_MANI_2013 = rast(MANI_2013)
SRCS_MANI_2013 = values(SRCS_MANI_2013[[1]])

# Extract Codes (these are associated with the crops used in the website)

# Data that contains the code & meanings
COLOUR_MAP = read.csv("aci_crop_classifications.csv", header = TRUE, fileEncoding = "Latin1")

# reference of the dataset we want to make
VALUES_DATASET = data.frame(
  Year = rep(c(2009, 2010, 2011, 2012, 2013), 2),  
  Region = rep(c("Saskatchewan", "Manitoba"), each = 5)  # Region labels
)

add_crop_data = function(dataset, crop_id = "Peas"){
  code_id = COLOUR_MAP$Code[which(COLOUR_MAP$Label == crop_id)]
  code_id = as.numeric(code_id) # ensuring we have an numeric val
  # Values for Saskatchewan
  extra_sask_2009 = sum(SRCS_SASK_2009 == code_id, na.rm = TRUE) 
  extra_sask_2010 = sum(SRCS_SASK_2010 == code_id, na.rm = TRUE) 
  extra_sask_2011 = sum(SRCS_SASK_2011 == code_id, na.rm = TRUE) 
  extra_sask_2012 = sum(SRCS_SASK_2012 == code_id, na.rm = TRUE) 
  extra_sask_2013 = sum(SRCS_SASK_2013 == code_id, na.rm = TRUE) 
  # Values for Manitoba
  extra_mani_2009 = sum(SRCS_MANI_2009 == code_id, na.rm = TRUE) 
  extra_mani_2010 = sum(SRCS_MANI_2010 == code_id, na.rm = TRUE) 
  extra_mani_2011 = sum(SRCS_MANI_2011 == code_id, na.rm = TRUE) 
  extra_mani_2012 = sum(SRCS_MANI_2012 == code_id, na.rm = TRUE) 
  extra_mani_2013 = sum(SRCS_MANI_2013 == code_id, na.rm = TRUE) 
  # Getting the new column name for the dataset
  new_col_name = paste0(crop_id, "_Production")
  # Adding values to the dataset
  dataset = dataset %>%
    mutate(!!sym(new_col_name) := c(extra_sask_2009, extra_sask_2010, extra_sask_2011, 
                                    extra_sask_2012, extra_sask_2013,
                                    extra_mani_2009, extra_mani_2010, extra_mani_2011, 
                                    extra_mani_2012, extra_mani_2013))
  return(dataset)
}

ALL_CROP_TYPES = c("Cereals", "Barley", "Millet", "Oats", "Rye", "Spelt", "Triticale", 
                   "Wheat", "Sorghum", "Quinoa", "Corn", "Soybeans", "Peas", 
                   "Chickpeas", "Beans", "Fababeans", "Lentils")

for(crop in ALL_CROP_TYPES){
  VALUES_DATASET = add_crop_data(VALUES_DATASET, crop_id = crop)
}

write.csv(VALUES_DATASET, "CropData3.csv", row.names=FALSE)


#codes_crop = c(132, 133, 135, 136, 137, 138, 139, 140, 142, 143, 147, 158, 162, 163, 167, 168, 174)
codes_crop = c(147, 158)

# Loading the data

SRCS_SASK_2009 = rast(SASK_2009)
SRCS_SASK_2009 = values(SRCS_SASK_2009[[1]])
#SRCS_SASK_2009 = SRCS_SASK_2009[SRCS_SASK_2009 %in% codes_crop]

SRCS_SASK_2010 = rast(SASK_2010)
SRCS_SASK_2010 = values(SRCS_SASK_2010[[1]])
SRCS_SASK_2010 = SRCS_SASK_2010[SRCS_SASK_2010 %in% codes_crop]

SRCS_SASK_2011 = rast(SASK_2011)
SRCS_SASK_2011 = values(SRCS_SASK_2011[[1]])
SRCS_SASK_2011 = SRCS_SASK_2011[SRCS_SASK_2011 %in% codes_crop]

SRCS_SASK_2012 = rast(SASK_2012)
SRCS_SASK_2012 = values(SRCS_SASK_2012[[1]])
SRCS_SASK_2012 = SRCS_SASK_2012[SRCS_SASK_2012 %in% codes_crop]

SRCS_SASK_2013 = rast(SASK_2013)
SRCS_SASK_2013 = values(SRCS_SASK_2013[[1]])
SRCS_SASK_2013 = SRCS_SASK_2013[SRCS_SASK_2013 %in% codes_crop]

SRCS_MANI_2009 = rast(MANI_2009)
SRCS_MANI_2009 = values(SRCS_MANI_2009[[1]])
SRCS_MANI_2009 = SRCS_MANI_2009[SRCS_MANI_2009 %in% codes_crop]

SRCS_MANI_2010 = rast(MANI_2010)
SRCS_MANI_2010 = values(SRCS_MANI_2010[[1]])
SRCS_MANI_2010 = SRCS_MANI_2010[SRCS_MANI_2010 %in% codes_crop]

SRCS_MANI_2011 = rast(MANI_2011)
SRCS_MANI_2011 = values(SRCS_MANI_2011[[1]])
SRCS_MANI_2011 = SRCS_MANI_2011[SRCS_MANI_2011 %in% codes_crop]

SRCS_MANI_2012 = rast(MANI_2012)
SRCS_MANI_2012 = values(SRCS_MANI_2012[[1]])
SRCS_MANI_2012 = SRCS_MANI_2012[SRCS_MANI_2012 %in% codes_crop]

SRCS_MANI_2013 = rast(MANI_2013)
SRCS_MANI_2013 = values(SRCS_MANI_2013[[1]])
SRCS_MANI_2013 = SRCS_MANI_2013[SRCS_MANI_2013 %in% codes_crop]


# Find the maximum length
max_length = max(length(SRCS_SASK_2009), length(SRCS_SASK_2010), length(SRCS_SASK_2011),
                  length(SRCS_SASK_2012), length(SRCS_SASK_2013),
                  length(SRCS_MANI_2009), length(SRCS_MANI_2010), length(SRCS_MANI_2011),
                  length(SRCS_MANI_2012), length(SRCS_MANI_2013))
# Pad with NA
SRCS_SASK_2009 = c(SRCS_SASK_2009, rep(NA, max_length - length(SRCS_SASK_2009)))
SRCS_SASK_2010 = c(SRCS_SASK_2010, rep(NA, max_length - length(SRCS_SASK_2010)))
SRCS_SASK_2011 = c(SRCS_SASK_2011, rep(NA, max_length - length(SRCS_SASK_2011)))
SRCS_SASK_2012 = c(SRCS_SASK_2012, rep(NA, max_length - length(SRCS_SASK_2012)))
SRCS_SASK_2013 = c(SRCS_SASK_2013, rep(NA, max_length - length(SRCS_SASK_2013)))

SRCS_MANI_2009 = c(SRCS_MANI_2009, rep(NA, max_length - length(SRCS_MANI_2009)))
SRCS_MANI_2010 = c(SRCS_MANI_2010, rep(NA, max_length - length(SRCS_MANI_2010)))
SRCS_MANI_2011 = c(SRCS_MANI_2011, rep(NA, max_length - length(SRCS_MANI_2011)))
SRCS_MANI_2012 = c(SRCS_MANI_2012, rep(NA, max_length - length(SRCS_MANI_2012)))
SRCS_MANI_2013 = c(SRCS_MANI_2013, rep(NA, max_length - length(SRCS_MANI_2013)))

TEST_DATA = data.frame(SASK_2009 = SRCS_SASK_2009,
                       SASK_2010 = SRCS_SASK_2010,
                       SASK_2011 = SRCS_SASK_2011,
                       SASK_2012 = SRCS_SASK_2012,
                       SASK_2013 = SRCS_SASK_2013,
                       MANI_2009 = SRCS_MANI_2009,
                       MANI_2010 = SRCS_MANI_2010,
                       MANI_2011 = SRCS_MANI_2011,
                       MANI_2012 = SRCS_MANI_2012,
                       MANI_2013 = SRCS_MANI_2013)

# SAVE TEST_DATA AS CSV
write.csv(TEST_DATA, "CropData2.csv", row.names=FALSE)
