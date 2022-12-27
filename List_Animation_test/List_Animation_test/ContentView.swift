//
//  ContentView.swift
//  List_Animation_test
//
//  Created by Rohan Sehgal on 12/25/22.
//

import SwiftUI

struct ContentView: View {
    let views: [String: AnyView] = ["View 1": AnyView(Text("View 1")), "View 2": AnyView(Text("View 2"))]

    var body: some View {
        TabView {
            ForEach(Array(views.keys), id: \.self) { key in
                self.views[key]!
                    .tabItem {
                        Image(systemName: "circle")
                        Text(key)
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
