#!/bin/bash

# Concatenates the source files of the RallySportED-js client into a single distributable file.

SRC_DIRECTORY="./src/client/js"
DST_DIRECTORY="./distributable/client/js"
DST_FILENAME="rallysported.cat.js"
VERSION="live"

SOURCE_FILES=("$SRC_DIRECTORY/jszip/jszip.min.js"
		      "$SRC_DIRECTORY/filesaver/FileSaver.min.js"
		      "$SRC_DIRECTORY/retro-ngon/rngon.cat.js"
              "$SRC_DIRECTORY/rallysported-js/rallysported.js"
              "$SRC_DIRECTORY/rallysported-js/misc/rngon-minimal-fill.js"
              "$SRC_DIRECTORY/rallysported-js/misc/rngon-minimal-tcl.js"
              "$SRC_DIRECTORY/rallysported-js/project/project.js"
              "$SRC_DIRECTORY/rallysported-js/project/hitable.js"
              "$SRC_DIRECTORY/rallysported-js/misc/constants.js"
              "$SRC_DIRECTORY/rallysported-js/world/world.js"
              "$SRC_DIRECTORY/rallysported-js/world/mesh-builder.js"
              "$SRC_DIRECTORY/rallysported-js/world/camera.js"
              "$SRC_DIRECTORY/rallysported-js/visual/texture.js"
              "$SRC_DIRECTORY/rallysported-js/visual/palette.js"
              "$SRC_DIRECTORY/rallysported-js/visual/canvas.js"
              "$SRC_DIRECTORY/rallysported-js/track/varimaa.js"
              "$SRC_DIRECTORY/rallysported-js/track/maasto.js"
              "$SRC_DIRECTORY/rallysported-js/track/palat.js"
              "$SRC_DIRECTORY/rallysported-js/track/props.js"
              "$SRC_DIRECTORY/rallysported-js/ui/ui.js"
              "$SRC_DIRECTORY/rallysported-js/ui/asset-mutator.js"
              "$SRC_DIRECTORY/rallysported-js/ui/undo-stack.js"
              "$SRC_DIRECTORY/rallysported-js/ui/html.js"
              "$SRC_DIRECTORY/rallysported-js/ui/popup-notification.js"
              "$SRC_DIRECTORY/rallysported-js/ui/font.js"
              "$SRC_DIRECTORY/rallysported-js/ui/ground-brush.js"
              "$SRC_DIRECTORY/rallysported-js/ui/draw.js"
              "$SRC_DIRECTORY/rallysported-js/ui/window.js"
              "$SRC_DIRECTORY/rallysported-js/ui/input-state.js"
              "$SRC_DIRECTORY/rallysported-js/ui/mouse-picking-element.js"
              "$SRC_DIRECTORY/rallysported-js/ui/component.js"
              "$SRC_DIRECTORY/rallysported-js/ui/components/active-pala.js"
              "$SRC_DIRECTORY/rallysported-js/ui/components/fps-indicator.js"
              "$SRC_DIRECTORY/rallysported-js/ui/components/ground-hover-info.js"
              "$SRC_DIRECTORY/rallysported-js/ui/components/palat-pane.js"
              "$SRC_DIRECTORY/rallysported-js/ui/components/tilemap-minimap.js"
              "$SRC_DIRECTORY/rallysported-js/ui/components/color-selector.js"
              "$SRC_DIRECTORY/rallysported-js/scene/scene.js"
              "$SRC_DIRECTORY/rallysported-js/scene/scene-3d.js"
              "$SRC_DIRECTORY/rallysported-js/scene/scene-tilemap.js"
              "$SRC_DIRECTORY/rallysported-js/scene/scene-texture.js"
              "$SRC_DIRECTORY/rallysported-js/core/core.js")

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
