//
//  ReponseController.swift
//  HelpProject
//
//  Created by leo on 25/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
/*
Permet de répondre à un service
*/
//

import UIKit
import CoreData

class RepondreController: UIViewController {
    @IBOutlet weak var textReponseDetaille: UITextView!
    
    @IBOutlet weak var valeurPropose: UITextField!
    @IBOutlet weak var texteSujet: UITextField!
    var identification: Identification!
    var idService:Int!
    
    @IBAction func repondre(sender: AnyObject) {
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        
        let newMessage=NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: contexte)
        newMessage.setValue(newMessage.objectID.hash, forKey: "idMsg")//TODO objectID
        newMessage.setValue(texteSujet.text, forKey: "sujet")
        newMessage.setValue(textReponseDetaille.text, forKey: "msgContent")
        newMessage.setValue(idService, forKey: "idService")
        newMessage.setValue(identification.id, forKey: "from")
        newMessage.setValue(Int(valeurPropose.text!), forKey: "sommePropose")
        newMessage.setValue("attente", forKey: "statutAttenteAccepteIgnore")
        
        
        do{
            try contexte.save()
            //performSegueWithIdentifier("retourListeParCategorie", sender: 1)
            navigationController?.popViewControllerAnimated(false)
        }catch{
            print("Probleme lors du peuplement de la BDD")
            //tableCacheBDD[0]="BDD pas remplie"
        }
    }
}
