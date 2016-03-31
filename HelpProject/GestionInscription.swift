//
//  GestionInscription.swift
//  HelpProject
//
//  Created by tp on 31/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//

import UIKit
import CoreData

class GestionInscription: UIViewController {
    
    
    @IBOutlet var passTwo: UITextField!
    @IBOutlet var passOne: UITextField!
    @IBOutlet var login: UITextField!
    
    
    @IBOutlet var numRue: UITextField!
    
    @IBOutlet var nomRue: UITextField!
    
    
    @IBOutlet var codePostal: UITextField!
    
    
    @IBOutlet var ville: UITextField!
    
    
    
    @IBAction func addNewPerson(sender: AnyObject) {
        
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        let req=NSFetchRequest(entityName: "Person")
        req.returnsObjectsAsFaults=false
        req.predicate=NSPredicate(format: "login = %@",login!.text!)
        var c=0
        do{
            let res=try contexte.executeFetchRequest(req)
            if res.count>0{
                let r=res.first as! NSManagedObject
               let passwd = ((r.valueForKey("password")!) as? String)!
             var idPerson = ((r.valueForKey("idPerson")!) as? Int)!
                if passwd == passOne!.text! {
                    // Message user existe
                    
                    performSegueWithIdentifier("afficherListeCategorie",sender: "")
                }/*
                else {
                    // add user in the table!
                    let entityDescription = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedObjectContext)
                    let newPerson = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                    newPerson.setValue(" ", forkey: )
                    newPerson.setValue(" ", forkey: )
                }
                */
                
                c+=1 //swift ne supporte pas c++
                
                //}
            }
        }catch{
            print("Echec du fetch!")
        }

        
        
        
        var addressPerson = ""
        
        /*addressPerson += numRue.text!
        addressPerson += " "
        addressPerson += nomRue.text!
        addressPerson += codePostal.text!
        */
        
        
        
    }
    

}
