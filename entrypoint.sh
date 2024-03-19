#!/bin/bash
set -euo pipefail

# Example initialization tasks
echo "Initialization tasks..."
# Add your initialization tasks here

# Call the command received as arguments (usually the main process of the container)
exec "$@"
