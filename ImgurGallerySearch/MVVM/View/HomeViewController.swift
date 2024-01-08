//
//  ViewController.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import UIKit

class HomeViewController: IGSBaseViewController {
    // MARK: - IBOutlets. Public Props
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var layoutToggleButton: UIBarButtonItem!
    @IBOutlet weak var noResultView:UIView!
    @IBOutlet weak var noResultLabel:UILabel!
    
    var isListLayout: Bool = false
    
    // MARK: -  Private Props
    private lazy var homeViewModel = HomeViewModel()
    private lazy var collectionViewDatasourceDelegate = HomeCollectionViewDatasourceDelegate()
    private var searchTopicString = ""
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
        if isListLayout {
            layoutToggleButton.image = UIImage(systemName: "square.grid.2x2")
        } else {
            layoutToggleButton.image = UIImage(systemName: "list.bullet")
        }
        updateLayout()
    }
}

// MARK: - Private

private extension HomeViewController {
    func configuration() {
        setupSearchBar()
        setupCollectionView()
        observeEvent()

        // Initial call to load random images
        self.fetchImages(searchText: "Random")
    }
    
    // Setting up the searchbar UI
    func setupSearchBar() {
        // Set up search bar
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.backgroundColor = .white.withAlphaComponent(0.4)
        navigationItem.titleView = searchBar
    }
    
    // Data binding event observe for communication
    func observeEvent() {
        homeViewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading:
                DispatchQueue.main.async {
                    self.view.makeToastActivity(.center)
                }
            case .stopLoading:
                DispatchQueue.main.async {
                    self.view.hideToastActivity()
                }
            case .dataLoaded:
                DispatchQueue.main.async {
                    if let albumEntityArray = self.homeViewModel.galleryData.data {
                        if albumEntityArray.count == 0 {
                            
                            self.noResultLabel.text = "No result for \"\(self.searchTopicString)\""
                            self.noResultView.isHidden = false
                            self.collectionView.isHidden = true
                        } else {
                            self.noResultView.isHidden = true
                            self.collectionView.isHidden = false
                            self.collectionViewDatasourceDelegate.albumEntityArray = albumEntityArray
                            self.updateLayout()
                        }
                    }
                }
            case .error(let error):
                print(error.debugDescription)
            }
        }
    }
    
    // CollectionView setup
    func setupCollectionView() {
        self.collectionView.backgroundColor = .clear
        self.collectionView.dataSource = collectionViewDatasourceDelegate
        self.collectionView.delegate = collectionViewDatasourceDelegate
        collectionViewDatasourceDelegate.delegate = self
        collectionView.register(cell: GridCollectionViewCell.reuseIdentifier)
        collectionView.register(cell: ListCollectionViewCell.reuseIdentifier)
    }
    
    // UpdateLayout function modify the CollectionView layout based on the selected layout (List/Grid)
    func updateLayout() {
        self.collectionViewDatasourceDelegate.isListLayout = self.isListLayout
        collectionView.reloadData()
        if isListLayout {
            collectionView.collectionViewLayout = createListLayout()
        } else {
            collectionView.collectionViewLayout = createGridLayout()
        }
    }
    
    // Function to create the layout for List collection
    func createListLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.bounds.width - 20, height: 120)
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        return layout
    }
    
    // Function to create the layout for Grid collection
    func createGridLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionView.bounds.width - 30) / 2, height: 120)
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        return layout
    }
    
    // Fetch images function calls method of HomeViewModel to fetch the images from server.
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
    // Function calls when serarch button triggers and get response for the entered search term in search bar.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            self.searchTopicString = searchText
            self.fetchImages(searchText: searchText)
            searchBar.endEditing(true) // Exit the keyboard once search done
        }
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func homeCollectionView(didSelectItemAt selectedIndexPath: IndexPath) {
        if let controller = self.storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController{
            controller.detailsViewModel = DetailsViewModel(albumEntity: self.collectionViewDatasourceDelegate.albumEntityArray[selectedIndexPath.row])
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
