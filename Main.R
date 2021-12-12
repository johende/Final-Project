# R Reproducability 

# Initialization --------------------------------------------------------------

#install.packages("rgdal")
#install.packages("tidyverse")
#install.packages("osmdata")
#install.packages("broom")
#install.packages("devtools")
#devtools::install_github("marcusvolz/strava")
install.packages("sf")

library(tidyverse)
library(rgdal)
library(osmdata)
library(broom)
library(devtools)
library(strava)
library(sf)

features <- available_features()

# Startup Function --------------------------------------------------------

startup <- function() {

# Getting the working directory
  wd <- getwd()

# Creating extra directories --------------------------------------------------
  directories <- c("Data - Raw", "Data - Clean", "Results", "Scripts", 
                   "Figures")
  
  if (file.exists("ReadMe.txt")){
    print("Directories already exist")
  } else {
    dir.create("Data - Raw")
    dir.create("Data - Clean")
    dir.create("Results")
    dir.create("Scripts")
    dir.create("Figures")
    file.create("ReadMe.txt")
  }
  

# Creating other scripts ------------------------------------------------------
  files <- c("DataClean.R","DataVis.R","DataAnalysis.R","Functions.R")
  
   if (file.exists(files[1])) {
    print("Files already exist")
  } else {
    file.create("Scripts/DataClean.R")
  }
  
  if (file.exists(files[2])) {
    print("Files already exist")
  } else {
    file.create("Scripts/DataVis.R")
  }
  
  if (file.exists(files[3])) {
    print("Files already exist")
  } else {
    file.create("Scripts/DataAnalysis.R")
  }
  
  if (file.exists(files[4])) {
    print("Files already exist")
  } else {
    file.create("Scripts/Functions.R")
  }


# Sources -----------------------------------------------------------------

  source("Scripts/Functions.R")    
  
}

startup()

# Next we run DataClean.R, found in the scripts folder

