//
//  NameItem.swift
//  VirtualBackgroundWithSwiftUI
//
//  Created by Mika Urakawa on 2022/02/17.
//

import SwiftUI

struct NameItem: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(red: 32 / 255, green: 101 / 255, blue: 109 / 255))
                .frame(width: 500, height: 400)
            VStack(alignment: .leading, spacing: 20) {
                Text("エンジニア2年目")
                    .font(.system(size: 30))
                Text("みか")
                    .font(.system(size: 65, weight: .bold))
                Text("#times_kamimi01")
                    .font(.system(size: 30))
            }
            .font(.title)
            .foregroundColor(.white)
            .padding(.leading, 100)
            .padding(.top, 70)
        }
    }
}

struct NameItem_Previews: PreviewProvider {
    static var previews: some View {
        NameItem()
            .previewLayout(.fixed(width: 600, height: 500))
    }
}
