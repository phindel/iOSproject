//
//  BDDTableViewController.swift
//  HelpProject
//  Classe abstraite pour afficher le contenu de table de base de données
//  Utilisé pour afficher les catégories, les offres et les demandes
//  Created by leo on 10/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//

import UIKit
import CoreData

class BDDTableViewController: UITableViewController {
    
    var tableCacheBDD=NSMutableArray()//["","","","","","","","","","","","","","","","","",""]
    private var classeBDD=""
    private var champAAfficherBDD=""
    

    func initialiser(classeBDD:String,champAAfficherBDD:String) {
        self.classeBDD=classeBDD
        self.champAAfficherBDD=champAAfficherBDD
        rafraichir()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the number of rows
        return tableCacheBDD.count
    }
    func ajouterDansTable(c:Int,r:NSManagedObject ){
        tableCacheBDD[c]=((r.valueForKey(champAAfficherBDD)!) as? String)!
    }
    func ajouterCritere(req:NSFetchRequest){
        
    }
    func rafraichir(){
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        let req=NSFetchRequest(entityName: classeBDD)
        req.returnsObjectsAsFaults=false
        ajouterCritere(req)
        tableCacheBDD.removeAllObjects()
        var c=0
        do{
            let res=try contexte.executeFetchRequest(req)
            if res.count>0{
                for r in res as! [NSManagedObject]{
                    //print(r.valueForKey("nomCategorie")!)
                    
                    ajouterDansTable(c,r:r)
                    
                    
                    c+=1 //swift ne supporte pas c++
                    
                }
            }
        }catch{
            print("Echec du fetch!")
        }
    }
    
}
