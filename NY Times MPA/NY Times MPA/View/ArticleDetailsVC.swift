//
//  ArticleDetailsVC.swift
//  NY Times MPA
//
//  Created by Mohammed Saleh on 6/13/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleDetailsVC: UIViewController {

    var article:Article!
    
    @IBOutlet weak var abstract: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var copyright: UILabel!
    @IBOutlet weak var caption: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Article Details"
        
        image.sd_setImage(with: URL(string: article.largeThumbnailURL ?? ""))
        
        abstract.text = article.abstract
        abstract.textColor = UIColor(red: 0.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1)
        
        copyright.text = article.copyright
        caption.text = article.caption
        
    }
}
