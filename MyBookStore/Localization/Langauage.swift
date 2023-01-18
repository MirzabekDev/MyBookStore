//
//  Langauage.swift
//  MyBookStore
//
//  Created by Mirzabek on 08/01/23.
//

import Foundation

extension Bundle{
    
    private static var bundle: Bundle!
    
    public static func localizeBundle() -> Bundle!{
    
        if bundle == nil{
        let appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "en"
        let path = Bundle.main.path(forResource: appLang, ofType: "lproj")
        bundle = Bundle(path: path!)
    }
  
    return bundle;
    
}
    
    public static func setLangauage(lang:String){
        UserDefaults.standard.set(lang, forKey: "apll_lang")
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        bundle = Bundle(path: path!)
    }
}

extension String{
    func localized() -> String{
        return NSLocalizedString(self, tableName: nil,bundle: .localizeBundle(),value: "",comment: "")
    }
    
    func localizeWithFormat(arguments: CVarArg...) -> String{
        return String(format: self.localized(), arguments: arguments)
    }
}
