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
    @State private var result: [String: [String]]?
    
    var body: some View {
        if isActive {
            if result != nil {
                ContentView(APIoutput : result!)
            }
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
                    makePostRequest { result in
                        switch result {
                        case .success(let dictionary):
                            self.result = dictionary
                        case .failure(let error):
                            print(error)
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation{
                            self.isActive=true
                        }
                    }
                }
            }
        }
    }
    
    func makePostRequest(completion: @escaping (Result<[String: [String]], Error>) -> Void) {
        print("calling API...")
        let url = URL(string: "https://i5bka3jah1.execute-api.us-west-1.amazonaws.com/prod")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters = ["key": "value"]
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)

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
                        
                        var result: [String: [String]] = [:]
                        for (key, value) in dictionary {
                            if let array = value as? [String] {
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
