//
//  DataSource.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource, SourceType {

    var dataObject: DataType

    var conditionForAdding: Bool {
        return false
    }

    init<A: DataType>(dataObject: A) {
        self.dataObject = dataObject
    }

    // MARK: - Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.numberOfItems
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        fatalError("This method must be overriden")
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            dataObject = dataObject.deleteItemAtIndex(indexPath.row)
            deleteRowAtIndexPath(indexPath, from: tableView)
        }
    }

    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        dataObject = dataObject.moveItem(fromIndexPath.row, toIndex: toIndexPath.row)
    }

}
