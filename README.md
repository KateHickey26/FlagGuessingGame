# Flag Guessing Game

A SwiftUI-based flag guessing game where a flag is displayed and you have to type in the name of the country. The app supports fuzzy matching for misspelled country names and alternative names (e.g., "UK" for "United Kingdom"), giving users clear visual feedback on their guesses.

## Features

- ✅ **Offline support:** Flags and country data are loaded from a bundled JSON file, making the app self-contained and offline supported.
- 🤖 **Fuzzy Matching:** Supports minor misspellings using a Levenshtein distance algorithm.
- 🔁 **Alternative Names:** Recognizes alternative names and abbreviations (e.g., "usa" for "United States").
- ✨ **Visual Feedback:** Displays animations for correct and incorrect answers, including a blink effect for subsequent wrong attempts.
- 🧠 **"I Give Up" button** – reveals the answer and disables further guesses.
- 🎯 **Score tracking** – tracks your correct answers.
- 🖼 **Stylized UI** – hand-drawn map background, semi-transparent UI card, mobile-optimized layout.
- ▶️ **Interactive UI:** Buttons for "Submit", "Next", and "I Give Up" with dynamic states and animations.
- 🧪 **Unit tested** – Levenshtein distance and fuzzy logic tested using XCTest

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
   ```

2.	Open in Xcode:
   ```bash
   open FlagGuessingGame.xcodeproj
   ```

3.	Run the app
   •	Use the iOS Simulator or a physical device.
	•	Press ⌘ + R to build and run.

## Running tests

The project includes unit tests for fuzzy matching and string distance logic.

To run tests:
```bash
⌘ + U
```
Or open the Test Navigator (⌘ + 6) and run individual tests.

## License

MIT License. See LICENSE for details.

## Author

Kate Hickey
Software engineer & builder of tiny, thoughtful apps
LinkedIn • Portfolio • GitHub

## Why I Built It

I wanted to create a small but polished SwiftUI app that combined:

- Clean, responsive UI
- Non-trivial user input handling
- Animations that improve UX
- A playful but educational purpose

This project also served as a hands-on way to explore SwiftUI state management, string distance algorithms, layout responsiveness, and testing strategy.
I was inspired by my partner, who always amazes me with his knowledge of flags! He's now the number one fan of this game.
