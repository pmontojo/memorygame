//
//  CollectionViewCell.swift
//  finalApp
//
//  Created by Paula Montojo on 4/5/15.
//  Copyright (c) 2015 Paula Montojo. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    var carta = Card()
    
    func actualizaImage() {
        myImage.image = carta.cardImageView.image
    }
}