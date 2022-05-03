//
//  MainViewModel.swift
//  mvvmProject
//
//  Created by sangdon kim on 2022/05/03.
//

import Foundation
import Combine


class MainViewModel : ObservableObject {
    
    init() {
        print("init viewModel")
    }
    var appendingCount:Int = 0
    var addingArray = ["array 1","array 2","array 3","array 4","array 5"]
    
    @Published var tempArray:[String] = []
}

extension MainViewModel {
    func appendData(){
        appendingCount = appendingCount + 1
        let tempAddingArray = addingArray.map {
            $0.appending(String(appendingCount))
        }
        self.tempArray += tempAddingArray
        
    }
}
