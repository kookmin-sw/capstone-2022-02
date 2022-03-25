function setThumnail (event) {
    var reader = new FileReader ();
    reader.onload = function (event) {
        var img = document.getElementById ("id_picture");
        img.removeAttribute ("src");
        img.setAttribute ("src", event.target.result);
    };

    reader.readAsDataURL (event.target.files[0]);
}