//
//  ViewController.swift
//  AlmofireinUse
//
//  Created by ANKIT SHARMA on 03/05/17.
//  Copyright © 2017 ANKIT SHARMA. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=08e64df2d3f3bc0822de1f0fc22fcb2d").responseJSON(completionHandler: { response in
            print(response.request!)   // URL request
            print(response.response!)  // HTTP URL response
            print(response.data!)      // server data
            print(response.result)     // Result of response serialization
            
            if let jsonResult = response.result.value
            {
                print("\(jsonResult)")
            }
            
           })
 
        

        
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=08e64df2d3f3bc0822de1f0fc22fcb2d")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                case .failure(let error):
                    print(error)
                }
        }
        

        
        
        
    }
}

