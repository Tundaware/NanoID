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

extension ID {
  public struct Alphabet {
    let characters: [Character]

    /// Initializes an alphabet given one or more strings
    /// - Parameter alphabet: Strings to build the alphabet from
    public init(_ alphabet: String...) {
      self.characters = Array(alphabet.joined())
    }

    /// Returns the size of the alphabet as a UInt32
    public var uInt32Size: UInt32 {
      return UInt32(self.characters.count)
    }

    /// Returns the size of the alphabet as a Int
    public var intSize: Int {
      return self.characters.count
    }

    /// Returns a single character from the alphabet
    ///
    /// - Parameter index: The position of the character to return
    public func character(at index: Int) -> Character {
      return self.characters[index]
    }

    /// Returns a single character from the alphabet given a byte
    ///
    /// - Parameter byte: The byte used to determine the character's position
    public func character(from byte: UInt8) -> Character {
      return self.characters[Int(byte) % self.characters.count]
    }
  }
}

extension ID.Alphabet {
  public static var numeric = Self(.numeric)
  public static var alphaLower = Self(.alphaLower)
  public static var alphaUpper = Self(.alphaUpper)
  public static var alphaNumeric = Self(.alphaNumeric)
  public static var symbols = Self(.symbols)
  public static var urlSafe = Self(.alphaNumeric, "_-")
  public static var full = Self(.alphaNumeric, .symbols)
}

extension String {
  internal static var numeric = "0123456789"
  internal static var alphaLower = "abcdefghijklmnopqrstuvwxyz"
  internal static var alphaUpper = Self.alphaLower.uppercased()
  internal static var alpha = [Self.alphaLower, Self.alphaUpper].joined()
  internal static var alphaNumeric = [Self.numeric, Self.alpha].joined()
  internal static var symbols = "!()[]<>=?-_+*#,.:;/\\"
}
