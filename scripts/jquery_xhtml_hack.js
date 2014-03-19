/*jslint skipme:true */
/**
 * Hack to allow jQuery to work within XHTML documents that define an xmlns
 */
(function(){
    /**
     * Default namespace. Maybe changed for parse XML with another namespace.
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


    var fixDocument=function(){
        if( undefined===document.head ){
            head=document.getElementsByTagNameNS('http://www.w3.org/1999/xhtml','head')[0];
            if( head != null ){
                document.head=head;
            }
        }
        if( undefined===document.body ){
            body=document.getElementsByTagNameNS('http://www.w3.org/1999/xhtml','body')[0];
            if( body != null ){
                document.body=body;
            }
        }
    };
    window.addEventListener( "load", fixDocument, false );
})();
