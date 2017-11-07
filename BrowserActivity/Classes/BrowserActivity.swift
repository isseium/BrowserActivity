//
//  BrowserActivity.swift
//  The Tech Time
//
//  Created by Rakshit Majithiya on 1/11/17.
//
//

import Foundation

public class BrowserActivity: UIActivity {
    var urlToOpen: URL?
    var foundURL: URL? {
        didSet {
            urlToOpen = foundURL
        }
    }
    var canOpen: (Any) -> Bool = { item in
        switch item {
        case is URL:
            return UIApplication.shared.canOpenURL(item as! URL)
        case is String:
            if let string = item as? String, let url = URL(string: string) {
                return UIApplication.shared.canOpenURL(url)
            }
        default:
            break
        }

        return false
    }

    public override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return activityItems.contains(where: canOpen)
    }

    public override func prepare(withActivityItems activityItems: [Any]) {
        let item = activityItems.first(where: canOpen)

        switch item {
        case is URL:
            foundURL = item as? URL
        case is String:
            if let string = item as? String, let url = URL(string: string) {
                foundURL = url
            }
        default:
            break
        }
    }

    public override func perform() {
        guard let url = urlToOpen else {
            activityDidFinish(false)
            return
        }
        activityDidFinish(UIApplication.shared.openURL(url))
    }

    public static var compatibleActivities: [BrowserActivity] {
        var activities: [BrowserActivity] = [SafariActivity()]

        if GoogleChromeActivity.isChromeInstalled {
            activities.append(GoogleChromeActivity())
        }

        return activities
    }
}

public extension UIActivityType {
    static let openInGoogleChrome = UIActivityType(rawValue: "com.raxityo.BrowserActivity.openInGoogleChrome")
    static let openInSafari = UIActivityType(rawValue: "com.raxityo.BrowserActivity.openInSafari")
}                                                       
