//
//  ViewController.swift
//  MKTableStatusBackgroundViewExample
//
//  Created by Michael Konapelsky on 7/25/18.
//  Copyright © 2018 Mike Konapelsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKTableStatusBackgroundDelegate {

    @IBOutlet private var tableView: UITableView?
    private var _data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // A tableFooterView must be set to get rid of the visible lines between empty cells when there is no data.
        tableView?.tableFooterView = UIView()
        getData(dataShouldExist: false)
    }
    
    private func getData(dataShouldExist: Bool) {
        
        // Feed the table some data - or not.
        if dataShouldExist {
            _data = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
        }
        
        if _data.count == 0 {
            
            tableView?.delegate = nil
            tableView?.dataSource = nil
            
            tableView?.backgroundView = MKTableStatusBackgroundView(withMessage: "No data is available.",
                                                                    frame: self.view.frame,
                                                                    delegate: self)
        }
        else {
            tableView?.delegate = self
            tableView?.dataSource = self
            
            tableView?.backgroundView = nil
        }
        
        tableView?.reloadData()
    }
    
    func didTapRetry() {
        // This is where you enter your logic to try for new data and reload the UITableView
        getData(dataShouldExist: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        cell?.textLabel?.text = _data[indexPath.row]
        
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

