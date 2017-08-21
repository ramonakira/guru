import Signal from '../../src/signal.js';


<scanner>
    <div class="scan_results">
        <table>
            <tr each={pageScanResults}>
                <td>{url}</td>
                <td>{found}</td>
                <td>{status}</td>
                <td>{visited}</td>
            </tr>
        </table>
    </div>

    <script>
    var pageScanResults = [];
    var self = this;

    this.on('mount', function() {
        var links = document.querySelectorAll('a[href]:not([href=""]):not([href="#"]):not([href^="mailto:"]');
        Signal.dispatch('scanner:start', {'links': links});
    });

    Signal.listen('scanner:done', function() {
        // get plausible urls
        var plausibleUrls = JSON.parse(localStorage.getItem('plausibleUrls'));
        var urlToVisit = plausibleUrls.shift();
        localStorage.setItem('plausibleUrls', JSON.stringify(plausibleUrls));

        window.setTimeout(visit, 5000);

        function visit() {
            if (!localStorage.getItem('visitedUrls')) {
                var visitedUrls = [];
            } else {
                var visitedUrls = JSON.parse(localStorage.getItem('visitedUrls'));
            }
            visitedUrls.push(urlToVisit);
            localStorage.setItem('visitedUrls', JSON.stringify(visitedUrls));
            window.location = urlToVisit;
        }
    });       
    </script>

    <style>
    .scan_results {
        position: absolute;
        top: 0;
        right: 0;
        width: 400px;
        height: 400px;
        background-color: gray;
        padding: 4px;
        overflow-y: scroll;
    }
    </style>
</scanner>
