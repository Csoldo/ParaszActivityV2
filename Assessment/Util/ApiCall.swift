//
//  ApiCall.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 21..
//

import Foundation

class ApiCall {
    func getHousesFromApi(completion: @escaping ([House]) -> ()) {
        guard let url = URL(string: "https://intern.development.d-tt.dev/api/house") else { return }

        let config = URLSessionConfiguration.default

        config.httpAdditionalHeaders = [
            "Access-Key": "98bww4ezuzfePCYFxJEWyszbUXc7dxRx"
        ]
        
        let urlSession = URLSession(configuration: config)
        
        urlSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            if let data = data {
                print(data.count)
                if let houses = try? JSONDecoder().decode([House].self, from: data) {
                    print(houses)
                    DispatchQueue.main.async {
                        completion(houses)
                    }
                    
                }else {
                   print("Could not decode data.")
                }
            } else {
                print("Could not load data.")
            }
        }
        .resume()
    }
}
