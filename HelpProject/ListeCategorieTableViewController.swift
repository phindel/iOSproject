//
//  ListeCategorieTableViewController.swift
//  HelpProject
//
//  Created by tp on 08/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//

import UIKit
import CoreData

class ListeCategorieTableViewController: UITableViewController {
    
    var table1=["Ayy","fdg","V","","","8"]
    @IBAction func remplirBDD(sender: AnyObject) {
        table1[1]="rb"
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        let newCat=NSEntityDescription.insertNewObjectForEntityForName("Categorie", inManagedObjectContext: contexte)
        newCat.setValue(1, forKey: "idCategorie")
        newCat.setValue("cat 1", forKey: "nomCategorie")
        let newCat2=NSEntityDescription.insertNewObjectForEntityForName("Categorie", inManagedObjectContext: contexte)
        newCat2.setValue(2, forKey: "idCategorie")
        newCat2.setValue("cat 2", forKey: "nomCategorie")
        let newCat3=NSEntityDescription.insertNewObjectForEntityForName("Categorie", inManagedObjectContext: contexte)
        newCat3.setValue(3, forKey: "idCategorie")
        newCat3.setValue("cat 3", forKey: "nomCategorie")
        
        do{
            try contexte.save()
            table1[0]="BDD remplie"
        }catch{
            print("Probleme lors du peuplement de la BDD")
            table1[0]="BDD pas remplie"
        }
        
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the number of rows
        return table1.count
    }
    func rafraichir(){
        //table1[1]+="j"
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let contexte:NSManagedObjectContext=appDel.managedObjectContext
        let req=NSFetchRequest(entityName: "Categorie")
        req.returnsObjectsAsFaults=false
        print("rafraichir()")
        table1[0]="rafraichir()"
        var c=0
        do{
            let res=try contexte.executeFetchRequest(req)
            if res.count>0{
                for r in res as! [NSManagedObject]{
                    //print(r.valueForKey("nomCategorie")!)
                    if c<table1.count{
                        table1[c]=((r.valueForKey("nomCategorie")!) as? String)!
                    }
                    
                    c+=1//swift ne supporte pas c++
                    
                }
            }
        }catch{
            print("Echec du fetch!")
        }
    }
    
    
    
    @IBAction func refresh(sender: UIRefreshControl) {
        refreshControl?.attributedTitle=NSAttributedString(string:"yo man")
        rafraichir()
        table1[1]+="j"
        self.tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    func refresh2(sender: UIRefreshControl) {
        
    }
    
    var t=0
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("typeGen", forIndexPath: indexPath)
        let cell=UITableViewCell(style: .Value1, reuseIdentifier: "typeGen")
        cell.textLabel!.text=table1[indexPath.item]
        cell.detailTextLabel!.text=table1[indexPath.item]+" lol"
        cell.imageView!.image=UIImage(named: "rond.png")
        
        return cell
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("segueListeParCat", sender: indexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="segueListeParCat"){
            if let indice = tableView.indexPathsForSelectedRows{
                let dvc=segue.destinationViewController as! ListeParCategorieController
                dvc.categorie=table1[(indice.first?.item)!]
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
