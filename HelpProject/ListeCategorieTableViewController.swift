//
//  ListeCategorieTableViewController.swift
//  HelpProject
//
//  Created by tp on 08/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//
import UIKit
import CoreData


class ListeCategorieTableViewController: BDDTableViewController {
    

    @IBOutlet weak var boutonConnection: UIButton!
    
    
    //var table1=["Ayy","fdg","V","","","8"]
    //var tableCategories=["","","","","","","","","","","","","","","","","",""]
    var identification: Identification!
    
    @IBAction func remplirBDD(sender: AnyObject) {
        //tableCategories[1]="rb"
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
            
        }catch{
            print("Probleme lors du peuplement de la BDD")
            //tableCacheBDD[0]="BDD pas remplie"
        }
        
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiser("Categorie", champAAfficherBDD: "nomCategorie")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    /*let bdcache=BDDCache()
    func rafraichir(){
        bdcache.rafraichir()
    }*/
    
    
    
    @IBAction func refresh(sender: UIRefreshControl) {
        refreshControl?.attributedTitle=NSAttributedString(string:"Chargement...")
        rafraichir()
        //tableCategories[1]+="j"
        self.tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    
    var t=0
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("typeGen", forIndexPath: indexPath)
        let cell=UITableViewCell(style: .Value1, reuseIdentifier: "typeGen")
        cell.textLabel!.text=tableCacheBDD[indexPath.item] as! String as String!
        //cell.detailTextLabel!.text=tableCategories[indexPath.item]+" lol"
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
                dvc.categorie=tableCacheBDD[(indice.first?.item)!] as! String as String!
                dvc.identification=identification
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
