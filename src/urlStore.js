import Dexie from 'dexie';

import Signal from '../src/signal.js';
import { search } from '../src/utils/search.js';
import { forEach } from '../src/utils/forEach.js';


function Urls() {
    var self = this;
    var urlsToBeAdded = 0;
    var urlsAdded = 0;
    var url;
    var plausibleUrls = [];
    var visitedUrls = [];

    if (localStorage.getItem('plausibleUrls')) {
        plausibleUrls = JSON.parse(localStorage.getItem('plausibleUrls'));
    } 

    if (localStorage.getItem('visitedUrls')) {
        visitedUrls = JSON.parse(localStorage.getItem('visitedUrls'));
    }
    
    Signal.listen('scanner:start', function(event) {
        console.log('scanner start');
        var links = event.detail.links;

        for (var index = 0; index < links.length; ++index) {
            var url = links[index].getAttribute('href');

            // visiting external urls is usually prohibited by server configuration, so we can skip those
            if (url.startsWith('http://')) {
                console.log('External url... skipping', url);
                continue;
            }

            // if url is already in plausibleUrls, don't add it again
            if (plausibleUrls.indexOf(url) != -1) {
                console.log('Already got this url... skipping', url);
                continue;
            }

            // if url is already in visitedUrls, don't add it again
            if (visitedUrls.indexOf(url) != -1) {
                console.log('Already visited this url... skipping', url);
                continue;
            }

            console.log('Adding', url);
            plausibleUrls[index] = url;
        }

        localStorage.setItem('plausibleUrls', JSON.stringify(plausibleUrls));

        Signal.dispatch('scanner:done');
    });

    // register events
    Signal.listen('scanner:stop', function(event) {
        // ...
    }); 
}

export default Urls;

    
    // if (!localStorage.getItem('scanResults')) {
    //     this.pageScanResults = [];
    // } else {
    //     this.pageScanResults = JSON.parse(localStorage.getItem('scanResults'));
    // }