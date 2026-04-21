//
//  WeatherMapping.swift
//  WeatherlyTest
//
//  Created by CCS038 on 21/04/26.
//

import Foundation

enum WeatherMapping {

    static func map(dto: OpenMeteoDTO) -> WeatherSummary {
        WeatherSummary(
            temperature: dto.current.temperature_2m,
            windSpeed: dto.current.wind_speed_10m
        )
    }
}
