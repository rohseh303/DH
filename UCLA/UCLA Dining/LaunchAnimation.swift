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
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.isActive = true
                }
            }
        }
    }
}

//VStack {
//    ZStack {
//        //Content
//        ZStack {
            //ContentView()
//        }
//
        //Splash
//        ZStack {
//            Color(.black)
//               .opacity(1)
//            Image("LaunchScreenImage")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 100, height: 100)
//                .scaleEffect(animate ? 30 : 1)
//                .animation(Animation.easeIn(duration: 1), value: animate)
//
//        }
//        .ignoresSafeArea(.all)
//        //.animation(.default, value: offset)
//        .opacity(animate ? 1 : 0)
//    }
//}
//.onAppear {
//    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
//        animate.toggle()
//    }
//}

//{
//VStack {
//    ZStack {
//        //Content
//        ZStack {
//            ContentView()
//        }
//
//        //Splash
//        ZStack {
//            Color(.black)
//                .opacity(1)
//            Image("LaunchScreenImage")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 100, height: 100)
//                .scaleEffect(animate ? 30 : 1)
//                .animation(Animation.easeIn(duration: 2),
//                           value: animate)
//        }
//        .ignoresSafeArea(.all)
//    }
//}
//.onAppear {
//    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//        animate.toggle()
//    }
//}
//}

struct LaunchAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LaunchAnimation()
    }
}
