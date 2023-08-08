//
//  ViewController.swift
//  NewsAppMVVM
//
//  Created by Hasan PC on 8.08.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var newsTableView: UITableView!
    var newsTableViewModel : NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.estimatedRowHeight = UITableView.automaticDimension
        
        getData()
    }
    
    func getData (){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        
        Webservice().getNews(url: url!) { news in
                if let news = news{
                    self.newsTableViewModel = NewsTableViewModel(newsList: news)
                    DispatchQueue.main.async {
                        self.newsTableView.reloadData()
                    }
                    print("succeded")
                }else{
                    self.showErrorMessage(titleInput: "Error", messageInput: "an error has occured")
                }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsCell",for: indexPath) as! NewsTableViewCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)
        cell.cellHeader.text = newsViewModel.title
        cell.cellParagraph.text = newsViewModel.story
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func showErrorMessage(titleInput : String , messageInput : String){
        var alertDialog = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        var alertAction = UIAlertAction(title: "Error", style: UIAlertAction.Style.default)
        alertDialog.addAction(alertAction)
        self.present(alertDialog, animated: true)
    }
}

