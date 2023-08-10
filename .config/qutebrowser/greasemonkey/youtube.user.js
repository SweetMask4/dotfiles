// ==UserScript==
// @name        Redirigir YouTube a Invidious
// @namespace   Violentmonkey Scripts
// @match       https://www.youtube.com/*
// @grant       none
// ==/UserScript==

(function () {
	'use strict';
	top.location.hostname = "https://inv.vern.cc";
})();
