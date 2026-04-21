//
//  LiveWeatherService.swift
//  WeatherlyTest
//
//  Created by CCS038 on 21/04/26.
//

import Foundation

struct LiveWeatherService {

    func fetchWeather() async throws -> WeatherSummary {

        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let dto = try JSONDecoder().decode(OpenMeteoDTO.self, from: data)

        return WeatherMapping.map(dto: dto)
    }
}
