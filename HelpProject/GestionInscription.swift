//
//  GestionInscription.swift
//  HelpProject
//
//  Created by tp on 31/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
/*
Permet l'inscription d'une personne
*/
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if(segue.identifier=="afficherListeCategorie"){
            
            
            let dvc=segue.destinationViewController as! ListeCategorieTableViewController
            dvc.identification=Identification(login:login!.text!,password:passOne!.text!,id:idPerson)
            
        }
    }
    var idPerson=0
    @IBAction func addNewPerson(sender: AnyObject) {
        if(passOne!.text!==passTwo!.text!){
            let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
            let contexte:NSManagedObjectContext=appDel.managedObjectContext
            let newPerson=NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: contexte)
            idPerson=newPerson.objectID.hash
            newPerson.setValue(idPerson, forKey: "idPerson")
            newPerson.setValue("TODO", forKey: "address")
            newPerson.setValue(login!.text!, forKey: "login")
            newPerson.setValue(passOne!.text!, forKey: "password")
            performSegueWithIdentifier("afficherListeCategorie",sender: "")
        }
        

        
        
        
        
        
        
        
    }
    

}
