// MIT License
//
// Copyright (c) 2020 Tundaware LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE

public class ID {
  private var alphabet: Alphabet
  private var size: UInt
  private var randomizer: RandomizerProtocol

  public static let defaultAlphabet: Alphabet = .urlSafe
  public static let defaultSize = UInt(21)
  public static let defaultRandomizer: RandomizerProtocol = Randomizers.secure

  public init(
    alphabet: Alphabet = ID.defaultAlphabet,
    size: UInt = ID.defaultSize,
    randomizer: RandomizerProtocol = ID.defaultRandomizer
  ) {
    self.alphabet = alphabet
    self.size = size
    self.randomizer = randomizer
  }

  public func generate(
    alphabet: Alphabet? = nil,
    size: UInt? = nil,
    randomizer: RandomizerProtocol? = nil
  ) -> String {
    return String((randomizer ?? self.randomizer)
      .getCharacters(count: size ?? self.size,
                     from: alphabet ?? self.alphabet))
  }
}
