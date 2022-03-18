// Copyright (c) 2022 Bob
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

@testable import HMAC
import XCTest

final class HMACTests: XCTestCase {
    
    func testSha1() throws {
        let value = "abcdef".hmac(for: .SHA1, secretKey: "1234")
        XCTAssertEqual(value, "HruYu1fWDENhOQyaIOPH4/P21Ik=")
    }
    
    func testSha256() throws {
        let value = "abcdef".hmac(for: .SHA256, secretKey: "1234")
        XCTAssertEqual(value, "X2xjrT5Uo/ZgOZRgEK6CEDoPrypm/UIgw4LTP4pVK+4=")
    }
    
    func testSha512() throws {
        let value = "abcdef".hmac(for: .SHA512, secretKey: "1234")
        XCTAssertEqual(value, "oR7PR1Gr2qXiW0MP66QI94FxJLm4/0ChwIVdNgVTZD+oDABX9iVlyBmqhDE4PFUsT3XEn6TRa/RCeI8nrGZa8A==")
    }
}
