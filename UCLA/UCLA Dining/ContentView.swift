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
        let NoData = "No Data displayed"
        
        NavigationView {
            ZStack {
                //LinearGradient(gradient: Gradient(colors:[Color("TopBackground"),Color("BottomBackground")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    //.edgesIgnoringSafeArea(.all)
                Color.white
                    .ignoresSafeArea(.all)
                //v stack with your ucla dining hall text
                VStack {
                    //UCLA Dining Hall text / NAVBAR
                    HStack {
                        Image("UCLA designer text")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                        Text("Dining")
                            .font(.system(size: 32))
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("NavBar color"))
                    .edgesIgnoringSafeArea(.horizontal)

                    
                    ScrollView {
                        
                        ZStack {
                            
                            VStack {
                                //Dining Hall buttons
                                VStack{
                                    
                                    let EpicuriaData = Hall(
                                        name: "Epicuria at Covel",
                                        dishes: APIoutput["Epicuria"] ?? [NoData],
                                        image: "Epicuria at Covel"
                                    )
                                    
                                    let DeNeveData = Hall(
                                        name: "De Neve",
                                        dishes: APIoutput["DeNeve"] ?? [NoData],
                                        image: "De Neve Dining"
                                    )
                                    
                                    let BruinPlateData = Hall(
                                        name: "Bruin Plate",
                                        //change back to BruinPlate after testing
                                        dishes: APIoutput["BruinPlate"] ?? [NoData],
                                        image: "Bruin Plate Dining"
                                    )
                                    
                                    //Spacer()
                                    //Epicuria Icon
                                    NavigationLink(
                                        destination: Menu(hall: EpicuriaData),
                                        label: {
                                            FoodIcon(hall: EpicuriaData)
                                        })
                                    
                                    //De Neve Icon
                                    NavigationLink(
                                        destination: Menu(hall: DeNeveData),
                                        label: {
                                            FoodIcon(hall: DeNeveData)
                                        })
                                    
                                    //Bruin Plate icon
                                    NavigationLink(
                                        destination: Menu(hall: BruinPlateData),
                                        label: {
                                            FoodIcon(hall: BruinPlateData)
                                        })
                                    //Spacer()
                                }
                                
                                //Restaurant text
                                HStack {
                                    Text("Quick Service Restaurants")
                                        .font(.system(size:28, weight: .medium, design: .default))
                                        .foregroundColor(.black)
                                }
                                
                                //Restaurant Buttons
                                VStack{
                                    
                                    let EpicuriaAckermanData = Hall(
                                        name: "Epicuria at Ackerman",
                                        dishes: APIoutput["EpicAtAckerman"] ?? [NoData],
                                        image: "Epicuria at Ackerman"
                                    )
                                    
                                    NavigationLink(
                                        destination: Menu(hall: EpicuriaAckermanData),
                                        label: {
                                            FoodIcon(hall: EpicuriaAckermanData)
                                        })
                                    
                                    let DreyData = Hall(
                                        name: "The Drey",
                                        dishes: APIoutput["Drey"] ?? [NoData],
                                        image: "the drey"
                                    )
                                    
                                    NavigationLink(
                                        destination: Menu(hall: DreyData),
                                        label: {
                                            FoodIcon(hall: DreyData)
                                        })
                                    
                                    let RendezvousData = Hall(
                                        name: "Rendezvous",
                                        dishes: APIoutput["Rendezvous"] ?? [NoData],
                                        image: "Rendezvous"
                                    )
                                    
                                    NavigationLink(
                                        destination: Menu(hall: RendezvousData),
                                        label: {
                                            FoodIcon(hall: RendezvousData)
                                        })
                                    
                                    let BruinCafeData = Hall(
                                        name: "Bruin Cafe",
                                        dishes: APIoutput["BruinCafe"] ?? [NoData],
                                        image: "Bruin Cafe"
                                    )
                                    
                                    NavigationLink(
                                        destination: Menu(hall: BruinCafeData),
                                        label: {
                                            FoodIcon(hall: BruinCafeData)
                                        })
                                    
                                    let Cafe1919Data = Hall(
                                        name: "Cafe 1919",
                                        dishes: APIoutput["Cafe 1919"] ?? [NoData],
                                        image: "Cafe 1919"
                                    )
                                    
                                    NavigationLink(
                                        destination: Menu(hall: Cafe1919Data),
                                        label: {
                                            FoodIcon(hall: Cafe1919Data)
                                        })
                                    
                                    let DeNeveLateNightData = Hall(
                                        name: "De Neve Late Night",
                                        dishes: APIoutput["DeNeveLateNight"] ?? [NoData],
                                        image: "De Neve Late Night"
                                    )
                                    
                                    NavigationLink(
                                        destination: Menu(hall: DeNeveLateNightData),
                                        label: {
                                            FoodIcon(hall: DeNeveLateNightData)
                                        })
                                    
                                    let TheStudyatHedrickData = Hall(
                                        name: "The Study at Hedrick",
                                        dishes: APIoutput["HedrickStudy"] ?? [NoData],
                                        image: "The Study at Hedrick"
                                    )
                                    
                                    NavigationLink(
                                        destination: Menu(hall: TheStudyatHedrickData),
                                        label: {
                                            FoodIcon(hall: TheStudyatHedrickData)
                                        })
                                    
                                    //what is feast at rieber?
                                }
                            }
                            .padding()
                        }
                    }.edgesIgnoringSafeArea(.all)
                }
            }
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
