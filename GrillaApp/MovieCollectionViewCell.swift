//
//  MovieCollectionViewCell.swift
//  GrillaApp
//
//  Created by Diana Pava Avila on 13/06/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleSection: UILabel!
    
    func set(data: SectionMovie){
        titleSection.text = data.title
    }
}
