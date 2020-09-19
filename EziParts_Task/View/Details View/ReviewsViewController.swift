//
//  ReviewsViewController.swift
//  
//
//  Created by Esma on 9/19/20.
//

import UIKit

class ReviewsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    lazy var viewModel: DetailsViewModel = {
        return DetailsViewModel()
    }()
    
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewCell else {return UITableViewCell()}
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
