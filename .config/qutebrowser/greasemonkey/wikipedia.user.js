// ==UserScript==
// @name        Redirigir Wikipedia a Wiki Slipfox
// @namespace   Violentmonkey Scripts
// @match       https://*.wikipedia.org/*
// @grant       none
// ==/UserScript==

(function () {
	'use strict';
	top.location.hostname = "wiki.slipfox.xyz";
})();

(function() {
    'use strict';

    var wikiURL = 'https://wiki.slipfox.xyz/';
    var newURL = window.location.href.replace('.wikipedia.org', '.wiki.slipfox.xyz');
    if (newURL !== window.location.href) {
        window.location.replace(newURL);
    }
})();
