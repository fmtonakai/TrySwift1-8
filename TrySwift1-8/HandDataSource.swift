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
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? CardCell else {
                fatalError("Could not create CardCell")
        }
        cell.fillWith(dataObject[indexPath.row])
        return cell
    }

}
