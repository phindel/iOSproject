//
//  OffreDemandeController.swift
//  HelpProject
//
//  Created by leo on 16/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
/*
Permet de visualiser un Service, de commenter et de voir les réponses

*/
//

import UIKit
import CoreData
import MapKit

class OffreDemandeController: UIViewController, MKMapViewDelegate{
    var identification: Identification!
    var idService:Int!
    
    @IBOutlet weak var initiateur: UILabel!
    
    
    
    @IBOutlet weak var boutonVoirReponses: UIButton!
    @IBOutlet weak var boutonRepondre: UIButton!
    @IBOutlet weak var localisationOnMap: MKMapView!
    
    @IBOutlet weak var libelleA_O: UILabel!
    
    
    @IBOutlet weak var datePubA_O: UILabel! //date de début
    
    
    @IBOutlet weak var dateFin: UILabel!
    
    
    
    @IBOutlet weak var descriptionA_O: UILabel!
    
    
    @IBOutlet weak var budgetA_O: UILabel!
    
    var services = [NSManagedObject]()
    
    @IBOutlet weak var titreVue: UINavigationItem!
    @IBAction func entrerContact(sender: AnyObject, forEvent event: UIEvent) {
        
    }
    override func viewDidLoad() {
            super.viewDidLoad()
        
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        let req=NSFetchRequest(entityName: "Service")
        req.returnsObjectsAsFaults=false
        boutonVoirReponses.enabled=identification != nil
        boutonRepondre.enabled=identification != nil
        
        req.predicate=NSPredicate(format: "idService = %@", NSString(format:"%d",idService))
        var initiateurNum=0
        do{
            let res=try contexte.executeFetchRequest(req)
            if res.count>0{
                
                for r in res as! [NSManagedObject]{
                    
                    
                    
                    //print(r.valueForKey("nomCategorie")!)
                    //(num: ((r.valueForKey("idService")!) as? Int)!,nom: ((r.valueForKey("intituleService")!) as? String)!)
                    var type=""
                    if(((r.valueForKey("offreOuDemande")!) as? Bool)! ){
                        type="Offre"
                    }else{
                        type="Demande"
                    }
                    initiateurNum = ((r.valueForKey("initiateur")!) as? Int)!
                    title = type + " " + ((r.valueForKey("intituleService")!) as? String)!
                    
                    libelleA_O.text = "Nom:" + ((r.valueForKey("intituleService")!) as? String)!
                    
                    budgetA_O.text = "Budget: " +  String(((r.valueForKey("coutService") as? Double!))!) + " euros"
                    
                    descriptionA_O.text = "Description: " +  ((r.valueForKey("descriptionService") as? String)!)
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "hh:mm"
                   datePubA_O.text = "Début: " +  dateFormatter.stringFromDate(((r.valueForKey("dateDebutDispo") as? NSDate)!))
                    dateFin.text = "Fin: " +  dateFormatter.stringFromDate(((r.valueForKey("dateFinDispo") as? NSDate)!))
                   
                    /*
                    
                    */
                    
                    
                }
            }
        }catch{
            print("Echec du fetch!")
        }
        let req2=NSFetchRequest(entityName: "Person")
        req2.returnsObjectsAsFaults=false
        req2.predicate=NSPredicate(format: "idPerson = %@", NSString(format:"%d",initiateurNum))
        var initiateurText=""
        var initiateurNote:Double=0
        do{
            let res=try contexte.executeFetchRequest(req2)
            if res.count>0{
                for r in res as! [NSManagedObject]{
                    initiateurText = "Initiateur: " + ((r.valueForKey("login")!) as? String)!
                }
            }
        }catch{
            print("Echec du fetch!")
        }
        
        let req3=NSFetchRequest(entityName: "NotePerson")
        req3.returnsObjectsAsFaults=false
        req3.predicate=NSPredicate(format: "idPerson = %@", NSString(format:"%d",initiateurNum))
        
        do{
            let res=try contexte.executeFetchRequest(req3)
            
            if res.count>0{
                let iCount:Double=1/(Double(res.count))
                for r in res as! [NSManagedObject]{
                    let mul=Double(((r.valueForKey("note")!) as? Int)!) * iCount
                    initiateurNote+=mul
                }
            }
        }catch{
            print("Echec du fetch!")
        }
        
        if(initiateurNote>0){
            initiateurText = initiateurText + " (noté " + (NSString(format:"%.1f",initiateurNote) as String) + " )"
        }else{
            initiateurText = initiateurText + " (non noté)"
        }
        initiateur.text=initiateurText
        /*
            Chargement des coordonnées sur la map!
        */
        
        
        
        
        }
    
    func getServiceInfo(id : integer_t) {
        
        
        
        }

        func printInfoService()
        {
            
            
            
        }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier=="voirReponse"){
            
            let dvc=segue.destinationViewController as! ListeReponsesController
            dvc.identification=identification
            dvc.idService=idService
        }
        if(segue.identifier=="repondre"){
            
            let dvc=segue.destinationViewController as! RepondreController
            dvc.identification=identification
            dvc.idService=idService
        }
    }
    //
    
    
    
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