//
//  ViewController.swift
//  RxBidMVVM
//
//  Created by rkw1316 on 2020/02/05.
//  Copyright © 2020 rkw1316. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        let userdef = UserDefaults.init(suiteName: "group.rk1316.test.build.setting.app.group.user.defined")!
        let userstad = UserDefaults.standard

        let str = userdef.string(forKey: "text")
        let str2 = userstad.string(forKey: "text")

        print(str ?? "a")
        userdef.set("text", forKey: "text")
        let str3 = userdef.string(forKey: "text")
        print(str3 ?? "a")

//        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
//            print("\(key) = \(value) \n")
//        }
//
//        let filePath = Bundle.main.path(forResource: "Settings.bundle/Root", ofType:"plist" )
//        let plist = NSDictionary(contentsOfFile: filePath!)
//        print(filePath)
        
        label?.text = (str ?? "a") + " " + (str2 ?? "b")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
