# Development Guide

## Environment Setup

### Requirements
- **macOS 13.0+** (with latest updates)
- **Xcode 15.0+**
- **iPhone 16 Pro Simulator** (iOS 18+) or physical device with iOS 17+
- **Swift 5.9+**

### Initial Setup

1. **Clone the repository** (if you don't have it locally):
```bash
git clone https://github.com/julio/workout-tracker.git
cd workout-tracker
```

2. **Install dependencies** (if any):
```bash
# No external dependencies currently, but update Xcode if needed
xcode-select --install
```

3. **Run setup script** (optional):
```bash
./setup.sh
```

## Opening in Xcode

### Option 1: Direct File Opening
```bash
# Navigate to project directory
cd /Users/julio/code/personal/workout-tracker

# Open in Xcode
open -a Xcode .
```

### Option 2: Project File
If an Xcode project file exists:
```bash
open WorkoutTracker.xcodeproj
```

### Option 3: Manual Project Creation in Xcode
If you need to create the project manually:

1. Launch Xcode
2. File → New → Project
3. Choose "App" template
4. Set:
   - Product Name: `WorkoutTracker`
   - Bundle Identifier: `com.julio.workout-tracker`
   - Interface: `SwiftUI`
   - Language: `Swift`
   - Target: `iOS`
   - Minimum Deployment: `17.0`
5. Create at this directory
6. Xcode will offer to add the existing files — accept this

## Development Workflow

### Building
```bash
# From Xcode: Cmd+B
# From command line:
xcodebuild build -scheme WorkoutTracker -destination 'platform=iOS Simulator,name=iPhone 16 Pro'
```

### Running
```bash
# From Xcode: Cmd+R (with simulator running)
# From command line:
xcodebuild run -scheme WorkoutTracker -destination 'platform=iOS Simulator,name=iPhone 16 Pro'
```

### Testing
```bash
# From Xcode: Cmd+U
# From command line:
xcodebuild test -scheme WorkoutTracker -destination 'platform=iOS Simulator,name=iPhone 16 Pro'

# With coverage:
xcodebuild test -scheme WorkoutTracker \
  -destination 'platform=iOS Simulator,name=iPhone 16 Pro' \
  -enableCodeCoverage YES
```

## Code Organization

```
WorkoutTracker/
├── Sources/
│   ├── WorkoutTrackerApp.swift    # @main entry point
│   ├── ContentView.swift          # Main UI view hierarchy
│   ├── Models.swift               # Data models (Workout, Exercise, DailyStats)
│   └── WorkoutStore.swift         # State management & persistence
├── Tests/
│   ├── WorkoutStoreTests.swift    # Store persistence & logic
│   └── ModelsTests.swift          # Model serialization & formatting
├── Assets.xcassets/
│   ├── AppIcon.appiconset/        # App icons (dumbbell design)
│   └── AccentColor.colorset/      # Brand color (#FF6B35)
└── Info.plist                     # App configuration
```

## Testing Requirements

All code requires **100% test coverage** across:
- Statements
- Branches
- Functions
- Lines

### Running Coverage Analysis
```bash
xcodebuild test \
  -scheme WorkoutTracker \
  -destination 'platform=iOS Simulator,name=iPhone 16 Pro' \
  -enableCodeCoverage YES \
  -derivedDataPath build
```

### Current Test Suites
- **WorkoutStoreTests**: 8 tests covering data persistence, CRUD operations, date filtering, and stats
- **ModelsTests**: 9 tests covering initialization, serialization, formatting, and identifiability

## Architecture

### MVVM Pattern
- **Models**: `Workout`, `Exercise`, `DailyStats` (data structures)
- **View Models**: `WorkoutStore` (ObservableObject for state management)
- **Views**: `ContentView`, `StatsCard`, `WorkoutRow`, `NewWorkoutSheet`

### State Management
- **WorkoutStore**: Central state container using `@Published` for reactive updates
- **File-based Persistence**: JSON storage in app's Documents directory
- **Date-based Filtering**: Calendar-aware grouping of workouts

## iOS 17+ Features Used

- SwiftUI 4.0+
- MVVM with `@MainActor`
- NavigationStack (replaces NavigationView)
- `@EnvironmentObject` for dependency injection
- File I/O with `FileManager`
- `Codable` for serialization

## Debugging

### Common Issues

**Problem**: Xcode says "No such module 'WorkoutTracker'"
- **Solution**: Build the project first (Cmd+B)

**Problem**: Tests don't run
- **Solution**: Ensure target is set to iOS Simulator, not Any iOS Device
- Run: `xcodebuild test -scheme WorkoutTracker -destination 'platform=iOS Simulator,name=iPhone 16 Pro'`

**Problem**: Data not persisting
- **Solution**: Check that the app has write permissions in Documents directory
- Verify `WorkoutStore.save()` is being called after mutations

### Logging
Add to any file:
```swift
import os.log
let logger = Logger()
logger.debug("Message here")
```

View logs in Console.app or Xcode's debug navigator.

## Git Workflow

```bash
# Make changes
# ...

# Test everything
xcodebuild test -scheme WorkoutTracker

# Commit with conventional message
git commit -m "Add feature description"

# Push to GitHub
git push origin main
```

## Performance Considerations

- **Lazy Loading**: Views use `@State` efficiently, no unnecessary re-renders
- **Storage**: JSON file read once on app launch, written only on mutations
- **Memory**: No view controller lifecycle overhead (SwiftUI managed)

## Future Development

- Add HomeKit integration for equipment tracking
- Implement cloud sync (iCloud/CloudKit)
- Add Siri Shortcuts support
- Implement Apple Watch companion app
- Add workout templates and progress charts
