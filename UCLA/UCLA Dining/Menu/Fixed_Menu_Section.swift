import Foundation
import SwiftUI

struct Fixed_Menu_Section: View {
    // Use a scale effect to zoom in and out
    @State private var scale: CGFloat = 1.0
    var hall: Hall
    var section_number: Int
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea(.all)
            VStack {
                VStack{
                    ScrollView(.vertical, showsIndicators: false) {
                        Image(hall.fixed_menu![section_number])
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
        }.navigationBarTitle("Menu - " + hall.name);
    }
}

struct Fixed_Menu_Section_Previews: PreviewProvider {
    static let HallPreview = Hall(
        name: "The Drey",
        dishes: ["default", "preview", "menu"],
        image: "the drey",
        fixed_menu: ["The Drey fixed menu 1"]
    )
    
    static var previews: some View {
        // 5. Use the right SecondView initializator
        fixed_menu(hall: HallPreview)
    }
}
