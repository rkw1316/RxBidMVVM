//
//  CareTableViewController.swift
//  RxBidMVVM
//
//  Created by rkw1316 on 2020/02/01.
//  Copyright © 2020 rkw1316. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum CellType{
    case none
    case select
    case intger
    case multi
}

class CareTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate let refreshCtl = UIRefreshControl()
    private var cellHeightList: [IndexPath: CGFloat] = [:]
    var viewModel:CareTableViewModel? = nil
    
    var tableRelay:PublishRelay<Int> = PublishRelay<Int>()
    var bag       = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PickerTableViewCell", bundle: nil), forCellReuseIdentifier: "PickerTableViewCell")
        tableView.register(UINib(nibName: "KeyboardTableViewCell", bundle: nil), forCellReuseIdentifier: "KeyboardTableViewCell")
        
        tableView.refreshControl = refreshCtl
        refreshCtl.addTarget(self, action: #selector(CareTableViewController.refresh(sender:)), for: .valueChanged)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
//        tableRelay.asSignal().emit(onNext: {[unowned self] (index) in
//            self.viewModel?.setup()
//            self.reload(row: index)
//        }).disposed(by: bag)
        
        self.setup()
    }
    
    func reload(row:Int? = nil){
        guard let row = row else {
            self.tableView.reloadData()
            return
        }

        let indexPath = IndexPath(row: row, section: 0)
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }

    @objc func refresh(sender: UIRefreshControl) {
        bag = DisposeBag()
        self.setup()
        sender.endRefreshing()
    }
    
    func setup(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {[unowned self] in
            self.viewModel = CareTableViewModel()
            
            self.viewModel?.cellViewModelAry.skip(1).subscribe(onNext: {[unowned self]  (cvm) in
                Logger.info(cvm.map{$0.strRelay.value}.description)
                self.tableView.reloadRows(at: [IndexPath(row:1,section: 0)], with: .none)
            }).disposed(by: self.bag)
            
            self.tableView.reloadData()
        }
    }

    func createCell(_ tableView:UITableView,_ indexPath:IndexPath) -> AbsTableViewCell{
        return viewModel!.createCell(tableView,indexPath)
    }











    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.cellViewModelAry.value.count ?? 0
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createCell(tableView,indexPath)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//
//          guard let height = self.cellHeightList[indexPath] else {
//            return UITableView.automaticDimension
//          }
//          return height
          return UITableView.automaticDimension
      }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

           if !self.cellHeightList.keys.contains(indexPath) {
               // キャッシュする
               self.cellHeightList[indexPath] = cell.frame.height
           }

//           if indexPath.row == viewModel.count - 1 {
//               // 次の分をページング
//               fetch(isPaging: true, completion: {})
//           }
       }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
