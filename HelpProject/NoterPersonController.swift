//
//  NoterPersonController.swift
//  HelpProject
//
//  Created by tp on 31/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//

import UIKit
import CoreData

class NoterPersonController: UIViewController {
    
    
    @IBOutlet weak var intituleService: UILabel!
    
    @IBOutlet weak var notePersonneText: UITextField!
    
    
    @IBAction func noter(sender: AnyObject) {
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        
        let newMessage=NSEntityDescription.insertNewObjectForEntityForName("NotePerson", inManagedObjectContext: contexte)
        newMessage.setValue(personneANoter, forKey: "idPerson")
        newMessage.setValue(Int(notePersonneText.text!), forKey: "note")
        
        
        
        
        
        
        let req=NSFetchRequest(entityName: "Service")
        req.returnsObjectsAsFaults=false
        
        
        
        req.predicate=NSPredicate(format: "idService = %@", NSString(format:"%d",idService))
        
        do{
            let res=try contexte.executeFetchRequest(req)
            if res.count>0{
                for r in res as! [NSManagedObject]{
                    
                    contexte.deleteObject(r)
                    
                    
                    
                }
            }
        }catch{
            print("Echec du fetch!")
        }
        
        
        
        
        
        do{
            try contexte.save()
            navigationController?.popViewControllerAnimated(false)
        }catch{
            print("Probleme lors de la creation de la note")
        }
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        let req=NSFetchRequest(entityName: "Person")
        req.returnsObjectsAsFaults=false
        
        
        
        req.predicate=NSPredicate(format: "idPerson = %@", NSString(format:"%d",personneANoter))
        
        do{
            let res=try contexte.executeFetchRequest(req)
            if res.count>0{
                for r in res as! [NSManagedObject]{
                    title = "Noter "+((r.valueForKey("login")!) as? String)!
                 }
            }
        }catch{
            print("Echec du fetch!")
        }
        
        let req2=NSFetchRequest(entityName: "Service")
        req2.returnsObjectsAsFaults=false
        
        
        print("Service: " + (NSString(format:"%d",idService) as String))
        req2.predicate=NSPredicate(format: "idService = %@", NSString(format:"%d",idService))
        
        do{
            let res=try contexte.executeFetchRequest(req2)
            if res.count>0{
                for r in res as! [NSManagedObject]{
                    missionText.text = "Service: " + ((r.valueForKey("descriptionService")!) as? String)!
                    intituleService.text = "Intitulé: " + ((r.valueForKey("intituleService")!) as? String)!
                    
                }
            }
        }catch{
            print("Echec du fetch!")
        }
        
    }
    
    
    @IBOutlet weak var missionText: UILabel!
    var identification: Identification!
    var personneANoter:Int!
    var idService:Int!
}
