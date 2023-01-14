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
                    //ScrollView {
                    VStack{
                        if hall.dishes!.count > 0 {
                            let error = ["something", "went", "wrong"]
                            
                            TabView {
                                //ForEach(0..<hall.dishes!.count, id: \.self) { index in
                                Menu_Section(arr: hall.dishes!["Breakfast"] ?? error)
                                    .tabItem {
                                        Image(systemName: "circle")
                                        Text("Breakfast")
                                    }
                                Menu_Section(arr: hall.dishes!["Lunch"] ?? error)
                                    .tabItem {
                                        Image(systemName: "circle")
                                        Text("Lunch")
                                    }
                                Menu_Section(arr: hall.dishes!["Dinner"] ?? error)
                                    .tabItem {
                                        Image(systemName: "circle")
                                        Text("Dinner")
                                    }
                            }
                        }
                        else {
                            Text("No Data Displayed")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }
        }.navigationBarTitle("Menu - " + hall.name)
    }
}

struct Menu_Previews: PreviewProvider {
    static let HallPreview = Hall(
        name: "sample dining hall",
        dishes: ["Breakfast" : ["eggs", "ham", "cereal"], "Lunch" : ["Sandwhich", "Pasta", "Burrito"], "Dinner" : ["Nachos", "Soup", "Chicken"]],
        image: "Epicuria at Covel"
    )
    
    static var previews: some View {
        // 5. Use the right SecondView initializator
        Menu(hall: HallPreview)
    }
}
