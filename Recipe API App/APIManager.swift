//
//  APIManager.swift
//  Recipe API App
//
//  Created by Fadhli Firdaus on 26/04/2024.
//

import Foundation

struct APIManager{
    
    static func fetchDataFromAPI(completion: @escaping (MainResponse?, Error?) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "9f795507a5msh02c32d3138b1687p1086b1jsn74411d669c34",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=10")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(nil, error)
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    if let data = data {
                        do {
                            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                            let prettyPrintedData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
                            if let prettyPrintedString = String(data: prettyPrintedData, encoding: .utf8) {
                                print("Pretty printed JSON data:")
                                print(prettyPrintedString)
                            }
                            let mainResponse = try MainResponse(data: data)
                            completion(mainResponse, nil)
                        } catch {
                            completion(nil, error)
                        }
                    } else {
                        let error = NSError(domain: "Data is nil", code: 0, userInfo: nil)
                        completion(nil, error)
                    }
                }
            }

        })
        dataTask.resume()
    }

}
