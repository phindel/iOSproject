//
//  IdEtNom.swift
//  HelpProject
//
//  Created by leo on 17/03/2016.
//  Copyright © 2016 del_leo. All rights reserved.
/*
Pour usage dans une classe héritant de BDDTableViewController (on pouvait aussi utiliser une map)
nom sert à f'affichage dans la TableView
num sert à identifier l'élément dans une table
num2 sert quand on en a besoin (s'il faut un autre identifiant)
*/
//



class NumEtNom{
    let num:Int
    let nom:String
    init(num:Int,nom:String){
        self.num=num
        self.nom=nom
    }
    var num2=0
}