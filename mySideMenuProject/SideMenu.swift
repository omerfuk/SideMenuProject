//
//  SideMenu.swift
//  mySideMenuProject
//
//  Created by Ömer Faruk Kılıçaslan on 6.07.2022.
//

import Foundation
import UIKit
protocol MenuControllerDelegate {
    
    func didSelectMenuItem(named: SideMenuItem)
    
}

enum SideMenuItem: String, CaseIterable{
    case home = "Home"
    case info = "Info"
    case settings = "Settings"
}

class MenuController: UITableViewController {
    
    public var delegate: MenuControllerDelegate?
    
    
    private let menuItems: [SideMenuItem]
    private let color = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    
    init(with menuItems: [SideMenuItem]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = color
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //TableView Funcs
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = color
        cell.contentView.backgroundColor = color
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        //Relay to delegate about menu item selection
        
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
        
        
        
    }
    
    
}
