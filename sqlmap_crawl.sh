#!/bin/bash
# SQLmap Crawling and Testing Script
# Author: Priyanshu K Sharma
# Date: 15th Jan 2025
# Description: Automates SQLmap crawling and testing with various options.

# Check if SQLmap is installed
if ! command -v sqlmap &> /dev/null; then
    echo "SQLmap is not installed. Please install it and try again."
    exit 1
fi

# Target URL
TARGET_URL="http://testphp.vulnweb.com/index.php" # Replace with your target URL

# Crawl Depth
CRAWL_DEPTH=2 # Set the crawling depth (1 for shallow, higher for deeper crawling)

# Number of Threads
THREADS=5 # Set the number of threads for faster crawling

# Exclude Specific Links
EXCLUDE_REGEX="logout" # Exclude links matching this pattern (optional)

# Save Crawling Results
SAVE_FILE="/tmp/sqlmap_crawl_results.txt" # Path to save crawling results

# Delay Between Requests
DELAY=2 # Add delay (in seconds) between requests to avoid overwhelming the server

# Testing Level and Risk
LEVEL=3 # Level of testing (1-5, higher means more parameters are tested)
RISK=2 # Risk level of tests (1-3, higher means riskier tests)

# Run SQLmap with the configured options
sqlmap -u "$TARGET_URL" \
       --crawl "$CRAWL_DEPTH" \
       --threads "$THREADS" \
       --crawl-exclude="$EXCLUDE_REGEX" \
       --save="$SAVE_FILE" \
       --delay "$DELAY" \
       --level "$LEVEL" \
       --risk "$RISK" \
       --batch

# Script Completed
echo "Crawling and testing complete. Results saved in $SAVE_FILE"
