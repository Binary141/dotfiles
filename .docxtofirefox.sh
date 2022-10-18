#!/bin/bash

# Reassign all the arguments passed in to a single variable
# If just opening a single document, this will only be one argument in size
arg=$@

# The filepath comes in as 'file://filepath' so
# This will strip off the 'file://' portion
# To make it a useable filepath in linux
filePath=${arg:7}

# Replaces the %20 (which is a url encoded space)
# To just a regular space in all positions in the string
spaces=$(echo ${filePath}|sed -e 's/%20/ /g')

# Just remove the %20 from the name and don't replace with anything
noSpaces=$(echo ${filePath}|sed -e 's/%20//g')

# Make the destination the same file name, but just with a pdf extension
destination=$(echo ${noSpaces}|sed -e 's/docx/pdf/g')

# Move the source file so that it doesn't contain spaces anymore
mv "${spaces}" "${noSpaces}"

# Convert the file to a pdf and output in the same directory as the source
pandoc "${noSpaces}" -o ${destination}

# Open the file in firefox
firefox ${destination}
