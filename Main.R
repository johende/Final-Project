# R Reproducability 

# Initialization --------------------------------------------------------------

# Installing packages

#install.packages("tidyverse")
#install.packages("osmdata")
#install.packages("devtools")
#devtools::install_github("marcusvolz/strava")
#install.packages("sf")

# Packages used in the first attempt but no longer required

#install.packages("broom")
#install.packages("rgdal")


# Loading Librarys

library(tidyverse)
library(osmdata)
library(devtools)
library(strava)
library(sf)

# Packages used in the first attempt but no longer required

#library(rgdal)
#library(broom)


# Startup Function - only to be used once when starting project ----------------

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

