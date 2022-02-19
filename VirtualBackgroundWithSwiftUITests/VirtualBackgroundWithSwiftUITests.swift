//
//  VirtualBackgroundWithSwiftUITests.swift
//  VirtualBackgroundWithSwiftUITests
//
//  Created by Mika Urakawa on 2022/02/19.
//

import XCTest
@testable import VirtualBackgroundWithSwiftUI
import iOSSnapshotTestCase
import SwiftUI

class PreviewScreenshotSampleTests: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        // ここは、今回利用したFBSnapshotTestCaseのための実装です
        self.recordMode = true
    }

    func test() {
        ContentView_Previews.Context.screenshot(self)
    }
}

extension Previewable where Self.AllCases: RandomAccessCollection, Self.RawValue == String {
    static func screenshot(_ testCase: FBSnapshotTestCase) {
        // 定義されてある全てのケースを1つずつ撮影していく
        Self.allCases.forEach { (ctx) in
            ctx.screenshot(testCase)
        }
    }

    func screenshot(_ testCase: FBSnapshotTestCase) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        // previewプロパティから対象の状態のViewを生成します
        window.rootViewController = UIHostingController(rootView: self.preview)
        window.makeKeyAndVisible()
        let expectation = testCase.expectation(description: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // ここで任意のスクリーンショット撮影処理を実行します。
            // 今回はFBSnapshotTestCaseのメソッドを使うため、画面に表示されたぐらいのタイミングで、UIViewの型でSwiftUIの画面を取り出して受け渡します
            // identifierにrawValueを渡すことで、出力されるファイルの名前を定義したcaseの名前になるようにしています
            testCase.FBSnapshotVerifyView(window.rootViewController!.view, identifier: self.rawValue)
            expectation.fulfill()
        }
        testCase.wait(for: [expectation], timeout: 5.0)
    }
}
