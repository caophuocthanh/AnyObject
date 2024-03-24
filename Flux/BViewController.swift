//
//  BViewController.swift
//  Flux
//
//  Created by Thanh on 6/30/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    var lableB = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lableB.text = "B THANH"
        
        // Do any additional setup after loading the view.
        
        let v =  Store.defaultStore
        let z = v.fetch("1")
        let zc = z[0]
        
//        self.lableB.text = zc.model.id
//        print(zc.model.id.reacts)
//        print(zc.model.id)
//        
//        
//        let nc = React<String> {
//            print("react B: ",$0)
//            self.lableB.text = $0
//        }
//        nc.bind(zc.model.id)
        
        
    }
    @IBAction func touch(sender: AnyObject) {
        print("--------------------------asfjasf")
        let v =  Store.defaultStore
        let z = v.fetch("1")
        let zc = z[0]
        
//        print(zc.model.id.reacts)
//        print(zc.model.id)
//        
//        zc.model.id.value = "asdasdasfasf"
    }
    @IBOutlet weak var button: UIButton!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear B")
    }

}
