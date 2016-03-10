//
//  BDDCache.swift
//  HelpProject
//
//  Created by leo on 10/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//
/*import UIKit
import CoreData
import Foundation

class BDDCache{
    var table=["","","","","","","","","","","","","","","","","",""]
    var classe:String
    var champAAfficher:String
    init(){
        classe=""
        champAAfficher=""
    }
    func rafraichir(){
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        let req=NSFetchRequest(entityName: classe)
        req.returnsObjectsAsFaults=false
        
        var c=0
        do{
            let res=try contexte.executeFetchRequest(req)
            if res.count>0{
                for r in res as! [NSManagedObject]{
                    //print(r.valueForKey("nomCategorie")!)
                    if c<table.count{
                        table[c]=((r.valueForKey(champAAfficher)!) as? String)!
                    }
                    
                    c+=1//swift ne supporte pas c++
                    
                }
            }
        }catch{
            print("Echec du fetch!")
        }
    }
}*/