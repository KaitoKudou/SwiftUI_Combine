//
//  ConpassTopView.swift
//  CombinePractice
//
//  Created by 工藤海斗 on 2021/03/03.
//

import SwiftUI

struct ConnpassTopView: View {
    @ObservedObject var connpassTopViewModel = ConnpassTopViewModel()
    
    var body: some View {
        NavigationView {
            List(connpassTopViewModel.eventData ?? [Event.init(id: 0, title: "hoge", eventUrl: "hoge")]) { event in
                NavigationLink(
                    destination: ConnpassEventDetailView(eventData: event)) {
                    ConnpassEventRowView(eventData: event)
                }
            }
            .navigationTitle("Connpassイベント")
        }
        .onAppear(perform: {
            self.connpassTopViewModel.fetchConpassEvents()
        })
    }
}

struct ConnpassTopView_Previews: PreviewProvider {
    static var previews: some View {
        ConnpassTopView(connpassTopViewModel: ConnpassTopViewModel())
    }
}
