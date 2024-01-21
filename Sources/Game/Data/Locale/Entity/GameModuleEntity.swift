//
//  File.swift
//  
//
//  Created by Magistra Apta on 19/01/24.
//

import Foundation
import RealmSwift

public class GameModuleEntity: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var backgroundImage = ""
    @objc dynamic var slug = ""
    @objc dynamic var released = ""
    @objc dynamic var rating = 0.0
    @objc dynamic var favorite = false
    
    
    
    public override static func primaryKey() -> String? {
        return "id"
    }
}
