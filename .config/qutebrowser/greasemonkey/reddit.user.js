// ==UserScript==
// @name        Redirigir Reddit a Teddit
// @namespace   Violentmonkey Scripts
// @match       https://www.reddit.com/*
// @grant       none
// ==/UserScript==

(function () {
	'use strict';
	top.location.hostname = "teddit.net";
})();
