//
//  HomeViewController.swift
//  EziParts_Task
//
//  Created by Esma on 9/17/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var resultCount: UILabel!
    
    private  var activityInd = UIActivityIndicatorView ()
    private var viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.getSuppliers()
        setupObservers()
    }
    func setupView() {
        setupTableView()
        resultCount.isHidden = true
        activityInd = showActivityIndicator(view: view)
        
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        let nibName = UINib(nibName: "HomeCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "HomeCell")
    }
    
    func setupObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name(rawValue: "suppliers"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name(rawValue: "error"), object: nil)
    }
    
    @objc func errorRecieved(_ notification: Notification){
        if let errorText = notification.userInfo?["error"] as? String {
            print(errorText)
        }
    }
    
    @objc func reloadTableView(){
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            removeActivityIndicator(activityIndicator: self.activityInd)
            self.tableView.reloadData()
            self.tableView.isHidden = false
            self.resultCount.isHidden = false
            self.resultCount.text = "\(self.viewModel.getSuppliersArrCount() ?? 0) results"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.getSuppliersArrCount() ?? 0
        if count == 0{
            tableView.setEmptyView(title: "", message: "No Suppliers Found", messageImage: #imageLiteral(resourceName: "close"))
        }else{
            tableView.restore()
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else {return UITableViewCell()}
        let suppliers = viewModel.getSupplierData(indexPath: indexPath)
        cell.configureCell(suppliers: suppliers)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
}
