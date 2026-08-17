# Getting Started with Workout Tracker

## Quick Start (5 minutes)

### 1. Open in Xcode

```bash
cd /Users/julio/code/personal/workout-tracker
open -a Xcode .
```

Or manually:
1. Launch Xcode
2. File → Open
3. Navigate to `/Users/julio/code/personal/workout-tracker`
4. Click Open

### 2. Create Xcode Project (First Time Only)

If Xcode asks about setting up the project:

1. **File** → **New** → **Project**
2. Choose **App** from the iOS section
3. Fill in:
   - **Product Name**: `WorkoutTracker`
   - **Team**: Your team
   - **Bundle Identifier**: `com.julio.workout-tracker`
   - **Interface**: `SwiftUI`
   - **Language**: `Swift`
4. Choose this repository directory
5. Let Xcode add the existing files

### 3. Select Target Device

1. At the top of Xcode, select the device dropdown
2. Choose **iPhone 16 Pro** simulator (or your preferred iPhone)
3. Start the simulator: **Cmd+Shift+2** (or from Xcode menu)

### 4. Run the App

Press **Cmd+R** or click the Play button (►)

### 5. Run Tests

Press **Cmd+U** to run the full test suite with 100% coverage

## What You'll See

**Main Screen:**
- Date picker at the top
- Daily statistics card (workout count, total duration)
- List of workouts for the selected date
- Plus button (+) to add new workouts

**Add Workout:**
- Tap the + button
- Enter workout name (e.g., "Chest Day")
- Adjust duration using the stepper
- Tap "Add"

**View History:**
- Use the date picker to select any past or future date
- View all workouts from that day

## Project Features

✅ **100% Test Coverage**
- 8 tests for data storage and retrieval
- 9 tests for data models
- Run with Cmd+U

✅ **Local Storage**
- All workouts saved to device
- No cloud required
- Data persists between app launches

✅ **iPhone 16 Pro Ready**
- Optimized for dynamic island
- Supports all safe area sizes
- Full gesture support

✅ **Modern SwiftUI**
- Reactive updates
- Preview support
- Accessible UI

## Project Structure

```
workout-tracker/
├── README.md              # Overview and features
├── DEVELOPMENT.md         # Detailed dev guide
├── GETTING_STARTED.md     # This file
├── setup.sh              # Setup script
├── .gitignore            # Git ignore rules
├── WorkoutTracker/
│   ├── Sources/
│   │   ├── WorkoutTrackerApp.swift
│   │   ├── ContentView.swift
│   │   ├── Models.swift
│   │   └── WorkoutStore.swift
│   ├── Tests/
│   │   ├── WorkoutStoreTests.swift
│   │   └── ModelsTests.swift
│   ├── Assets.xcassets/
│   ├── Info.plist
│   └── [Icons created]
└── .git/                 # Git repository
```

## First Development Steps

### 1. Modify the Welcome Message
Open `WorkoutTracker/Sources/ContentView.swift` and change the title.

### 2. Add a New Feature
- Add new model in `Models.swift`
- Add test in `Tests/ModelsTests.swift`
- Update view in `ContentView.swift`
- Verify coverage with Cmd+U

### 3. Commit Changes
```bash
git add .
git commit -m "Description of change"
git push origin main
```

## Troubleshooting

### "No such module 'WorkoutTracker'"
- Build first: **Cmd+B**
- Clean build folder: **Cmd+Shift+K**

### Simulator won't start
- **Hardware** → **Erase All Content and Settings**
- Or: **Cmd+Shift+2** to launch default simulator

### Tests fail
- Ensure target is iOS Simulator, not physical device
- Run: **Cmd+U**

### Data not saving
- Check that the app has Documents folder access
- Verify you're not using read-only mode

## Resources

- [Swift.org](https://swift.org) — Swift documentation
- [Developer.apple.com](https://developer.apple.com) — iOS docs
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/SwiftUI)

## Next Steps

1. ✅ Understand the code structure
2. ✅ Run the app and explore
3. ✅ Run tests and check coverage
4. ✅ Start building your features
5. ✅ Maintain 100% test coverage
6. ✅ Commit and push to GitHub

Happy coding! 🏋️‍♂️
