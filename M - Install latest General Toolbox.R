######################################################################################
# NAME:         M - INSTALL LATEST GENERAL TOOLBOX
# AUTHOR:       Pieter Overdevest
######################################################################################

        # If the package is attached to memory - i.e., there is a checkmark in front of the package
        # in the Packages tab - detach it from memory, first. In case the package is already detached,
        # then this code will result in a 'invalid name argument' error (not a problem).
        detach("package:generaltoolbox", unload = TRUE)
        
        # Update the toolbox by downloading the latest version from GitHub.
        devtools::install_github(
                
                rrepo        = "pieterov/generaltoolbox",
                INSTALL_opts = c("--no-multiarch")
        )
        
        # Attach the (updated) package again to memory.
        library(generaltoolbox)
