//
//  MostPopulaArticlesCell.swift
//  NY Times MPA
//
//  Created by Mohammed Saleh on 6/13/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit
import SDWebImage

class MostPopulaArticlesCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var autheres: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func configCell(article:Article){
        updateUI()
        img.sd_setImage(with: URL(string: article.smallThumbnailURL ?? ""))
        title.text = article.title
        autheres.text = article.byline
        date.text = article.published_date
    }
    
    private func updateUI(){
        img.layer.cornerRadius = 30
        img.clipsToBounds = true
    }
    
}
