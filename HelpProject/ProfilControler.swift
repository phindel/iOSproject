//
//  ProfilControler.swift
//  HelpProject
//
//  Created by leo on 16/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//

import UIKit
import CoreData

class ProfilControler: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        rafraichir()
        
    }
    var login=""
    var identification: Identification!
    @IBAction func refresh(sender: UIRefreshControl) {
        refreshControl?.attributedTitle=NSAttributedString(string:"Chargement...")
        rafraichir()
        //tableCategories[1]+="j"
        self.tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    
    var t=0
    
    var tableCacheBDD=["","","","","","","","","","","","","","","","","",""]
    var classeBDD=""
    var champAAfficherBDD=""
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the number of rows
        return tableCacheBDD.count
    }
    func rafraichir(){
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        let req=NSFetchRequest(entityName: "Person")
        req.returnsObjectsAsFaults=false
        //NSFe
        //TODO recuperer les notes sur la personne (a-t-on une liste de {login,note,commentaire}, ou login est remplacé par un pointeur vers une personne?
        var c=0
        do{
            let res=try contexte.executeFetchRequest(req)
            if res.count>0{
                for r in res as! [NSManagedObject]{
                    //print(r.valueForKey("nomCategorie")!)
                    if c<tableCacheBDD.count{
                        tableCacheBDD[c]=((r.valueForKey(champAAfficherBDD)!) as? String)!
                    }
                    
                    c+=1//swift ne supporte pas c++
                    
                }
            }
        }catch{
            print("Echec du fetch!")
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("typeGen", forIndexPath: indexPath)
        let cell=UITableViewCell(style: .Value1, reuseIdentifier: "typeGen")
        cell.textLabel!.text=tableCacheBDD[indexPath.item]
        //cell.detailTextLabel!.text=tableCategories[indexPath.item]+" lol"
        cell.imageView!.image=UIImage(named: "rond.png")
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
