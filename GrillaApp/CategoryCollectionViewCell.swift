//
//  CategoryCollectionViewCell.swift
//  GrillaApp
//
//  Created by Diana Pava Avila on 15/06/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    
    func setData(dataMovie: MovieModel){
        //imageMovie.image = UIImage(named: (dataMovie.image))
        titleLabel.text = dataMovie.title
    }
}
