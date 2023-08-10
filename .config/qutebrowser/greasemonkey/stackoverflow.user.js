// ==UserScript==
// @name           stackoverflow to ao.vern.cc redirector
// @namespace      mamg22's userscripts
// @match          https://stackoverflow.com/*
// @run-at         document-start
// ==/UserScript==

(function () {
	'use strict';
	top.location.hostname = "ao.vern.cc";
})();
