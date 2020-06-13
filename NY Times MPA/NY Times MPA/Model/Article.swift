//
//  Article.swift
//  NY Times MPA
//
//  Created by Mohammed Saleh on 6/13/20.
//  Copyright © 2020 me. All rights reserved.
//

import Foundation
import SwiftyJSON

class Article:NSObject {
    var title:String?
    var byline:String?
    var abstract:String?
    var published_date:String?
    var smallThumbnailURL:String?
    var largeThumbnailURL:String?
    var caption:String?
    var copyright:String?
    
    init(parametersJson:[String:JSON]) {
        if let title = parametersJson["title"]?.stringValue {
            self.title = title
        }
        
        if let byline = parametersJson["byline"]?.stringValue {
            self.byline = byline
        }
        
        if let abstract = parametersJson["abstract"]?.stringValue {
            self.abstract = abstract
        }
        
        if let published_date = parametersJson["published_date"]?.stringValue {
            self.published_date = published_date
        }
        
        if let AllMedia = parametersJson["media"]?.arrayValue {
            for media in AllMedia {
                if let mediaType = media["type"].string, mediaType == "image" {
                    caption = media["caption"].stringValue
                    copyright = media["copyright"].stringValue
                    let mediaMetadata = media["media-metadata"].arrayValue
                    for metadata in mediaMetadata {
                        if let format = metadata["format"].string, format == "Standard Thumbnail" {
                            smallThumbnailURL = metadata["url"].stringValue
                        }
                        
                        if let format = metadata["format"].string, format == "mediumThreeByTwo440" {
                            largeThumbnailURL = metadata["url"].stringValue
                        }
                    }
                }
            }
        }
    }
    
    
}
