//
//  RxBidMVVMModel.swift
//  RxBidMVVM
//
//  Created by 荒川大樹 on 2020/02/02.
//  Copyright © 2020 rkw1316. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct Item{
    var itemID = ""
    var details = [Detail()]
}

struct Detail{
    var detailID = ""
    var value = ""
    var cellType : CellType = .none
    var row :[String]? = nil
    var multiDetail :[MultiDetail]? = nil
}

struct MultiDetail{
    var multiDetailID = ""
    var value = ""
    var trigerDetailID = ""
    var trigerValue = ""
    var cellType : CellType = .select
    var row :[String]? = nil
    var multiDetail :[Detail]? = nil
}

class FormatModel: NSObject {
    
    var Format:[Item] = [
        Item(itemID: "娯楽", details:[
            Detail(detailID: "機種", cellType: .select, row:["PS4","PSP"]),
            Detail(detailID: "ソフト", cellType: .multi, multiDetail:[
//                MultiDetail(detailID: "PS4", cellType: .select, row: ["a","b"]),
//                MultiDetail(detailID: "PSP", cellType: .select, row: ["c","d"])
            ]),
        ])
    ]
    static let shaerd = FormatModel()
    
    
    func reset(now:[CellViewModel]) -> [CellViewModel]{
        let tmp = now
//        if tmp[0].strRelay.value == "トイレ" {
//            tmp[1].cellType = .select
//            tmp[1].str = "尿量a"
//            tmp[1].strAryRelay = BehaviorRelay<[String]>(value: ["なしa","ありa","拒否a"])
//        } else if tmp[0].strRelay.value == "おむつ" {
//            tmp[1].cellType = .select
//            tmp[1].str = "尿量b"
//            tmp[1].strAryRelay = BehaviorRelay<[String]>(value: ["なしb","ありb","拒否b"])
//        } else {
//            tmp[1].cellType = .intger
//            tmp[1].str = "尿量c"
//            tmp[1].strAryRelay = BehaviorRelay<[String]>(value: ["なしc"])
//        }
        return tmp
    }
    
}
