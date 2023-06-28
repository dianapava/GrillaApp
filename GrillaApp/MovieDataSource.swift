//
//  MovieDataSource.swift
//  GrillaApp
//
//  Created by Diana Pava Avila on 15/06/23.
//

import UIKit

class MovieDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate  {

    var items: [MovieModel] = []
    static let idCollectionViewCategory = "catCollectionView"
    
    
    override init(){
        super.init()
    }
    
    func set(data: [MovieModel]){
        items = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDataSource.idCollectionViewCategory, for: indexPath) as? CategoryCollectionViewCell else{
                return UICollectionViewCell()
            }
        cell.setData(dataMovie: items[indexPath.row])
    
            return cell
 
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(items[indexPath.row])
    }
    
}
