//
//  MostPopularArticlesPresenter.swift
//  NY Times MPA
//
//  Created by Mohammed Saleh on 6/13/20.
//  Copyright © 2020 me. All rights reserved.
//

import Foundation
import SwiftyJSON

class MostPopularArticlesPresenter:NSObject {
    
    func mostPopularArticles(onSuccess: @escaping ([Article]) -> Void, onFailure: @escaping (String?) -> Void ) -> Void
    {
        let url = URLManager().getMostPopularURL()
        
        ServiceManager.callAPI(url: url, method: .get, parameters: nil, custumHeaders: nil) { (error, response) in
            if response != nil
            {
                let status = response!["status"].stringValue
                if status == "OK" {
                    var popularArticles = [Article]()
                    print(response!["results"])
                    let results = response!["results"].arrayValue
                    
                    for result in results {
                        popularArticles.append(Article(parametersJson: result.dictionaryValue))
                    }
                    
                    onSuccess(popularArticles)
                }else{
                    let errorMessage = response!["fault"]["faultstring"].stringValue
                    onFailure(errorMessage)
                }
            }
            else
            {
                onFailure("حدث خطأ الرجاء المحاولة مرة اخرى")
            }
        }
    }
}
