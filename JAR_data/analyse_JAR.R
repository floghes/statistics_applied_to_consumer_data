# Import du jeu de données

JAR <- read.delim("JAR.txt")
plan <- read.delim("plan.txt",stringsAsFactors = TRUE)

# conversions en facteurs

JAR <- JAR %>% 
  rename(SérieuxJAR = Sérieux1) %>%
  mutate(Sexe = as.factor(Sexe)) %>%
  mutate(CSP = as.factor(CSP)) %>%
  mutate(Juge = as.factor(Juge)) %>%
  mutate(Son = as.factor(Son)) %>%
  mutate(Rang = as.factor(Rang)) 
colnames(JAR)
summary(JAR)

# Import des librairies

library(tidyverse)

# import du plan d'expérience dans le jeu de données jar
plan_essai <- plan %>%
  pivot_longer(
    cols = paste0("X", 1:12), names_to = "Rang",
    names_prefix = "X", values_to = "Son",
    values_drop_na = TRUE)

jeu_donnee_complet<-
