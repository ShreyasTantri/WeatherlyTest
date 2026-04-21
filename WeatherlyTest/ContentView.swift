//
//  ContentView.swift
//  WeatherlyTest
//
//  Created by CCS038 on 13/04/26.
//

import SwiftUI

struct ContentView: View {

    @State private var summary: WeatherSummary?
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            VStack {

                Text("Current Weather")
                    .font(.largeTitle)

                if let summary {
                    Text("Temperature: \(summary.temperature) °C")
                    Text("Wind Speed: \(summary.windSpeed) km/h")
                } else if isLoading {
                    ProgressView()
                } else {
                    Text("No data")
                }

            }
            .padding()
            .task {
                await load()
            }
        }
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }

        do {
            summary = try await LiveWeatherService().fetchWeather()
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
