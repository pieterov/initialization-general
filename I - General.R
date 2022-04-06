######################################################################################
# NAME:         I - GENERAL
# AUTHOR:       Pieter Overdevest
######################################################################################

######################################################################################
# LOAD LIBRARIES.
######################################################################################

        f_install_package_from_cran(v.package = c(

                # Bijv. rbindlist (to rbind a list of data frames).
                "data.table",

                # Data wrangling. Note, plyr needs to be activated before dplyr!
                # Forecats is tidyverse library, especially made to handle factors in R. It provides a suite of
                # useful tools that solve common problems with factors. 
                "plyr", "dplyr", "magrittr", "tidyr", "forcats", "tibble",

                # Fast write and read.
                # https://github.com/fstpackage/fst/issues/71 - Cannot write list columns.
                "fst",
                
                # Convert data to tidy data
                # https://cran.r-project.org/web/packages/broom/vignettes/broom.html
                "broom",

                # Functional programming.
                "purrr",

                # Text manipulation, e.g., to manipulate characters, whitespaces and pattern matching.
                "stringi", "stringr",

                # Files to open and save XLS and CSV (readr) files.
                "openxlsx", "readxl", "readr",

                # Nice tables
                "flextable",

                # Flex dashboards
                "flexdashboard",
                
                # Create shiny dashboard in three parts.
                "shinydashboard",

                # Knit PDF with Notebook.
                # And on new machines run, tinytex::install_tinytex(), see also:
                # https://github.com/yihui/tinytex/issues/103
                # https://bookdown.org/yihui/rmarkdown-cookbook/install-latex.html
                #
                # 2021 04 06 - Mary had problemen met installeren van tinytex function.
                # https://github.com/yihui/tinytex/issues/210#issuecomment-629457990
                # To anyone who is still having problems with tinytex::install_tinytex(),
                # please restart your R session, and try:
                # remotes::install_github('yihui/tinytex')
                # tinytex:::install_prebuilt()
                "tinytex",
                
                # E.g. combine PDFs.
                "pdftools",
                
                # Plotting.
                "grid", "gridExtra", "ggrepel", #"ggplot2",
                "RColorBrewer", "scales", "plotly",

                # Date functions.
                "lubridate",

                # Build dashboards.
                "shiny", "miniUI", "shinyFiles",

                # Clock speed of code.
                "tictoc",

                # Install packages from GitHub.
                "devtools",

                # E.g. append items to list using 'list.append'.
                "rlist",

                # Forward fill of NA.
                # https://stackoverflow.com/questions/7735647/replacing-nas-with-latest-non-na-value
                "zoo",

                # Create R Markdown documents (dynamic documents for R).
                "rmarkdown",

                # Create beautiful tables in RMarkdown.
                "knitr", "kableExtra",

                # Edit RProfie of Snippets.
                "usethis"
                )
        )

        # Platform specific packages.
        if(c.computer == "mac") {
                
                f_install_package_from_cran(v.package = c(
                        
                        # Scheduling.
                        # https://www.youtube.com/watch?v=J72LP2_yv1U
                        # https://github.com/bnosac/cronR
                        # daarnaast benodigd: "shiny", "miniUI", "shinyFiles"
                        "cronR"
                        )
                )
                        
        } else if(c.computer == "windows") {
                
                f_install_package_from_cran(v.package = c(
                        
                        # Scheduling.
                        # https://github.com/bnosac/taskscheduleR
                        "taskscheduleR"
                        )
                )
        }


######################################################################################
# BASIC INITIALIZATION.
######################################################################################

        # Default paths.
        path.project      <- if(!exists("path.project")) {paste0(getwd(), "/")} else{path.project}
        path.code         <- paste0(path.project, "Code/")
        path.data         <- paste0(path.project, "Data/")
        path.documents    <- paste0(path.project, "Documents/")
        path.deliverables <- paste0(path.project, "Deliverables/")
        path.leafets      <- paste0(path.project, "Leaflets/")
        path.shiny        <- paste0(path.project, "Shiny/")
        path.images       <- paste0(path.project, "Images/")
        
        # Set options(stringsAsFactors = FALSE), to allow row binding of esb rows.
        options(stringsAsFactors = FALSE)
        
        # Turn off scientific numbers.
        options(scipen = 999)
        
        # Set seed.
        set.seed(12345)
        
        # Color vector, light and dark colors (6 color pairs).
        v.color.pair      <- rep(brewer.pal(n = 12, name = "Paired"), 6)
        
        # Color vector, darker colors (8 color levels).
        v.color.dark      <- rep(brewer.pal(n = 8, name = "Dark2"), 10)
        
        # Color vector, lighter colors (12 color levels).
        v.color.light     <- rep(brewer.pal(n = 12, name = "Set3"), 6)
        
        # This allows defining font.axis.text.size before calling this initialization script.
        if (!exists("font.axis.title.size")) {font.axis.title.size <- 20} # Axis title.
        if (!exists("font.axis.text.size"))  {font.axis.text.size  <- 20} # Axis text.
        if (!exists("font.facet.text.size")) {font.facet.text.size <- 14} # Size of text in facet headers.
        if (!exists("font.label.text.size")) {font.label.text.size <- 3}  # Size of text labels next to dots.
        
        # Define font and line color.
        font.color <- "grey30"
        line.color <- "grey70"
        
        # Set system locale.
        # https://stackoverflow.com/questions/41743949/utf-8-encoding-not-used-although-it-is-set-in-source/41747709#41747709
        # Sys.setlocale("LC_ALL") #,"English"
        
        
        # Style title, requires library(shiny), activated here in 'I - Overall'.
        tag.map.title <- tags$style(HTML(
                
                ".leaflet-control.map-title {
                                transform: translate(-50%,20%);
                                width: 750px;
                                position: fixed !important;
                                left: 50%;
                                text-align: center;
                                padding-left: 10px;
                                padding-right: 10px;
                                background: rgba(255,255,255,0.5);
                                font-weight: bold;
                                font-size: 24px;}"))


#########################################################################
# THEMES.
#########################################################################

        # Determine figure theme. Note, the order of the margin coordinates is: top, right, bottom, left.
        theme.figure <- theme(

                panel.background = element_rect(fill = NA), #color = line.color, size = 0.5,
                #panel.border     = element_blank(),
                panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(),

                plot.margin      = unit(c(1, 1, 1, 1), "cm"),

                axis.line        = element_line(color = line.color, size = 0.5),

                axis.ticks       = element_line(color = line.color, size = 1),

                axis.text.x      = element_text(color = font.color,
                                                size  = font.axis.text.size,
                                                #angle = 0,
                                                hjust = 0.5),

                axis.text.y      = element_text(color = font.color,
                                                size  = font.axis.text.size,
                                                #angle = 0,
                                                hjust = 1),

                axis.title.x     = element_text(color  = font.color,
                                                size   = font.axis.title.size,
                                                margin = margin(15, 0, 0, 0)),

                axis.title.y     = element_text(color  = font.color,
                                                size   = font.axis.title.size,
                                                margin = margin(0, 15, 0, 0)),

                plot.title       = element_text(color      = font.color,
                                                size       = font.axis.title.size,
                                                lineheight = 0.8,
                                                face       = "bold",
                                                hjust      = 0.5),

                legend.position  = "right",

                legend.text      = element_text(color = font.color,
                                                size  = font.axis.title.size),

                legend.title     = element_text(color = font.color,
                                                size  = font.axis.title.size,
                                                face  = "plain"),

                strip.text       = element_text(color = font.color,
                                                size  = font.facet.text.size,
                                                face  = "plain"), # or bold.

                strip.background =  element_rect(colour = line.color,
                                                 fill   = "grey90")
        )

