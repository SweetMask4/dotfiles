// ==UserScript==
// @name        Redirigir Twitter a Nitter
// @namespace   Violentmonkey Scripts
// @match       https://twitter.com/*
// @grant       none
// ==/UserScript==

(function () {
	'use strict';
	top.location.hostname = "nitter.it";
})();
