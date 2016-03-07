//
//  UITableViewExtension.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/7/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import UIKit

protocol TableViewCellReusable {
    typealias CellType
    var reuseIdentifier: String { get }
}

extension UITableView {
    
    func dequeueReusableCell<Reusable: TableViewCellReusable where Reusable.CellType: UITableViewCell>(reusable: Reusable, forIndexPath indexPath: NSIndexPath) -> Reusable.CellType {
        return dequeueReusableCellWithIdentifier(reusable.reuseIdentifier, forIndexPath: indexPath) as! Reusable.CellType
    }
}

