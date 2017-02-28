import UIKit
import XCTest
@testable import UBTokenBar

class UBTokenTests: XCTestCase {
    func testUBTokenInit() {
        let token = UBToken(title: "maxwell", object: "Object" as NSObject)
        XCTAssertEqual(token.tokenTitle, "maxwell")
        if let representedObject = token.representedObject as? String {
            XCTAssertEqual(representedObject, "Object")
        } else {
            XCTFail("representedObject is invalid")
        }
    }
}
