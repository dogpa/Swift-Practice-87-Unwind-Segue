//
//  SaveMoneyType.swift
//  Swift Practice # 87 Unwind Segue
//
//  Created by Dogpa's MBAir M1 on 2021/10/4.
//

import Foundation


struct MoneyStruct:Codable {
    var itemName:String
    var itemPrice:String
    
    static func saveInfo (_ moneyInfo:[MoneyStruct]) {
        let encoder = JSONEncoder()
        guard let date = try? encoder.encode(moneyInfo) else { return }
        UserDefaults.standard.set(date, forKey: "list")
    }
    
    static func LoadInfo() ->[MoneyStruct]? {
        let userDeFult = UserDefaults.standard
        guard let data = userDeFult.data(forKey: "list") else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode([MoneyStruct].self, from: data)
    }
    
}
