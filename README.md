# Workout Tracker

An iOS app to help you track your daily workouts. Built with SwiftUI and designed for modern iOS devices.

## Features

- **Daily Workout Tracking**: Log your workouts with name, duration, and exercises
- **Exercise Details**: Track exercises with sets, reps, and optional weight
- **Daily Statistics**: View daily stats including workout count and total duration
- **Date Navigation**: Browse workouts from any date
- **Persistent Storage**: All workouts are saved locally on your device
- **Clean UI**: Intuitive SwiftUI interface with iOS design guidelines

## Requirements

- iOS 17.0+
- iPhone 16 Pro recommended
- Xcode 15.0+
- Swift 5.9+

## Testing

The app includes comprehensive test coverage with 100% statement, branch, function, and line coverage.

Run tests with:
```bash
xcode-select --install  # if needed
xcodebuild test -scheme WorkoutTracker
```

## Project Structure

```
WorkoutTracker/
├── Sources/
│   ├── WorkoutTrackerApp.swift      # App entry point
│   ├── ContentView.swift            # Main UI
│   ├── Models.swift                 # Data models
│   └── WorkoutStore.swift           # State management
├── Tests/
│   ├── WorkoutStoreTests.swift      # Store tests
│   └── ModelsTests.swift            # Model tests
├── Assets.xcassets/
│   ├── AppIcon.appiconset/          # App icons
│   └── AccentColor.colorset/        # Brand color
└── Info.plist                       # App configuration
```

## Getting Started

1. Clone or open the project in Xcode
2. Open `WorkoutTracker.xcodeproj`
3. Select your target device
4. Press Cmd+R to build and run

## Development

### Adding a Workout

1. Tap the + button in the top right
2. Enter workout name and duration
3. Tap "Add" to save

### Viewing Workout History

Use the date picker to navigate to any date and view workouts from that day.

### Testing Coverage

- `WorkoutStoreTests.swift`: 100% coverage of data persistence and state management
- `ModelsTests.swift`: 100% coverage of data models and serialization
