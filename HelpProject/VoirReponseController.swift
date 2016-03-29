//
//  VoirReponseController.swift
//  HelpProject
//
//  Created by leo on 25/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//

import UIKit
import CoreData

class VoirReponseController: UIViewController {
    @IBOutlet weak var grandTextarea: UITextView!
    
    var idMsg:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        let req=NSFetchRequest(entityName: "Message")
        req.returnsObjectsAsFaults=false
        
        
        
        req.predicate=NSPredicate(format: "idMsg = %@", NSString(format:"%d",idMsg))
        
        do{
            let res=try contexte.executeFetchRequest(req)
            if res.count>0{
                for r in res as! [NSManagedObject]{
                    //print(r.valueForKey("nomCategorie")!)
                    //(num: ((r.valueForKey("idService")!) as? Int)!,nom: ((r.valueForKey("intituleService")!) as? String)!)
                    
                    grandTextarea.text = ((r.valueForKey("msgContent")!) as? String)!
                    //afficher aussi sujet
                    
                    print("VoirReponseController "+((r.valueForKey("msgContent")!) as? String)!)
                    
                    
                    
                }
            }
        }catch{
            print("Echec du fetch!")
        }
        
        
        
    }
}
