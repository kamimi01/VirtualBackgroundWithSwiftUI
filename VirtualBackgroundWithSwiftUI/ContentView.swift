//
//  ContentView.swift
//  VirtualBackgroundWithSwiftUI
//
//  Created by Mika Urakawa on 2022/02/17.
//

import SwiftUI

struct ContentView: View {
    struct Item: Hashable {
        var title: String = ""
        var description: String = ""
    }

    private let items = [
        Item(title: "話したいこと", description: "心身の健康の保ち方\n（ぼっち暮らしでも通用する方法だと嬉しい）"),
        Item(title: "興味のある技術etc", description: "SwiftUI / ドメイン駆動設計"),
        Item(title: "住んでいるところ", description: "東京"),
        Item(title: "趣味", description: "アニメを見る / 海に行く / \n VRする")
    ]

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 40) {
                ForEach(items, id: \.self) { item in
                    CapsuleItem(title: item.title, description: item.description)
                }
            }
            .offset(x: -80)
            .padding(.top, 40)
            Spacer()
            VStack(alignment: .trailing) {
                NameItem()
                    .offset(x: 60, y: -90)
                Spacer()
                ProfileImage(imageName: "profile")
            }
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 1600, height: 1000))
    }
}
