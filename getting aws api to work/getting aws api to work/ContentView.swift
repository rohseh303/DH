//
//  ContentView.swift
//  api_test
//
//  Created by Rohan Sehgal on 12/19/22.
//

import SwiftUI

enum APIError: Error {
    case invalidStatusCode
    case invalidResponse
}

struct ContentView: View {
    @State private var result: [String: [String]]?

        var body: some View {
            VStack {
                if result != nil {
                    List {
                        ForEach(Array(result!.keys), id: \.self) { key in
                            Text("\(key): \(self.result![key]!.joined(separator: ", "))")
                        }
                    }
                } else {
                    Text("Loading...")
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
            }
        }
        
        func makePostRequest(completion: @escaping (Result<[String: [String]], Error>) -> Void) {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
