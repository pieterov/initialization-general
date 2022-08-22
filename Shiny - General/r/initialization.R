#######################################################################################################################
# GENERAL INITIALIZATION
#
# Purpose: Define parameters that are used in any app.
#######################################################################################################################

        ###############################################################################################################
        # LIBRARIES
        ###############################################################################################################

        # Libraries.
        library(shiny)
        library(shinydashboard)
        library(shinyWidgets)
        library(shinyFeedback)
        library(Metrics)
        library(ggplot2)
        library(ggrepel) # geom_label_repel
        library(reactable)
        library(tidyverse)
        library(RColorBrewer)
        library(gridExtra)
        library(polynom)
        library(glue)
        library(fresh) # updating shiny theme
        library(sp) # area under the curve, using Polygon and @area
        library(echarts4r) # Dynamic plots


        ###############################################################################################################
        # PARAMETERS
        ###############################################################################################################
        
        # Set seed
        set.seed(46)
        
        # This allows defining font.axis.text.size before calling this initialization script.
        font.axis.title.size <- 18
        font.axis.text.size  <- 16
        
        # Define font and line color.
        font.color   <- "grey30"
        line.color   <- "grey70"
        
                
        ###############################################################################################################
        # OBJECTS
        ###############################################################################################################

        # Determine figure theme. Note, the order of the margin coordinates is: top, right, bottom, left.
        theme.figure <- theme(
                
                panel.background = element_rect(
                        
                        fill = NA #color = line.color, size = 0.5, 
                ), 
                
                #panel.border     = element_blank(),
                
                panel.grid.major = element_blank(),
                
                panel.grid.minor = element_blank(),
                
                # text             = element_text(
                # 
                #         family = "Montserrat"
                # ),
                
                plot.margin      = unit(
                        
                        c(1, 1, 1, 1), "cm"
                ),
                
                axis.line = element_line(
                        
                        color = line.color,
                        size  = 0.5
                ),
                
                axis.ticks = element_line(
                        
                        color = line.color,
                        size  = 1
                ),
                
                axis.text.x = element_text(
                        
                        color = font.color,
                        size  = font.axis.text.size,
                        #angle = 0,
                        hjust = 0.5
                ),
                
                axis.text.y = element_text(
                        
                        color = font.color,
                        size  = font.axis.text.size,
                        #angle = 0,
                        hjust = 1
                ),
                
                axis.title.x = element_text(
                        
                        color  = font.color,
                        size   = font.axis.title.size,
                        margin = margin(15, 0, 0, 0)
                ),
                
                axis.title.y = element_text(
                        
                        color  = font.color,
                        size   = font.axis.title.size,
                        margin = margin(0, 15, 0, 0)
                ),
                
                plot.title = element_text(
                        
                        color      = font.color,
                        size       = font.axis.title.size,
                        lineheight = 0.8,
                        #face       = "bold",
                        hjust      = 0.5
                ),
                
                plot.subtitle = element_text(
                        
                        color      = font.color,
                        size       = font.axis.title.size - 2,
                        hjust      = 0.5
                ),
                
                legend.position = "right",
                
                legend.text      = element_text(
                        
                        color = font.color,
                        size  = font.axis.text.size
                ),
                
                legend.title = element_text(
                        
                        color = font.color,
                        size  = font.axis.text.size
                        #face  = "plain"
                ),
                
                strip.text = element_text(
                        
                        color = font.color,
                        size  = 18
                        #face  = "plain"
                ),
                
                strip.background = element_rect(
                        
                        colour = line.color,
                        fill   = "grey90"
                )
        )
        
        
        ###############################################################################################################
        # FUNCTIONS
        ###############################################################################################################

        # If applicable
        
        
        