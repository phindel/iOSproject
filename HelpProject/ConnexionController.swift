//
//  ConnexionController.swift
//  HelpProject
//
//  Created by leo on 17/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//

import UIKit
import CoreData

class ConnexionController: UIViewController {
    
    
    @IBOutlet weak var entree_login: UITextField!
    
    @IBOutlet weak var entree_password: UITextField!
    
    
    var clickConnection=false
    
    
    @IBAction func seConnecter(sender: AnyObject) {
        if entree_login.text=="hello"
        {
            clickConnection=true
            performSegueWithIdentifier("afficherListeCategorie",sender: "")
            entree_login.text="pasbon!"
            //clickConnection=false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if(segue.identifier=="afficherListeCategorie" && clickConnection){
            
            let dvc=segue.destinationViewController as! ListeCategorieTableViewController
            dvc.identification=Identification(login:entree_login!.text!,password:entree_password!.text!)
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