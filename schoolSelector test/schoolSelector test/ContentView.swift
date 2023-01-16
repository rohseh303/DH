//
//  ContentView.swift
//  schoolSelector test
//
//  Created by Rohan Sehgal on 1/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    @State private var selectedKey: String? = UserDefaults.standard.string(forKey: "selectedKey")
    var body: some View {
        VStack {
            if selectedKey != nil {
                Text("Selected Key: \(selectedKey!)")
            } else {
                Button("Select Key") {
                    self.isPresented = true
                }
                .sheet(isPresented: $isPresented) {
                    FillInView(selectedKey: self.$selectedKey)
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
