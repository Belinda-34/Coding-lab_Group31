#!/bin/bash

# Hospital Archivist
# Member 4
# Moves active log files to archived_logs with a timestamp
# and creates fresh log files for the hospital system.

ACTIVE_DIR="active_logs"
ARCHIVE_DIR="archived_logs"

# Check that required directories exist
if [ ! -d "$ACTIVE_DIR" ] || [ ! -d "$ARCHIVE_DIR" ]; then
    echo "Error: Required log directories do not exist."
    exit 1
fi

# Create a timestamp in YYYYMMDD_HHMM format
TIMESTAMP=$(date +"%Y%m%d_%H%M")

# Archive heart rate log
if [ -f "$ACTIVE_DIR/heart_rate_log.log" ]; then
    mv "$ACTIVE_DIR/heart_rate_log.log" \
       "$ARCHIVE_DIR/heart_rate_log_${TIMESTAMP}.log"
    echo "Archived heart rate log."
fi
# Archive temperature log
if [ -f "$ACTIVE_DIR/temperature_log.log" ]; then
    mv "$ACTIVE_DIR/temperature_log.log" \
       "$ARCHIVE_DIR/temperature_log_${TIMESTAMP}.log"
    echo "Archived temperature log."
fi

# Archive water usage log
if [ -f "$ACTIVE_DIR/water_usage_log.log" ]; then
    mv "$ACTIVE_DIR/water_usage_log.log" \
       "$ARCHIVE_DIR/water_usage_log_${TIMESTAMP}.log"
    echo "Archived water usage log."
fi
# Create fresh empty log files
touch "$ACTIVE_DIR/heart_rate_log.log"
touch "$ACTIVE_DIR/temperature_log.log"
touch "$ACTIVE_DIR/water_usage_log.log"

echo "Logs archived successfully."
echo "Archive timestamp: $TIMESTAMP"

