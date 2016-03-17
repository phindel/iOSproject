//
//  OffreDemandeController.swift
//  HelpProject
//
//  Created by leo on 16/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class OffreDemandeController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var localisationOnMap: MKMapView!
    
    @IBOutlet weak var libelleA_O: UILabel!
    
    
    @IBOutlet weak var datePubA_O: UILabel!
    
    
    @IBOutlet weak var descriptionA_O: UILabel!
    
    
    @IBOutlet weak var budgetA_O: UILabel!
    
    
    @IBAction func entrerContact(sender: AnyObject, forEvent event: UIEvent) {
        
    }
    var identification: Identification!
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
        // MARK: - Table view data source
        
        
        
       /* override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            //let cell = tableView.dequeueReusableCellWithIdentifier("typeGen", forIndexPath: indexPath)
            let cell=UITableViewCell(style: .Value1, reuseIdentifier: "typeDemande")
            cell.textLabel!.text=categorie
            cell.detailTextLabel!.text="TODO"
            cell.imageView!.image=UIImage(named: "rond.png")
            
            return cell
    }*/
}