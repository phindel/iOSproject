//
//  Identification.swift
//  HelpProject
//
//  Created by leo on 17/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//

import UIKit
import CoreData

class Identification{
    var login=""
    var password=""
    var id:Int
    init(login:String , password:String, id:Int){
        self.login=login
        self.password=password
        self.id=id
    }
}