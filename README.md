Enketo XSLT 
===========

[![Build Status](https://travis-ci.org/medic/enketo-xslt.svg?branch=master)](https://travis-ci.org/medic/enketo-xslt)

XSLT sheets used to transform OpenRosa-flavoured XForms into an HTML form and XML instance.

This is a fork of [`enketo-xslt`](https://github.com/enketo/enketo-xslt), modified to run client-side, in a web browser.

# Browser Support

We commonly test on:

* Firefox
* Chrome

# Examples

## Code

(This example uses jQuery to parse strings into [`XMLDocument`](https://developer.mozilla.org/en-US/docs/Web/API/XMLDocument) instances.)

	var htmlTransformXsltAsString = // loaded somehow
	var modelTransformXsltAsString = // loaded somehow
	var htmlTransformXslt = jQuery.parseXML(htmlTransformXsltAsString);
	var modelTransformXslt = jQuery.parseXML(modelTransformXsltAsString);

	var xformXmlAsString = // loaded somehow
	var xformXml = jQuery.parseXML(xformXmlAsString);

	function transform(xslt, xml) {
		var p = new XSLTProcessor();
		p.importStylesheet(xslt);

		var transformed = p.transformToDocument(xml);

		var root = transformed.documentElement.firstElementChild;
		return new XMLSerializer().serializeToString(root);
	}

	var formHtml = transformed(htmlTransformXslt, xformXml);
	var formModel = transformed(modelTransformXslt, xformXml);

## `src/`

There is a fuller example in this repository at `examples/index.js`.

## In the wild

You can find examples of this code in use in [`medic-webapp`](https://github.com/medic/medic-webapp/) and [`enketo-collect`](https://github.com/alxndrsn/enketo-collect).

# Use

## Use with npm

	npm install medic-enketo-xslt

## Use without npm and in any programming language. 

Use as git submodule and read the [two .xsl files](./xsl) as required. Ignore index.js.

# License

See [license document](./LICENSE).

In addition, any product that uses enketo-xslt is required to have a "Powered by Enketo" footer, according to the specifications below, on all screens in which the output of enketo-xslt, or parts thereof, are used, unless explicity exempted from this requirement by Enketo LLC in writing. Partners and sponsors of the Enketo Project, listed on [https://enketo.org/#about](https://enketo.org/#about) and on [https://github.com/enketo/enketo-core#sponsors](https://github.com/enketo/enketo-core#sponsors) are exempted from this requirements and so are contributors listed in [package.json](./package.json).

The aim of this requirement is to force adopters to give something back to the Enketo project, by at least spreading the word and thereby encouraging further adoption.

Specifications:

1. The word "Enketo" is displayed using Enketo's logo.
2. The minimum font-size of "Powered by" is 12 points.
3. The minimum height of the Enketo logo matches the font-size used.
4. The Enketo logo is hyperlinked to https://enketo.org

Example:

Powered by <a href="https://enketo.org"><img height="16" style="height: 16px;" src="https://enketo.org/media/images/logos/enketo_bare_150x56.png" /></a>

# Change Log

See [change log](./CHANGELOG.md)
