

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.Background
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Accent Color")
                    .foregroundColor(Color.theme.Accent)
                
                Text("Secondary Text Color")
                    .foregroundColor(Color.theme.SecondaryText)
                
                Text("Red Color")
                    .foregroundColor(Color.theme.Red)
                
                Text("Green Color")
                    .foregroundColor(Color.theme.Green)
            }
            .font(.headline)
        }
    }
}

#Preview {
    ContentView()
}
