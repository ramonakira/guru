import riot from 'riot';
import format from 'string-format';

import './tags/debugger.tag';

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
}
];


document.addEventListener('DOMContentLoaded', function() {
    riot.mount('debugger', {hinters: hinters});
});
