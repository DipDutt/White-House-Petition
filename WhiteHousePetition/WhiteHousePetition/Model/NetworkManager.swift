//
//  NetworkManager.swift
//  WhiteHousePetition
//
//  Created by Dip on 14/7/25.
//

import Foundation
import UIKit

 // MARK: - Create downloadData method
func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
    
    URLSession.shared.dataTask(with: url) { (data,response,error,) in
        guard
            let data = data,
            error == nil,
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 400 else {
            print("Error downloading data.")
            //completionHandler(nil)
            return
        }
       completionHandler(data)
        
    }
    .resume()
}



