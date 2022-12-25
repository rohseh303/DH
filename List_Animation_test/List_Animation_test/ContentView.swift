//
//  ContentView.swift
//  List_Animation_test
//
//  Created by Rohan Sehgal on 12/25/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showList = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.showList.toggle()
                }
            }) {
                Text("Toggle List")
            }

            if showList {
                List {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
                .transition(.move(edge: .leading))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
