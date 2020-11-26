//
//  MainVC.swift
//  SideMenu-Swift
//
//  Created by Arvind on 26/11/20.
//

import UIKit

class MainVC: UIViewController {
 
    @IBOutlet var profileImgV: UIImageView!
    @IBOutlet var userName: UILabel!
    
    public var isShowSideMenu = false
    public var homeView = HomeView()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.setHidesBackButton(true, animated: false)
        
        setupHeaderView()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        showSideMenu(index: 0)
    }
    
    @IBAction func orderButtonPressed(_ sender: UIButton) {
        showSideMenu(index: 1)
    }
    @IBAction func wishlistButtonPressed(_ sender: UIButton) {
        showSideMenu(index: 2)
    }
    
    @IBAction func aboutButtonPressed(_ sender: UIButton) {
        showSideMenu(index: 3)
    }
}

extension MainVC  {
    
    func setupHeaderView() {
        profileImgV.setRadius()
        homeView.setupHomeView(self)
        homeView.setupContainerView(cornerR: 20)
        view.addSubview(homeView)
    }
    
    @objc
    func bagDidTap(_ index: Int) {
        showSideMenu(index: 0)
    }
    
    func showSideMenu(index: Int) {
        
        if !isShowSideMenu {
            UIView.animate(withDuration: 0.2) {
                let degrees : Double = -4
                self.homeView.transform = CGAffineTransform(rotationAngle: CGFloat(degrees * .pi/180))
                self.homeView.frame = self.homeView.frame.offsetBy(dx: screenWidth / 2, dy: 70)
                self.homeView.menuButton.setImage(UIImage(named: "xmark"), for: .normal)
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                let degrees : Double = 0
                self.homeView.transform = CGAffineTransform(rotationAngle: CGFloat(degrees * .pi/180))
                self.homeView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
                self.homeView.menuButton.setImage(UIImage(named: "menu"), for: .normal)
            }
        }
        isShowSideMenu = !isShowSideMenu
    }
}
