## ---------------------------
##
## Script name: Plotting.r
##
## Purpose of script: 
##      Functions for making boxplots of the flipper data, saves to png and svg 
##
## Author: Dr. Lydia France
##
## Date Created: 2022-11-10
##
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------
# Plot the flipper length as a boxplot of species
plot_flipper_figure <- function(penguins_flippers){
  penguins_flippers %>% 
    ggplot(aes(x = species, y = flipper_length_mm)) +
    geom_boxplot(aes(color = species), width = 0.3, show.legend = FALSE) +
    geom_jitter(aes(color = species), alpha = 0.3, show.legend = FALSE, 
                position = position_jitter(width = 0.2, seed = 0)) +
    scale_color_manual(values = c("darkorange","purple","cyan4")) +
    scale_x_discrete(labels=c("Adelie","Chinstrap","Gentoo")) +
    labs(x = "Penguin Species",
         y = "Flipper length (mm)") +
    theme_bw()
}

# Save the plot as a png and define the size, resolution, and scaling
save_flipper_plot_png <- function(penguins_flippers, filename, size, res, scaling){
  agg_png(filename, width = size, 
                    height = size, 
                    units = "cm", 
                    res = res, 
                    scaling = scaling)
  flipper_box <- plot_flipper_figure(penguins_flippers)
  print(flipper_box)
  dev.off()
}

# Save the plot as a svg and define the size and scaling
save_flipper_plot_svg <- function(penguins_flippers, filename, size, scaling){
    size_inches = size/2.54
    svglite(filename, width = size_inches, height = size_inches, scaling = scaling)
    flipper_box <- plot_flipper_figure(penguins_flippers)
    print(flipper_box)
    dev.off()
}