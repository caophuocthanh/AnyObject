//
//  Model.swift
//  Flux
//
//  Created by Thanh on 6/30/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

/* Model */
class Model {
    private(set) var id:            String
    private(set) var created_at:    Date
    
    var className: String { return String(describing: self.self) }
    init(id: String, created_at: Date = Date()) {
        self.id = id
        self.created_at = created_at
    }
}
