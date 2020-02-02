//
//  AbsTableViewCell.swift
//  RxBidMVVM
//
//  Created by 荒川大樹 on 2020/02/01.
//  Copyright © 2020 rkw1316. All rights reserved.
//

import UIKit

protocol AbsTableViewCellProtocol {
    func setCell(_ vm: CellViewModel)
}

class AbsTableViewCell: UITableViewCell,AbsTableViewCellProtocol {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(_ vm: CellViewModel) {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
