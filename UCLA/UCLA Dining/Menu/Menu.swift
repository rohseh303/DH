///
//  Menu.swift
//  UCLA Dining
//
//  Created by Rohan Sehgal on 10/20/22.
//

import SwiftUI

struct Menu: View {
    var hall: Hall
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea(.all)
            VStack {
                VStack {
                    ScrollView {
                        VStack{
                            if hall.dishes.count > 0 {
                                ForEach(hall.dishes, id: \.self) { dish in
                                    Text(dish)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .fontWeight(.thin)
                                }
                            }
                            else {
                                Text("No Data Displayed")
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                VStack(alignment: .trailing) {
                    BannerAd(unitID: "ca-app-pub-3940256099942544/2934735716")
                }.frame(height: 45)
            }
        }.navigationBarTitle("Menu - " + hall.name)
    }
}

struct Menu_Previews: PreviewProvider {
    static let HallPreview = Hall(
        name: "sample dining hall",
        dishes: ["default", "preview", "menu"],
        image: "Epicuria at Covel"
    )
    
    static var previews: some View {
        // 5. Use the right SecondView initializator
        Menu(hall: HallPreview)
    }
}
