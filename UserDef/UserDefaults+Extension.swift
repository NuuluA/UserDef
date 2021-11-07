//
//  UserDefaults+Extension.swift
//  UserDef
//
//  Created by Арген on 07.11.2021.
//

import Foundation

extension UserDefaults {
    private enum UserDefKeys: String {
        case switchIsOn
        case signedId
    }
    
    var switchIsOn: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefKeys.switchIsOn.rawValue)
        }
         
        set {
            setValue(newValue, forKey: UserDefKeys.switchIsOn.rawValue )
        }
    }
    
    var signedId: User? {
        get {
            if let data = object(forKey: UserDefKeys.signedId.rawValue) as? Data {
                let user = try? JSONDecoder().decode(User.self, from: data)
                return user
            }
            return nil
            
        }
        
        set {
            
            if newValue == nil {
                removeObject(forKey: UserDefKeys.signedId.rawValue)
            } else {
                let data = try? JSONEncoder().encode(newValue)
                setValue(data, forKey: UserDefKeys.signedId.rawValue)
            }
        }
    }
}
