//
//  PhotosLibraryViewCollection.swift
//  libraryPhotos
//
//  Created by Siarhei Stasevich on 14/11/2022.
//

import UIKit

class PhotosCV: UICollectionViewController {
    
    var networkService = NetworkSerwice()
    
    private lazy var addBarButtomItem:UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(setupAddBarButtom))
    }()
    
    private  lazy var actionBarButtonItem:UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionAddBarButtom))
    }()
    
    let idCell = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .cyan
        
        setupViewCell()
        setupnavigationBar()
        searchBar()
    }
    
    // MARK: - setup Bar Buttom
    
    @objc func setupAddBarButtom() {
        print(#function)
    }
    @objc func actionAddBarButtom() {
        print(#function)
    }
    
    // MARK: - setup Ui Elements
    private func setupViewCell(){
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: idCell)
    }
    
    private func setupnavigationBar(){
        let titleLabel = UILabel()
        titleLabel.text = "PHOTOS"
        titleLabel.textColor = .gray
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.rightBarButtonItems = [actionBarButtonItem, addBarButtomItem]
    }
    private func searchBar(){
        let searchBar = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        searchBar.hidesNavigationBarDuringPresentation =  false
        searchBar.searchBar.delegate = self
    }
    
    //MARK: - UICollection DataSourse, Delegate
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
}

//MARK: - UiSearchBar Delegate

extension PhotosCV: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        networkService.reqest(SearchTerm: searchText) { _, _ in
            print("11")
        }
    }
}
