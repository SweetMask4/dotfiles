// ==UserScript==
// @name        Redirigir Goodreads a Biblioreads
// @namespace   Violentmonkey Scripts
// @match       https://www.goodreads.com/*
// @grant       none
// ==/UserScript==

(function () {
	'use strict';
	top.location.hostname = "biblioreads.ml";
})();
