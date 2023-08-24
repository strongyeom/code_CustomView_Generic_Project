//
//  NetflexDetailViewController.swift
//  code_CustomView_Generic_Project
//
//  Created by 염성필 on 2023/08/24.
//

import UIKit
import SnapKit

class NetflexDetailViewController: UIViewController {
    
    let backImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "bgImage")
        return image
    }()
    
    let coverView = {
       let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        return view
    }()
    
    let topview = TopAreaView()
    let middleView = MiddleView()
    let bottomView = BottomView()

    override func viewDidLoad() {
        super.viewDidLoad()
         
        [backImageView, topview, middleView, bottomView].forEach {
            view.addSubview($0)
        }
        
        backImageView.addSubview(coverView)
        
        backImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        coverView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        topview.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.1)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        
        middleView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.1)
            make.bottom.equalTo(bottomView.snp.top).offset(-20)
            
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        bottomView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.2)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
    
        
    }

}
