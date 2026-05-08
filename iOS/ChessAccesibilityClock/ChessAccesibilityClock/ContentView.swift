//
//  ContentView.swift
//  ChessAccesibilityClock
//
//  Created by Anthony Sale on 07/05/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.green
            VStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
