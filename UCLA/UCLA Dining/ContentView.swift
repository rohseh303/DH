//
//  ContentView.swift
//  UCLA
//
//  Created by Rohan Sehgal on 10/15/22.
//

import SwiftUI
//@frozen struct Color

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors:[Color("TopBackground"),.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        
                        //UCLA Dining Hall text
                        HStack {
                            Text("UCLA Dining Halls")
                                .font(.system(size:28, weight: .medium, design: .default))
                                .foregroundColor(.white)
                                .frame(alignment: .center)
                        }.padding([.top],40)
                        
                        //Dining Hall buttons
                        HStack{
                            VStack{
                                //Epicuria and De Neve Dining icons
                                Spacer()

                                let EpicuriaData = Hall(
                                        name: "Epicuria at Covel",
                                        website: "createwithswift.com",
                                        image: "Epicuria at Covel"
                                )
                                
                                NavigationLink(
                                    destination: Menu(hall: EpicuriaData),
                                    label: {
                                        FoodIcon(hall: EpicuriaData)
                                    })
                                
                                Spacer()
                                    
                                
                                let DeNeveData = Hall(
                                        name: "De Neve",
                                        website: "createwithswift.com",
                                        image: "De Neve Dining"
                                )
                                NavigationLink(
                                    destination: Menu(hall: DeNeveData),
                                    label: {
                                        FoodIcon(hall: DeNeveData)
                                    })
                                    
                                Spacer()
                        
                                //Bruin Plate icon
                                let BruinPlateData = Hall(
                                        name: "Bruin Plate",
                                        website: "createwithswift.com",
                                        image: "Bruin Plate Dining"
                                )
                                NavigationLink(
                                    destination: Menu(hall: BruinPlateData),
                                    label: {
                                        FoodIcon(hall: BruinPlateData)
                                    })
                            }
                        }//.padding([.bottom], 30)
                        
                        //Restaurant Buttons + text
                        HStack{
                            VStack{
                                
                                //Restaurant text
                                HStack {
                                    Text("Quick Service Restaurants")
                                        .font(.system(size:28, weight: .medium, design: .default))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                
                                //restaurant icons
                                VStack{
                                    Spacer()
                                    
                                    HStack{
                                        Spacer()
                                        
                                        NavigationLink(
                                            destination: Text("menu"),
                                            label: {
                                                HStack{
                                                    Image("Epicuria at Ackerman")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 150)
                                                }
                                            })
                                        
                                        Spacer()
                                        
                                        NavigationLink(
                                            destination: Text("menu"),
                                            label: {
                                                HStack{
                                                    Image("the drey")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 150)
                                                }
                                            })
                                        
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                    
                                    HStack{
                                        Spacer()
                                        NavigationLink(
                                            destination: Text("menu"),
                                            label: {
                                                HStack{
                                                    Image("Bruin Bowl")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 150)
                                                }
                                            })
                                        Spacer()
                                        NavigationLink(
                                            destination: Text("menu"),
                                            label: {
                                                HStack{
                                                    Image("Rendezvous")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 150)
                                                }
                                            })
                                        Spacer()
                                    }
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        NavigationLink(
                                            destination: Text("menu"),
                                            label: {
                                                HStack{
                                                    Image("Bruin Cafe")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 150)
                                                }
                                            })
                                        Spacer()
                                        NavigationLink(
                                            destination: Text("menu"),
                                            label: {
                                                HStack{
                                                    Image("Cafe 1919")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 150)
                                                }
                                            })
                                        Spacer()
                                    }
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        NavigationLink(
                                            destination: Text("menu"),
                                            label: {
                                                HStack{
                                                    Image("De Neve Late Night")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 150)
                                                }
                                            })
                                        Spacer()
                                        NavigationLink(
                                            destination: Text("menu"),
                                            label: {
                                                HStack{
                                                    Image("The Study at Hedrick")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 150)
                                                }
                                            })
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding()
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

//when user clicks on image menu links, create new structs for each or pass in functions
//most likely you should be passing in the name/ basic deatils for restaurant and specific link to web scrape from
//struct DisplayView: View {
//    var body: some View {
//        var l: link
        
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
