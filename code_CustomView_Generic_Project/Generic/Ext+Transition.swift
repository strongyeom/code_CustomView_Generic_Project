//
//  Ext+Transition.swift
//  code_CustomView_Generic_Project
//
//  Created by 염성필 on 2023/08/24.
//

import UIKit

extension UIViewController {
    
    func gotoTransition<T: UIViewController>(view: T) {
        let vc = view
       // present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
}
