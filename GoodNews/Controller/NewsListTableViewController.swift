//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Mahmut Senbek on 14.02.2023.
//

import Foundation
import UIKit

class NewsListTableViewController : UITableViewController {
    
    private var articlesListVM : ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Good News"
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=c7a035d064684aa3aabbe42ceb523562")
        WebService().getArticle(url: url!) { articles in
            if let articles = articles {
                self.articlesListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articlesListVM == nil ? 0 : self.articlesListVM.numberOfSections
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("CellNotFound")
        }
       let articleVM =  self.articlesListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleVM =  self.articlesListVM.articleAtIndex(indexPath.row)
        guard let url = URL(string: articleVM.url ) else { return }
        UIApplication.shared.open(url)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
