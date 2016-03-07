//
//  HandDataSource.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/7/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import UIKit

class HandDataSource: DataSource<Hand> {

    init() {
        super.init(dataObject: Hand())
    }

    override var conditionForAdding: Bool {
        return dataObject.numberOfItems < 5
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(CardCellReusable(), forIndexPath: indexPath)
        cell.fillWith(dataObject[indexPath.row])
        return cell
    }

    private struct CardCellReusable: TableViewCellReusable {
        let reuseIdentifier = "Cell"
        typealias CellType = CardCell
    }

}
