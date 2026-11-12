#!/bin/bash

extract_text() {
    local pdf_path="$1"
    local output_dir="output"

    # Check if pdftotext is available
    if ! command -v pdftotext &> /dev/null; then
        echo "Error: 'pdftotext' is not installed. Please install it using: sudo apt install poppler-utils" >&2
        exit 1
    fi

    # Check if input file exists
    if [ ! -f "$pdf_path" ]; then
        echo "Error: PDF file '$pdf_path' not found." >&2
        exit 1
    fi

    # Create output directory if it doesn't exist
    mkdir -p "$output_dir"

    # Extract filename without extension
    local base_name
    base_name=$(basename "$pdf_path" .pdf)
    local txt_path="$output_dir/${base_name}.txt"

    # Perform extraction
    pdftotext "$pdf_path" "$txt_path"
    
    if [ $? -eq 0 ]; then
        echo "$txt_path"
    else
        echo "Error: Failed to extract text from PDF." >&2
        exit 1
    fi
}
