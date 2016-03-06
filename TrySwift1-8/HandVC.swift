//
//  HandVC.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import UIKit

class HandVC: UITableViewController {

    private let hand = Hand()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem()
    }

    @IBAction private func addNewCard(sender: UIBarButtonItem) {
        if hand.numberOfCards < 5 {
            hand.addNewCardAtIndex(0)
            insertTopRow()
        }
    }

    private func insertTopRow() {
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hand.numberOfCards
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let card = hand.cardAtPosition(indexPath.row)
        cell.textLabel?.text = card.rank.description
        cell.textLabel?.textColor = card.color
        cell.detailTextLabel?.text = card.suit.description
        return cell
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            hand.deleteCardAtIndex(indexPath.row)
            deleteRowAtIndexPath(indexPath)
        }
    }

    private func deleteRowAtIndexPath(indexPath: NSIndexPath) {
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        hand = hand.moveCard(fromIndexPath.row, toIndex: toIndexPath.row)
    }
    */

}
