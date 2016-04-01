//
//  AttenteNotationController.swift
//  HelpProject
//
//  Created by leo on 31/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
/*
Liste des services à noter
*/
//


import UIKit
import CoreData

class AttenteNotationController: BDDTableViewController {
    
    
    /*override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)*/
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiser("Service", champAAfficherBDD: "__inutile__")
    }
    
    
    
    
    
    var identification: Identification!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func ajouterDansTable(c:Int,r:NSManagedObject ){
        var personneANoter=""
        if(((r.valueForKey("offreOuDemande")!) as? Bool)!){
            personneANoter="partenaire"
        }
        else{
            personneANoter="initiateur"
        }
        
        let nn=NumEtNom(num: ((r.valueForKey(personneANoter)!) as? Int)!,nom: ((r.valueForKey("intituleService")!) as? String)!)//((r.valueForKey("b")!) as? String)!
        nn.num2=((r.valueForKey("idService")!) as? Int)!
        tableCacheBDD[c]=nn
        //msgContent
    }
    override func ajouterCritere(req:NSFetchRequest){
        
        //cas offre: si on a accepte l'offre
        //cas demande: si on est le demandeur et qu'il y a un accepteur
        //req.predicate=NSPredicate(format: " ((offreOuDemande=true) and (partenaire=%@)) or ((offreOuDemande=false) and (initiateur=%@))",identification.id,identification.id)
        let id=NSString(format:"%d",identification.id)
        //req.predicate=NSPredicate(format: " ( partenaire=%@ ) ",NSString(format:"%d",id))
        req.predicate=NSPredicate(format: " ((offreOuDemande=true) and (partenaire=%@)) or ((offreOuDemande=false) and (initiateur=%@ and partenaire!=0))",id,id)
        
        //
    }//attente", forKey: "statutAttenteAccepteIgnore
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("tableView cellForRowAtIndexPath")
        let cell = tableView.dequeueReusableCellWithIdentifier("typeNotation", forIndexPath: indexPath)
        let nen=tableCacheBDD[indexPath.item] as! NumEtNom as NumEtNom!
        cell.textLabel!.text=nen.nom//categorie
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("segueNoter", sender: indexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="segueNoter"){
            if let indice = tableView.indexPathsForSelectedRows{
                let dvc=segue.destinationViewController as! NoterPersonController
                //print((indice.first?.item)!)
                let nen=tableCacheBDD[(indice.first?.item)!] as! NumEtNom as NumEtNom!
                //dvc.categorie=nen.nom//tableCacheBDD[(indice.first?.item)!] as! String as String!
                //dvc.identification=identification
                dvc.identification=identification
                dvc.personneANoter=nen.num
                dvc.idService=nen.num2
                
            }
        }
        
        
    }
    
    
}
