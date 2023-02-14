//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Mahmut Senbek on 14.02.2023.
//

import Foundation
import UIKit

class NewsListTableViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Good News"
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=c7a035d064684aa3aabbe42ceb523562")
        WebService().getArticle(url: url!) { _ in
            print("yes")
        }
    }
}
