//
//  OpenMeteoDTO.swift
//  WeatherlyTest
//
//  Created by CCS038 on 21/04/26.
//

struct OpenMeteoDTO: Decodable {
    let current: CurrentWeather
}

struct CurrentWeather: Decodable {
    let temperature_2m: Double
    let wind_speed_10m: Double
}
    
