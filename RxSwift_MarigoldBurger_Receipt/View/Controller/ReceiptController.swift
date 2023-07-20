//
//  ReceiptController.swift
//  RxSwift_MarigoldBurger_Receipt
//
//  Created by 황홍필 on 2023/07/18.
//

import UIKit
import SnapKit

final class ReceiptController: UIViewController {

    
    
    // MARK: - UI 객체
    
    // MARK: - Ordered List
    
    
    let orderedItemsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ordered Item"
        label.font = UIFont(name: "Poppins-Semibold", size: 24)
        label.textColor = .black
        return label
    }()
    
    
    let orderedList: UILabel = {
        let label = UILabel()
        label.text = "List"
        label.font = UIFont(name: "Poppins-Semibold", size: 21)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    
    lazy var orderedStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [orderedItemsLabel, orderedList])
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        return stack
    }()
    
    
    
    // MARK: - Price to pay
    
    let priceToPayLabel: UILabel = {
        let label = UILabel()
        label.text = "Price to pay"
        label.font = UIFont(name: "Poppins-Semibold", size: 24)
        label.textColor = .black
        return label
    }()
    
    
    
    // MARK: - Items
    
    let itemsLabel: UILabel = {
        let label = UILabel()
        label.text = "Items"
        label.font = UIFont(name: "Poppins-Semibold", size: 22)
        label.textColor = .systemGray
        return label
    }()
    
    
    let itemsPrice: UILabel = {
        let label = UILabel()
        label.text = "₩ 10000"
        label.font = UIFont(name: "Poppins-Semibold", size: 24)
        label.textColor = .black
        return label
    }()
    
    
    
    lazy var itemsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [itemsLabel, itemsPrice])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    
    
    // MARK: - VAT
    
    
    
    let vatLabel: UILabel = {
        let label = UILabel()
        label.text = "VAT"
        label.font = UIFont(name: "Poppins-Semibold", size: 22)
        label.textColor = .systemGray
        return label
    }()
    
    
    let vatPrice: UILabel = {
        let label = UILabel()
        label.text = "₩ 10000"
        label.font = UIFont(name: "Poppins-Semibold", size: 24)
        label.textColor = .black
        return label
    }()
    
    
    
    lazy var vatStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [vatLabel, vatPrice])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    
    
    // MARK: - Total Price
    
    let totalPrice: UILabel = {
        let label = UILabel()
        label.text = "₩ 10000"
        label.font = UIFont(name: "Poppins-Semibold", size: 40)
        label.textColor = .black
        return label
    }()
    
    
    // MARK: - Total StackView
    
    
    lazy var totalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [priceToPayLabel, itemsStackView, vatStackView])
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fill
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupLayout()
        
    }
    
    
    func setupSubviews() {
        view.addSubview(orderedStackView)
        view.addSubview(totalStackView)
        view.addSubview(totalPrice)
    }
    

    
    func setupLayout() {
        
        orderedStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(10)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        totalStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(10)
            make.trailing.equalTo(view.snp.trailing).offset(-10)
            make.top.equalTo(orderedStackView.snp.bottom).offset(140)
        }
        
        
        totalPrice.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(10)
            make.trailing.equalTo(view.snp.trailing).offset(-10)
            make.top.equalTo(totalStackView.snp.bottom).offset(30)
        }
        
    }
    

    

}
