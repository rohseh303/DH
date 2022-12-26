///
//  Menu.swift
//  UCLA Dining
//
//  Created by Rohan Sehgal on 10/20/22.
//

import Foundation
import SwiftUI

struct fixed_menu: View {
    // Use a scale effect to zoom in and out
    @State private var scale: CGFloat = 1.0
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
                
                VStack{
                    ScrollView(.vertical, showsInicators: false) {
                        Image(hall.fixed_menu!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .scaleEffect(scale)
                            .gesture(
                                MagnificationGesture()
                                    .onChanged { self.scale = $0 }
                                    .onEnded { _ in self.scale = 1.0 }
                                )
                        }
                }
                Spacer()
            }
        }
    }
}

struct fixed_menu_Previews: PreviewProvider {
    static let HallPreview = Hall(
        name: "The Drey",
        dishes: ["default", "preview", "menu"],
        image: "the drey",
        fixed_menu: "The Drey fixed menu"
    )
    
    static var previews: some View {
        // 5. Use the right SecondView initializator
        fixed_menu(hall: HallPreview)
    }
}
