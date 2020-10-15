//
//  CareTableViewModel.swift
//  RxBidMVVM
//
//  Created by rkw1316 on 2020/02/02.
//  Copyright © 2020 rkw1316. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CareTableViewModel{

    var cellViewModelAry : BehaviorRelay<[CellViewModel]> = BehaviorRelay(value:[])
    var editRelay:PublishRelay<Int> = PublishRelay<Int>()
    var bag = DisposeBag()

    init(){
        self.setup()
    }
    
    func setup(){
        cellViewModelAry = BehaviorRelay(value:[
            CellViewModel(
                index:0,
                str: "場所",
                type: .select ,
                strRelay: BehaviorRelay<String?>(value: "トイレ"),
                strAryRelay: BehaviorRelay<[String]>(value: ["トイレ","おむつ","バル"]),
                aryRelay: editRelay
            ),
            CellViewModel(index:1,str: "尿量",type: .select ,strRelay: BehaviorRelay<String?>(value: "なし"),strAryRelay: BehaviorRelay<[String]>(value: ["なし","あり","拒否"]),aryRelay: editRelay),
            CellViewModel(index:2,str: "状態",type: .select ,strRelay: BehaviorRelay<String?>(value: "1"),strAryRelay: BehaviorRelay<[String]>(value: ["1","10","100"]),aryRelay: editRelay),
            CellViewModel(index:3,str: "状態2",type: .intger ,strRelay: BehaviorRelay<String?>(value: "1"),strAryRelay: BehaviorRelay<[String]>(value: ["1","10","100"]),aryRelay: editRelay)
        ])
        
        editRelay.asSignal().emit(onNext:{[unowned self] (a) in
            Logger.debug(String(a))
            self.update()
        }).disposed(by:bag)

    }
    
    func update(){
        let tmp = cellViewModelAry.value
        FormatModel.shaerd.reset(now: tmp)
        cellViewModelAry.accept(tmp)
    }

    func createCell(_ tableView:UITableView,_ indexPath:IndexPath) -> AbsTableViewCell{
        let cell : AbsTableViewCell
        
        switch cellViewModelAry.value[indexPath.row].cellType {
        case .select:
            cell = tableView.dequeueReusableCell(withIdentifier: "PickerTableViewCell", for: indexPath) as! PickerTableViewCell
        case .intger:
            cell = tableView.dequeueReusableCell(withIdentifier: "KeyboardTableViewCell", for: indexPath) as! KeyboardTableViewCell
        default:
            cell = AbsTableViewCell()
        }
                
        cell.rx.sentMessage(#selector(UITableViewCell.prepareForReuse))
            .bind {[unowned self] (_) in
        }.disposed(by: bag)
        
        cell.setCell(cellViewModelAry.value[indexPath.row])


        return cell
    }
}
