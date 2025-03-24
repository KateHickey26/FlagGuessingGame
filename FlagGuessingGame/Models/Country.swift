import Foundation

struct Country: Codable, Identifiable {
    var id: UUID { UUID() } 
    let name: Name
    let flags: Flags

    struct Name: Codable {
        let common: String
        let official: String?
    }

    struct Flags: Codable {
        let png: String
    }
}
