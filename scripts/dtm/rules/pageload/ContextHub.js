if (typeof window.summitaemintegrationlab === "undefined") {
    window.summitaemintegrationlab = {};
    window.summitaemintegrationlab.firstLoad = true;
}

window.summitaemintegrationlab.triggerGlobalMBoxUpdate = function() {
    var params = [ "target-global-mbox" ];
    if(_satellite.getToolsByType("tnt")) {
        var globalMboxMappings = _satellite.getToolsByType("tnt")[0].settings.pageParams;
        for (var p in globalMboxMappings) {
            var val = _satellite.getVar(globalMboxMappings[p].replace(/%/g, ''));
            params.push(p + "=" + val);
        }
    }
    console.log("triggering global mbox update", params);
    mboxUpdate.apply(this, params);

    // give global mbox update a few ms to finish
    setTimeout(function() {
        window.summitaemintegrationlab.triggerMBoxUpdates()
    }, 400);
}

window.summitaemintegrationlab.triggerMBoxUpdates = function() {
    console.log("triggering mbox update");
    CQ_Analytics.TestTarget.callMboxUpdate();
}

ContextHub.eventing.on(ContextHub.Constants.EVENT_STORE_UPDATED, function(e) {
    if (window.summitaemintegrationlab.firstLoad) {
        window.summitaemintegrationlab.firstLoad = false;
    } else {
        window.summitaemintegrationlab.triggerGlobalMBoxUpdate();
    }
}, null, true);
