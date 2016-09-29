//
//  UserDefaultsCache.swift
//  UserCache
//
//  Created by Nicolas Molina on 8/8/16.
//  Copyright © 2016 UserCache. All rights reserved.
//

import UIKit

public class UserDefaultsCache: UserCacheProtocol
{

    static let sharedInstance = UserDefaultsCache()

    public func dictionaryRepresentation() -> [String : AnyObject]
    {
        return NSUserDefaults.standardUserDefaults().dictionaryRepresentation()
    }

    public func get(key: String, defaultValue: AnyObject? = nil) -> AnyObject?
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        let value = defaults.objectForKey(key)

        if value == nil {
            return defaultValue
        }
        return value
    }

    public func put(key: String, value: AnyObject?)
    {
        if value == nil {
            remove(key)

        } else {
            let defaults = NSUserDefaults.standardUserDefaults()

            defaults.setObject(value, forKey: key)
            defaults.synchronize()
        }
    }

    public func has(key: String) -> Bool
    {
        return get(key) != nil
    }

    public func remove(key: String) -> AnyObject?
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        let value = get(key)

        defaults.removeObjectForKey(key)
        defaults.synchronize()

        return value
    }

}
