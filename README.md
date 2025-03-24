# Flag Guessing Game

A SwiftUI-based flag guessing game where a flag is displayed and you have to type in the name of the country. The app supports fuzzy matching for misspelled country names and alternative names (e.g., "UK" for "United Kingdom"), giving users clear visual feedback on their guesses.

## Features

- **Local JSON Data:** Flags and country data are loaded from a bundled JSON file, making the app self-contained.
- **Fuzzy Matching:** Supports minor misspellings using a Levenshtein distance algorithm.
- **Alternative Names:** Recognizes alternative names and abbreviations (e.g., "usa" for "United States").
- **Visual Feedback:** Displays animations for correct and incorrect answers, including a blink effect for subsequent wrong attempts.
- **Interactive UI:** Buttons for "Submit", "Next", and "I Give Up" with dynamic states and animations.
- **Unit & UI Tests:** Includes basic tests for game logic using XCTest.

## Requirements

- Xcode 15 (or later)
- iOS 16 (or later)

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/YOUR_USERNAME/FlagGuessingGame.git
   cd FlagGuessingGame
