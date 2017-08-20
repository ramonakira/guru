<toggle-button>
    <div class={btn: true, btn-active: opts.active}><span><yield/></span></div> 

    <style>
    .btn {
        display: inline-block;
        border: 1px solid transparent;
        padding: 1px 4px;
    }

    .btn-active {
        border: 1px solid #fff;
        background-color: #3C7FB2;
    }

    .btn > span {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;        
    }    
    </style>
</toggle-button>
