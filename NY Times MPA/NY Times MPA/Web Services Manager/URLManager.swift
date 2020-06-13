//
//  URLManager.swift
//  NY Times MPA
//
//  Created by Mohammed Saleh on 6/13/20.
//  Copyright © 2020 me. All rights reserved.
//

import Foundation

enum AppEnvironments {
    case development, production
}

class URLManager {
    
    let apiAccessKey = "Authorization"
    let apiAccessKeyValue = ""
    //http://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=oaxyIvvFl2NGyQE7YrlA8CdbBPnbI7oJ
    private let currentWorkingEnvironment = AppEnvironments.development
    
    private var developmentServerBaseURL:String
    {
        return "http://api.nytimes.com/svc/mostpopular/v2/viewed"
    }
    
    private var ProducationServerBaseURL:String
    {
        return "http://api.nytimes.com/svc/mostpopular/v2/viewed"
    }
    
    private func getCurrentBaseUrl() -> String{
        if currentWorkingEnvironment == .development {
            return developmentServerBaseURL
        }else{
            return ProducationServerBaseURL
        }
    }
    
    
    func getMostPopularURL() -> String {
        return "\(getCurrentBaseUrl())/7.json?api-key=oaxyIvvFl2NGyQE7YrlA8CdbBPnbI7oJ"
    }
}
