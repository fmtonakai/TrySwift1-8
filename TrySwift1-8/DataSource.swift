//
//  DataSource.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {

    private var hand = Hand()
    func addItemTo(tableView: UITableView) {
        if hand.numberOfCards < 5 {
            hand = hand.addNewCardAtIndex(0)
            insertTopRowIn(tableView)
        }
    }

    private func insertTopRowIn(tableView: UITableView) {
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
    }

    // MARK: - Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hand.numberOfCards
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? CardCell else {
            fatalError("Could not create CardCell")
        }
        cell.fillWith(hand[indexPath.row])
        return cell
    }

    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            hand = hand.deleteCardAtIndex(indexPath.row)
            deleteRowAtIndexPath(indexPath, from: tableView)
        }
    }

    private func deleteRowAtIndexPath(indexPath: NSIndexPath, from tableView: UITableView) {
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }

    // Override to support rearranging the table view.
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        hand = hand.moveCard(fromIndexPath.row, toIndex: toIndexPath.row)
    }

}
