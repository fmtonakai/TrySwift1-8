//
//  SourceType.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import UIKit

protocol SourceType: UITableViewDataSource {

    var dataObject: DataType { get set }
    var conditionForAdding: Bool { get }
    func insertTopRowIn(tableView: UITableView)
    func deleteRowAtIndexPath(indexPath: NSIndexPath, from tableView: UITableView)
}

extension SourceType {

    func addItemTo(tableView: UITableView) {
        if conditionForAdding {
            dataObject = dataObject.addNewItemAtIndex(0)
            insertTopRowIn(tableView)
        }
    }

    func insertTopRowIn(tableView: UITableView) {
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
    }

    func deleteRowAtIndexPath(indexPath: NSIndexPath, from tableView: UITableView) {
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }


}