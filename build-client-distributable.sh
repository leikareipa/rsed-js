#!/bin/bash

# Concatenates the source files of the RallySportED-js client into a single distributable file.

DST_DIRECTORY="./rallysported-js/client/js/"
DST_FILENAME="rallysported.cat.js"
VERSION="live"

SOURCE_FILES=("./rallysported-js/client/js/jszip/jszip.min.js"
		      "./rallysported-js/client/js/filesaver/FileSaver.min.js"
		      "./rallysported-js/client/js/retro-ngon/rngon.cat.js"
              "./rallysported-js/client/js/rallysported/rallysported.js"
              "./rallysported-js/client/js/rallysported/project/project.js"
              "./rallysported-js/client/js/rallysported/project/hitable.js"
              "./rallysported-js/client/js/rallysported/misc/constants.js"
              "./rallysported-js/client/js/rallysported/world/world.js"
              "./rallysported-js/client/js/rallysported/world/mesh-builder.js"
              "./rallysported-js/client/js/rallysported/world/camera.js"
              "./rallysported-js/client/js/rallysported/visual/texture.js"
              "./rallysported-js/client/js/rallysported/visual/palette.js"
              "./rallysported-js/client/js/rallysported/visual/canvas.js"
              "./rallysported-js/client/js/rallysported/track/varimaa.js"
              "./rallysported-js/client/js/rallysported/track/maasto.js"
              "./rallysported-js/client/js/rallysported/track/palat.js"
              "./rallysported-js/client/js/rallysported/track/props.js"
              "./rallysported-js/client/js/rallysported/ui/ui.js"
              "./rallysported-js/client/js/rallysported/ui/html.js"
              "./rallysported-js/client/js/rallysported/ui/popup-notification.js"
              "./rallysported-js/client/js/rallysported/ui/font.js"
              "./rallysported-js/client/js/rallysported/ui/ground-brush.js"
              "./rallysported-js/client/js/rallysported/ui/draw.js"
              "./rallysported-js/client/js/rallysported/ui/window.js"
              "./rallysported-js/client/js/rallysported/ui/input-state.js"
              "./rallysported-js/client/js/rallysported/ui/mouse-picking-element.js"
              "./rallysported-js/client/js/rallysported/scene/scene.js"
              "./rallysported-js/client/js/rallysported/scene/scene-3d.js"
              "./rallysported-js/client/js/rallysported/scene/scene-tilemap.js"
              "./rallysported-js/client/js/rallysported/core/core.js")

echo "// WHAT: Concatenated JavaScript source files" > "$DST_DIRECTORY/$DST_FILENAME"
echo "// PROGRAM: RallySportED-js" >> "$DST_DIRECTORY/$DST_FILENAME"
echo "// AUTHOR: Tarpeeksi Hyvae Soft" >> "$DST_DIRECTORY/$DST_FILENAME"
echo "// VERSION: $VERSION (`LC_ALL=en_US.utf8 date -u +"%d %B %Y %H:%M:%S %Z"`)" >> "$DST_DIRECTORY/$DST_FILENAME"
echo "// LINK: https://www.github.com/leikareipa/rallysported-js/" >> "$DST_DIRECTORY/$DST_FILENAME"
echo "// INCLUDES: { JSZip (c) 2009-2016 Stuart Knightley, David Duponchel, Franz Buchinger, António Afonso }" >> "$DST_DIRECTORY/$DST_FILENAME"
echo "// INCLUDES: { FileSaver.js (c) 2016 Eli Grey }" >> "$DST_DIRECTORY/$DST_FILENAME"
echo "// INCLUDES: { The retro n-gon renderer (c) 2019 Tarpeeksi Hyvae Soft }" >> "$DST_DIRECTORY/$DST_FILENAME"
echo "// FILES:" >> "$DST_DIRECTORY/$DST_FILENAME"
printf "//\t%s\n" "${SOURCE_FILES[@]}" >> "$DST_DIRECTORY/$DST_FILENAME"
echo -e "/////////////////////////////////////////////////\n" >> "$DST_DIRECTORY/$DST_FILENAME"

cat ${SOURCE_FILES[@]} >> "$DST_DIRECTORY/$DST_FILENAME"

# Remove empty lines
sed -i '/^[[:space:]]*$/d' "$DST_DIRECTORY/$DST_FILENAME"

# Trim whitespace.
sed -i 's/^[[:blank:]]*//;s/[[:blank:]]*$//' "$DST_DIRECTORY/$DST_FILENAME"
