//
//  SchoolSelector.swift
//  UCLA Dining
//
//  Created by Rohan Sehgal on 1/15/23.
//

import SwiftUI

struct SchoolSelector: View {
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

struct SchoolSelector_Previews: PreviewProvider {
    static var previews: some View {
        SchoolSelector(selected: .constant("UCLA"))
    }
}
