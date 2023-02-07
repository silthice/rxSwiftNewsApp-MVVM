//
//  ArticleViewModel.swift
//  rxSwiftNewsApp MVVM
//
//  Created by Giap on 07/02/2023.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleViewModel {
    let article: Article
    
    init(article: Article) {
        self.article = article
    }
}


extension ArticleViewModel {
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
}
