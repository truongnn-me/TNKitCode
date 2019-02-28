import UIKit

var str = "Hello"
if let index = str.index(str.startIndex, offsetBy: 5, limitedBy: str.endIndex) {
    if index == str.endIndex {
        print("Call me")
        print("#####\(String(str[index]))")
    }
} else {
    print("Call")
}
