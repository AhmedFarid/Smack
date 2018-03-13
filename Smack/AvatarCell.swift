//
//  AvatarCell.swift
//  Smack
//
//  Created by FARIDO on 3/12/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

enum AvaterType {
    case dark
    case light
    
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avaterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    
    func configerCell(index: Int, type: AvaterType) {
        if type == AvaterType.dark{
            avaterImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }else{
            avaterImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    func setUpView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}
