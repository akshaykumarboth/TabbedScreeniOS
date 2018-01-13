//
//  Sports.swift
//  TabScreen
//
//  Created by Akshay Both on 14/01/18.
//  Copyright © 2018 Akshay Both. All rights reserved.
//

import UIKit

class Sports: UIViewController {
    
    @IBOutlet weak var topstoryView: UIView!
    
    @IBOutlet weak var tiitle: UILabel!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tiitle.text = text
    }
    
}

