//
//  MainViewController.swift
//  mvvmProject
//
//  Created by sangdon kim on 2022/05/03.
//

import UIKit
import Combine

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var mainViewModel:MainViewModel = MainViewModel()
    
    var disposableBag = Set<AnyCancellable>()
    
    var tempArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: MainTableViewCell.cellID, bundle: nil), forCellReuseIdentifier: MainTableViewCell.cellID)
        
        // 뷰모델 상태 연동
        self.setBindings()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier:MainTableViewCell.cellID) as? MainTableViewCell else {return UITableViewCell()}
        cell.setData(strLable: tempArray[indexPath.row])
        return cell
    }

    /// 어레이추가
    /// - Parameter sender: 버튼 컨트롤
    @IBAction func addArrayButtonPressed(_ sender: UIButton) {
        mainViewModel.appendData()
    }
}


//============================================================
// MARK: - 뷰모델 관련
//============================================================
extension MainViewController {
    fileprivate func setBindings(){
        print("ViewController - setBindings")
        self.mainViewModel.$tempArray.sink { (array:[String]) in
            print("ViewController - updatedList.count: \(array.count)")
            self.tempArray = array
            self.tableView.reloadData()
        }.store(in: &disposableBag)
    }
}
