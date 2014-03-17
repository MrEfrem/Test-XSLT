<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        version="1.0"
        xmlns="http://www.w3.org/1999/xhtml"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        exclude-result-prefixes="xsl xsd">

    <xsl:output
            media-type="application/xhtml+xml"
            method="xml"
            encoding="UTF-8"
            indent="yes"
            omit-xml-declaration="yes"
            doctype-system="about:legacy-compat" />

    <xsl:strip-space elements="*" />

    <xsl:template match="/">
        <html xml:lang="ru" lang="ru">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <meta name="viewport" content="width=device-width" />
                <title>Test page</title>
                <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"/>
            </head>
            <body>
                <label for="tags">Tags: </label>
                <input id="tags"/>

                <script type="text/javascript">
                    /*jslint skipme:true */
                    /**
                     * Hack to allow jQuery to work within XHTML documents that define an xmlns
                     */
                    /**
                     * Dafault namespace. Maybe changed for parse XML with another namespace.
                     */
                    var defaultNS = document.documentElement.namespaceURI;
                    /**
                     * Use the given object to override the given methods in its prototype
                     * with namespace-aware equivalents
                     */
                    function addNS(obj, methods) {
                        var proto = obj.constructor.prototype;

                        for (var methodName in methods) {
                            (function() {
                                var methodNS = proto[methodName + "NS"];

                                if (methodNS) {
                                    proto[methodName] = function() {
                                        var args = Array.prototype.slice.call(arguments, 0);
                                        args.unshift(defaultNS);
                                        return methodNS.apply(this, args);
                                    };
                                }
                            })();
                        }
                    }

                    // Play nice with IE -- who doesn't need this hack in the first place
                    if (document.constructor) {
                        // Override document methods that are used by jQuery
                        addNS(document, {
                            createElement: 1/*,
                             getElementsByTagName: 1*/
                        });

                        // Override element methods that are used by jQuery
                        /*addNS(document.createElement("div"), {
                         getElementsByTagName: 1,
                         getAttribute: 1,
                         getAttributeNode: 1,
                         removeAttribute: 1,
                         setAttribute: 1
                         });*/
                    }
                </script>
                <script src="//code.jquery.com/jquery-1.9.1.js"></script>
                <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
                <script type="text/javascript">
                    window.onload=function(){
                        var availableTags = [
                            "ActionScript",
                            "AppleScript",
                            "Asp",
                            "BASIC",
                            "C",
                            "C++",
                            "Clojure",
                            "COBOL",
                            "ColdFusion",
                            "Erlang",
                            "Fortran",
                            "Groovy",
                            "Haskell",
                            "Java",
                            "JavaScript",
                            "Lisp",
                            "Perl",
                            "PHP",
                            "Python",
                            "Ruby",
                            "Scala",
                            "Scheme"
                        ];
                        $( "#tags" ).autocomplete({
                            source: availableTags
                        });
                    };
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>