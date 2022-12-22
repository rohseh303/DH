//
//  ContentView.swift
//  UCLA
//
//  Created by Rohan Sehgal on 10/15/22.
//

import SwiftUI

struct ContentView: View {
    //passed API output and storing in var
    var APIoutput : [String: [String]]
    
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
                                        dishes: APIoutput["Epicuria"] ?? ["something's wrong"],
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
                                        dishes: APIoutput["DeNeve"] ?? ["something's wrong"],
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
                                        //change back to BruinPlate after testing
                                        dishes: APIoutput["BruinCafe"] ?? ["something's wrong"],
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

struct ContentView_Previews: PreviewProvider {
    static let APIpreview = ["this" : ["is", "a", "preview"]]
    
    static var previews: some View {
        // 5. Use the right SecondView initializator
        ContentView(APIoutput: APIpreview)
    }
}
