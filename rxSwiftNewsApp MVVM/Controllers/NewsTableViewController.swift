//
//  NewsTableViewController.swift
//  rxSwiftNewsApp MVVM
//
//  Created by Giap on 07/02/2023.
//

import Foundation
import UIKit
import RxSwift

class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        populateNews()
    }
    
    func populateNews() {
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=8df1353389ed43a6b6ba142136c17d22")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: {
                print($0)
            }).disposed(by: disposeBag)
    }
}
