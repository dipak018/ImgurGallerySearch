//
//  ViewController.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import UIKit

// HomeViewController

class HomeViewController: IGSBaseViewController {
    
    // MARK: - IBOutlets. Public Props
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var layoutToggleButton: UIBarButtonItem!
    var isListLayout: Bool = false
    
    // MARK: -  Private Props
    private lazy var homeViewModel = HomeViewModel()
    private lazy var collectionViewDatasourceDelegate = HomeCollectionViewDatasourceDelegate()
    
}

// MARK: - View Lifecycle

extension HomeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}

// MARK: - Public
extension HomeViewController {
    @IBAction func toggleLayout(_ sender: Any) {
        isListLayout.toggle()
        updateLayout()
    }
}

// MARK: - Private

private extension HomeViewController {
    func configuration() {
        setupSearchBar()
        setupCollectionView()
        observeEvent()
    }
    
    func setupSearchBar() {
        // Set up search bar
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        navigationItem.titleView = searchBar
    }
    
    // Data binding event observe karega - communication
    func observeEvent() {
        homeViewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading:
                /// Indicator show
                print("Product loading....")
                DispatchQueue.main.async {
                    self.view.makeToastActivity(.center)
                }
            case .stopLoading:
                // Indicator hide kardo
                print("Stop loading...")
                DispatchQueue.main.async {
                    self.view.hideToastActivity()
                }
                
            case .dataLoaded:
                print("Data loaded...")
                DispatchQueue.main.async {
                    if let albumEntityArray = self.homeViewModel.galleryData.data {
                        self.collectionViewDatasourceDelegate.albumEntityArray = albumEntityArray
                        self.updateLayout()
                    }
                }
            case .error(let error):
                print(error.debugDescription)
            }
        }
    }
    
    func setupCollectionView() {
        self.collectionView.backgroundColor = .clear
        self.collectionView.dataSource = collectionViewDatasourceDelegate
        self.collectionView.delegate = collectionViewDatasourceDelegate
        collectionView.register(cell: GridCollectionViewCell.reuseIdentifier)
        collectionView.register(cell: ListCollectionViewCell.reuseIdentifier)
    }
    
    func updateLayout() {
        self.collectionViewDatasourceDelegate.isListLayout = self.isListLayout
        collectionView.reloadData()
        if isListLayout {
            collectionView.collectionViewLayout = createListLayout()
        } else {
            collectionView.collectionViewLayout = createGridLayout()
        }
    }
    
    func createListLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.bounds.width - 20, height: 120)
        layout.minimumInteritemSpacing = 10
        return layout
    }
    
    func createGridLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionView.bounds.width - 30) / 2, height: 120)
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return layout
    }
    
    func fetchImages(searchText:String) {
        if Reachability.isConnectedToNetwork {
            homeViewModel.fetchTopImagesFromImgurGallery(searchTopic: searchText)
        } else {
            self.view.show(toastMessage: "Please check your network connection and try again.")
        }
    }
}

// MARK: - Search Bar Delegate

extension HomeViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            self.fetchImages(searchText: searchText)
            searchBar.endEditing(true)
        }
    }
}

