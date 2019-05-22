import './debugger-line.tag';
import './scanner.tag';
import './toggle-button.tag';

<debugger>
    <scanner if={scanner_active}></scanner>

    <div class="guru-results">
        <main if={validator_open && loading}>
            Loading...
        </main>

        <main if={validator_open && !loading}>
            <debugger-line each={opts.hinters} hinter={this}></debugger-line>
        </main>

        <main if={scanner_open} if={feature_scanner_enabled}>
            <toggle-button onClick={toggleScan} active={scanner_active}>{parent.scanner_active ? 'stop' : 'start'} scan</toggle-button>
        </main>

        <div class="guru-switch">
            <h1>guru</h1>
            <div class="guru-options">
                <toggle-button onclick={toggleScanner} active={scanner_open} if={feature_scanner_enabled}>scanner</toggle-button>
                <toggle-button onclick={toggleValidator} active={validator_open}>validator</toggle-button>
            </div>
        </div>
    </div>

    <script>
    this.validator_open = localStorage.getItem('validator_open') == 'true' || false;
    this.scanner_open = false;
    this.scanner_active = false;
    this.feature_scanner_enabled = false;
    this.loading = true;

    toggleScanner(event) {
        this.scanner_open = !this.scanner_open;
    }

    toggleValidator(event) {
        this.validator_open = !this.validator_open;
        localStorage.setItem('validator_open', this.validator_open);
    }

    toggleScan(event) {
        if (this.feature_scanner_enabled) {
            this.scanner_active = !this.scanner_active;
            localStorage.setItem('scanner_active', this.scanner_active);
        }
    }

    this.on('mount', function(event) {
        if (this.feature_scanner_enabled) {
            this.scanner_active = (localStorage.getItem('scanner_active') == 'true');
        }

        if (this.scanner_active) {
            this.scanner_open = true;
        }

        this.update();
        var self = this;

        setTimeout(function(){
            self.loading = false;
            self.update();
        }, 1000);
    });
    </script>

    <style>
    .guru-switch {
        display: flex;
        flex-wrap: nowrap;
        justify-content: space-between;
        align-items: center;
    }

    main {
        margin-bottom: 15px;
    }

    h1 {
        margin: 0;
        color: #b0d6f4;
    }

    .guru-results {
        width: 300px;
        max-height: 100vh;
        position: fixed;
        padding: 10px 15px;
        bottom: 0px;
        right: 50px;
        background-color: #000;
        z-index: 1000;
        font-family: sans-serif;
        color: #fff;
        transition: height 0.7s;
    }

    .guru-options {
        display: flex;
        flex-direction: row;
    }

    .guru-options > div {
        cursor: pointer;
    }

    .guru-options > div:first-child {
        margin-right: 10px;
    }
    </style>
</debugger>
