import UIKit
import RxSwift
import RxCocoa

class PickerTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    var dataList = [String]()
    var preText:String?

    init() {
        super.init(frame: CGRect.zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setup(dataList: [String]) {
        self.dataList = dataList

        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self

        let toolbar = UIToolbar(frame: CGRect(x : 0, y : 0, width : 0, height : 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:#selector(cancel))
        toolbar.setItems([cancelItem, doneItem], animated: true)

        self.inputView = picker
        self.inputAccessoryView = toolbar
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = dataList[row]
    }

    @objc func cancel() {
        self.text = preText
        self.endEditing(true)
    }

    @objc func done() {
        preText = self.text
        self.endEditing(true)
    }
    deinit{
        Logger.dein(type(of: self).description())
    }

}


class KeyBoardTextField: UITextField, UITextFieldDelegate {

    var preText:String?
    
    init() {
        super.init(frame: CGRect.zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setup(dataList: [String]) {

        let toolbar = UIToolbar(frame: CGRect(x : 0, y : 0, width : 0, height : 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:#selector(cancel))
        toolbar.setItems([cancelItem, doneItem], animated: true)

        self.inputAccessoryView = toolbar
    }

    @objc func cancel() {
        self.text = preText
        self.endEditing(true)
    }

    @objc func done() {
        preText = self.text
        self.endEditing(true)
    }
    deinit{
        Logger.dein(type(of: self).description())
    }

}
