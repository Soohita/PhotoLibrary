//
//  Photo.swift
//  PhotoLibrary
//
//  Created by KimSoo Ha on 2017-07-04.
//  Copyright © 2017 KimSoo Ha. All rights reserved.
//

import Foundation


class Photo {
    
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
    }
    
}

extension Photo:Equatable {

    public static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.photoID == rhs.photoID
    }

}
