//
//  ReponseController.swift
//  HelpProject
//
//  Created by leo on 25/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
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
        
        let newService=NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: contexte)
        newService.setValue(100, forKey: "idMsg")//TODO 100
        newService.setValue(texteSujet.text, forKey: "sujet")
        newService.setValue(textReponseDetaille.text, forKey: "msgContent")
        newService.setValue(idService, forKey: "idService")
        newService.setValue(identification.id, forKey: "from")
        newService.setValue(Int(valeurPropose.text!), forKey: "sommePropose")
        
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
