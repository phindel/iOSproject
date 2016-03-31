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
        var latitude = 0.0
        var longitude = 0.0
        /*
        (CLLocationCoordiante2D) geoCodeUsingAddress: (NSString *)addressPersonn
        {
            NSString
            
        }
        */
        /*

        (CLLocationCoordinate2D) geoCodeUsingAddress:(NSString *)address
        {
        
        NSString *esc_addr =  [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
        NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
        if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\":" intoString:nil] && [scanner scanString:@"\"lat\":" intoString:nil]) {
        [scanner scanDouble:&latitude];
        if ([scanner scanUpToString:@"\"lng\":" intoString:nil] && [scanner scanString:@"\"lng\":" intoString:nil]) {
        [scanner scanDouble:&longitude];
        }
        }
        }
        CLLocationCoordinate2D center;
        center.latitude = latitude;
        center.longitude = longitude;
        return center;
        }

        */
        
        
        
        
        
        
        
        
    }
    

}
