#!/bin/bash

# Function to convert image format
convert_image_format() {
    # Check if the required arguments are provided
    if [ $# -ne 3 ]; then
        echo "Error: Invalid number of arguments. Usage: convert_image_format <input_file> <output_file> <format>"
        return 1
    fi
    
    local input_file=$1
    local output_file=$2
    local format=$3
    
    # Check if the input file exists
    if [ ! -f "$input_file" ]; then
        echo "Error: Input file '$input_file' does not exist."
        return 1
    fi
    
    # Check if the output file already exists
    if [ -f "$output_file" ]; then
        echo "Error: Output file '$output_file' already exists."
        return 1
    fi
    
    # Check if the format is supported
    if ! convert -list format | grep -q "$format"; then
        echo "Error: Unsupported image format '$format'."
        return 1
    fi
    
    # Convert the image format
    convert "$input_file" "$output_file"
    
    if [ $? -eq 0 ]; then
        echo "Image format converted successfully."
    else
        echo "Error: Failed to convert image format."
        return 1
    fi
}
