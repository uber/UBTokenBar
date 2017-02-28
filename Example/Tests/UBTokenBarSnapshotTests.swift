//
//  UBTokenBarSnapshotTests.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/27/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

@testable import UBTokenBar
import FBSnapshotTestCase

class UBTokenBarSnapshotTests: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        self.recordMode = false
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTokenBarTokenRendering() { 
        let tokenBar = UBTokenBar(frame: CGRect(x: 0, y: 0, width: 375, height: 400))
        let token1 = UBToken(title: "token1", object: "token1obj" as NSObject)
        let token2 = UBToken(title: "token2", object: "token2obj" as NSObject)
        let token3 = UBToken(title: "token3", object: "token3obj" as NSObject)
        let token4 = UBToken(title: "token4", object: "token4obj" as NSObject)
        let token5 = UBToken(title: "token5", object: "token5obj" as NSObject)
        let token6 = UBToken(title: "token6", object: "token6obj" as NSObject)
        tokenBar.setTokens(tokens: [token1, token2, token3, token4, token5, token6])
        FBSnapshotVerifyView(tokenBar)
    }

    func testTokenBarTokenRenderingWithDynamicCellSizing() {
        let tokenBar = UBTokenBar(frame: CGRect(x: 0, y: 0, width: 375, height: 400))
        let token1 = UBToken(title: "token1 this is long", object: "token1obj" as NSObject)
        let token2 = UBToken(title: "token2 hey", object: "token2obj" as NSObject)
        let token3 = UBToken(title: "token3", object: "token3obj" as NSObject)
        let token4 = UBToken(title: "token4 whoa what a token", object: "token4obj" as NSObject)
        let token5 = UBToken(title: "token5", object: "token5obj" as NSObject)
        let token6 = UBToken(title: "token6 final token and long!", object: "token6obj" as NSObject)
        tokenBar.setTokens(tokens: [token1, token2, token3, token4, token5, token6])
        FBSnapshotVerifyView(tokenBar)
    }

    func testTokenBarTokenRenderingWithVeryLongTokens() {
        let tokenBar = UBTokenBar(frame: CGRect(x: 0, y: 0, width: 375, height: 400))
        let token1 = UBToken(title: "token1 this is long token1 this is long token1 this is long token1 this is long", object: "token1obj" as NSObject)
        let token2 = UBToken(title: "token2 hey", object: "token2obj" as NSObject)
        let token3 = UBToken(title: "token3 final token and long as well!", object: "token3obj" as NSObject)
        tokenBar.setTokens(tokens: [token1, token2, token3])
        FBSnapshotVerifyView(tokenBar)
    }

    func testTokenBarTokenRenderingFooterInputFieldWithNoTokens() {
        let tokenBar = UBTokenBar(frame: CGRect(x: 0, y: 0, width: 375, height: 400))
        tokenBar.placeholderText = "Enter a name, phone number"
        FBSnapshotVerifyView(tokenBar)
    }

    func testTokenBarTokenRenderingAfterDeletingTokens() {
        let tokenBar = UBTokenBar(frame: CGRect(x: 0, y: 0, width: 375, height: 400))
        let token1 = UBToken(title: "token1 this is long", object: "token1obj" as NSObject)
        let token2 = UBToken(title: "token2 hey", object: "token2obj" as NSObject)
        let token3 = UBToken(title: "token3", object: "token3obj" as NSObject)
        let token4 = UBToken(title: "token4 whoa what a token", object: "token4obj" as NSObject)
        let token5 = UBToken(title: "token5", object: "token5obj" as NSObject)
        let token6 = UBToken(title: "token6 final token and long!", object: "token6obj" as NSObject)
        tokenBar.setTokens(tokens: [token1, token2, token3, token4, token5, token6])
        FBSnapshotVerifyView(tokenBar, identifier: "Before_Deleting_Tokens")
        tokenBar.setTokens(tokens: [token1, token2, token4, token6])
        FBSnapshotVerifyView(tokenBar, identifier: "After_Deleting_Tokens1")
        tokenBar.setTokens(tokens: [token1, token3, token6])
        FBSnapshotVerifyView(tokenBar, identifier: "After_Deleting_Tokens2")
        tokenBar.setTokens(tokens: [token3])
        FBSnapshotVerifyView(tokenBar, identifier: "After_Deleting_Tokens3")
    }
}
