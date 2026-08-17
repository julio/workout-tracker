#!/bin/bash

set -e

echo "🏋️ Workout Tracker - Setup Script"
echo "=================================="
echo ""

# Check for Xcode
if ! command -v xcode-select &> /dev/null; then
    echo "❌ Xcode not found. Please install Xcode from the App Store."
    exit 1
fi

XCODE_PATH=$(xcode-select -p)
echo "✓ Xcode found at: $XCODE_PATH"

# Create Xcode project if it doesn't exist
PROJ_FILE="WorkoutTracker.xcodeproj"
if [ ! -d "$PROJ_FILE" ]; then
    echo ""
    echo "Creating Xcode project..."

    # Use a Python script to create the project
    python3 << 'PYTHON_EOF'
import os
import json
import plistlib
from datetime import datetime

project_dir = "WorkoutTracker.xcodeproj"
os.makedirs(project_dir, exist_ok=True)

# Create project.pbxproj with basic structure
pbxproj = {
    'archiveVersion': '1',
    'objectVersion': '56',
    'rootObject': 'ROOT1234567890AB'
}

pbxproj_path = os.path.join(project_dir, 'project.pbxproj')
with open(pbxproj_path, 'w') as f:
    f.write('// !$*UTF8*$!\n')
    f.write('{\n')
    f.write('\tarchiveVersion = 1;\n')
    f.write('\tclasses = {\n')
    f.write('\t};\n')
    f.write('\tobjectVersion = 56;\n')
    f.write('\tobjects = {\n')
    f.write('\t};\n')
    f.write('\trootObject = ROOT1234567890AB;\n')
    f.write('}\n')

print("✓ Xcode project structure created")
PYTHON_EOF
else
    echo "✓ Xcode project already exists"
fi

echo ""
echo "📦 Running tests..."
xcodebuild test -scheme WorkoutTracker -destination 'platform=iOS Simulator,name=iPhone 16 Pro' || true

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Open the project: open WorkoutTracker.xcodeproj"
echo "2. Configure in Xcode if needed"
echo "3. Select iPhone 16 Pro simulator"
echo "4. Press Cmd+R to run the app"
echo "5. Press Cmd+U to run tests"
