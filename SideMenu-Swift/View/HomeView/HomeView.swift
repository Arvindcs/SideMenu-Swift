//
//  HomeViewController.swift
//  SideMenu-Swift
//
//  Created by Arvind on 26/11/20.
//


import UIKit

class HomeView: UIView {
    
    //MARK: - Properties
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let tableView = UITableView(frame: .zero, style: .grouped)
    public let menuButton = UIButton()
    public let titleLabel = UILabel()
    
    private var parentVC: MainVC!
    lazy var productList: [Product] = getProductList()
    lazy var bannerList: [Product] = getBannerList()

    private var parallaxOffsetSpeed: CGFloat = 30.0
    private var cellHeight: CGFloat = 130.0
    private var parallaxImageHeight: CGFloat {
        let tvHeight = tableView.frame.height
        let maxOffset = (sqrt(pow(cellHeight, 2) + 4 * tvHeight * parallaxOffsetSpeed) - cellHeight)/2
        return maxOffset
    }
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configures

extension HomeView {
    
    func setupHomeView(_ parent: MainVC) {
        parentVC = parent
        frame = CGRect(x: 0.0, y: 0.0, width: screenWidth, height: screenHeight)
        setupNavi()
        setupDarkMode()
        fetchProducts()
    }
    
    func setupNavi() {
        menuButton.configureMenuButton(self, imgNamed: "menu", selector: #selector(parentVC.menuButtonPressed), controller: parentVC!)
        titleLabel.configureMenuTitle(self ,txtColor: .black, fontSize: 25, isTxt: "Home")
    }
    
    private func fetchProducts() {
        setupCV()
        setupTV()
        setupConstraint()
    }
    
    func setupCV() {
        collectionView.configureCVAddSub(ds: self, dl: self, view: self)
        collectionView.register(ProductCVCell.self, forCellWithReuseIdentifier: ProductCVCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10.0
        
    }
    
    func setupTV() {
        tableView.configureTVNonSepar(ds: self, dl: self, view: self)
        tableView.register(ProductTVCell.self, forCellReuseIdentifier: ProductTVCell.identifier)
        tableView.rowHeight = 130.0
    }
    
    func setupConstraint() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
            
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

//MARK: - UICollectionViewDataSource

extension HomeView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVCell.identifier, for: indexPath) as! ProductCVCell
        cell.product = bannerList[indexPath.item]
        return cell
    }
}


//MARK: - UICollectionViewDelegateFlowLayout

extension HomeView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeItem = (collectionView.frame.size.width - 20.0)/2.0
        return CGSize(width: sizeItem * 2, height: 250)
    }
}

//MARK: - UITableViewDataSource

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTVCell.identifier, for: indexPath) as! ProductTVCell
        cell.product = productList[indexPath.row]
        return cell
    }
    
    func parallaxOffset(_ newOffsetY: CGFloat, cell: ProductTVCell) -> CGFloat {
        return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
}

//MARK: - UITableViewDelegate

extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
}

//MARK: - DarkMode

extension HomeView {
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupDarkMode()
    }
    
    private func setupDarkMode() {
        if #available(iOS 12.0, *) {
            switch traitCollection.userInterfaceStyle {
            case .light, .unspecified: setupDarkModeView()
            case .dark: setupDarkModeView(true)
            default: break
            }
        } else {
            setupDarkModeView()
        }
    }
    
    private func setupDarkModeView(_ isDarkMode: Bool = false) {
        self.backgroundColor = isDarkMode ? .black : .white
        
        collectionView.backgroundColor = isDarkMode ? .black : .white
        tableView.backgroundColor = isDarkMode ? .black : .white
    }
}
