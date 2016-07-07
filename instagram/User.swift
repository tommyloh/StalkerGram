//
//  User.swift
//  instagram
//
//  Created by Tommy Loh on 06/07/2016.
//  Copyright © 2016 Tommy Loh. All rights reserved.
//

import UIKit
import Foundation
class User: NSObject {

    
    class func signIn(uid: String){
        NSUserDefaults.standardUserDefaults().setValue(uid, forKeyPath: "uid")
    }
    
    class func isSignedIn() -> Bool {
        if let _ = NSUserDefaults.standardUserDefaults().valueForKey("uid") as? String {
            return true
        }else{
            return false
        }
    }
    
    class func currentUserUid() -> String?{
        return NSUserDefaults.standardUserDefaults().valueForKey("uid") as? String
    }
    

}
