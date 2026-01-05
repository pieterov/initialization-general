# Re-install packages in new R version folder 

# 1. Define the old library path (Adjust if your version was different)
c_old_lib <- "/Library/Frameworks/R.framework/Versions/4.3-arm64/Resources/library"

# 2. Get the list of packages you had in old library path
l_old_pkgs <- installed.packages(lib.loc = c_old_lib)[, "Package"]

# 3. Get the list of packages you already have in new library path.
l_new_pkgs <- installed.packages()[, "Package"]

# 4. Find what's missing
l_to_install <- setdiff(l_old_pkgs, l_new_pkgs)

# Remove olettitoolbox if present
l_to_install <- setdiff(l_to_install, "olettitoolbox")

# 5. Install them!
if (length(l_to_install) > 0) {
  install.packages(l_to_install)
} else {
  message("All packages are already migrated!")
}