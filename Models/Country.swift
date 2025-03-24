import Foundation

struct Country: Codable, Identifiable {
    var id: UUID = UUID() // For SwiftUI List
    let name: Name
    let flags: Flags

    struct Name: Codable {
        let common: String
    }

    struct Flags: Codable {
        let png: String
    }
}
