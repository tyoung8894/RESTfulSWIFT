//
//  RestApiManager.swift
//  RESTfulExample
//
//  Created by Tyler Young on 11/2/16.
//  Copyright © 2016 Tyler Young. All rights reserved.
//

import Foundation

class RestApiManager {
    
    static let instance = RestApiManager()
    
    let baseURL = "https://api.randomuser.me/"
    
    func getRandomUser(resultsHandler: @escaping ((JSON) -> Void)) {
        makeHTTPGetRequest(path: baseURL, _resultsHandler: resultsHandler)
    }
    
    
    
    //Mark: Perform a GET Request
    private func makeHTTPGetRequest(path: String,
                                    _resultsHandler: @escaping ((JSON) -> Void)) {
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: path)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            //code in here
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let jsonData = data {
                    let json = JSON(data:jsonData)
                    _resultsHandler(json)
                }
            }
            
        })
        task.resume()
        
    }
    
}
