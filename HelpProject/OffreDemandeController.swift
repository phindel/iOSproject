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

class OffreDemandeController: UIViewController, MKMapViewDelegate{
    var identification: Identification!
    var idService:Int!
    @IBOutlet weak var localisationOnMap: MKMapView!
    
    @IBOutlet weak var libelleA_O: UILabel!
    
    
    @IBOutlet weak var datePubA_O: UILabel!
    
    
    @IBOutlet weak var descriptionA_O: UILabel!
    
    
    @IBOutlet weak var budgetA_O: UILabel!
    
    var services = [NSManagedObject]()
    
    @IBAction func entrerContact(sender: AnyObject, forEvent event: UIEvent) {
        
    }
    override func viewDidLoad() {
            super.viewDidLoad()
       
        
            datePubA_O.text = " "
            libelleA_O.text = " "
            budgetA_O.text = " "
            descriptionA_O.text = " "
        
        }
    
    func getServiceInfo(id : integer_t) {
        
        
        
        }

        func printInfoService()
        {
            
            
            
        }
    
    
    func tableView( tableView: UITableView, numBerOfRowsInSection section : Int) ->Int {
        return services.count
    }
    
    func listService ( tableView: UITableView, cellForRowAtIndexPath indexPath : NSIndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idService")
        
        let service = services[indexPath.row]
        
        cell!.textLabel!.text = service.valueForKey("idService") as? String
        
        return cell!
    }
    
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