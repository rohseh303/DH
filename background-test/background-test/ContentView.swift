//
//  ContentView.swift
//  background-test
//
//  Created by Rohan Sehgal on 12/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Set the background to a LinearGradient
            LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            // Add a scroll view on top of the background
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<100) { i in
                        Text("Item \(i)")
                            .font(.title)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
