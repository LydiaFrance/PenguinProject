install.packages(c("ggplot2", "palmerpenguins", "janitor", "dplyr"))

# Load the packages:
library(ggplot2)
library(palmerpenguins)
library(janitor)
library(dplyr)

# Load the function definitions
source("functions/cleaning.r")
source("functions/plotting.r")

# Save the raw data:
write.csv(penguins_raw, "data/penguins_raw.csv")

# Check the raw data:
names(penguins_raw)

# Clean the data:
penguins_clean <- penguins_raw %>%
    clean_column_names() %>%
    shorten_species() %>%
    remove_empty_columns_rows()

# Check the cleaned data:
names(penguins_clean)

# Save cleaned data:
write.csv(penguins_clean, "data/penguins_clean.csv")

# Filter the data:
flipper_data <- penguins_clean %>%
    subset_columns(c("flipper_length_mm", "species","sex")) %>%
    remove_NA()

# Check the subset data:
head(flipper_data)

# Plot the data:
flipper_boxplot <- plot_flipper_figure(flipper_data)
flipper_boxplot

# Save the data
save_flipper_plot_png(flipper_data, 
                      "figures/fig01_report.png", 
                      size = 15, res = 600, scaling=1)
save_flipper_plot_svg(flipper_data, 
                      "figures/fig01_vector.svg", 
                      size = 15, scaling = 1)

