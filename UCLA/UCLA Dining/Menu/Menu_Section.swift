//
//  Menu_Section.swift
//  UCLA Dining
//
//  Created by Rohan Sehgal on 1/13/23.
//

import SwiftUI

struct Menu_Section: View {
    var arr: [String]
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            VStack {
                VStack {
                    if arr.count > 0 {
                        ScrollView {
                            ForEach(arr, id: \.self) { dish in
                                Text(dish.replacingOccurrences(of: "&amp;", with: "&"))
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .fontWeight(.thin)
                            }
                        }
                    }
                    else {
                        Text("No data displayed")
                    }
                }
                Spacer()
                VStack {
                    BannerAd(unitID: "ca-app-pub-7275807859221897/8994587990")
                }.frame(height: 45, alignment: .bottom)
            }
        }
    }
}

struct Menu_Section_Previews: PreviewProvider {
    static var previews: some View {
        Menu_Section(arr: ["eggs", "bacon", "sausage"])
    }
}
