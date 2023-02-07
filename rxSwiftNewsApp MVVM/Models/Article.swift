//
//  Article.swift
//  rxSwiftNewsApp MVVM
//
//  Created by Giap on 07/02/2023.
//

import Foundation

struct ArticleResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String?
}
