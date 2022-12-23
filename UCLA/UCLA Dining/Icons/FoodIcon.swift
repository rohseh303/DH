//
//  FoodIcons.swift
//  UCLA Dining
//
//  Created by Rohan Sehgal on 10/18/22.
//

import SwiftUI

struct FoodIcon: View {
    var hall: Hall
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack {
                Image(hall.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .cornerRadius(25)
                HStack {
                    Text(hall.name)
                        .padding([.leading],45)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
        }
    }
}

struct FoodIcon_Previews: PreviewProvider {
        static let HallPreview = Hall(
            name: "sample dining hall",
            dishes: ["default preview menu"],
            image: "Epicuria at Covel"
        )
        
        static var previews: some View {
            // 5. Use the right SecondView initializator
            FoodIcon(hall: HallPreview)
        }
}
