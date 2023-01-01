import Foundation
import SwiftUI
import UIKit


struct Fixed_Menu_Section: View {
    // Use a scale effect to zoom in and out
    @State private var location: CGSize = CGSize()
    @GestureState private var translation: CGSize = CGSize()
    @State private var offset: CGSize = .zero
    @State private var finalAmount = 1.0
    @State private var curAmount = 0.0
    
    
    
    @State private var imageSize = CGSize.zero
    var hall: Hall
    var section_number: Int
    var body: some View {
        let tapDrag = DragGesture(minimumDistance: 0)
          .updating($translation) { value, state, _ in
            state = value.translation
          }
          .onEnded { value in
            location = CGSize(width: location.width + value.translation.width, height: location.height + value.translation.height)
          }
          .simultaneously(with:                         MagnificationGesture()
           .onChanged { amount in
               curAmount = amount - 1
           }
           .onEnded{ amount in
               finalAmount += curAmount
               curAmount = 0
           }
     )

        
        
        ZStack{
            Color.white
                .ignoresSafeArea(.all)
            VStack {
                //ScrollView(.vertical, showsIndicators: false) {
                    Image(hall.fixed_menu![section_number])
                    .onAppear {
                                    if let uiImage = UIImage(named: self.hall.fixed_menu![section_number]) {
                                        self.imageSize = uiImage.size
                                    }
                                }
                    .offset(x: 0, y: imageSize.height - UIScreen.main.bounds.height)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .bottom)
                
                
                      .position(x: location.width + translation.width + 250, y: location.height + translation.height + 100)
                      .scaleEffect(finalAmount + curAmount)
                      .gesture(tapDrag)
                //}
            }.navigationBarTitle("Menu - " + hall.name)
                
        }
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
