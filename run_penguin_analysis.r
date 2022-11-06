## ---------------------------
##
## Script name: run_penguin_analysis.r
##
## Purpose of script: 
##      Loads penguin data, cleans it, and plots the flipper length, and saves the plot to a file.
##
## Author: Dr. Lydia France
##
## Date Created: 2022-11-06
##
##
## Notes:
##   
##
## ---------------------------

setwd("/Users/lfrance/Library/CloudStorage/OneDrive-TheAlanTuringInstitute/004_REG/001_Teaching/R_teaching/PenguinProject/")
# Load the packages
source("functions/packages.r")

# ---------------------------
# Load functions
source("functions/cleaning.r")
source("functions/plotting.r")

# ---------------------------
# Load the data
# ---------------------------

penguins_raw <- read.csv("data_raw/penguins_raw.csv")

# ---------------------------
# Clean the data
# ---------------------------

# Fix the column names, remove empty rows, remove columns called comment and delta
penguins_clean <- cleaning(penguins_raw)

# Save the cleaned data with the current date
date = Sys.Date() 
filename = paste("/data/", date, "_penguins_clean.csv",sep="")
write.csv(penguins_clean, "data_clean/penguins_clean.csv")

# Subset the data and remove the penguins with NA flipper length
penguins_flippers <- remove_empty_flipper_length(penguins_clean)


# ---------------------------
# Plot the data
# ---------------------------

# Plot the flipper length as a boxplot of species
flipper_boxplot <- plot_flipper_figure(penguins_flippers)


# ---------------------------
# Save Figures
# ---------------------------


# Save the plot for a report
save_flipper_plot_png(penguins_flippers, "figures/fig01_report.png", 
                      size = 15, res = 600, scaling = 1)

# Save the plot for a presentation
save_flipper_plot_png(penguins_flippers, "figures/fig01_powerpoint.png", 
                      size = 15, res = 600, scaling = 1.4)

# Save the plot for a poster
save_flipper_plot_png(penguins_flippers, "figures/fig01_poster.png", 
                      size = 30, res = 600, scaling = 2.8)

# Save the plot as a vector (no resolution needed)
save_flipper_plot_svg(penguins_flippers, "figures/fig01_vector.svg", 
                      size = 15, scaling = 1)
