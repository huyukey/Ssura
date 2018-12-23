//
//  BoardTableViewCell.swift
//  Ssura
//
//  Created by 겨울나무 on 23/12/2018.
//  Copyright © 2018 겨울나무. All rights reserved.
//

import UIKit

class BoardTableViewCell: UITableViewCell {

    @IBOutlet weak var boardWriterAvatar: UIImageView!
    @IBOutlet weak var boardStatusBadge: UILabel!
    @IBOutlet weak var boardWriterName: UILabel!
    @IBOutlet weak var boardWriteDate: UILabel!
    @IBOutlet weak var boardWriteTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
