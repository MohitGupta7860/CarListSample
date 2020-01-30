//
//  NetworkManager.swift
//  CarDelaerSample
//
//  Created by Mohit on 29/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import Foundation

protocol NetworkSession {
    func getApiCall(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    
    func getApiCall(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with:url) { (data, response, error) in
            completion(data, response, error)
        }
        task.resume()
    }
}
