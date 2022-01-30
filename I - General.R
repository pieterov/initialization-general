######################################################################################
# NAME:         I - GENERAL
# AUTHOR:       Pieter Overdevest
######################################################################################

######################################################################################
# LOAD LIBRARIES.
######################################################################################

        f_install_packages_from_cran(v.package = c(

                # Bijv. rbindlist (to rbind a list of data frames).
                "data.table",

                # Data wrangling. Note, plyr needs to be activated before dplyr!
                # Forecats is tidyverse library, especially made to handle factors in R. It provides a suite of
                # useful tools that solve common problems with factors. 
                "plyr", "dplyr", "magrittr", "tidyr", "forcats", "tibble",

                # Fast write and read.
                # https://github.com/fstpackage/fst/issues/71 - Cannot write list columns.
                "fst",
                
                # Write en read parquet files.
                "arrow",

                # Convert data to tidy data
                # https://cran.r-project.org/web/packages/broom/vignettes/broom.html
                "broom",

                # Read and write data (like 'csv', 'tsv' and 'fwf') quickly.
                "vroom",
                
                # Text manipulation.
                "tidytext",

                # Functional programming.
                "purrr",

                # Text manipulation, e.g., to manipulate characters, whitespaces and pattern matching.
                "stringi", "stringr",

                # Files to open and save XLS and CSV (readr) files.
                "openxlsx", "readxl", "readr",

                # Reading spatial files into R
                # http://zevross.com/blog/2016/01/13/tips-for-reading-spatial-files-into-r-with-rgdal/
                "rgdal",

                # Nice tables
                "flextable",

                # Read websites.
                "RCurl",

                # Tools for working with URL's and HTTP, used to send messages to Slack.
                "httr",
                
                # Read PDF documents.
                "pdftools",

                # Read and write PNG and JPEG files.
                "jpeg", "png",

                # Manipulate JPEGs.
                # https://cran.r-project.org/web/packages/magick/vignettes/intro.html
                "magick",

                # Working with images
                # https://cran.r-project.org/web/packages/imager/vignettes/gettingstarted.html
                "imager",
                
                # Read .dbf .spss .octave files.
                # https://cran.r-project.org/web/packages/foreign/foreign.pdf
                "foreign",

                # To do OCR with pdftools.
                "tesseract",

                # Read WORD documents, work with Office documents.
                "qdapTools", "officer",

                # Open-source JavaScript library for mobile-friendly interactive maps.
                # https://rstudio.github.io/leaflet/
                # https://stackoverflow.com/questions/30110377/saving-leaflet-output-as-html/44086571
                "leaflet", "htmlwidgets",

                # Toon muiscoordinaten in Leaflet.
                # https://community.rstudio.com/t/problem-with-data-projection-on-leaflet/8801
                # https://cran.r-project.org/web/packages/leafem/leafem.pdf
                "leafem",

                # Construct, coerce to, test for, and print polynomial objects.
                # https://cran.r-project.org/web/packages/polynom/polynom.pdf
                "polynom",

                # Flex dashboards
                "flexdashboard",
                
                # Create shiny dashboard in three parts.
                "shinydashboard",

                #' Fast nearest neighbour search (C++). Finds the k nearest neighbours for every point
                #' in a given dataset in O(N log N) time using Arya and Mount's ANN library (v1.1.3).
                #' There is support for approximate as well as exact searches, fixed radius searches
                #' and 'bd' as well as 'kd' trees. The distance is computed using the L2 (Euclidean) metric.
                # https://stackoverflow.com/questions/30343898/nearest-neighbor-in-r
                "RANN",

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

                # Read sqlite files
                "RSQLite",

                # Read JSON files.
                "jsonlite", "geojsonR",

                # Dropbox integration from R
                # https://github.com/karthik/rdrop2
                "rdrop2",
                
                # Interact with Google Sheets and Google Drive.
                # https://googlesheets4.tidyverse.org/articles/articles/auth.html
                "googlesheets4",
                
                # https://googledrive.tidyverse.org
                "googledrive",
                
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

                # Microbenchmarking.
                "microbenchmark",

                # Parallel computing
                "parallel",

                # Connect with CBS data (toc = table of contents).
                # df.toc <- cbs_get_toc()
                # df.data <- cbs_get_data("83765NED")
                # https://www.cbs.nl/nl-nl/onze-diensten/open-data/statline-als-open-data/snelstartgids
                "cbsodataR",

                # Shape files.
                # There was an error after installing Big Surr.
                # https://stackoverflow.com/questions/64844185/sf-and-rgdal-are-not-working-on-mac-os-big-sur-how-to-fix-closed
                #
                # https://github.com/r-spatial/sf
                "sf",

                # Spatial points.
                # https://www.jessesadler.com/post/gis-with-r-intro/
                # https://cengel.github.io/rspatial/2_spDataTypes.nb.html
                "sp",

                # rgeos implements functionality for the manipulation and querying of spatial geometries
                # using the Geometry Engine — Open Source (GEOS)C library.
                # https://medium.com/ibm-data-science-experience/introduction-to-spatial-data-analysis-in-r-using-rgeos-ea69059c3b90
                #"rgeos",

                # Point in polygon.
                # https://www.rforge.net/doc/packages/SDMTools/pnt.in.poly.html
                #"SDMTools",

                # Take screenshot from website.
                #"webshot",

                # Scrape websites.
                #"rvest",

                # Reverse geocoding.
                # https://rdrr.io/cran/tmaptools/man/tmaptools-package.html
                # https://rdrr.io/cran/tmaptools/man/rev_geocode_OSM.html
                "tmaptools", "tmap",

                #' Function sline: A line in 2D space is defined by a start and an and point, each associated with 2D
                #' coordinates. This function takes a /codedata.frame as input and assumes that each row
                #' defines a line in space. In order to do so, the data frame must have at least four
                #' columns and the start.cols and end.cols parameters must be used to point out the names
                #' of the columns that define the start and end coordinates of the line. The data is then
                #' converted to a SpatialLinesDataFrame DF.
                #' https://rdrr.io/cran/inlabru/man/sline.html
                #' Niet nodig omdat ik SP gebruik (SpatialLines en SpatialPolygons)
                #"inlabru"

                # Graphs
                "igraph", "networkD3",
                
                # Edit RProfie of Snippets.
                "usethis"
                )
        )

        # Platform specific packages.
        if(c.computer == "mac") {
                
                f_install_packages_from_cran(v.package = c(
                        
                        # Scheduling.
                        # https://www.youtube.com/watch?v=J72LP2_yv1U
                        # https://github.com/bnosac/cronR
                        # daarnaast benodigd: "shiny", "miniUI", "shinyFiles"
                        "cronR"
                        )
                )
                        
        } else if(c.computer == "windows") {
                
                f_install_packages_from_cran(v.package = c(
                        
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

