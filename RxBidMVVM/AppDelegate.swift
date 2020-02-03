//
//  AppDelegate.swift
//  RxBidMVVM
//
//  Created by 荒川大樹 on 2020/02/01.
//  Copyright © 2020 rkw1316. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        //バンドルパスを取得
//        var path = Bundle.main.bundlePath
//        var settingPath = path.appendingPathComponent("Settings.bundle")
//        var plist = settingPath.appendingPathComponent("Root.plist")
//
//        //Root.plistの設定ディクショナリから、設定項目の配列を取得
//        var dic = NSDictionary(contentsOfFile:plist)
//        let nsary = dic?["PreferenceSpecifiers"]
//        var ary: [Any?] = (nsary as? [Any?])!
//
//        for item in ary {
//            print(item)
//        }
        
        let userdef = UserDefaults.init(suiteName: "group.rk1316.test.build.setting.app.group.user.defined")!
        let userstad = UserDefaults.standard

        let str = userdef.string(forKey: "text")
        let str2 = userstad.string(forKey: "text")
        let bo1 = userdef.bool(forKey: "enabled_preference")

        print(str ?? "a")
        print(bo1 ?? "b")

        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
            print("\(key) = \(value) \n")
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


extension String {

    private var ns: NSString {
        return (self as NSString)
    }

    public func substring(from index: Int) -> String {
        return ns.substring(from: index)
    }

    public func substring(to index: Int) -> String {
        return ns.substring(to: index)
    }

    public func substring(with range: NSRange) -> String {
        return ns.substring(with: range)
    }

    public var lastPathComponent: String {
        return ns.lastPathComponent
    }

    public var pathExtension: String {
        return ns.pathExtension
    }

    public var deletingLastPathComponent: String {
        return ns.deletingLastPathComponent
    }

    public var deletingPathExtension: String {
        return ns.deletingPathExtension
    }

    public var pathComponents: [String] {
        return ns.pathComponents
    }

    public func appendingPathComponent(_ str: String) -> String {
        return ns.appendingPathComponent(str)
    }

    public func appendingPathExtension(_ str: String) -> String? {
        return ns.appendingPathExtension(str)
    }
}

//extension UserDefaults {
//
//    /**
//     Setting.bundle の初期設定を NSUserDefaults に登録する
//
//     - parameter plistName: String
//     */
//    public static func registerSettingBundleDefaults(plistName: String = "Root") {
//        guard let plist = Bundle.main.path(forResource: plistName, ofType: "plist", inDirectory: "Settings.bundle") else {
//            return
//        }
//
//        let settings = NSDictionary(contentsOfFile: plist)!
//        guard let prefs = settings.object(forKey: "PreferenceSpecifiers") as? NSArray else {
//            return
//        }
//
//        let userDefaults = UserDefaults.standard
//        for pref in prefs {
//            guard let key = (pref as? Dictionary)["Key"]  else {
//                continue
//            }
//
//            let obj = userDefaults.object(forKey: key as! String)
//            if obj == nil {
//                guard let defaultValue = (pref as Any).object("DefaultValue")else {
//                    continue
//                }
//                userDefaults.set(defaultValue, forKey: key as! String)
//            }
//        }
//        userDefaults.synchronize()
//    }
//
//    /**
//     Setting.bundle の設定を NSUserDefaults から削除する（Setting.bundle の設定をリセットする）
//
//     - parameter plistName: String
//     */
//    public static func removeSettingBundleDefaults(plistName: String = "Root") {
//        guard let plist = Bundle.mainBundle.path(forResource: plistName, ofType: "plist", inDirectory: "Settings.bundle") else {
//            return
//        }
//
//        let settings = NSDictionary(contentsOfFile: plist)!
//        guard let prefs = settings.object(forKey: "PreferenceSpecifiers") as? NSArray else {
//            return
//        }
//
//        let userDefaults = UserDefaults.standard
//        for pref in prefs {
//            guard let key = (pref as AnyObject).objectForKey("Key") else {
//                continue
//            }
//            userDefaults.removeObjectForKey(key as! String)
//        }
//        userDefaults.synchronize()
//    }
//}
