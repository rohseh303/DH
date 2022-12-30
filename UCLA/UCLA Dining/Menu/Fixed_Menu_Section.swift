import Foundation
import SwiftUI

struct Fixed_Menu_Section: View {
    // Use a scale effect to zoom in and out
    @State private var offset: CGSize = .zero
    @State private var finalAmount = 1.0
    @State private var curAmount = 0.0
    
    var hall: Hall
    var section_number: Int
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea(.all)
            VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        Image(hall.fixed_menu![section_number])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                        }
                    .scaleEffect(finalAmount + curAmount)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { amount in
                                curAmount = amount - 1
                            }
                            .onEnded{ amount in
                                finalAmount += curAmount
                                curAmount = 0
                            }
                    )
            }
        }.navigationBarTitle("Menu - " + hall.name)
    }
}

struct Fixed_Menu_Section_Previews: PreviewProvider {
    static let HallPreview = Hall(
        name: "The Drey",
        dishes: ["default", "preview", "menu"],
        image: "the drey",
        fixed_menu: ["The Drey fixed menu 1"],
        sections: 1
    )
    
    static var previews: some View {
        // 5. Use the right SecondView initializator
        fixed_menu(hall: HallPreview)
    }
}
