//
//  ConnpassEventRowView.swift
//  CombinePractice
//
//  Created by 工藤海斗 on 2021/03/03.
//

import SwiftUI

struct ConnpassEventRowView: View {
    var eventData: Event
    
    var body: some View {
        Text(eventData.title)
    }
}

struct ConnpassEventRowView_Previews: PreviewProvider {
    static var eventData = ConnpassTopViewModel().eventData
    static var previews: some View {
        ConnpassEventRowView(eventData: (eventData?[0])!)
    }
}
