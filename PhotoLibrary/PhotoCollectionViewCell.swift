//
//  CollectionViewCell.swift
//  PhotoLibrary
//
//  Created by KimSoo Ha on 2017-07-06.
//  Copyright © 2017 KimSoo Ha. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var photoViewImage: UIImageView!
    @IBOutlet var spinner:UIActivityIndicatorView!
    
    
    
    override func awakeFromNib() {
        // When the cell is first created.
        super.awakeFromNib()
        update(with: nil)
    }
    
    override func prepareForReuse() {
        // When the cell is getting reused.
        super.prepareForReuse()
        update(with: nil)
    }
    
    func update(with image:UIImage?){
        if let imageToDisplay = image {
            spinner.stopAnimating()
            photoViewImage.image = imageToDisplay
        } else {
            spinner.startAnimating()
            photoViewImage.image = nil
        }
        
    }
    
    
    
    
    
}
