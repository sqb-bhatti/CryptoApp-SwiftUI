
import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            
            if showHoldingsColumn {
                centerColumn
            }
            
            rightColumn
            
        }
        .font(.subheadline)
    }
}





extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.SecondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.Accent)
        }
    }
    
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWithTwoDecimals())
                .bold()
            
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        
        .foregroundColor(Color.theme.Accent)
    }
    
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWithTwoDecimals())
                .bold()
                .foregroundColor(Color.theme.Accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24HInCurrency ?? 0.0 > 0 ? Color.theme.Green: Color.theme.Red))
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}






#Preview {
    Group {
        CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
            
        
        CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
    }
}
