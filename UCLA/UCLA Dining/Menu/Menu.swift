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
                
                //contains header and menu title
                ZStack(alignment: .bottomLeading) {
                    //Color(.gray)
                    //  .ignoresSafeArea(.all)
                    Text("Menu - " + hall.name)
                        .font(.system(size:28, weight: .medium, design: .default))
                        .underline()
                        .italic()
                        .foregroundColor(.black)
                    
                }
                .frame(height: 50)
                .shadow(color: Color.black, radius: 30, x: 0, y: 0)
                
                ScrollView {
                    VStack{
                        if hall.dishes.count > 0 {
                            ForEach(hall.dishes, id: \.self) { dish in
                                Text(dish)
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                        }
                            else {
                                Text("No Data displayed")
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                    }
                    Spacer()
                }
            }
        }
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
