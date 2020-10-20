import Foundation
import Publish
import Plot
import CasperishTheme

// This type acts as the configuration for your website.
struct AlexandersPortfolio: Website, CasperishWebsite {
    
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case projects
        case about
    }
    
    struct ItemMetadata: WebsiteItemMetadata, CasperishWebsiteItemMetadata { // 3
        // Add any site-specific metadata that you want to use here.
        var cover: String? // 3 bis
    }
    
    // Update these properties to configure your website:
    var url = URL(string: "https://aglegaspi.github.io")!
    var name = "Alexander's Portfolio"
    var description = "Software Engineer Portfolio"
    var language: Language { .english }
    var imagePath: Path? { nil }
    
    // Update these properties to configure your casperish-website:
    var rootPathString = "/"
    var headerColor = "#424242"
    var cover = ""
    var author = "Alexander"
    var avatar = "/images/dev-memoji.png"
    var bio = "Software Developer"
    var icon = "👨🏽‍💻"
    var newsletterAction = ""
    var contacts: [(ContactPoint, String)] { [
        (.twitter, "alxndr________"),
        (.linkedIn, "aglegaspi"),
        (.gitHub, "aglegaspi"),
    ]}
}



// This will generate your website using the built-in Foundation theme:
try AlexandersPortfolio().publish(
    withTheme: .casperish,
    additionalSteps: [
        .installPlugin(.readingTime()),
        .installPlugin(.pygments()),
    ],
    plugins: [.pygments()]
)

//[.deploy(using: .gitHub("aglegaspi/portfolio", useSSH: false))]
//try AlexandersPortfolio().publish(using: [.deploy(using: .gitHub("aglegaspi/portfolio", useSSH: true))])

