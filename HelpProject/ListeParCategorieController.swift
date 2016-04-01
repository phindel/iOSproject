//
//  ListeParCategorieController.swift
//  HelpProject
//
//  Created by tp on 08/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
/*
Permet d'afficher les services correspondant à une catégorie (en séparant les offres et les demandes)
*/
//

import UIKit
import CoreData

class ListeParCategorieController: BDDTableViewController {
    @IBOutlet weak var choixOffreOuDemande: UISegmentedControl!

    @IBAction func selectionOffreOuDemande(sender: UISegmentedControl) {
        
        
        rafraichir()
        
        self.tableView.reloadData()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        rafraichir()
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initialiser("Service", champAAfficherBDD: "__inutile__")
        titreVue.title=categorie
        
        //TODO
        boutonAjouter.enabled = (identification != nil)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    @IBOutlet weak var boutonAjouter: UIBarButtonItem!
    @IBOutlet weak var titreVue: UINavigationItem!
    
    
    
    
    var identification: Identification!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var listeDesDemandes=false
    var categorie=""
    // MARK: - Table view data source

    override func ajouterDansTable(c:Int,r:NSManagedObject ){
        tableCacheBDD[c]=NumEtNom(num: ((r.valueForKey("idService")!) as? Int)!,nom: ((r.valueForKey("intituleService")!) as? String)!)//((r.valueForKey("b")!) as? String)!
    }
    override func ajouterCritere(req:NSFetchRequest){
        req.predicate=NSPredicate(format: "(categorie = %@) and (offreOuDemande=%@)", categorie,choixOffreOuDemande.selectedSegmentIndex==0)
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("tableView cellForRowAtIndexPath")
        let cell = tableView.dequeueReusableCellWithIdentifier("typeDemande", forIndexPath: indexPath)
        //let cell=UITableViewCell(style: .Value1, reuseIdentifier: "typeDemande")
        let nen=tableCacheBDD[indexPath.item] as! NumEtNom as NumEtNom!
        cell.textLabel!.text=nen.nom//categorie
        //cell.detailTextLabel!.text="TODO"
        //cell.imageView!.image=UIImage(named: "rond.png")
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("afficherDetailsOfferOrAnnonce", sender: indexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="afficherDetailsOfferOrAnnonce"){
            if let indice = tableView.indexPathsForSelectedRows{
                let dvc=segue.destinationViewController as! OffreDemandeController
                print((indice.first?.item)!)
                let nen=tableCacheBDD[(indice.first?.item)!] as! NumEtNom as NumEtNom!
                //dvc.categorie=nen.nom//tableCacheBDD[(indice.first?.item)!] as! String as String!
                dvc.identification=identification
                dvc.idService=nen.num
            }
        }
        if(segue.identifier=="nouveauService"){
            
            let dvc=segue.destinationViewController as! NouveauServiceController
            dvc.identification=identification
            dvc.categorie=categorie
        }
        
    }
    
    

    

    

}
