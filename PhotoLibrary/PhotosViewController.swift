//
//  PhotosViewController.swift
//  PhotoLibrary
//
//  Created by KimSoo Ha on 2017-07-04.
//  Copyright © 2017 KimSoo Ha. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    
    @IBOutlet var imageView:UIImageView!
    var store: PhotoStore!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        store.fetchInterestingPhotos{ (photosResult) in
            // When the task is done we will get the photosResult of [Photo]
            // async task
            
            switch photosResult {
                case let .success(photos):
                    print("Got \(photos.count) photos ")
                    if let firstPhoto = photos.first{
                        self.updateImageView(for: firstPhoto)
                }
                case let .failure(error):
                    print("No photos: \(error)")
            }
        }
    }

    
    func updateImageView(for photo: Photo){
        store.fetchImage(for: photo) { (imageResult) in
            switch imageResult {
            case let .success(image):
                DispatchQueue.main.async {
                self.imageView.image = image
                }
            case let .failure(error):
                print("Error downLoading image: \(error)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
