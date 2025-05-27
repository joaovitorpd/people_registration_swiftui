# People Registration App

A SwiftUI demo project exploring local data persistence in iOS/macOS applications.

## Overview

This project demonstrates how to implement:
- Local data persistence using JSON files
- CRUD operations (Create, Read, Update, Delete)
- SwiftUI best practices for data binding and state management
- Cross-platform development (works on both iOS and macOS)

## Features

- Add new people with name, email, and description
- Edit existing entries
- Delete records with swipe actions
- Automatic saving to local storage
- Responsive design for different device sizes

## Technical Details

### Core Components

1. **Data Model**: `Person.swift`
   - Identifiable, Hashable, Codable struct
   - UUID-based identification
   - Example data for previews

2. **Data Management**: `PeopleData.swift`
   - ObservableObject class
   - JSON encoding/decoding for persistence
   - Automatic saving on changes
   - File storage in documents directory

3. **UI Components**:
   - `PeopleList.swift`: Main view with navigation
   - `PersonEditor.swift`: Form for editing/adding people
   - `PersonRow.swift`: Custom list row view
   - `CustomLabelStyle.swift`: Reusable label style

### Persistence Implementation

The app automatically:
1. Loads data on launch (`people.load()`)
2. Saves changes whenever the people array is modified (`onChange(of: people.people, people.save)`)
3. Stores data in a protected JSON file in the app's documents directory

## Requirements

- Xcode 13+
- iOS 15+ / macOS 12+
- Swift 5.5+

## How to Run

1. Clone the repository
2. Open `People Registration.xcodeproj`
3. Build and run on your preferred simulator or device

## Learning Points

This project serves as an educational example for:
- SwiftUI data flow (@State, @Binding, @ObservedObject)
- Local file persistence strategies
- Cross-platform UI adaptation (#if os(iOS))
- Custom view styling and reusable components

