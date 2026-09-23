import Foundation

struct Ticker: Identifiable {
    let id: Int
    let symbol: String
    var history: [Double]

    var price: Double { history.last ?? 0 }

    private(set) var trend: Double = 0

    mutating func record(_ price: Double) {
        history.append(price)
        if history.count > 2_000 {
            history.removeFirst()
        }
        trend = Ticker.trend(of: history)
    }

    static func trend(of history: [Double]) -> Double {
        let smoothed = movingAverage(of: history, window: 100)
        guard let first = smoothed.first, let last = smoothed.last, first != 0 else { return 0 }
        return (last - first) / first
    }

    static func sample(id: Int) -> Ticker {
        let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let symbol = String((0..<4).map { letters[($0 * 7 + id * 13 + id / 26) % letters.count] })
        var price = Double.random(in: 20...400)
        var history: [Double] = []
        for _ in 0..<2_000 {
            price *= Double.random(in: 0.99...1.01)
            history.append(price)
        }
        var ticker = Ticker(id: id, symbol: symbol, history: history)
        ticker.trend = Ticker.trend(of: history)
        return ticker
    }
}

func movingAverage(of values: [Double], window: Int) -> [Double] {
    guard values.count >= window else { return values }
    return (0...(values.count - window)).map { start in
        values[start..<start + window].reduce(0, +) / Double(window)
    }
}
