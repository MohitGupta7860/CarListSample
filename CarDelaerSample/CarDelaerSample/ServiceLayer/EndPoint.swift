//
//  EndPoint.swift
//  CarDelaerSample
//
//  Created by Mohit on 29/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import Foundation

struct Enpoint {
    let endPoint = "https://carfax-for-consumers.firebaseio.com"
    func getDealerDetailsEndPoint() -> URL {
        guard let url = URL(string: endPoint + "/assignment.json") else { return  NSURL() as URL }
        return url
    }
}
