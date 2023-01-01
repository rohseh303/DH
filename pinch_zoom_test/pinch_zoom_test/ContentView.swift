//
//  ContentView.swift
//  pinch_zoom_test
//
//  Created by Rohan Sehgal on 12/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
     
     CircleView()
     
    }
}

struct CircleView: View {

@State private var location: CGSize = CGSize()
@GestureState private var translation: CGSize = CGSize()
    @State private var offset: CGSize = .zero
    @State private var finalAmount = 1.0
    @State private var curAmount = 0.0

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
     
     Image("Image")
       //.fill()
       .frame(width: 100, height: 100, alignment: .center)
       .position(x: location.width + translation.width + 100, y: location.height + translation.height + 100)
       .scaleEffect(finalAmount + curAmount)
       .gesture(tapDrag)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
