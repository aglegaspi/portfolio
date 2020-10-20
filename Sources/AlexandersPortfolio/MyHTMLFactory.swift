//
//  File.swift
//  
//
//  Created by Alex 6.1 on 10/20/20.
//

import Foundation
import Publish
import Plot

/*
 

//MARK: - CUSTOM
private extension Node where Context == HTML.BodyContext {
    
    //MARK: - WRAPPER
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }
    
    //MARK: - ITEMLIST FOR INDEX
    static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
        return .ul(
            .class("item-list"),
            .forEach(items) { item in
                .li(.article(
                    .h1(.a(
                        .href(item.path),
                        .text(item.title)
                    ))
                )) // li
            } // forEach
        ) // ul
    }
}

//MARK: - EXTENTION FOR NODES / HTML
extension Node where Context == HTML.BodyContext {
    
    //MARK: - HEADER
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
                            )) // li
                        },
                        .li(.a(
                            .href("/assets/agl_resume.pdf"),
                            .target(HTMLAnchorTarget.blank),
                            .text("Resume")
                        )), //li
                        .li(.a(
                            .href("https://github.com/aglegaspi"),
                            .target(HTMLAnchorTarget.blank),
                            .text("Github")
                        )) //li
                        ) //ui
                    ) //nav
                ) //if
            ) //wrapper
        )//header
    }
    
    //MARK: - FOOTER
    static func footer<T: Website>(for site: T) -> Node {
        return .footer(
            .p(
                .text("Made using "),
                .a(
                    .text("Publish"),
                    .href("https://github.com/johnsundell/publish")
                )
            ),
            .p(.a(
                .text("RSS feed"),
                .href("/feed.rss")
            ))
        )
    }
    
    
}

//MARK: - HTML PAGES
struct MyHtmlFactory<Site: Website>: HTMLFactory {
    
    //MARK: - INDEX
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
                ), //wrapper
                .footer(for: context.site)
            ) //body
        ) //html
    }
    
    //MARK: - SECTIONS
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
                    
                ),
                .footer(for: context.site)
            )
        )
    }
    
    //MARK: - ITEMS
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
                ), //wrapper
                .footer(for: context.site)
            ) //body
        ) //html
    }
    
    //MARK: - PAGES (CUSTOM)
    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            
            .body(
                .myHeader(for: context, selectedSection: nil),
                .wrapper(
                ),
                .footer(for: context.site)
            )
        )
    }
    
    //MARK: - TAGS
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }
    
    //MARK: - TAG DETAILS
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }
    
}

//MARK: - CUSTOM THEME
extension Theme {
    static var myTheme: Theme {
        Theme(htmlFactory: MyHtmlFactory(),
              resourcePaths: ["Resources/MyTheme/styles.css"]
        )
    }
}

 
 */
