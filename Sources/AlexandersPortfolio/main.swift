import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct AlexandersPortfolio: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case about
        case posts
    }
    
    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }
    
    // Update these properties to configure your website:
    var url = URL(string: "https://aglegaspi.github.io")!
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

extension Node where Context == HTML.BodyContext {
    
    static func myHeader<T: Website>(for context: PublishingContext<T>,selectedSection: T.SectionID?) -> Node {
        let sectionIDs = T.SectionID.allCases
        
        return .header(
            .wrapper(
                .a(.class("site-name"), .href("/"), .text(context.site.name)),
                .if(sectionIDs.count > 1,
                    .nav(
                        .ul(.forEach(sectionIDs) { section in
                            .li(.a(
                                .class(section == selectedSection ? "selected" : ""),
                                .href(context.sections[section].path),
                                .text(context.sections[section].title)
                            ))
                        },
                        .li(.a(
                            .href("/assets/agl_resume.pdf"),
                            .text("Resume")
                        )),
                        .li(.a(
                            .href("https://github.com/aglegaspi"),
                            .text("Repo")
                        ))
                        )
                    )
                )
                )
            )//header
    }
    
    
    
}

struct MyHtmlFactory<Site: Website>: HTMLFactory {
    
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .head(for: index, on: context.site),
            
            .body(
                .myHeader(for: context,selectedSection: nil), //header
                
                .wrapper(
                    .ul(
                        .class("item-list"),
                        .forEach(
                            context.allItems(sortedBy: \.date,
                                             order: .descending)
                        ) { item in
                            .li(
                                .article(
                                    .h1(.a(
                                        .href(item.path),
                                        .text(item.title)
                                    ) //a
                                    ), //h1
                                    .p(.text(item.description))
                                    
                                ) // article
                            ) //li
                        } //forEach
                    ) //ul
                ) //wrapper
            ) //body
        ) //html
    }
    
    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site),
            .body(
                .myHeader(for: context, selectedSection: section.id),
                .wrapper(
                    //.h1(.text(section.title)),
                    .contentBody(section.body),
                    .itemList(for: section.items, on: context.site)
                    
                )
            )
        )
    }
    
    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site),
            .body(
                .myHeader(for: context, selectedSection: item.sectionID),
                
                .wrapper(
                    .article(
                        .contentBody(item.body)
                    ) // article
                ) //wrapper
            ) //body
        ) //html
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            
            .body(
                .myHeader(for: context, selectedSection: nil),
                .wrapper(
                )
            )
        )
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
              resourcePaths: ["Resources/MyTheme/styles.css"]
        )
    }
}

// This will generate your website using the built-in Foundation theme:
try AlexandersPortfolio().publish(withTheme: .myTheme, additionalSteps: [.deploy(using: .gitHub("aglegaspi/portfolio", useSSH: false))])
//try AlexandersPortfolio().publish(using: [.deploy(using: .gitHub("aglegaspi/portfolio", useSSH: true))])

