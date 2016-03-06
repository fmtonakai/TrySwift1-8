//
//  DataSource.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource, SourceType {

    var dataObject: DataType = Hand()

    var conditionForAdding: Bool {
        return dataObject.numberOfItems < 5
    }

    // MARK: - Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.numberOfItems
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? CardCell,
        hand = dataObject as? Hand else {
            fatalError("Could not create CardCell or Hand instance")
        }
        cell.fillWith(hand[indexPath.row])
        return cell
    }

    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            dataObject = dataObject.deleteItemAtIndex(indexPath.row)
            deleteRowAtIndexPath(indexPath, from: tableView)
        }
    }

    // Override to support rearranging the table view.
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        dataObject = dataObject.moveItem(fromIndexPath.row, toIndex: toIndexPath.row)
    }

}
