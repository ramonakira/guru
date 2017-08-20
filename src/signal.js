class cEvent {
    listen(event, callback) {
        document.body.addEventListener(event, callback);
    }

    dispatch(event, data) {
        var event = new CustomEvent(event, {
            detail: data
        });
        document.body.dispatchEvent(event);
    }
}

export default new cEvent();