//
//  NanoID.tests.swift
//  NanoIDTests
//
//  Created by George Cox on 9/7/19.
//  Copyright © 2019 Tundaware LLC. All rights reserved.
//

import Foundation
import XCTest

@testable import NanoID

class ID_Tests: XCTestCase {
  func test_ids_are_the_expected_size() {
    XCTAssert(ID().generate().count == ID.defaultSize)
    XCTAssert(ID().generate(size: 25).count == 25)
    XCTAssert(ID().generate(size: 47).count == 47)
  }

  func test_ids_limited_to_alphabet_simple() {
    XCTAssertEqual(ID(alphabet: ID.Alphabet("a"), size: 5).generate(), "aaaaa")
  }

  func test_ids_limited_to_alphabet_complex() {
    let alphabet = ID.Alphabet("abc!6")
    let id = ID(alphabet: alphabet, size: 50)

    (0...1000).enumerated().forEach { _ in
      XCTAssertTrue(id.generate().isLimitedTo(elements: alphabet.characters))
    }
  }

  func test_ids_use_the_urlSafe_alphabet_by_default() {
    XCTAssert(ID().generate().isLimitedTo(elements: ID.Alphabet.urlSafe.characters))
  }

  func test_ids_have_flat_distribution() {
    ([ID.Randomizers.insecure,
      ID.Randomizers.secure,
      ID.Randomizers.arc4RandomUniform,
      ID.Randomizers.default] as [RandomizerProtocol]).forEach { randomizer in
      let count = 100 * 1000
      let size = UInt(5)
      let alphabet = ID.Alphabet.alphaLower
      let id = ID(alphabet: alphabet, size: size, randomizer: randomizer)

      let chars = (0..<count).reduce(into: [Character: Int]()) { acc, _ in
        id.generate().forEach { acc[$0] = (acc[$0] ?? 0) + 1 }
      }

      XCTAssertEqual(chars.count, alphabet.characters.count)

      let dist = chars.reduce(into: (min: Double(INT_MAX), max: Double(0))) { acc, kvp in
        let distribution = Double(kvp.value * alphabet.characters.count) / Double(count * Int(size))
        if distribution > acc.max {
          acc.max = distribution
        }
        if distribution < acc.min {
          acc.min = distribution
        }
      }

      if randomizer is ID.Randomizers.Secure {
        XCTAssertLessThanOrEqual(dist.max - dist.min, 0.15)
      } else {
        XCTAssertLessThanOrEqual(dist.max - dist.min, 0.05)
      }
    }
  }

  func test_ids_do_not_collide() {
    ([ID.Randomizers.insecure,
      ID.Randomizers.secure,
      ID.Randomizers.arc4RandomUniform,
      ID.Randomizers.default] as [RandomizerProtocol]).forEach { randomizer in
      let id = ID(randomizer: randomizer)
      _ = (0..<10).reduce(into: Set<String>()) { acc, _ in
        let generated = id.generate()
        XCTAssertFalse(acc.contains(generated), "\(randomizer) produced collisions: \(generated):\(acc)")
        acc.insert(generated)
      }
    }
  }
}

extension Sequence where Element == Character {
  func isLimitedTo(elements: [Character]) -> Bool {
    for c in self {
      if !elements.contains(c) {
        return false
      }
    }
    return true
  }
}
