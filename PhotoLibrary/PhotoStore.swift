

import Foundation
import UIKit

enum PhotosResult {
    case success([Photo])
    case failure(Error)
}

enum ImageResult {
    case success(UIImage)
    case failure(Error)
}

enum PhotoError: Error {
    case imageCreationError
}


class PhotoStore {
    
    private let session: URLSession = {
        let config  = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    private func processPhotosRequest(data:Data?, error:Error?) -> PhotosResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return FlickrAPI.photos(fromJSON: jsonData)
    }
    
    private func processImageRequest(data:Data?, error: Error?) -> ImageResult{
        guard let imageData = data,let image = UIImage(data: imageData) else {
            if data == nil {
                return .failure(error!)
            } else {
                return .failure(PhotoError.imageCreationError)
            }
        }
        return.success(image)
    }
    
    func fetchImage (for photo: Photo, completion: @escaping (ImageResult) -> Void) {
        let photoURL = photo.remoteURL
        let request = URLRequest(url: photoURL)
        let task = session.dataTask(with: request) { (data, reponse, error) in
                // Some code for data and error handling
            
            let result = self.processImageRequest(data: data, error: error)
            completion(result)
            
        }
        task.resume()
    }
    
    func fetchInterestingPhotos(completion: @escaping (PhotosResult)-> Void) {
        let url = FlickrAPI.interestingPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){
            (data, request, error) in
            
            
            // result is [Photo]
            let result = self.processPhotosRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
}
