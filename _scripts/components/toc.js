export const toc = () => {
    tocbot.init({
        // Options: https://tscanlin.github.io/tocbot/
        
        // Where to render the table of contents.
        tocSelector: '.js-toc',
        // Where to grab the headings to build the table of contents.
        contentSelector: '.js-toc-content',
        // Which headings to grab inside of the contentSelector element.
        headingSelector: 'h2, h3, h4, h5, h6',
        // For headings inside relative or absolute positioned containers within content.
        hasInnerContainers: true,
        // Smooth scrolling enabled.
        scrollSmooth: false,
        // orderedList can be set to false to generate unordered lists (ul)
        // instead of ordered lists (ol)
        orderedList: false,
    });

    tocbot.refresh();
}
