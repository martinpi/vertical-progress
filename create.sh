#!/bin/sh

gollum-site --output_path ../vertical-progress --working generate
perl toc.pl > ../vertical-progress/Ingredients.html
