//
//  File.swift
//  PhotoLibrary
//
//  Created by KimSoo Ha on 2017-07-06.
//  Copyright © 2017 KimSoo Ha. All rights reserved.
//

import UIKit


class PhotoDataSource: NSObject, UICollectionViewDataSource {
    
    var photos = [Photo]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "collectionVewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:identifier ,for:indexPath) as! PhotoCollectionViewCell

        
        return cell
    }
    
}
    
    
