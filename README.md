# 📄 PDF Text Extractor & Analyzer (CLI)

A robust command-line interface tool built with **Bash**, **`pdftotext`**, and **`awk`** designed to extract text from PDF documents and perform automated regex-based data extraction and text analysis. 

Developed as a course-end project for a university **Scripting Workshop**, this tool demonstrates proficiency in Linux shell scripting, regular expressions, and modular software architecture.

---

## 📁 Project Directory Structure

```text
pdf-analyzer/
├── bin/
│   └── pdf-analyzer          # Main CLI entry point script & argument parser
├── lib/
│   ├── extractor.sh          # PDF-to-text conversion module
│   └── analyzer.sh           # Core regex matching and awk frequency engine
├── input_pdfs/               # Directory for placing target PDF files
├── output/                   # Auto-generated plain text extraction results
├── .gitignore                # Excludes temporary build/output artifacts
└── README.md                 # Project documentation
