//
//  ViewController.swift
//  TabScreen
//
//  Created by Akshay Both on 14/01/18.
//  Copyright © 2018 Akshay Both. All rights reserved.
//

import UIKit

import Tabman
import Pageboy

//

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let controller = YourTabViewController()
        
        controller.bar.appearance = TabmanBar.Appearance({ (appearance) in
            
            // customise appearance here lineWeight
            appearance.state.selectedColor = UIColor.black
            appearance.state.color = UIColor.black
            appearance.indicator.lineWeight = .thick
            appearance.indicator.color = UIColor(red:0.70, green:0.26, blue:0.26, alpha:1.0)
            appearance.text.font = UIFont.boldSystemFont(ofSize: 16.0)
        })
        controller.bar.style = .scrollingButtonBar
        controller.bar.location = .top
        displayContentController(content: controller)
    }
    
    func displayContentController(content: UIViewController) {
        addChildViewController(content)
        self.view.addSubview(content.view)
        content.didMove(toParentViewController: self)
    }
    
}

class YourTabViewController: TabmanViewController, PageboyViewControllerDataSource {
    var viewControllers: [UIViewController] = []
    var barItems: [Item] = [Item(title: "Sports".uppercased() ),
                            Item(title: "Technologies".uppercased() ),
                            Item(title: "Design".uppercased() ),
                            Item(title: "Politics".uppercased() ),
                            Item(title: "Movies".uppercased() ),
                            Item(title: "About".uppercased() ),
                            Item(title: "Settings".uppercased() ) ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        for i in 0..<barItems.count {
            let vc1 = storyboard.instantiateViewController(withIdentifier: "Sports") as! Sports
            vc1.text = barItems[i].title!.uppercased()
            viewControllers.append(vc1)
        }
        self.dataSource = self
        self.bar.items = barItems
    }
    
    
    
    //
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}

