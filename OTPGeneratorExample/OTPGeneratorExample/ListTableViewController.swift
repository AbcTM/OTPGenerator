//
//  ListTableViewController.swift
//  OTPGeneratorExample
//
//  Created by tm on 2018/9/24.
//  Copyright © 2018年 tm. All rights reserved.
//

import UIKit

/// main
class ListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TokenViewController {
            let destinationVC = segue.destination as! TokenViewController
            guard let indexPath = self.tableView.indexPathForSelectedRow, let generatorType = OTPGeneratorType(rawValue: indexPath.row) else { return }
            self.navigationItem.title = ""
            destinationVC.generatorType = generatorType
        }
    }
}

// MARK: - Table view data source
extension ListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath as IndexPath)
        
        if let gType = OTPGeneratorType(rawValue: indexPath.row) {
            cell.textLabel?.text = gType.title
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
