//
//  PostTableCellViewController.swift
//  Hella Slaps
//
//  Created by Sean MacPherson on 3/14/16.
//  Copyright © 2016 loofy. All rights reserved.
//

import UIKit

class PostTableCellViewController: UITableViewCell {
    
    @IBOutlet weak var AlbumArt: UIImageView!
    
    
    @IBOutlet weak var PostTitle: UILabel!
    
    
    @IBOutlet weak var PostInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
