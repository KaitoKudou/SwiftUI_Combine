//
//  CombinePracticeApp.swift
//  CombinePractice
//
//  Created by 工藤海斗 on 2021/03/03.
//

import SwiftUI

@main
struct CombinePracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ConnpassTopView(connpassTopViewModel: ConnpassTopViewModel())
        }
    }
}
