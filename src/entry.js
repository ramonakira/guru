import riot from 'riot';
import format from 'string-format';
import Signal from './signal.js';

import './tags/debugger.tag';
import 'simple-ajax';

import Urls from './urlStore.js';
var urls = new Urls();

format.extend(String.prototype, {});

let hinters = [{
    description: 'Anchors with empty href-attribute',
    selector: 'a[href=""]',
}, {
    description: 'Anchors with hash as href-attribute value',
    selector: 'a[href="#"]',
}, {
    description: 'Inline styles',
    selector: '*[style]',
}, {
    description: 'Images without alt-attributes',
    selector: 'img:not([alt])',
}, {
    description: 'Images with empty alt-attributes',
    selector: 'img[alt=""]',
}, {
    description: 'Missing document language',
    selector: 'html:not([lang]), html[lang=""]',
}, {
    description: 'Incorrectly positioned character set',
    selector: 'meta[charset="UTF-8"]:not(:first-child)',
}, {
    description: 'Incorrect character set',
    selector: 'meta[charset]:not([charset="UTF-8"])',
}, {
    description: 'Absolute links to current domain',
    selector: 'a[href^=\''+window.location.origin+'\']',
}, {
    description: 'Anchors with external links with missing rel=noreferrer',
    selector: 'a[href^="https://"]:not([rel*="noreferrer"])'
}];


document.addEventListener('DOMContentLoaded', function() {
    var debugger_element = document.createElement('debugger');
    document.body.appendChild(debugger_element);
    riot.mount('debugger', {hinters: hinters});
});
