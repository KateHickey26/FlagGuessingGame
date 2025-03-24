import XCTest
@testable import FlagGuessingGame

final class FlagGuessingGameTests: XCTestCase {
    
    func testLevenshteinDistance() throws {
        let view = ContentView()
        // "belguim" should be 1 character different from "belgium"
        let distance = view.levenshteinDistance("belguim", "belgium")
        XCTAssertEqual(distance, 1, "The Levenshtein distance between 'belguim' and 'belgium' should be 1")
    }
    
    func testIsSimilar() throws {
        let view = ContentView()
        // "belguim" should be similar to "belgium" (allowing 2 character differences)
        XCTAssertTrue(view.isSimilar("belguim", "belgium"))
        
        // Identical strings should be similar
        XCTAssertTrue(view.isSimilar("france", "france"))
        
        // Different strings should not be considered similar
        XCTAssertFalse(view.isSimilar("spain", "france"))
    }
}
