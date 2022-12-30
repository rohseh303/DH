//
//  ContentView.swift
//  pinch_zoom_test
//
//  Created by Rohan Sehgal on 12/28/22.
//

import SwiftUI

struct ContentView: View {
    @State private var offset: CGSize = .zero
    @State private var finalAmount = 1.0
    @State private var curAmount = 0.0
    @State private var position = CGSize.zero
    

    var body: some View {
        VStack {
            //ScrollView {
                Image("Image")
                    .scaleEffect(finalAmount + curAmount)
                    //.offset(offset)
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
                    .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            self.position = value.translation
                                        }
                                )
            //}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
