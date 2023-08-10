// ==UserScript==
// @name        Redirigir TikTok a Tok Habedieeh
// @namespace   Violentmonkey Scripts
// @match       https://www.tiktok.com/*
// @grant       none
// ==/UserScript==

(function () {
	'use strict';
	top.location.hostname = "https://tok.habedieeh.re";
})();

