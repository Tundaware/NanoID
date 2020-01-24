[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-orange.svg)](#swift-package-manager) [![Cocoapods compatible](https://img.shields.io/cocoapods/v/NanoID)](#cocoa-pods) [![GitHub release](https://img.shields.io/github/release/Tundaware/NanoID/all.svg)](https://github.com/Tundaware/NanoID/releases) ![Swift 5.1](https://img.shields.io/badge/Swift-5.1-orange.svg) ![platforms](https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-blue.svg)

# Nano ID

Another Swift implementation of [Nano ID](https://github.com/ai/nanoid). This borrows
heavily from https://github.com/antiflasher/NanoID, which seems to have been abandoned.

## Usage

```swift
// Create an ID generator using the default alphabet, size, and randomizer
let id = ID()

// Generate a 21 character id (21 is the default size)
id.generate() 

// Generate a 10 character id
id.generate(size: 10) 

// Generate a 5 character id containing only numeric characters
id.generate(alphabet: .numeric, size: 5) 

// Generate a 5 character id containing only symbols
id.generate(alphabet: .symbols, size: 5)

// Generate a secure 10 character id
id.generate(size: 5, randomizer: ID.Randomizers.secure)
```

## Randomizers

There are two implementations provided: `Secure` and `ARC4Random` (aliased as `Insecure`). The `Secure` implementation uses `CryptoKit` to for randomization. 
If those don't satisfy your requirements, you can provide your own implementation of `RandomizerProtocol`.

## Alphabets

There are several alphabets included: `numeric`, `alphaLower`, `alphaUpper`, `alphaNumeric`, `symbols`, `urlSafe`, and `full`.
You can easily create others, which only requires initializing the `Alphabet` struct with one or more strings.

**Example custom alphabet**
```swift
extension ID.Alphabet {
  public static var abc123 = Self(.abc123)
}
extension String {
  internal static var abc123 = "abc123" 
}
```
