//
//  ViewController.swift
//  SlideViewController
//
//  Created by Hitesh V-PI on 30/05/17.
//  Copyright © 2017 Pixabit Infotech. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var mainContens = ["data1","data2","data3","data4"]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
            self.tableView.registerCellNib(DataTableViewCell.self)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // create viewController code...
        
        let slideMenuController = SlideMenuController(ViewController: ViewController, LeftMenuViewController: LeftViewController, //rightMenuViewController: rightViewController)
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DataTableViewCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "SubContentsViewController", bundle: nil)
        let subContentsVC = storyboard.instantiateViewController(withIdentifier: "SubContentsViewController") as! SubContentsViewController
        self.navigationController?.pushViewController(subContentsVC, animated: true)
    }
}

extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainContens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: DataTableViewCell.identifier) as! DataTableViewCell
        let data = DataTableViewCellData(imageUrl: "dummy", text: mainContens[indexPath.row])
        cell.setData(data)
        return cell
    }
}





