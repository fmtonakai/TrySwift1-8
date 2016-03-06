//
//  HandVC.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import UIKit

class HandVC: UITableViewController {

    private var dataSource = DataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        navigationItem.leftBarButtonItem = editButtonItem()
    }

    @IBAction private func addNewCard(sender: UIBarButtonItem) {
        dataSource.addItemTo(tableView)
    }

}
