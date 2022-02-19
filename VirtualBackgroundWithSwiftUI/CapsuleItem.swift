//
//  CapsuleItem.swift
//  VirtualBackgroundWithSwiftUI
//
//  Created by Mika Urakawa on 2022/02/17.
//

import SwiftUI

struct CapsuleItem: View {
    let title: String
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color(red: 32 / 255, green: 101 / 255, blue: 109 / 255))
                    .frame(width: 500, height: 105)
                Text(title)
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .padding(.leading, 120)
            }
            Text(description)
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(Color(red: 32 / 255, green: 101 / 255, blue: 109 / 255))
                .padding(.leading, 120)
        }
    }
}

struct CapsuleItem_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleItem(title: "趣味", description: "心身の健康の保ち方\n（ぼっち暮らしでも通用する方法だと嬉しい）")
            .previewLayout(.fixed(width: 1000, height: 400))
    }
}
