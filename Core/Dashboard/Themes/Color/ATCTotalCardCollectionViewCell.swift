//
//  ATCTotalCardCollectionViewCell.swift
//  DashboardApp
//
//  Created by Florian Marcu on 7/28/18.
//  Copyright © 2018 Instamobile. All rights reserved.
//

import UIKit

class ATCTotalCardCollectionViewCell: UICollectionViewCell, ATCTotalCardCollectionViewCellDisplayable {
    @IBOutlet var cardContainerView: UIView!
    @IBOutlet var totalTitleLabel: UILabel!
    @IBOutlet var totalNumberLabel: UILabel!
    @IBOutlet var cardImageView: UIImageView!
}
