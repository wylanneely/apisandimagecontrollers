//
//  RandomCardViewController.swift
//  OneDeckOfCards
//
//  Created by ALIA M NEELY on 6/5/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class RandomCardViewController: UIViewController {

    
    @IBAction func drawButtonTapped(_ sender: Any) {
        
        CardController.draw { (card) in
            guard let card = card else {return}
            
            ImageController.image(forURL: card.imageEndPoint, completion: { (image) in
                guard let image = image else { return }
                
                self.imageView.image = image
            })
        }
        
    }
    
    @IBOutlet weak var imageView: UIImageView!

}
