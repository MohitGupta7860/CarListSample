//
//  ViewController.swift
//  CarDelaerSample
//
//  Created by Mohit on 29/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import UIKit

class DealerListViewController: UIViewController {
    
    @IBOutlet weak var dealerDetailTableView: UITableView!
    
    lazy var viewModel: DealerDetailViewModel = {
        let viewModel = DealerDetailViewModel(dealerDetailsWebService: DealerDetailsWebService())
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getDealerDeatails()
    }
    
    func getDealerDeatails() {
        viewModel.getDealerDetails {
            DispatchQueue.main.async { [weak self] in 
                self?.dealerDetailTableView.reloadData()
            }
        }
    }
    
    func setupTableView() {
        dealerDetailTableView.register(UINib(nibName: "DealerDetailTableViewCell", bundle: nil),
                                       forCellReuseIdentifier: "DealerDetailTableViewCell")
    }
}

extension DealerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dealerDetailList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dealerDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DealerDetailTableViewCell",
                                                                            for: indexPath) as? DealerDetailTableViewCell
            else { return UITableViewCell() }
        let carDetail = viewModel.dealerDetailList[indexPath.row]
        let carMake = viewModel.getCarModelAndYear(carPriceDetails:(year: carDetail.year,
                                                                    carMake: carDetail.make,
                                                                    carModel: carDetail.model))
        let carPriceAddress = viewModel.getCarPriceMileAndAddress(carMake: (price: carDetail.currentPrice,
                                                                            carMileage: carDetail.mileage,
                                                                            dealerCity: carDetail.dealer.city,
                                                                            dealerState: carDetail.dealer.state))
        dealerDetailTableViewCell.updateDealerCellData(carMake: carMake ,
                                                       dealerDetail: carPriceAddress,
                                                       phoneNumber: carDetail.dealer.phone)
        return dealerDetailTableViewCell
    }
}

