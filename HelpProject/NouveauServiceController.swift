//
//  NouveauServiceController.swift
//  HelpProject
//
//  Created by leo on 22/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//
import UIKit
import CoreData
import MapKit
import Foundation

class NouveauServiceController: UIViewController{
    
    
    @IBOutlet weak var ddescription: UITextView!
    @IBOutlet weak var intitule: UITextField!
    
    @IBOutlet weak var cout: UITextField!
    
    
    @IBOutlet weak var duree: UITextField!
    
    @IBOutlet weak var offreOuDemande: UISegmentedControl!
    
    @IBOutlet weak var dateDebutDispo: UIDatePicker!
    
    @IBOutlet weak var dateFinDispo: UIDatePicker!
    
    var identification: Identification!
    var categorie=""
    @IBAction func creerService(sender: AnyObject) {
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        
        let newService=NSEntityDescription.insertNewObjectForEntityForName("Service", inManagedObjectContext: contexte)
        newService.setValue(1, forKey: "attribute")
        newService.setValue(Int(cout.text!), forKey: "coutService")
        newService.setValue(dateDebutDispo.date, forKey: "dateDebutDispo")
        newService.setValue(dateFinDispo.date, forKey: "dateFinDispo")
        newService.setValue(Int(duree.text!), forKey: "duree")
        newService.setValue(100, forKey: "idService")//TODO autogenere?
        newService.setValue(intitule.text, forKey: "intituleService")
        newService.setValue(offreOuDemande.selectedSegmentIndex==0, forKey: "offreOuDemande")//offre: offreDemande==true
        newService.setValue(categorie, forKey: "categorie")
        newService.setValue(ddescription.text, forKey: "descriptionService")
        newService.setValue(identification.id, forKey: "initiateur")
        
        do{
            try contexte.save()
            //performSegueWithIdentifier("retourListeParCategorie", sender: 1)
            navigationController?.popViewControllerAnimated(false)
        }catch{
            print("Probleme lors du peuplement de la BDD")
            //tableCacheBDD[0]="BDD pas remplie"
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}