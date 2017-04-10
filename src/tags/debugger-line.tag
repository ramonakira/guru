import './item.tag';

<debugger-line>
    <div class="debugger-line-wrapper" if={foundElements.length > 0}>
        <div class="debugger-line" onclick={showItemsToggle}>
            Found <span class={foundElements.length == 0 ? "good": "bad"}>{foundElements.length}</span> {opts.hinter.description.toLowerCase()}
        </div>

        <ul if={showItems}>
            <item each={foundElements} element={this}></item>
        </ul>
    </div>

    <script>
    this.foundElements = {'elements': {}};
    this.showItems = false;

    this.on('mount', function() {
        this.foundElements = Array.prototype.slice.call(document.querySelectorAll(opts.hinter.selector));
        this.update();
    });

    showItemsToggle(event) {
        this.showItems = !this.showItems;
    }
    </script>

    <style>

    h1 {
        margin: 0;
    }

    .good {
        color: green;
    }

    .bad {
        color: red;
    }

    .debugger-line-wrapper > div {
        font-size: 14px;
    }

    ul {
        font-size: 13px;
        margin: 0;
        padding: 0;
    }

    .debugger-line {
        cursor: pointer;
    }

    </style>

</debugger-line>
