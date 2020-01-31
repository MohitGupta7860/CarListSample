//
//  ViewController.swift
//  CarDelaerSample
//
//  Created by Mohit on 29/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import UIKit

class DealerListViewController: UIViewController {
    lazy var viewModel: DealerDetailViewModel = {
        let viewModel = DealerDetailViewModel(dealerDetailsWebService: DealerDetailsWebService())
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDealerDeatails()
    }
    
    func getDealerDeatails() {
        viewModel.getDealerDetails {
            print(self.viewModel.dealerDetailList)
        }
    }
}

