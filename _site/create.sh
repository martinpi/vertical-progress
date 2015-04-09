#!/bin/sh

cp -r css ../vertical-progress/_site
cp -r img ../vertical-progress/_site
cp -r javascript ../vertical-progress/_site
gollum-site --output_path ../vertical-progress/_site --working generate
perl toc.pl > ../vertical-progress/_site/Ingredients.html
