function ajaxCallFetch(url, method) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: url,
            type: method,
            success: function (data) {
                resolve(data);
            },
            error: function (error) {
                reject(error);
            },
        })
    });
}

function ajaxCallSend(url, method, jsonData) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: url,
            type: method,
            data : {
                data: jsonData
            },
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                resolve(data);
            },
            error: function (error) {
                reject(error);
            },
        })
    });
}