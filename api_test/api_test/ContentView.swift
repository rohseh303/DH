//
//  ContentView.swift
//  api_test
//
//  Created by Rohan Sehgal on 12/19/22.
//

import SwiftUI

//this copies api data and translates it into a struct for us
struct Response: Codable {
    var results: [Result]
}

//further breaking each result down into datapoints
struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct ContentView: View {
    //async variable, states that it will take time to load
    @State private var results = [Result]()

    var body: some View {
        //don't know how the hell this formatting work, def need to understand
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        //let url = "https://i5bka3jah1.execute-api.us-west-1.amazonaws.com/prod"
        }
        
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string:
                "https://itunes.apple.com/search?term=taylor+swift&entity=song") else
            {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from:
                data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
