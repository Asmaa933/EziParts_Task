//
//  HomeViewController.swift
//  EziParts_Task
//
//  Created by Esma on 9/17/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
setupTableView()
        // Do any additional setup after loading the view.
        for familyName in UIFont.familyNames {
                  print("\n-- \(familyName) \n")
                  for fontName in UIFont.fontNames(forFamilyName: familyName) {
                      print(fontName)
                  }
              }
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nibName = UINib(nibName: "HomeCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "HomeCell")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else {return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
