//
//  Logger.swift
//  RxBidMVVM
//
//  Created by rkw1316 on 2020/02/02.
//  Copyright © 2020 rkw1316. All rights reserved.
//

import UIKit

class Logger: NSObject {

    static func vm2ui(_ str:String? = "", line:Int = #line,funcName:String = #file){
        print("\((#function).split(separator: "(").map{String($0)}.first!) (\(funcName.split(separator: "/").map{String($0)}.last!):\(line)) ***:\(str ?? "nil")")
    }
    static func ui2vm(_ str:String? = "",line:Int = #line,funcName:String = #file){
        print("\((#function).split(separator: "(").map{String($0)}.first!) (\(funcName.split(separator: "/").map{String($0)}.last!):\(line)) ***:\(str ?? "nil")")
    }

    static func debug(_ str:String?,line:Int = #line,funcName:String = #file){
        print("\((#function).split(separator: "(").map{String($0)}.first!) (\(funcName.split(separator: "/").map{String($0)}.last!):\(line)) ***:\(str ?? "nil")")
    }

    static func subsc(_ str:String?,line:Int = #line,funcName:String = #file){
        print("\((#function).split(separator: "(").map{String($0)}.first!) (\(funcName.split(separator: "/").map{String($0)}.last!):\(line)) ***:\(str ?? "nil")")
    }

    static func info(_ str:String?,line:Int = #line,funcName:String = #file){
        print("\((#function).split(separator: "(").map{String($0)}.first!) (\(funcName.split(separator: "/").map{String($0)}.last!):\(line)) ***:\(str ?? "nil")")
    }
    
    static func dein(_ str:String?,line:Int = #line,funcName:String = #file){
        print("\((#function).split(separator: "(").map{String($0)}.first!) (\(funcName.split(separator: "/").map{String($0)}.last!):\(line)) ***:\(str ?? "nil")")
    }


}
