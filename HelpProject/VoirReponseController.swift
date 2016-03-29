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
    
    @IBOutlet weak var proposeur: UITextField!
    
    @IBAction func refuserReponse(sender: AnyObject) {
        
    }
    @IBAction func accepterReponse(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var offreText: UILabel!
    
    @IBOutlet weak var sujetText: UILabel!
    
    
    @IBOutlet weak var grandTextarea: UITextView!
    
    var idMsg:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        let req=NSFetchRequest(entityName: "Message")
        req.returnsObjectsAsFaults=false

        req.predicate=NSPredicate(format: "idMsg = %@", NSString(format:"%d",idMsg))
        var idPerson=0
        do{
            let res=try contexte.executeFetchRequest(req)
            if res.count>0{
                for r in res as! [NSManagedObject]{
                    //print(r.valueForKey("nomCategorie")!)
                    //(num: ((r.valueForKey("idService")!) as? Int)!,nom: ((r.valueForKey("intituleService")!) as? String)!)
                    
                    grandTextarea.text = ((r.valueForKey("msgContent")!) as? String)!
                    sujetText.text = ((r.valueForKey("sujet")!) as? String)!
                    offreText.text = NSString(format:"%d",((r.valueForKey("sommePropose") as? Int)!)) as String
                    idPerson=((r.valueForKey("from") as? Int)!)
                }
            }
        }catch{
            print("Echec du fetch!")
        }
        
        let reqp=NSFetchRequest(entityName: "Person")
        reqp.returnsObjectsAsFaults=false
        
        reqp.predicate=NSPredicate(format: "idPerson = %@", NSString(format:"%d",idPerson))
        
        do{
            let res=try contexte.executeFetchRequest(reqp)
            if res.count>0{
                for r in res as! [NSManagedObject]{
                    proposeur.text = ((r.valueForKey("login")!) as? String)!+" vous propose"
                }
            }
        }catch{
            print("Echec du fetch!")
        }
        
    }
}
