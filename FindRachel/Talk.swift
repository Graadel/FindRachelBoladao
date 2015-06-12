//
//  Talk.swift
//  FindRachel
//
//  Created by Thiago Gallego on 12/06/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class Talk
{
    //let destinatario: Person
    
    let remetente: Person
    
    var messsageList: [Message]
    
    init (remetente: Person, messsageList: [Message])
    {
        //self.destinatario = destinatario
        self.remetente = remetente
        self.messsageList = messsageList
    }
}
