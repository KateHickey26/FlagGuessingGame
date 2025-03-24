import SwiftUI
import NaturalLanguage

struct ContentView: View {
    @StateObject var service = CountryService()
    @State private var currentIndex = 0
    @State private var userAnswer = ""
    @State private var score = 0
    @State private var showFeedback = false
    @State private var isCorrect = false
    @State private var isSubmitDisabled = false
    @State private var gaveUp = false
    @State private var isGiveUpDisabled = false
    @State private var wrongFlash = false
    @State private var firstWrongAttempt = true

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("background2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .ignoresSafeArea()

                VStack {
                    ZStack {
                        Color.white.opacity(0.85)
                            .cornerRadius(20)

                        VStack(spacing: 20) {
                            Button("Reload Data") {
                                service.fetchCountries()
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)

                            if !service.countries.isEmpty {
                                let country = service.countries[currentIndex]

                                AsyncImage(url: URL(string: country.flags.png)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 200)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.black, lineWidth: 4)
                                        )
                                } placeholder: {
                                    ProgressView()
                                }

                                TextField("Enter country name", text: $userAnswer)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()

                                Group {
                                    if showFeedback {
                                        Text(gaveUp
                                            ? "😅 The correct answer was: \(service.countries[currentIndex].name.common)"
                                            : (isCorrect ? "✅ Correct!" : "❌ Wrong!")
                                        )
                                        .foregroundColor(gaveUp ? .orange : (isCorrect ? .green : .red))
                                        .font(.headline)
                                        .opacity(wrongFlash ? 0 : 1)
                                        .animation(.easeInOut(duration: 0.1), value: wrongFlash)
                                        .padding(.bottom, 10)
                                    }
                                }

                                VStack(spacing: 10) {
                                    HStack(spacing: 16) {
                                        Button("Submit") {
                                            checkAnswer()
                                        }
                                        .disabled(isSubmitDisabled)
                                        .padding()
                                        .frame(minWidth: 100, maxWidth: .infinity)
                                        .background(isSubmitDisabled ? Color.gray : Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        
                                        Button("I Give Up") {
                                            giveUp()
                                        }
                                        .padding()
                                        .frame(minWidth: 100, maxWidth: .infinity)
                                        .background(isGiveUpDisabled ? Color.gray : Color.red)
                                        
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .disabled(isGiveUpDisabled)
    //                                    .animation(.easeInOut(duration: 0.3), value: isGiveUpDisabled)

                                        
                                    }
                                    .frame(maxWidth: 300)

                                    Text("Score: \(score)")
                                        .font(.headline)
                                        .padding(.top)
                                    
                                    Button("Next") {
                                        goToNext()
                                    }
                                    .padding()
                                    .frame(minWidth: 100, maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                   
                                }
                            } else {
                                ProgressView("Loading countries...")
                            }
                        }
                        .padding()
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear { // Ensure data is fetched when the view loads
                    service.fetchCountries()
                }
            }
        }
    }

    func checkAnswer() {
        let correctName = service.countries[currentIndex].name.common.lowercased()
        let officialName = service.countries[currentIndex].name.official?.lowercased() ?? ""
        let userInput = userAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // Dictionary of alternative country names
        let alternativeNames: [String: String] = [
            "uk": "united kingdom",
            "usa": "united states",
            "us": "united states",
            "south korea": "korea republic",
            "czechia": "czech republic",
            "uae": "united arab emirates"
        ]
        
        let interpretedInput = alternativeNames[userInput] ?? userInput
        let validNames = [correctName, officialName]

        if validNames.contains(interpretedInput) || validNames.contains(where: { isSimilar(interpretedInput, $0) }) {
            score += 1
            isCorrect = true
            isSubmitDisabled = true
            isGiveUpDisabled = true
        } else {
            isCorrect = false
            userAnswer = ""
            if firstWrongAttempt {
                    firstWrongAttempt = false
            } else {
                    wrongFlash = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        wrongFlash = false
                    }
                }
        }

        showFeedback = true
    }

    func goToNext() {
        currentIndex = Int.random(in: 0..<service.countries.count)
        userAnswer = ""
        showFeedback = false
        isSubmitDisabled = false
        isGiveUpDisabled = false
        gaveUp = false
        firstWrongAttempt = true
    }
    
    func isSimilar(_ input: String, _ target: String) -> Bool {
        let distance = levenshteinDistance(input, target)
        return distance <= 2 // Allow 2 character differences
    }

    func levenshteinDistance(_ s1: String, _ s2: String) -> Int {
        let empty = [Int](repeating: 0, count: s2.count)
        var last = [Int](0...s2.count)

        for (i, char1) in s1.enumerated() {
            var current = [i + 1] + empty
            for (j, char2) in s2.enumerated() {
                current[j + 1] = char1 == char2 ? last[j] : min(last[j], last[j + 1], current[j]) + 1
            }
            last = current
        }
        return last.last ?? s2.count
    }
    
    func giveUp() {
        isCorrect = false
        gaveUp = true
        showFeedback = true
        isSubmitDisabled = true
        isGiveUpDisabled = true
    }
}

#Preview {
    ContentView()
}
