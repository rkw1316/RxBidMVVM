//
//  KeyboardTableViewCell.swift
//  RxBidMVVM
//
//  Created by 荒川大樹 on 2020/02/01.
//  Copyright © 2020 rkw1316. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class KeyboardTableViewCell: AbsTableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var textField: KeyBoardTextField!

    var bag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setCell(_ vm: CellViewModel) {
        super.setCell(vm)
        self.bag = DisposeBag()
        self.name.text = vm.str
        self.textField.preText = vm.strRelay.value
        
        vm.strAryRelay.asDriver().do(onNext:{Logger.vm2ui("\(vm.index) \($0.description)")}).drive(onNext:{[unowned self] ary in self.textField.setup(dataList: ary)}).disposed(by: bag)
        vm.strRelay.asDriver().do(onNext:{Logger.vm2ui("\(vm.index) \($0!)")}).drive(textField.rx.text).disposed(by: bag)
        
        textField.rx.text.asControlProperty().sample(textField.rx.controlEvent(.editingDidEnd)).do(onNext:{Logger.ui2vm("\(vm.index) \($0!)")}).bind(to: vm.strRelay).disposed(by: bag)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    deinit{
        Logger.dein(type(of: self).description())
    }

}
