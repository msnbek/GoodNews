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
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Good News"
    }
    
}
