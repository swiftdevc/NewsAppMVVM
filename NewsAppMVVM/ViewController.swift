//
//  ViewController.swift
//  NewsAppMVVM
//
//  Created by Hasan PC on 8.08.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsCell",for: indexPath) as! NewsTableViewCell
        cell.cellHeader.text = "selam"
        cell.cellParagraph.text = "hayatta her şey kısmet"
        return cell
    }
}

