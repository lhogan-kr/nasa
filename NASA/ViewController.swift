//
//  ItemListViewController.swift
//  NASA
//
//  Created by Lane Hogan on 3/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    
    var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the dummy data
        for i in 0...100 {
            data.append("Cell \(i)")
        }
        
        // Set up the view
        title = "NASA Data"
        view.addSubview(tableView)
        
        // Set up the table view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        tableView.rowHeight = 50
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Tapped cell \(indexPath.row)")
    }
}
