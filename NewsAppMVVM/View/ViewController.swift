//
//  ViewController.swift
//  NewsAppMVVM
//
//  Created by Hasan PC on 8.08.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var newsTableView: UITableView!
    var news = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        
        Webservice().getNews(url: url!) { news in
            if let news = news{
                self.news.removeAll(keepingCapacity: false)
                for new in news{
                    self.news.append(News(title: new.title , story: new.story))
                }

                print("succeded")
            }else{
                self.showErrorMessage(titleInput: "Error", messageInput: "an error has occured")
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsCell",for: indexPath) as! NewsTableViewCell
        cell.cellHeader.text = news[indexPath.row].title
        cell.cellParagraph.text = news[indexPath.row].story
        self.newsTableView.reloadData()
        return cell
    }
    
    func showErrorMessage(titleInput : String , messageInput : String){
        var alertDialog = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        var alertAction = UIAlertAction(title: "Error", style: UIAlertAction.Style.default)
        alertDialog.addAction(alertAction)
        self.present(alertDialog, animated: true)
    }
}

