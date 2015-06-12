//
//  Message.swift
//  FindRachel
//
//  Created by Thiago Gallego on 12/06/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class Message
{
    let text: String
    
    let owner: Person
    
    init (text: String, owner: Person)
    {
        self.text = text
        self.owner = owner
    }
}
    