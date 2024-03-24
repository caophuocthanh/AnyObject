//
//  ViewController.swift
//  Flux
//
//  Created by Thanh on 6/28/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var lableA = UILabel()
//    let warehouse = Store()
    
    private var cancelables: [any Cancelable] = []
    @Object var anObjectYouWantObser: String? = "asdasdasd"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // listent event
        let event = self.$anObjectYouWantObser.sink {
            print("$anObjectYouWantObser changed: ", $0 ?? "")
        }

        self.cancelables.append(event)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            // cancel if need
            //self.cancelables.removeAll()
            
            // or
            // self.cancelables.forEach { $0.cancel() }
            
            // or
            // cancel if need
            //event.cancel()
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                for i in (0...5) {
                    self.anObjectYouWantObser = "anObjectYouWantObser change \(i)"
                }
            }
        }
        
        
        
        
        
        
        
//        self.lableA.text = "THANH"
//        
//        
//        // get and insert to warehouse
//        let warehouse =  Store.defaultStore
//        
//        let a1: NewModel = NewModel(id: "a1", name: "a1")
//        let a2: NewModel = NewModel(id: "a2", name: "a1")
//        let a3: NewModel = NewModel(id: "a3", name: "a1")
//        let a4: NewModel = NewModel(id: "a4", name: "a1")
//        
//        let a21: NewModel = NewModel(id: "a21", name: "a2")
//        let a31: NewModel = NewModel(id: "a31", name: "a3")
//        let a41: NewModel = NewModel(id: "a41", name: "a4")
//        
//        warehouse.append(a1, storeIndentifier: "1")
//        warehouse.append(a2, storeIndentifier: "1")
//        warehouse.append(a3, storeIndentifier: "1")
//        warehouse.append(a4, storeIndentifier: "1")
//        
//        warehouse.append(a21, storeIndentifier: "2")
//        warehouse.append(a31, storeIndentifier: "2")
//        warehouse.append(a41, storeIndentifier: "2")
//        
//        print("warehouse:", warehouse.getStore())
//        
//        print("warehouse store 1:", Store.defaultStore.fetch("1").map { $0.model.id })
//        
//        
//        // get warehouse form other
//        let ware =  Store.defaultStore
//        let a = ware.fetch("1")
//        print("warehouse from other with id 1:", a.map { $0.model.id})
//        let ac = a[0]
//        
//        self.lableA.text = ac.model.id
//        
//        print(ac.model.self ?? "null")
//        
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
}

