//
//  NewsTableViewModel.swift
//  NewsAppMVVM
//
//  Created by Hasan PC on 8.08.2023.
//

import Foundation


struct NewsTableViewModel{
    let newsList : [News]
    
    func numberOfRowsInSection() -> Int {
        return self.newsList.count
    }
    
    func newsAtIndexPath (_ index : Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news : news)
    }
}

struct NewsViewModel {
    let news : News
    
    var title : String { return news.title }
    
    var story : String { return news.story }
}
