//
//  NewModel.swift
//  Flux
//
//  Created by Thanh on 6/30/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class NewModel: Model {
    @Object var name: String = ""
    init(id: String, create_at: Date = Date(), name: String) {
        super.init(id: id, created_at: create_at)
        self.name = name
    }
}
