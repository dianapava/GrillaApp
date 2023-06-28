//
//  CategoryMovieDatasource.swift
//  GrillaApp
//
//  Created by Diana Pava Avila on 15/06/23.
//

import Foundation
import UIKit

class CategoryMovieDatasource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate  {

    private var sectionMovie: [SectionMovie] = []
    static let idCollectionViewTitle = "movieCollection"
    
    override init(){
        super.init()
    }
    
    func set(data: [SectionMovie]){
        sectionMovie = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sectionMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryMovieDatasource.idCollectionViewTitle, for: indexPath) as? MovieCollectionViewCell else{
                return UICollectionViewCell()
            }
            cell.set(data: sectionMovie[indexPath.row])
            return cell
 
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(sectionMovie[indexPath.row])
    }
    
}
