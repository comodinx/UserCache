UserCache
=========
[![Version](http://img.shields.io/cocoapods/v/UserCache.svg?style=flat)](http://cocoapods.org/pods/UserCache) [![Platform](http://img.shields.io/cocoapods/p/UserCache.svg?style=flat)](http://cocoapods.org/pods/UserCache) [![License](http://img.shields.io/cocoapods/l/UserCache.svg?style=flat)](LICENSE)


Índice
------

* [Features][features].
* [Prerequisites][prerequisites].
* [Installation][Installation].
* [How to Use][how_to_use].
    + [Example][how_to_use_example].
    + [API][how_to_use_api].
* [License][license].


Features
--------
* Easy to use
* Default cache protocol use user defaults


Prerequisites
-------------
* iOS 8+
* Xcode 7+
* Swift 2.0


Installation
------------
UserCache is available through CocoaPods. To install it, simply add the following line to your Podfile:
```
pod "UserCache"
```


How to Use
----------
Check out the demo project for a concrete example.

#### Example
``` swift
// String
UserCache.put("string", value: "This is a string")
print("Key: string\nValue: \(UserCache.get("string"))")

// Number
UserCache.put("number", value: 20.3)
print("Key: number\nValue: \(UserCache.get("number"))")

// JSON
UserCache.put("json", value: ["key": "value"])
print("Key: json\nValue: \(UserCache.get("json"))")

// NSData
UserCache.put("data", value: NSData(bytes: [0xFF, 0xD9] as [UInt8], length: 2))
print("Key: data\nValue: \(UserCache.get("data"))")

print("------------------------------")

// Remove an object from the cache
UserCache.remove("string")
print("Remove Key: string\nValue: \(UserCache.get("string"))")

print("------------------------------")

// Set expired key in 2 seconds
UserCache.put("string", value: "This is a string key expired in 2 seconds", seconds: 2)
print("Expired Key: string\nValue: \(UserCache.get("string"))")
print("Sleep 3 seconds")
dispatch_after(
    dispatch_time(
        DISPATCH_TIME_NOW,
        Int64(3 * Double(NSEC_PER_SEC))
    ),
    dispatch_get_main_queue(),
    {
        self.print("Expired Key: string\nValue: \(UserCache.get("string"))")
    }
)

// Clean the cache
// UserCache.clear()

// Clean expired keys from cache
// UserCache.cleanExpirated()
```

#### API

##### UserCache.DEFAULT_CACHE_SECONDS = 60

##### UserCache.get(key: String, defaultValue: AnyObject? = nil)

Return value for `key` in cache. If not has `key` in cache return `defaultValue`.

```swift
UserCache.get("exist.key")                        // return value for "exist.key"
UserCache.get("not.exist.key")                    // return nil, because "not.exist.key" not exist in cache
UserCache.get("not.exist.key2", defaultValue: 10) // return 10, because "not.exist.key" not exist in cache, but defaultValue is set
```

##### UserCache.put(key: String, value: AnyObject?, seconds: Int = DEFAULT_CACHE_SECONDS)

Put `value` for `key` in cache. Expired in `seconds`.

```swift
UserCache.put("a.key", value: 10)                   // Expired in DEFAULT_CACHE_SECONDS
UserCache.put("a.key2", value: 10, seconds: 5 * 60) // Expired in 5 minutes
```

##### UserCache.has(key: String)

Return `true` if has value for `key` in cache, else `false`.

```swift
UserCache.has("exist.key")     // return true
UserCache.has("not.exist.key") // return false
```

##### UserCache.remove(key: String)

Return value for `key` in cache if exist, and remove this key in cache.

```swift
UserCache.remove("exist.key")     // return value for "exist.key"
UserCache.remove("not.exist.key") // return nil, because "not.exist.key" not exist in cache
```

##### UserCache.clear()

Return remove all keys in cache.

```swift
UserCache.clear()
```

##### UserCache.cleanExpirated()

Return remove expirated keys in cache.

```swift
UserCache.cleanExpirated()
```

##### UserCache.isExpirated()

Return `true` if `key` in cache is expired, else `false`.

```swift
UserCache.put("a.key2", value: 10, seconds: 5 * 60) // Expired in 5 minutes

// Delay 6 minutes

UserCache.isExpirated("a.key2") // return true
```

License
-------
UserCache is available under the MIT license. See the LICENSE file for more info.

<!-- deep links -->
[features]: #features
[screenshots]: #screen-shots
[prerequisites]: #prerequisites
[installation]: #installation
[how_to_use]: #how-to-use
[how_to_use_example]: #example
[how_to_use_api]: #api
[license]: #license
