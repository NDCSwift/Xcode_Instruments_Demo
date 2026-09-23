import Foundation
import Observation
import os

@MainActor
@Observable
final class Market {
    var tickers: [Ticker] = (0..<500).map { Ticker.sample(id: $0) }

    func run() async {
        while !Task.isCancelled {
            try? await Task.sleep(for: .milliseconds(50))
            let index = Int.random(in: tickers.indices)
            let next = tickers[index].price * Double.random(in: 0.98...1.02)
            tickers[index].record(next)
        }
    }

    private let signposter = OSSignposter(subsystem: "com.noahdoescoding.SwiftUIPerfLab", category: .pointsOfInterest)

    func sortByTrend() {
        signposter.withIntervalSignpost("Sort by Trend") {
            tickers.sort { $0.trend > $1.trend }
        }
    }
}
