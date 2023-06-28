//
//  ViewController.swift
//  GrillaApp
//
//  Created by Diana Pava Avila on 13/06/23.
//

import UIKit

struct SectionMovie{
    let title: String
}

struct CategoryMovie{
    let image: String
}

class ViewController: UIViewController {
    
    var sectionMovie: [SectionMovie] = []
    var categoryMovie: [CategoryMovie] = []
    
    @IBOutlet weak var collectionViewMovie: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var categoryMovieDatasource = CategoryMovieDatasource()
    private var movieDatasource = MovieDataSource()
    let client: Client = Client()

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CategoryMovieDatasource.idCollectionViewTitle)
        
        let nib2 = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        collectionViewMovie.register(nib2, forCellWithReuseIdentifier: MovieDataSource.idCollectionViewCategory)
        collectionViewMovie.collectionViewLayout = setupFlowLayout()
        collectionView.dataSource = categoryMovieDatasource
        collectionView.delegate = categoryMovieDatasource
        collectionViewMovie.delegate = movieDatasource
        collectionViewMovie.dataSource = movieDatasource
        //collectionView.delegate = self
        sectionMovie.append(SectionMovie(title: "comedy"))
        sectionMovie.append(SectionMovie(title: "terror"))
        sectionMovie.append(SectionMovie(title: "drama"))
        sectionMovie.append(SectionMovie(title: "suspenso"))
        sectionMovie.append(SectionMovie(title: "Telenovela"))
        categoryMovieDatasource.set(data: sectionMovie)
        categoryMovie.append(CategoryMovie(image: "guardianes"))
        categoryMovie.append(CategoryMovie(image: "guardianes"))
        categoryMovie.append(CategoryMovie(image: "guardianes"))
        categoryMovie.append(CategoryMovie(image: "guardianes"))
        categoryMovie.append(CategoryMovie(image: "guardianes"))
        //movieDatasource.set(data: categoryMovie)
        getMovies()
        
        
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let bounds = UIScreen.main.bounds
        layout.itemSize = CGSize(width: (bounds.width / 2) - 8, height: bounds.height / 4)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        return layout
    }
    
    func getMovies(){
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OWNhMjNiNDA0YTVkYzRmZDRhN2NiZjAxNGEzYzYxOCIsInN1YiI6IjY0NWQ5M2JjZDZjMzAwMDEwM2Q3NmEwMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Gkve36chGL10Axzt_I3fzTRIQsciOIhf_agEKovjpeo"
        ]

        client.request(url: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1", headers: headers) { result in
            DispatchQueue.main.async {
                self.movieDatasource.set(data: result.results)
                self.collectionViewMovie.reloadData()
            }
            
            print("Success")
        } onFailure: { error in
            print("Error \(error)")
        }

    }
}


