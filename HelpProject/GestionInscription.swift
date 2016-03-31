//
//  GestionInscription.swift
//  HelpProject
//
//  Created by tp on 31/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
//

import UIKit

class GestionInscription: UIViewController {
    
    
    @IBOutlet var personLogin: UITextField!
    @IBOutlet var passTwo: UITextField!
    @IBOutlet var passOne: UITextField!
    @IBOutlet var login: UITextField!
    
    
    @IBOutlet var numRue: UITextField!
    
    @IBOutlet var nomRue: UITextField!
    
    
    @IBOutlet var codePostal: UITextField!
    
    
    @IBOutlet var ville: UITextField!
    
    
    
    @IBAction func addNewPerson(sender: AnyObject) {
        
        var addressPerson = ""
        
        addressPerson += numRue.text!
        addressPerson += " "
        addressPerson += nomRue.text!
        addressPerson += codePostal.text!
        
        
        
        
    }
    

}
