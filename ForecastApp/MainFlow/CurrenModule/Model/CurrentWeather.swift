import Foundation

struct CurrentWeather: Codable {
    var weather: [Weather]
    var base: String
    var main: Main
    var visibility: Int
    var dt: Date
    var timezone, id: Int
    var name: String
    var cod: Int
}

struct Main: Codable {
    var temp, feelsLike, tempMin, tempMax: Double
    var pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}
