//
//  ContentView.swift
//  schoolSelector test
//
//  Created by Rohan Sehgal on 1/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selected: String?

    var body: some View {
        NavigationView {
            if selected == nil {
                NavigationLink(destination: FillInView(selected: $selected)) {
                    Text("Please fill in the variable")
                }
            } else {
                Text("Selected value: \(selected!)")
            }
        }
    }
}


struct FillInView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selected: String?
    @State private var value: String = ""

    var body: some View {
        VStack {
            Text("Enter the value for the variable:")
            TextField("Value", text: $value)
            Button("Submit") {
                // update the selected variable
                selected = value
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
