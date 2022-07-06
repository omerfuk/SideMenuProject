//
//  ViewController.swift
//  mySideMenuProject
//
//  Created by Ömer Faruk Kılıçaslan on 6.07.2022.
//
import SideMenu
import UIKit

class ViewController: UIViewController, MenuControllerDelegate, UINavigationControllerDelegate {
  
    
    
    private var sideMenu: SideMenuNavigationController?
    
    private let settingsController = SettingsViewController()
    private let infoController = InfoViewController()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuController(with:SideMenuItem.allCases)
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view) // provides slide feature
        addChildControllers()
    }
    
    func didSelectMenuItem(named: SideMenuItem) {
        
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            
            self?.title = named.rawValue
            
            switch named {
            case .home:
                self?.settingsController.view.isHidden = true
                self?.infoController.view.isHidden = true
            case .info:
                self?.settingsController.view.isHidden = true
                self?.infoController.view.isHidden = false
            case .settings:
                self?.settingsController.view.isHidden = false
                self?.infoController.view.isHidden = true
            }
            
        })
        
    }
    
    private func addChildControllers() {
        addChild(settingsController)
        addChild(infoController)
        view.addSubview(settingsController.view)
        
        view.addSubview(infoController.view)
        
        settingsController.view.frame = view.bounds
        infoController.view.frame = view.bounds
        
        settingsController.didMove(toParent: self)
        infoController.didMove(toParent: self)
        
        settingsController.view.isHidden = true
        infoController.view.isHidden = true
    }


    @IBAction func didTapMenuButton(_ sender: Any) {
        
        present(sideMenu!, animated: true)
        
    }
}










