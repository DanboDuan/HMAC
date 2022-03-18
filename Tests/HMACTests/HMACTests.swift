// Copyright (c) 2022 Bob
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import CryptoKit
@testable import HMAC
import XCTest

final class HMACTests: XCTestCase {
    private func makeAuthorization(data: String, secretKey: String) -> String {
        guard let canonical = data.data(using: .utf8) else {
            fatalError("error")
        }
        guard let key = secretKey.data(using: .utf8) else {
            fatalError("error")
        }

        let code = HMAC<Insecure.SHA1>.authenticationCode(for: canonical, using: SymmetricKey(data: key))

        let hash = Data(code).base64EncodedString()
        return hash
    }

    func testSha1() throws {
        let value = "abcdef".hmac(for: .SHA1, secretKey: "1234")
        XCTAssertEqual(value, "HruYu1fWDENhOQyaIOPH4/P21Ik=")
    }

    func testCase() throws {
        let data = UUID().uuidString
        let secretKey = UUID().uuidString
        let value1 = makeAuthorization(data: data, secretKey: secretKey)
        let value2 = data.hmac(for: .SHA1, secretKey: secretKey)
        XCTAssertEqual(value1, value2)
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
