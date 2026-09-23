import SwiftUI

struct ContentView: View {
    @State private var market = Market()

    var body: some View {
        NavigationStack {
            List(market.tickers) { ticker in
                TickerRow(market: market, id: ticker.id)
            }
            .navigationTitle("Market")
            .toolbar {
                Button("Sort by Trend") {
                    market.sortByTrend()
                }
            }
        }
        .task {
            await market.run()
        }
    }
}

struct TickerRow: View {
    let market: Market
    let id: Int

    var body: some View {
        if let ticker = market.tickers.first(where: { $0.id == id }) {
            HStack {
                Text(ticker.symbol)
                    .font(.headline.monospaced())
                Spacer()
                Text(ticker.trend, format: .percent.precision(.fractionLength(2)))
                    .foregroundStyle(ticker.trend >= 0 ? .green : .red)
                Text(ticker.price, format: .currency(code: "USD"))
                    .monospacedDigit()
            }
        }
    }
}
