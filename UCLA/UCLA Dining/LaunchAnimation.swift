//
//  LaunchAnimation.swift
//  UCLA Dining
//
//  Created by Rohan Sehgal on 10/24/22.
//

import SwiftUI

enum APIError: Error {
    case invalidStatusCode
    case invalidResponse
}

struct LaunchAnimation: View {
    @State var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    //for storing API call output
    @State private var result: [String: [String : [String]]]?
    
    //for retrieving school name
    @State private var selected: String?
    
    var body: some View {
        // before you go into this if else, check if a private var (which you need to create) that store the UserDefault school entry value is filled or not
        //if that statement is false go into another view (going to be created by Austin, that will set that the variable to someting)
        
        //and then proceed (the else branch) to here
        
        //might have to implement and fix the current navigation stack for this to work because i don't know how to pop out of the view once the variable is selected and how to save it to the var
        //could use a function to check if the private var is nil and get it
        
        //once you build that successfully, you've the var filled and what it should be is what is needed to fill the end of the link
        //so in the school selector view, there should be some dictionary so we can map the name of the university to the url var needed to add on to the aws api
        NavigationStack {
            if selected == nil {
                SchoolSelector(selected: $selected)
            }
            else {
                if result != nil && isActive {
                    ContentView(APIoutput : result!)
                }
                else {
                    ZStack {
                        Color(.black)
                            .ignoresSafeArea(.all)
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
                                withAnimation{
                                    self.isActive=true
                                }
                            }
                            
                            makePostRequest { result in
                                switch result {
                                case .success(let dictionary):
                                    self.result = dictionary
                                case .failure(let error):
                                    print(error)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func makePostRequest(completion: @escaping (Result<[String: [String : [String]]], Error>) -> Void) {
        print("calling API..." + selected!)
        let complete_api = "https://49jmxvbvc9.execute-api.us-west-1.amazonaws.com/v2/" + selected!
        let url = URL(string: complete_api)!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        //let parameters = ["key": "value"]
        //request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                        guard let dictionary = jsonObject as? [String: Any] else {
                            completion(.failure(APIError.invalidResponse))
                            return
                        }
                        
                        var result: [String: [String : [String]]] = [:]
                        for (key, value) in dictionary {
                            //alter code here to make output for dict of dicts
                            if let array = value as? [String : [String]] {
                                result[key] = array
                            } else {
                                completion(.failure(APIError.invalidResponse))
                                return
                            }
                        }

                        completion(.success(result))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(APIError.invalidStatusCode))
                }
            }
        }
        task.resume()
    }

}

struct LaunchAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LaunchAnimation()
    }
}
