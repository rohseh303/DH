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
        VStack {
            
            //contains header and menu title
            ZStack(alignment: .bottomLeading) {
                Color(.yellow)
                    .ignoresSafeArea(.all)
                Text("Menu - " + hall.name)
                    .font(.system(size:28, weight: .medium, design: .default))
            }
            .frame(height: 80)
            
            //where the web scraping data will go
            VStack{
                WebScraping(hall: hall)
            }
            Spacer()
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static let HallPreview = Hall(
        name: "sample dining hall",
        image: "Epicuria at Covel"
    )
    
    static var previews: some View {
        // 5. Use the right SecondView initializator
        Menu(hall: HallPreview)
    }
}
