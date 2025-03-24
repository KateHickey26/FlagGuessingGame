import Foundation

class CountryService: ObservableObject {
    @Published var countries: [Country] = []

    func fetchCountries() {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode([Country].self, from: data)
                    DispatchQueue.main.async {
                        self.countries = decoded
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
    }
}
