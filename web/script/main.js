/*window.onload = function () {
    var z, file, xhttp;
    z = document.getElementsByTagName ("*");
    for (var i = 0; i < z.length; i++) {
        if (z[i].hasAttribute ("include-html")) {
            file = z[i].getAttribute ("include-html");
            if (file) {
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        z[i].outterHTML = this.responseText;
                        console.log(this.responseText);
                    }
                }
            }
            xhttp.open ("GET", file, true);
            xhttp.send ();
        }
    }
};*/
