import Foundation

class CountryService: ObservableObject {
    @Published var countries: [Country] = []

    func fetchCountries() {
            // Get the URL for the local JSON file from the app bundle
            if let url = Bundle.main.url(forResource: "countries", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoded = try JSONDecoder().decode([Country].self, from: data)
                    DispatchQueue.main.async {
                        self.countries = decoded
                        print("Loaded \(decoded.count) countries from local JSON")
                    }
                } catch {
                    print("Error decoding local JSON: \(error)")
                }
            } else {
                print("countries.json not found in bundle")
            }
        }
}
