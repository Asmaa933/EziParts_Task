//
//  ReviewsViewController.swift
//  
//
//  Created by Esma on 9/19/20.
//

import UIKit

class ReviewsViewController: UIViewController {
    
    
    @IBOutlet private weak var tableView: UITableView!
    var reviews:[Review]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nibName = UINib(nibName: "ReviewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "ReviewCell")
    }
    
}
extension ReviewsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = reviews?.count ?? 0
        if count == 0{
            tableView.setEmptyView(title: "", message: "No Reviews Found", messageImage: #imageLiteral(resourceName: "not_found"))
        }else{
            tableView.restore()
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewCell else {return UITableViewCell()}
        cell.review = reviews?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
