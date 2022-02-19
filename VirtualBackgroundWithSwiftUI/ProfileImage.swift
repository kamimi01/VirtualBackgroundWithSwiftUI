//
//  ProfileImage.swift
//  VirtualBackgroundWithSwiftUI
//
//  Created by Mika Urakawa on 2022/02/17.
//

import SwiftUI

struct ProfileImage: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .padding([.trailing, .bottom], 20)
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(imageName: "profile")
    }
}
