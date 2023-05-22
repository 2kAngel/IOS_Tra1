//
//  MainTableViewCell.swift
//  IOS_Trabajo1
//
//  Created by Administrador on 19/5/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var descrTV: UITextView!
    @IBOutlet weak var imagenPais: UIImageView!
    @IBOutlet weak var imagenReceta: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var paisLabel: UILabel!
}
