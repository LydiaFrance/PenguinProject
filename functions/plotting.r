## ---------------------------
##
## Script name: Cleaning.r
##
## Purpose of script: 
##      Cleaning up the raw penguin data set by changing column names and removing columns. 
##
## Author: Dr. Lydia France
##
## Date Created: `r paste(Sys.Date())`
##
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------


plot_flipper_figure <- function(penguins_flippers){
  penguins_flippers %>% 
    ggplot(aes(x = species, y = flipper_length_mm)) +
    geom_boxplot(aes(color = species), width = 0.3, show.legend = FALSE) +
    geom_jitter(aes(color = species), alpha = 0.3, show.legend = FALSE, position = position_jitter(width = 0.2, seed = 0)) +
    scale_color_manual(values = c("darkorange","purple","cyan4")) +
    scale_x_discrete(labels=c("Adelie","Chinstrap","Gentoo")) +
    labs(x = "Penguin Species",
         y = "Flipper length (mm)") +
    theme_bw()
}

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

save_flipper_plot_svg <- function(penguins_flippers, filename, size, scaling){
    size_inches = size/2.54
    svglite(filename, width = size_inches, height = size_inches, scaling = scaling)
    flipper_box <- plot_flipper_figure(penguins_flippers)
    print(flipper_box)
    dev.off()
}