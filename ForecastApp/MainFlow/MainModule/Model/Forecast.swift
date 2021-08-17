// Forecast.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let forecast = try? newJSONDecoder().decode(Forecast.self, from: jsonData)

import Foundation

// MARK: - Forecast
struct Forecast: Codable {
    var lat, lon: Double
    var timezone: String
    var timezoneOffset: Int
    var current: Current
    var daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, daily
    }
}

// Current.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let current = try? newJSONDecoder().decode(Current.self, from: jsonData)

import Foundation

// MARK: - Current
struct Current: Codable {
    var dt, sunrise, sunset: Int
    var temp, feelsLike: Double
    var pressure, humidity: Int
    var dewPoint, uvi: Double
    var clouds, visibility: Int
    var windSpeed: Double
    var windDeg: Int
    var windGust: Double
    var weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather
    }
}

// Weather.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - Weather
struct Weather: Codable {
    var id: Int
    var main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// Daily.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let daily = try? newJSONDecoder().decode(Daily.self, from: jsonData)

import Foundation

// MARK: - Daily
struct Daily: Codable {
    var dt, sunrise, sunset, moonrise: Date
    var moonset: Int
    var moonPhase: Double
    var temp: Temp
    var feelsLike: FeelsLike
    var pressure, humidity: Int
    var dewPoint, windSpeed: Double
    var windDeg: Int
    var windGust: Double
    var weather: [Weather]
    var clouds: Int
    var pop: Double
    var rain: Double?
    var uvi: Double

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, rain, uvi
    }
}

// FeelsLike.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let feelsLike = try? newJSONDecoder().decode(FeelsLike.self, from: jsonData)

import Foundation

// MARK: - FeelsLike
struct FeelsLike: Codable {
    var day, night, eve, morn: Double
}

// Temp.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let temp = try? newJSONDecoder().decode(Temp.self, from: jsonData)

import Foundation

// MARK: - Temp
struct Temp: Codable {
    var day, min, max, night: Double
    var eve, morn: Double
}

// JSONSchemaSupport.swift

import Foundation
