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
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        populateNews()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.articleList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("articleTableViewCell is not found")
        }
        
        let articleVM = self.articleListVM.articleAt(indexPath.row)
        articleVM.title.asDriver(onErrorJustReturn: "")
            .drive(cell.titleLabel.rx.text).disposed(by: disposeBag)
        articleVM.description.asDriver(onErrorJustReturn: "")
            .drive(cell.descriptionLabel.rx.text).disposed(by: disposeBag)
        return cell
    }
    
    func populateNews() {
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=8df1353389ed43a6b6ba142136c17d22")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articleResponse in
                let articlesList = articleResponse.articles
                self.articleListVM = ArticleListViewModel(articleList: articlesList)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
    }
}
