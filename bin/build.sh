#!/usr/bin/env bash
# Step 1: clean all files in destination folder
rm -rf Resources/Public/Bundle/*.*

# Step 2: run parcel with the params
# -d: specified destination folder
# --no-source-maps --no-cache: do not use the parcel cache, do not generate source maps, static files contains content based hashes
# --public-url: set the relative url in js and css files to a specific url
parcel build Resources/Private/HTML/*.html -d Resources/Public/Bundle/ --public-url Resources/Public/Bundle/ --no-cache --no-source-maps --no-minify

# Step 3: execute a node script afterwards that removes the hashes in filenames from folder (arg[0]) and filenames (arg[1])
node bin/remove-file-hashes.js Resources/Public/Bundle/ js,css,ico

# Step 4: copy font files
# cp Resources/Private/Fonts/*.css Resources/Public/Bundle/

# Step 5: copy icon files
# // rm -rf Resources/Public/Icons/
# mkdir Resources/Public/Icons/
# cp Resources/Private/Images/pool/*.svg Resources/Public/Icons/

# Step 6: copy safe icon file (Problems with SVGO and Viewbox replacement)
# cp Resources/Private/Icons/icons_2403_safe.css Resources/Public/Bundle/icons_2403.css
