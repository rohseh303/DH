//
//  LaunchAnimation.swift
//  UCLA Dining
//
//  Created by Rohan Sehgal on 10/24/22.
//

import SwiftUI

struct LaunchAnimation: View {
    @State var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        }
        else {
            ZStack {
                Color(.black)
                    .ignoresSafeArea(.all)
                //LinearGradient(gradient: Gradient(colors:[Color("TopBackground"),.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                //    .edgesIgnoringSafeArea(.all)
                VStack{
                    VStack{
                        Image("LaunchScreenImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation{
                            self.isActive=true
                        }
                    }
                }
            }
        }
    }
}

struct LaunchAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LaunchAnimation()
    }
}
