//
//  CardController.swift
//  OneDeckOfCards
//
//  Created by ALIA M NEELY on 6/5/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation


class CardController {
    
    static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
    
    //Read
    
    static func draw(completion: @escaping (Card?) -> Void) {
        
        // - Make and send network request
        guard let baseURL = baseURL else { completion(nil); return }
        let parameters = ["count": "1"]

        NetworkController.performRequest(for: baseURL, httpMethod: .get, urlParameters: parameters, body: nil) { (data, error) in
        
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
        
    // - Wait for response as Data
            
            guard let data = data,
    // - Serialize data as json
                
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any],
            
            
            let cardDictionaries = jsonDictionary["cards"] as? [[String:Any]] else {completion(nil); return}
            
    // - Turn those dictionaries into Card objects
            
            let card = cardDictionaries.flatMap({ Card(jsonDictionary: $0) }).first
            
    // - Return the cards.

            completion(card)
            
        
       
        
        
  
        
                                   
    }
        }
        
       
  
       
        
        
        
        
    
    
    
    
    
}
