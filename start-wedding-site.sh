#!/bin/bash

# Wedding Site Startup Script
# This script starts the wedding site using gulp

# Set the working directory to the root directory (files moved from nuptial folder)
cd "$(dirname "$0")"

# Set NODE_ENV if not already set
export NODE_ENV=${NODE_ENV:-production}

# Log file for debugging
LOG_FILE="/tmp/wedding-site.log"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

log_message "Starting wedding site service..."

# Check if node_modules exists, if not install dependencies
if [ ! -d "node_modules" ]; then
    log_message "Installing npm dependencies..."
    npm install >> "$LOG_FILE" 2>&1
    if [ $? -ne 0 ]; then
        log_message "Failed to install npm dependencies"
        exit 1
    fi
fi

# Check if gulp is available
if ! command -v gulp &> /dev/null; then
    log_message "Gulp not found globally, using local gulp..."
    GULP_CMD="./node_modules/.bin/gulp"
else
    GULP_CMD="gulp"
fi

# Start the gulp server
log_message "Starting gulp server on port 8040..."
exec $GULP_CMD default >> "$LOG_FILE" 2>&1
