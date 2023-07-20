//
//  TableViewCell.swift
//  RxSwift_MarigoldBurger_Receipt
//
//  Created by 황홍필 on 2023/07/18.
//

import UIKit
import SnapKit

final class MenuCell: UITableViewCell {

    static let identifier = "MenuCell"
    
    
    let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    
    let menuName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-Semibold", size: 18)
        label.numberOfLines = 3
        return label
    }()
    
    
    let howManyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-Semibold", size: 18)
        label.text = "(0)"
        return label
    }()
    
    
    let howManyItemsCounter: UIStepper = {
        let stepper = UIStepper()
        stepper.maximumValue = 100 // Stepper 최대 수. 안 쓰면 기본값으로 100이 정해짐.
        stepper.minimumValue = 0 // Stepper 최소 수
        stepper.wraps = false // false: Stepper 최대 수에 도달하면 최소 수로 돌아가게 해줌
        stepper.autorepeat = true // 사용자가 버튼을 계속 누르고 있으면 계속해서 Stepper의 수가 올라감
        
        // Stepper 버튼이 눌릴 때마다 실행될 메소드를 적어놓는다.
//        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        return stepper
    }()
    
    
    
    let menuPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-Medium", size: 25)
        return label
    }()
    
  
    
    // MARK: - StackView
    
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [howManyItemsCounter, menuPrice])
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupSubview()
        howManyItemsCounter.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    func setupSubview() {
        self.addSubview(menuImageView)
        self.addSubview(menuName)
        self.addSubview(howManyLabel)
        self.addSubview(stackView)
        
    }
    
    
    func setupLayout() {
        menuImageView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.top.equalTo(self.snp.top).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.width.height.equalTo(100)
        }
        
        menuName.snp.makeConstraints { make in
            make.leading.equalTo(menuImageView.snp.trailing).offset(20)
            make.width.equalTo(130)
            make.centerY.equalToSuperview()
        }
        
        
        stackView.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.centerY.equalToSuperview()
        }
        
    }
    
    
    @objc func stepperValueChanged() {
        
    }
}
