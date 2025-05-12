# Flag Guessing Game

A SwiftUI-based flag guessing game where a flag is displayed and you have to type in the name of the country. The app supports fuzzy matching for misspelled country names and alternative names (e.g., "UK" for "United Kingdom"), giving users clear visual feedback on their guesses.

## Features

- **Local JSON Data:** Flags and country data are loaded from a bundled JSON file, making the app self-contained.
- **Fuzzy Matching:** Supports minor misspellings using a Levenshtein distance algorithm.
- **Alternative Names:** Recognizes alternative names and abbreviations (e.g., "usa" for "United States").
- **Visual Feedback:** Displays animations for correct and incorrect answers, including a blink effect for subsequent wrong attempts.
- **Interactive UI:** Buttons for "Submit", "Next", and "I Give Up" with dynamic states and animations.
- **Unit & UI Tests:** Includes basic tests for game logic using XCTest.

Game overview

<img width="179" alt="Screenshot 2025-05-12 at 13 52 20" src="https://github.com/user-attachments/assets/cff555c3-e608-4f2f-8df0-036c53cf600a" />

I give up!

<img width="173" alt="Screenshot 2025-05-12 at 13 52 47" src="https://github.com/user-attachments/assets/446d80cf-bb35-4972-98b9-71499c2e971a" />

Correct!

<img width="176" alt="Screenshot 2025-05-12 at 13 53 11" src="https://github.com/user-attachments/assets/dee9f73d-b3dc-4d1d-805f-3f2d25db008c" />


## Requirements

- Xcode 15 (or later)
- iOS 16 (or later)

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/YOUR_USERNAME/FlagGuessingGame.git
   cd FlagGuessingGame
