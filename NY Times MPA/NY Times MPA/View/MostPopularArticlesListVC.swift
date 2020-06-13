//
//  ViewController.swift
//  NY Times MPA
//
//  Created by Mohammed Saleh on 6/13/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit

class MostPopularArticlesListVC: ParentViewController {

    @IBOutlet weak var mostPopularArticlesTV: UITableView!
    
    let mostPopularArticlesPresenter = MostPopularArticlesPresenter()
    var mostPopularArticles = [Article]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "NY Most Popular Articles"
        
        mostPopularArticlesTV.delegate = self
        mostPopularArticlesTV.dataSource = self
        
        getMostPopularArticles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        mostPopularArticlesTV.rowHeight = 170
        mostPopularArticlesTV.register(UINib(nibName: "MostPopulaArticlesCell", bundle: nil), forCellReuseIdentifier: "MostPopulaArticlesCell")
    }

    
    func getMostPopularArticles(){
            if isNetworkReachable {
                self.showLoader()
                mostPopularArticlesPresenter.mostPopularArticles(onSuccess: { (articles) in
                    self.mostPopularArticles = articles
                    self.mostPopularArticlesTV.reloadData()
                    self.hideLoader()
                }) { (errorMessage) in
                    self.hideLoader()
                    self.showAlert(title: "", message: errorMessage ?? "Error", shouldpop: false)
                }
            }else{
                self.showAlert(title: "", message: "No, Internet connection", shouldpop: false)
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toArticleDetails" {
            let index = sender as! Int
            let dest = segue.destination as! ArticleDetailsVC
            dest.article = mostPopularArticles[index]
        }
    }

}

extension MostPopularArticlesListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mostPopularArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MostPopulaArticlesCell", for: indexPath) as! MostPopulaArticlesCell
        cell.configCell(article: mostPopularArticles[indexPath.row])
        return cell
    }
}

extension MostPopularArticlesListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toArticleDetails", sender: indexPath.row)
    }
}

