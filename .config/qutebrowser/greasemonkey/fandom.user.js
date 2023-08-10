// ==UserScript==
// @name        Redirigir Fandom a Breezewiki
// @namespace   Violentmonkey Scripts
// @match       https://*.fandom.com/*
// @grant       none
// ==/UserScript==

(function () {
	'use strict';
	top.location.hostname = "breezewiki.com";
})();
