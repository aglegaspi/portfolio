import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct AlexandersPortfolio: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://your-website-url.com")!
    var name = "Alexander's Portfolio"
    var description = "A portfolio of a Software Engineer"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

private extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }
    
    static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
        return .ul(
            .class("item-list"),
            .forEach(items) { item in
                .li(.article(
                    .h1(.a(
                        .href(item.path),
                        .text(item.title)
                    )),
                    .p(.text(item.description))
                )) // li
            } // forEach
        ) // ul
    }
}

struct MyHtmlFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML("Hello World")
    }
    
    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML("")
    }
    
    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML("")
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        HTML("")
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }
    
}

extension Theme {
    static var myTheme: Theme {
        Theme(htmlFactory: MyHtmlFactory(),
              resourcePaths: ["Sources/MyTheme/styles.css"]
        )
    }
}

// This will generate your website using the built-in Foundation theme:
try AlexandersPortfolio().publish(withTheme: .myTheme)
