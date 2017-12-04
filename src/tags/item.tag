<item>
    <li class="item" onclick={toggleHighlightElement}>
        {buildIdentifier(opts.element.localName, opts.element.className, opts.element.id, opts.element.text)}
    </li>

    <script>
    this.elementHighlighted = false;

    buildIdentifier(localName, className = '', id = '', text = '') {
        return '{localName}{className}{id}{text}'.format({
            localName: localName,
            className: (className.length > 0) ? `.${className}` : '',
            id: (id.length > 0) ? `#${id}` : '',
            text: (text.length > 0) ? `{${text}}` : ''
        });
    }

    toggleHighlightElement(event) {
        this.opts.element.style.outline = (!this.elementHighlighted) ? '4px solid red': '';
        this.elementHighlighted = !this.elementHighlighted;
    }
    </script>

    <style>
    .item {
        display: inline-block;
        border: 1px solid gray;
        margin: 2px;
        padding: 0 2px;
        line-height: 1.4;
        font-family: sans-serif;
        color: #fff;
    }
    </style>
</item>