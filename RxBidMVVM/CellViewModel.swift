//
//  CellViewModel.swift
//  RxBidMVVM
//
//  Created by rkw1316 on 2020/02/02.
//  Copyright © 2020 rkw1316. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa



class CellViewModel {

    var index:Int = 0
    var str:String = ""
    var strRelay:BehaviorRelay<String?> = BehaviorRelay<String?>(value: "")
    var strAryRelay:BehaviorRelay<[String]> = BehaviorRelay<[String]>(value: [])
    var cellType:CellType = .none

    var aryRelay:PublishRelay<Int>? = PublishRelay<Int>()
    var bag = DisposeBag()
    
    init(index:Int = 0,
         str:String,
         type:CellType,
         strRelay:BehaviorRelay<String?>,
         strAryRelay:BehaviorRelay<[String]>,
         aryRelay:PublishRelay<Int>? = nil
    ){
        self.index = index
        self.str = str
        self.cellType = type
        self.strRelay = strRelay
        self.strAryRelay = strAryRelay
        self.aryRelay = aryRelay

        strRelay.skip(1).subscribe(onNext:{[unowned self] (str2) in
            Logger.subsc("\(self.index) " + str2!)
            self.aryRelay?.accept(self.index)
        }).disposed(by:bag)
        
    }
    
    deinit{
        Logger.dein("CellViewModel")
    }

}
