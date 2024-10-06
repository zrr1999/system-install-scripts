#!/bin/bash

ORIGINAL_CONFIG="original.yaml"
BASE_CONFIG="base.yaml"
OUTPUT_CONFIG="config.yaml"

# Check if yq is installed
if ! command -v yq &>/dev/null; then
    echo "yq could not be found. Please install yq first."
    exit 1
fi

# Merge the custom config into the original config
cd /etc/mihomo/
yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' "$ORIGINAL_CONFIG" "$BASE_CONFIG" > "$OUTPUT_CONFIG"

echo "Merged configuration saved to $OUTPUT_CONFIG"
