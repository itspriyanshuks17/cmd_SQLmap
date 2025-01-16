#!/bin/bash
# SQLmap Automated Testing Script with --batch Option
# Author: Priyanshu K Sharma
# Date: 15 Jan 2025
# Description: Executes SQLmap commands with --batch for fully automated testing.
# A shell script to demonstrate the use of SQLmap with the --threads option
# In SQLmap, the --threads option specifies the number of concurrent threads used to perform tasks such as crawling, injecting, and exploiting. 
# By default, SQLmap operates with a single thread, but increasing the thread count can significantly speed up operations when dealing with multiple requests or complex tasks.

# Check if SQLmap is installed
if ! command -v sqlmap &> /dev/null; then
    echo "SQLmap is not installed. Please install it and try again."
    exit 1
fi

# Define the target URL
TARGET_URL="http://testphp.vulnweb.com/listproducts.php?cat=1"

# Define the number of threads to use
THREADS=5

# Use SQLmap with the --threads option
echo "Starting SQLmap with $THREADS threads..."
sqlmap -u "$TARGET_URL" --threads=$THREADS --batch

# Explanation of the commands used:
# - `--threads`: Specifies the number of concurrent threads. Here, 5 threads are used.
# - `--batch`: Runs in non-interactive mode, assuming default answers for all prompts.
# - `-u`: Specifies the target URL to test for SQL injection.

echo "SQLmap completed."
