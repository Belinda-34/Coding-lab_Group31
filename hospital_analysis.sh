#!/bin/bash
 
 process_vitals()
 {
   mkdir -p reports
   {
     grep "CRITICAL" active_logs/heart_rate_log.log
     grep "CRITICAL" active_logs/temperature_log.log
   } | awk -F '|' '{print $1 " | " $2 " | " $3}' > reports/critical_alerts.txt
}

water_audit() {
    local water_file="active_logs/water_usage_log.log"

    echo "Analyzing ICU water usage..."

    if [ ! -f "$water_file" ]; then
        echo "Error: $water_file does not exist."
        return 1
    fi

    awk -F'|' '
    $2 ~ /ICU_WATER_RESERVE/ {
        gsub(/^[ \t]+|[ \t]+$/, "", $3)
        sum += $3
        count++
    }
    END {
    if (count > 0) {
        printf "ICU Water Reserve Average Usage: %.2f Liters/min\n", sum / count
        printf "Records analyzed: %d\n", count
    }
    else
        print "No ICU_WATER_RESERVE data found."
}' "$water_file"