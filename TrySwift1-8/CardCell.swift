//
//  CardCell.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!

    func fillWith(card: Card) {
        rankLabel.textColor = card.color
        rankLabel.text = card.rank.description
        suitLabel.text = card.suit.description
    }
}
