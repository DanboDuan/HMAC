// Copyright (c) 2022 Bob
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import CommonCrypto
import Foundation

public extension Data {
    func hmac(for algorithm: Algorithm, secretKey: Data) -> Data {
        let hashBytes = UnsafeMutablePointer<UInt8>.allocate(capacity: algorithm.digestLength())
        defer { hashBytes.deallocate() }
        withUnsafeBytes { bytes in
            secretKey.withUnsafeBytes { secretKeyBytes in
                CCHmac(algorithm.toCCHmacAlgorithm(), secretKeyBytes.baseAddress, secretKey.count, bytes.baseAddress, count, hashBytes)
            }
        }

        return Data(bytes: hashBytes, count: algorithm.digestLength())
    }
}
