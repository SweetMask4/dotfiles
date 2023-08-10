// ==UserScript==
// @name        Redirigir IMDb a LibreMDB
// @namespace   Violentmonkey Scripts
// @match       https://www.imdb.com/*
// @grant       none
// ==/UserScript==

(function () {
	'use strict';
	top.location.hostname = "www.imdb.com";
})();
