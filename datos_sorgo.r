library(tidyverse)
setwd("/home/j/BIOINFORMATICA/sorghum_data")
# table from sra selector
df <- read.csv("table.txt",header = T, na.strings=c("","NA", "not applicable", "missing", "not collected"))
# mix dev_stage and Developmental_stage
df$dev_stage <- coalesce(df$dev_stage, df$Developmental_stage, df$Development_stage)
# see how many accession delete each filter for each variable of interest
df1 <- df[complete.cases(df$Cultivar), ]
df2 <- df[complete.cases(df$tissue), ]
df3 <- df[complete.cases(df$dev_stage), ]
df4 <- df[complete.cases(df$Developmental_stage), ]
# actually filter data for cultivar(genotype), tissue and dev_stage
table <- df[complete.cases(df$Cultivar), ]
table <- table[complete.cases(df$tissue), ]
table <- table[complete.cases(df$dev_stage), ]
# see the type of factors for our variables of interest
table$Cultivar <- as.factor(table$Cultivar)
table$tissue <- as.factor(table$tissue)
table$geo_loc_name_country <- as.factor(table$geo_loc_name_country)
table$Genotype <- as.factor(table$Genotype)
table$LibrarySelection <- as.factor(table$LibrarySelection)
table$dev_stage <- as.factor(table$dev_stage)
# plot frequency of factors of variables of interest
plot(table(table$Cultivar))
plot(table(table$tissue))
plot(table(table$dev_stage))
# optional
plot(table(table$LibrarySelection))
plot(table(table$geo_loc_name_country))
## make for tissue, cultivar and dev_stage
# get tissue, cultivar and dev_stage levels 
tissue_lvls <- levels(table$tissue)
dev_stage_lvls <- levels(table$tissue)
cultivar_lvls <- levels(table$tissue)
# write tissue levels as file
write.csv(tissue_lvls, "tissue_lvls.csv")
write.csv(dev_stage_lvls, "dev_stage_lvls.csv")
write.csv(cultivar_lvls, "cultivar_lvls.csv")
## SEE tissue_lvls.csv, dev_stage_lvls.csv, cultivar_lvls.csv and change factors
# like this
tidy <- table %>%
  mutate(tissue = recode(tissue, "stem nodal segment#6_Rep3"	= "Stem",
                         "Stem nodal segment#11_Rep3"	= "Stem",
                         "Stem nodal segment#16_Rep3"	= "Stem",
                         "stem nodal segment#6_Rep2"	= "Stem",
                         "Stem nodal segment#11_Rep2"	="Stem",
                         "Stem nodal segment #16_Rep2"	="Stem",
                         "Stem nodal segment#6_Rep1"	="Stem",
                         "Stem nodal segment#11_Rep1"	="Stem",
                         "Stem nodal segment#16_Rep1"	="Stem",
                         "Stem nodal segment#10_Rep3"	="Stem",
                         "Stem nodal segment#14_Rep3"	="Stem",
                         "Stem nodal segment#10_Rep2"	="Stem",
                         "Stem nodal segment #14_Rep2"	="Stem",
                         "Stem nodal segment#10_Rep1"	="Stem",
                         "Stem nodal segment#14_Rep1"	="Stem",
                         "65 % inflorescence/15% leaves/20% maturing seeds"	= "Mix",
                         "Grain"	= "Grain",
                         "stalks"	= "Stem",
                         "Leaves"	= "Leaf",
                         "internode"	= "Stem",
                         "Sessile spikelet"	= "Leaf",
                         "Pedicellate Spikelet"	= "Leaf",
                         "Inflorescence meristem"	= "Inflorescence meristem",
                         "Developing meristem"	= "Developing meritsem",
                         "Root"	= "Root",
                          "Leaf"	= "Leaf",
                          "Leaf"	= "Leaf",
                          "necleus"	= "NA",
                          "65 % inflorescence/15% leaves/20% seed"	= "Mix",
                          "Flag Leaf"	= "Leaf",
                          "Emerging Panicle"	= "Leaf",
                          "Mature leaves"	= "Leaf",
                          "endosperm"	= "Seed",
                          "epidermal tissue from developing domain domain of platochron 5 staged leaf primordia"	= "Leaf",
                          "Pollen PO:0025281"	= "Pollen",
                          "Microspore PO:0020048"	= "Pollen",
                          "root"	= "Root",
                          "root\\, root hairs removed"	= "Root",
                          "epidermal tissue from developing ligule domain of platochron 5 staged leaf primordia"	= "Leaf",
                          "leaves"	= "Leaf",
                          "Stem"	= "Stem",
                          "prop roots tissue"	= "Root",
                          "Leaf tissue"	= "Leaf",
                          "Sessile Spikelet"	= "Leaf",
                          "Awn"	= "NA",
                          "L1 tiller buds"	= "Flower",
                          "seeds"	= "Seed",
                          "pericarp"	= "Seed",
                          "male gametophyte"	= "NA",
                          "young panicle"	= "Flower",
                          "internode 3\\, fragment 4"	= "Stem",
                          "internode 3\\, fragment 3"	= "Stem",
                          "internode 3\\, fragment 2"	= "Stem",
                          "internode 3\\, fragment 6"	= "Stem",
                          "internode 3\\, fragment 5"	= "Stem",
                          "internode 3\\, fragment 1"	= "Stem",
                          "roots"	= "Root",
                          "stems and leaves"	= "Mix",
                          "Grains"	= "Grains",
                          "Stem"	= "Stem",
                          "Leaf Sheath"	= "Leaf"))
                

df3$tissue
root <- df3 %>% filter(tissue == "Root")
root$Run
write.table(root$Run, "~/root.txt", row.names = F, col.names = F , quote = F)

