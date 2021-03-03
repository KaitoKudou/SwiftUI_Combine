//
//  ConnpassEventDetailView.swift
//  CombinePractice
//
//  Created by 工藤海斗 on 2021/03/03.
//

import SafariServices
import SwiftUI

struct ConnpassEventDetailView: UIViewControllerRepresentable {
    
    var eventData: Event
    typealias UIViewControllerType = SFSafariViewController
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let url = URL(string: eventData.eventUrl)
        return SFSafariViewController(url: url!)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}

struct ConnpassEventDetailView_Previews: PreviewProvider {
    static var eventData = ConnpassTopViewModel().eventData
    static var previews: some View {
        ConnpassEventDetailView(eventData: eventData?[0] ?? Event.init(id: 0, title: "hoge", eventUrl: "hoge"))
    }
}



