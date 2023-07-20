//
//  ViewController.swift
//  RxSwift_MarigoldBurger_Receipt
//
//  Created by 황홍필 on 2023/07/18.
//

import UIKit
import SnapKit

final class MenuController: UIViewController {
    
    
    
    // MARK: - ViewModel
    
    let viewModel = MarigoldBurgerViewModel()
    
    
    // MARK: - UI 객체
    
    let tableView = UITableView()
    
    let ordersList: OrdersListView = {
        let view = OrdersListView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    
    
    // MARK: - StackView 생성
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tableView, ordersList])
        stack.spacing = 0
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        setupNavigation()
        setupDelegate()
        registerTableViewCell()
        setupLayout()
        
        ordersList.orderButton.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
        
    }
    
    func setupNavigation() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemRed
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // 내비게이션 바 버튼 색깔 설정 (< 이전으로 같은 버튼)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        // 내비게이션 바 타이틀 설정
        title = "Marigold Burger 🍔"
        
        appearance.configureWithTransparentBackground()  // 내비게이션 바 투명하게
        
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
    
    func setupDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func registerTableViewCell() {
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
        
    }
    
    
    func setupLayout() {
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(0)
            make.top.equalTo(view.snp.top).offset(0)
            make.trailing.equalTo(view.snp.trailing).offset(0)
            make.bottom.equalTo(view.snp.bottom)
        }
        
       
        ordersList.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
    }
    
    
    
    @objc func orderButtonTapped() {
        let vc = ReceiptController()
        // 내비게이션 바로 다음화면 넘어가기
        navigationController?.pushViewController(vc, animated: true)
    }

    
}

extension MenuController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.marigoldBurgerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
        
        cell.selectionStyle = .none
        cell.menuImageView.image = viewModel.marigoldBurgerArray[indexPath.row].menuImage
        cell.menuName.text = viewModel.marigoldBurgerArray[indexPath.row].menuName
        cell.menuPrice.text = String(viewModel.marigoldBurgerArray[indexPath.row].menuPrice)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
    
}


extension MenuController: UITableViewDelegate {
    
}
