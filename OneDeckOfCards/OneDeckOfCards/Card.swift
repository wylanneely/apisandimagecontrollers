//
//  Card.swift
//  OneDeckOfCards
//
//  Created by ALIA M NEELY on 6/5/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation

class Card{
    
        //MARK: - Keys
    
    private let suitKey = "suit"
    private let valueKey = "value"
    private let imageEndpointKey = "image"
    
        //MARK: - Properties
    
    let suit: String
    let value: String
    let imageEndPoint: String
    
        //MARK: - JsonInit
    
    init?(jsonDictionary: [String:Any]){
        
        guard let suit = jsonDictionary[suitKey] as? String,
           let value = jsonDictionary[valueKey] as? String,
            let imageEndPoint = jsonDictionary[imageEndpointKey] as? String
            else {return nil}
        
        self.suit = suit
        self.value = value
        self.imageEndPoint = imageEndPoint
        
        
    }
}
