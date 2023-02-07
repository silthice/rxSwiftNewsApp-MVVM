//
//  ArticleListViewModel.swift
//  rxSwiftNewsApp MVVM
//
//  Created by Giap on 07/02/2023.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleListViewModel {
    let articleList: [ArticleViewModel]
    
    init(articleList: [Article]) {
        self.articleList = articleList.compactMap(ArticleViewModel.init)
    }
}

extension ArticleListViewModel {
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.articleList[index]
    }
}
