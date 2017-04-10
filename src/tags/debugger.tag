import './debugger-line.tag';

<debugger>
    <div class="results">
        <header>
            <h1>guru</h1>
            <div class="options">
                <div onclick={toggleResults}>{results_open ? "close" : "open"}</div>
            </div>
        </header>

        <main if={results_open}>
            <debugger-line each={opts.hinters} hinter={this}></debugger-line>
        </main>
    </div>

    <script>
    this.results_open = false;

    toggleResults(event) {
        this.results_open = !this.results_open;
    }
    </script>

    <style>
    header {
        display: flex;
        flex-wrap: nowrap;
        justify-content: space-between;
        align-items: center;
    }

    main {
        margin-top: 15px;
    }

    h1 {
        margin: 0;
        color: #b0d6f4;
    }

    .results {
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

    .options {
        display: flex;
        flex-direction: row;
    }

    .options > div {
        cursor: pointer;
    }

    .options > div:first-child {
        margin-right: 10px;
    }
    </style>
</debugger>
