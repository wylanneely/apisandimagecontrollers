//
//  ImageController.swift
//  OneDeckOfCards
//
//  Created by ALIA M NEELY on 6/5/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    
    static func image(forURL url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else { fatalError("Image URL optional is nil") }
        NetworkController.performRequest(for: url, httpMethod: .get) { (data, error) in
            guard let data = data,
                let image = UIImage(data: data) else {
                    DispatchQueue.main.async {
                        completion(nil) }
                    return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    
}
