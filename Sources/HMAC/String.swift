// Copyright (c) 2022 Bob
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import Foundation

public extension String {
    func hmac(for algorithm: Algorithm = .SHA1, secretKey: String = "") -> String {
        guard let secretKeyData = secretKey.data(using: .utf8) else { fatalError() }
        let data = Data(utf8)
        let hmac = data.hmac(for: algorithm, secretKey: secretKeyData)
        return hmac.base64EncodedString()
    }
}
