//
//  ConnexionController.swift
//  HelpProject
//
//  Created by leo on 17/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
/*
Permet de se connecter
*/
//

import UIKit
import CoreData

class ConnexionController: UIViewController {
    
    
    @IBOutlet weak var entree_login: UITextField!
    
    @IBOutlet weak var entree_password: UITextField!
    
    
    var clickConnection=false
    var idPerson:Int=0
    
    @IBAction func seConnecter(sender: AnyObject) {
        
            clickConnection=true
            let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
            let contexte:NSManagedObjectContext=appDel.managedObjectContext
            let req=NSFetchRequest(entityName: "Person")
            req.returnsObjectsAsFaults=false
            req.predicate=NSPredicate(format: "login = %@", entree_login!.text!)
            var c=0
            do{
                let res=try contexte.executeFetchRequest(req)
                if res.count>0{
                    let r=res.first as! NSManagedObject
                    //for r in res as! [NSManagedObject]{
                        //print(r.valueForKey("nomCategorie")!)
                        let passwd=((r.valueForKey("password")!) as? String)!
                        idPerson=((r.valueForKey("idPerson")!) as? Int)!
                        if passwd==entree_password!.text! {
                            performSegueWithIdentifier("afficherListeCategorie",sender: "")
                        }
                        
                        
                        c+=1 //swift ne supporte pas c++
                        
                    //}
                }
            }catch{
                print("Echec du fetch!")
            }
            
            
            
            
            
            
            //clickConnection=false
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if(segue.identifier=="afficherListeCategorie" && clickConnection){
            
            
            let dvc=segue.destinationViewController as! ListeCategorieTableViewController
            dvc.identification=Identification(login:entree_login!.text!,password:entree_password!.text!,id:idPerson)
            
            //dvc.boutonConnection.setTitle("Se déconnecter",forState: UIControlState.Normal)
        }
        clickConnection=false
    }
    
    
    
    
    /* override func viewDidLoad() {
    super.viewDidLoad()
    classeBDD="Categorie"
    champAAfficherBDD="nomCategorie"
    rafraichir()
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var listeDesDemandes=false
    var categorie=""
    
    
    
    
}