//
//  CommentDate.swift
//  instagram
//
//  Created by 三坂真治 on 2019/07/15.
//  Copyright © 2019 shinji.misaka. All rights reserved.
//

import UIKit
import Firebase

class CommentData: NSObject {

    var name: String?
    var comment:String?
    var id: String?
    
    
    init(snapshot: DataSnapshot, myId: String) {
        
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: Any]
        
        self.name = valueDictionary["name"] as? String
        
        self.comment = valueDictionary["comment"] as? String
        
        }
}
