#!/bin/bash

analyze_text() {
    local txt_path="$1"
    local mode="$2"

    if [ ! -f "$txt_path" ]; then
        echo "Error: Text file '$txt_path' not found." >&2
        exit 1
    fi

    case "$mode" in
        dates)
            echo "--- Matching Dates (Format: DD-MM-YYYY) ---"
            grep -oE '\b[0-9]{2}-[0-9]{2}-[0-9]{4}\b' "$txt_path" | sort -u
            ;;
        phones)
            echo "--- Matching Phone Numbers ---"
            # Fixed pattern to robustly capture phone numbers with or without parentheses
            grep -oE '\b(\+?[0-9]{1,3}[-. ]?)?(\([0-9]{3}\)|[0-9]{3})[-. ]?[0-9]{3}[-. ]?[0-9]{4}\b' "$txt_path" | sort -u
            ;;
        words)
            echo "--- Top 10 Word Frequencies ---"
            awk '{
                gsub(/[^a-zA-Z]/, " ", $0);
                for(i=1; i<=NF; i++) {
                    word = tolower($i);
                    if(length(word) > 2) freq[word]++;
                }
            }
            END {
                for(w in freq) print freq[w], w;
            }' "$txt_path" | sort -nr | head -n 10
            ;;
        *)
            echo "Error: Unknown analysis mode '$mode'. Use: dates, phones, or words." >&2
            exit 1
            ;;
    esac
}
