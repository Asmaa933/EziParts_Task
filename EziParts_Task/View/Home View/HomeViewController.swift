//
//  HomeViewController.swift
//  EziParts_Task
//
//  Created by Esma on 9/17/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: ShadowedView!
    @IBOutlet private weak var noInternetImg: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
   // @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var resultCount: UILabel!
    
    private  var activityInd = UIActivityIndicatorView ()
    lazy var viewModel: HomeViewModel = {
        return HomeViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initVM()
    }
    
    private func setupView() {
        setupTableView()
        resultCount.isHidden = true
        noInternetImg.isHidden = true
        searchView.layer.cornerRadius = 10
        searchTextField.addTarget(self, action: #selector(searchInSuppliers), for: .editingChanged)
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(HomeViewController.gestureRecognizer))
        downSwipe.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(downSwipe)
    }
    @objc private func searchInSuppliers(){
        if searchTextField.text?.isEmpty ?? false{
                   viewModel.isFiltered = false
               }else{
                    viewModel.searchInArray(searchTxt: searchTextField.text?.trimmingCharacters(in: .whitespaces) ?? "")
               }
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        let nibName = UINib(nibName: "HomeCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "HomeCell")
    }
    
    private func initVM(){
        
        viewModel.updateUIClosure = { [weak self] () in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.tableView.isHidden = false
                self.tableView.reloadData()
                self.resultCount.isHidden = false
                self.resultCount.text = "\(self.viewModel.getSuppliersArrCount() ?? 0) results"
            }
        }
        
        viewModel.showAlertClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    if message == "Check Internet Connection"{
                        self?.noInternetImg.isHidden = false
                    }else{ self?.noInternetImg.isHidden = true
                        self?.present(showAlert(message), animated: true, completion: nil)
                    }
                }
            }
        }
        
        viewModel.updateLoadingStatus = { [weak self] () in
            guard let self = self else {
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                switch self.viewModel.state {
                case .empty, .error:
                    removeActivityIndicator(activityIndicator: self.activityInd)
                    self.tableView.alpha = 0.0
                    
                case .loading:
                    self.activityInd  = showActivityIndicator(view: self.view)
                    self.tableView.alpha = 0.0
                    
                case .populated:
                    removeActivityIndicator(activityIndicator: self.activityInd)
                    self.tableView.alpha = 1.0
                }
            }
        }
        viewModel.getSuppliers()
    }
    
    @objc private func gestureRecognizer(){
        viewModel.getSuppliers()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.getSuppliersArrCount() ?? 0
        if count == 0{
            tableView.setEmptyView(title: "", message: "No Suppliers Found", messageImage: #imageLiteral(resourceName: "not_found"))
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
        let detail = DetailsViewController()
        tableView.deselectRow(at: indexPath, animated: false)
        detail.modalPresentationStyle = .fullScreen
        let supplier = viewModel.getSupplierData(indexPath: indexPath)
        detail.supplierSlug = supplier?.slug
        self.present(detail, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

//extension HomeViewController: UISearchBarDelegate{
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        viewModel.isFiltered = false
//    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        viewModel.searchInArray(searchTxt: searchBar.text?.trimmingCharacters(in: .whitespaces) ?? "")
//        
//    }
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        tableView.reloadData()
//    }
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        tableView.resignFirstResponder()
//        
//    }
//}
