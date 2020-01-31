//
//  DealerDetailTableViewCell.swift
//  CarDelaerSample
//
//  Created by Mohit on 30/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import UIKit

class DealerDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var makeYearLabel: UILabel!
    @IBOutlet weak var dealerDetailLabel: UILabel!
    @IBOutlet weak var callDealerButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func updateDealerCellData(carMake: String,
                              dealerDetail: String,
                              phoneNumber: String) {
        makeYearLabel.text = carMake
        dealerDetailLabel.text = dealerDetail
        callDealerButton.setTitle(phoneNumber, for: .normal)
    }
}
