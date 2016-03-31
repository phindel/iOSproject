//
//  ListeReponsesController.swift
//  HelpProject
//
//  Created by leo on 25/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//

import UIKit
import CoreData

class ListeReponsesController: BDDTableViewController {
    
    var idService:Int!
    
    /*override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)*/
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiser("Message", champAAfficherBDD: "__inutile__")
    }
    
    
    
    
    
    var identification: Identification!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var listeDesDemandes=false
    var categorie=""
    // MARK: - Table view data source
    
    override func ajouterDansTable(c:Int,r:NSManagedObject ){
        tableCacheBDD[c]=NumEtNom(num: ((r.valueForKey("idMsg")!) as? Int)!,nom: ((r.valueForKey("sujet")!) as? String)!)//((r.valueForKey("b")!) as? String)!
        //msgContent
    }
    override func ajouterCritere(req:NSFetchRequest){
        let ser=NSString(format:"%d",idService)
        req.predicate=NSPredicate(format: " (idService=%@ ) and (statutAttenteAccepteIgnore='attente')",ser)
        //
    }//attente", forKey: "statutAttenteAccepteIgnore
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("tableView cellForRowAtIndexPath")
        let cell = tableView.dequeueReusableCellWithIdentifier("typeReponse", forIndexPath: indexPath)
        let nen=tableCacheBDD[indexPath.item] as! NumEtNom as NumEtNom!
        cell.textLabel!.text=nen.nom//categorie
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("voirReponse", sender: indexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="voirReponse"){
            if let indice = tableView.indexPathsForSelectedRows{
                let dvc=segue.destinationViewController as! VoirReponseController
                //print((indice.first?.item)!)
                let nen=tableCacheBDD[(indice.first?.item)!] as! NumEtNom as NumEtNom!
                //dvc.categorie=nen.nom//tableCacheBDD[(indice.first?.item)!] as! String as String!
                //dvc.identification=identification
                dvc.identification=identification
                dvc.idMsg=nen.num
                dvc.idService=idService
            }
        }
        
        
    }
    
    
}
