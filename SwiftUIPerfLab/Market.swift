import Foundation
import Observation

@MainActor
@Observable
final class Market {
    var tickers: [Ticker] = (0..<500).map { Ticker.sample(id: $0) }

    func run() async {
        while !Task.isCancelled {
            try? await Task.sleep(for: .milliseconds(500))
            let index = Int.random(in: tickers.indices)
            let next = tickers[index].price * Double.random(in: 0.98...1.02)
            tickers[index].record(next)
        }
    }

    func sortByTrend() {
        tickers.sort { $0.trend > $1.trend }
    }
}
