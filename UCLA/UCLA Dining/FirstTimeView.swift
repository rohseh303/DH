//
//  FirstTimeView.swift
//  UCLA Dining
//
//  Created by Rohan Sehgal on 1/15/23.
//

import SwiftUI

struct FirstTimeView: View {
    
    //for retrieving school name
    @State private var isPresented: Bool = false
    @State private var selectedKey: String? = UserDefaults.standard.string(forKey: "selectedKey")
    
    var body: some View {
        if selectedKey != nil {
            LaunchAnimation(selectedKey: selectedKey ?? "something wrong")
        }
        else {
            Button("Select Your University") {
                self.isPresented = true
            }
            .sheet(isPresented: $isPresented) {
                FillInView(selectedKey: self.$selectedKey)
            }
        }

    }
}

struct FirstTimeView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeView()
    }
}
