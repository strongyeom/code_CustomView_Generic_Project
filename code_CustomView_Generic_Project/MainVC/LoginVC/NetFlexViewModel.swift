//
//  NetFlexViewModel.swift
//  code_CustomView_Generic_Project
//
//  Created by 염성필 on 2023/09/12.
//

import Foundation

class NetFlexViewModel {
    var email = Observable("")
    var password = Observable("")
    var nickname = Observable("")
    var location = Observable("")
    var recommend = Observable("")
    var isVaild = Observable(false)
    var isTextVaild = Observable(false)
    // 유효성 검사
    func checkVaildation() {
        print("\(email.value)")
        print("\(password.value)")
        print("\(nickname.value)")
        print("\(location.value)")
        print("\(recommend.value)")
        
        if email.value.count >= 6 &&
            password.value.count >= 4 && nickname.value.count >= 6 && location.value.count >= 6 && recommend.value.count >= 6 {
            isVaild.value = true
        } else {
            isVaild.value = false
        }
    }
    
    func emailAndPasswordVaildataion() {
        if email.value.count >= 6 && password.value.count >= 4 {
            isTextVaild.value = true
        } else {
            isTextVaild.value = false
        }
    }
    
    
    
    
    
}
