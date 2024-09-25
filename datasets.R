# Data that contains the code & meanings
COLOUR_MAP = read.csv("aci_crop_classifications.csv", header = TRUE, fileEncoding = "Latin1")

# The dataset used for actually graphing
GRAPHING_DATASET = read.csv("CropData.csv", header = TRUE)

# List of ALL different crop types one can choose from.
ALL_CROP_TYPES = c("Cereals", "Barley", "Millet", "Oats", "Rye", "Spelt", "Triticale", 
                   "Wheat", "Corn", "Soybeans", "Peas", "Beans", "Lentils")

COLOUR_THEME_LIST = list("Default Theme 1" = 'default1',
                         "Default Theme 2" = 'default2',
                         "Default Theme 3" = 'default3',
                         "Lovely Mei" = 'lovelymei',
                         "Jack in, Execute!" = "jackin",
                         "Manually Insert" = 'manual')

DEFAULT1_COLOUR = c("#FF6666", "#6699FF", "#05DEB2", "#947aff", "#3333FF", "#5b10a7")
DEFAULT2_COLOUR = c("blue", "green", "red", "#b3bfff", "royalblue1", "#81ddff")
DEFAULT3_COLOUR = c("#EE4266", "#3cbbb1", "#b33c86", "#403f4c", "#0a0f0d", "#3185fc")
LOVELYMEI_COLOUR = c("#3800c2", "#676bf8", "#58887a", "#e69eb7", "#372f66", "#a2cda3")
EXECUTE_COLOUR = c("#0092d6", "#212c57", "#f85210", "#ffc710", "#0092d6", "#da1a1a")

COLOUR_TRANSLATION = list("default1" = DEFAULT1_COLOUR,
                          "default2" = DEFAULT2_COLOUR,
                          "default3" = DEFAULT3_COLOUR,
                          "lovelymei" = LOVELYMEI_COLOUR,
                          "jackin" = EXECUTE_COLOUR)
