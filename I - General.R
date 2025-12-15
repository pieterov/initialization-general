######################################################################################
# NAME:         I - GENERAL
# AUTHOR:       Pieter Overdevest
######################################################################################

######################################################################################
# LOAD LIBRARIES.
######################################################################################

        f_install_package_from_cran(
                
                v.package = c(

                # Bijv. rbindlist (to rbind a list of data frames).
                "data.table",

                # Data wrangling. Note, plyr needs to be activated before dplyr!
                # https://stackoverflow.com/questions/54749377/why-does-tidyverse-still-require-plyr-to-load
                "plyr",
                
                # Tidyverse Packages:
                # https://tidyverse.tidyverse.org/reference/tidyverse_packages.html
                # https://cran.r-project.org/web/packages/broom/vignettes/broom.html
                # https://googledrive.tidyverse.org
                # https://googlesheets4.tidyverse.org/articles/articles/auth.html
                #>  [1] "broom"         "cli"           "crayon"        "dbplyr"       
                #>  [5] "dplyr"         "dtplyr"        "forcats"       "ggplot2"      
                #>  [9] "googledrive"   "googlesheets4" "haven"         "hms"          
                #> [13] "httr"          "jsonlite"      "lubridate"     "magrittr"     
                #> [17] "modelr"        "pillar"        "purrr"         "readr"        
                #> [21] "readxl"        "reprex"        "rlang"         "rstudioapi"   
                #> [25] "rvest"         "stringr"       "tibble"        "tidyr"        
                #> [29] "xml2"          "tidyverse"  
                # Forecats is tidyverse library, especially made to handle factors in R. It provides a suite of
                # useful tools that solve common problems with factors.
                "tidyverse",
                
                # Tidyverse packages not loaded with 'tidyverse'
                # https://www.tidyverse.org/packages/
                # https://tidyverse.tidyverse.org
                # tidyverse_update()
                "broom", "googledrive", "googlesheets4", "hms", "httr", "jsonlite", "lubridate",
                "readxl", "glue", "jsonlite", #"dtplyr",
                
                # Text manipulation.
                "tidytext",
                
                # Read and write data (like 'csv', 'tsv' and 'fwf') quickly.
                "vroom",
                
                # Dynamic Charting
                "echarts4r",
                
                # Fast write and read.
                # https://github.com/fstpackage/fst/issues/71 - Cannot write list columns.
                "fst",
                
                # Read sqlite files
                "RSQLite",
                
                # Access MySQL
                "RMySQL",
                
                # Write en read parquet files.
                "arrow",
               
                # Very fast, portable, correct, consistent, and convenient string/text processing in any locale or character encoding.
                "stringi",

                # Files to open and save XLS and CSV (readr) files.
                "openxlsx", 

                # Nice tables
                "flextable",

                # Flex dashboards
                "flexdashboard",
                
                # Create shiny dashboards.
                "shinydashboard", "shinyFeedback", "fresh",
                
                # Quarto
                "quarto",

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
                
                # Text extraction, rendering, and converting of PDFs.
                "pdftools",
                
                # Split, combine, and compress PDF files
                "qpdf",
                
                # Plotting.
                "grid", "gridExtra", "ggrepel",
                "RColorBrewer", "scales", "plotly",

                # Build dashboards.
                "shiny", "miniUI", "shinyFiles",  "shinyWidgets",

                # Clock speed of code.
                "tictoc",

                # Install packages from GitHub.
                "devtools",

                # E.g. append items to list using 'list.append'.
                "rlist",

                # Forward fill of NA.
                # https://stackoverflow.com/questions/7735647/replacing-nas-with-latest-non-na-value
                "zoo",
                
                # Read and write PNG and JPEG files.
                "jpeg", "png",
                
                # Manipulate JPEGs.
                # https://cran.r-project.org/web/packages/magick/vignettes/intro.html
                "magick",
                
                # Working with images
                # https://cran.r-project.org/web/packages/imager/vignettes/gettingstarted.html
                # For installing imager on Mac OSX, you need to install Quartz, https://www.xquartz.org
                "imager",

                # Create R Markdown documents (dynamic documents for R).
                "rmarkdown",

                # Create beautiful tables in RMarkdown.
                "knitr", "kableExtra",
                
                # Dynamic tables
                "reactable",
                
                # Open-source JavaScript library for mobile-friendly interactive maps.
                # https://rstudio.github.io/leaflet/
                # https://stackoverflow.com/questions/30110377/saving-leaflet-output-as-html/44086571
                "leaflet", "htmlwidgets",
                
                # Toon muiscoordinaten in Leaflet.
                # https://community.rstudio.com/t/problem-with-data-projection-on-leaflet/8801
                # https://cran.r-project.org/web/packages/leafem/leafem.pdf
                "leafem",
                
                # Take mapshot of leaflet and store as pdf. Before using 'mapshot()', you may have to 
                # run 'webshot::install_phantomjs()'. ALTERNATIVE TO 'webshot', not needed for now.
                #"mapview",
                
                # Take webshot. Before using 'mapshot()', you may have to 
                # run 'webshot::install_phantomjs()'.
                "webshot",

                # Edit RProfile of Snippets.
                "usethis",
                
                # Utility package, o.a. copy and removal of directories.
                "R.utils",
                
                # Microbenchmark
                "microbenchmark",
                
                # Run parallel processing
                "parallel",
                
                # Working with graph data
                "igraph",
                
                # Model evaluation metrics.
                "Metrics"
        ))


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
        if(!exists("path.project")) {
                path.project = paste0(
                        gsub("/Code", "", getwd()),
                "/")
        }
        
        path.code         <- paste0(path.project, "Code/")
        path.data         <- paste0(path.project, "Data/")
        path.documents    <- paste0(path.project, "Documents/")
        path.deliverables <- paste0(path.project, "Deliverables/")
        path.leaflets     <- paste0(path.project, "Leaflets/")
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
        # Sys.setlocale(category = "LC_ALL", locale = "nl_NL.UTF-8")
        
        # Style title, requires library(shiny), activated here in 'I - General'.
        tag.map.title <- tags$style(HTML(
                
                ".leaflet-control.map-title {
                                transform: translate(-50%,20%);
                                width: 750px;
                                position: fixed !important;
                                left: 50%;
                                text-align: left;
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

                axis.line        = element_line(color = line.color, linewidth = 0.5),

                axis.ticks       = element_line(color = line.color, linewidth = 1),

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

