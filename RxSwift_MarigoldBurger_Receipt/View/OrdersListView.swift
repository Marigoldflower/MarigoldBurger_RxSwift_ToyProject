//
//  OrdersListView.swift
//  RxSwift_MarigoldBurger_Receipt
//
//  Created by 황홍필 on 2023/07/20.
//

import UIKit
import SnapKit

final class OrdersListView: UIView {

    // MARK: - UI 객체
    
    
    let yourOrder: UILabel = {
        let label = UILabel()
        label.text = "Your Order"
        label.font = UIFont(name: "Poppins-Semibold", size: 18)
        label.textColor = .black
        return label
    }()
    
    
    let itemsCount: UILabel = {
        let label = UILabel()
        label.text = "Items"
        label.font = UIFont(name: "Poppins-Semibold", size: 18)
        label.textColor = .systemGray
        return label
    }()
    
    
    let totalPrice: UILabel = {
        let label = UILabel()
        label.text = "₩ 10000"
        label.font = UIFont(name: "Poppins-Semibold", size: 40)
        label.textColor = .black
        return label
    }()
    
    
    
    // MARK: - 버튼
    
    
    let clearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-Semibold", size: 18)
        return button
    }()
    
    
    let orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Order", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-Semibold", size: 24)
        button.backgroundColor = .systemRed
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(yourOrder)
        self.addSubview(clearButton)
        self.addSubview(itemsCount)
        self.addSubview(totalPrice)
        self.addSubview(orderButton)
        
        setupLayout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    func setupLayout() {
        yourOrder.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.top.equalTo(self.snp.top).offset(16)
        }
        
        
        clearButton.snp.makeConstraints { make in
            make.leading.equalTo(yourOrder.snp.trailing).offset(20)
            make.top.equalTo(self.snp.top).offset(10)
        }
        
        
        itemsCount.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.top.equalTo(self.snp.top).offset(16)
        }
        
        
        totalPrice.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-30)
            make.top.equalTo(itemsCount.snp.bottom).offset(30)
            
        }
        
        
        orderButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom)
            
            
        }
        
    }
    
    
    
}
