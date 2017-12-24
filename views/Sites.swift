//
//  Sites.swift
//  views
//
//  Created by QAZAQ BRO on 24.12.17.
//  Copyright © 2017 Kanat. All rights reserved.
//

import Foundation

class Sites: NSObject {
    var user_id: String?
    var user_name: String?
    
    init(user_id: String?, user_name: String?){
        self.user_id = user_id
        self.user_name = user_name
    }
}

