//
//  Member.swift
//  MemberList
//
//  Created by 신승재 on 3/7/24.
//

import UIKit


protocol MemberDelegate: AnyObject { // 클래스에서만 선언할 수 있는 프로토콜
    func addNewMember(_ member: Member)
    func update(index: Int, _ member: Member)
}

struct Member {
    
    lazy var memberImage: UIImage? = {
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    // 타입 저장 속성(누적으로 담을 수 있음)
    static var memberNumbers: Int = 0
    
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    // 생성자
    init(name: String? = nil, age: Int? = nil, phone: String? = nil, address: String? = nil) {
        
        self.memberId = Member.memberNumbers
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        // 멤버를 생성한다면 +1
        Member.memberNumbers += 1
    }
}
