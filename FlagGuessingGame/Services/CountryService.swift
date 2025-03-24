import Foundation

class CountryService: ObservableObject {
    @Published var countries: [Country] = []

    func fetchCountries() {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else {
            print("❌ Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("❌ HTTP Error: Status Code \(httpResponse.statusCode)")
                return
            }

            guard let data = data else {
                print("❌ No data received")
                return
            }

            do {
                let decoded = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    self.countries = decoded
                    print("✅ Successfully loaded \(decoded.count) countries")
                }
            } catch {
                print("❌ Decoding error: \(error)")
            }
        }.resume()
    }
}
