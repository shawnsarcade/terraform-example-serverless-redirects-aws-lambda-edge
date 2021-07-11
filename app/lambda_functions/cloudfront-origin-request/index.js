'use strict';
exports.handler = (event, context, callback) => {
    let request = event.Records[0].cf.request;

    
    if (request.uri == "/sales") {
        const redirectResponse = {
            status: "301",
            statusDescription: "Moved Permanently",
            headers: {
                'location': [{
                    key: 'Location',
                    value: 'https://shawnsarcade.com/new-url/sales',
                }],
                'cache-control': [{
                    key: 'Cache-Control',
                    value: "max-age=3600"
                }],
            },
        };
        callback(null, redirectResponse);
    }
    if (request.uri == "/sales/contact") {
        const redirectResponse = {
            status: "301",
            statusDescription: "Moved Permanently",
            headers: {
                'location': [{
                    key: 'Location',
                    value: 'https://shawnsarcade.com/new-url/contact',
                }],
                'cache-control': [{
                    key: 'Cache-Control',
                    value: "max-age=3600"
                }],
            },
        };
        callback(null, redirectResponse);
    }

    else {
        const redirectResponse = {
            status: "301",
            statusDescription: "Moved Permanently",
            headers: {
                'location': [{
                    key: 'Location',
                    value: 'https://shawnsarcade.com/new-url/',
                }],
                'cache-control': [{
                    key: 'Cache-Control',
                    value: "max-age=3600"
                }],
            },
        };
        callback(null, redirectResponse);
    }
}