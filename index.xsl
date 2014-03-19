<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        version="1.0"
        xmlns="http://www.w3.org/1999/xhtml"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        exclude-result-prefixes="xsl">

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

                <script src="scripts/jquery_xhtml_hack.js"></script>
                <script src="//code.jquery.com/jquery-2.1.0.min.js"></script>
                <script src="//code.jquery.com/ui/1.9.2/jquery-ui.min.js"></script>
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