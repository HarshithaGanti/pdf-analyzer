# PDF Text Extractor & Analyzer (CLI)

A command-line interface tool built with Bash, `pdftotext`, and `awk` to extract text from PDFs and perform regex-based text analysis (dates, phone numbers, and word frequencies)[cite: 1].

## Prerequisites (Ubuntu on WSL)
Make sure you have `poppler-utils` installed for `pdftotext`[cite: 1]:
```bash
sudo apt update
sudo apt install poppler-utils
