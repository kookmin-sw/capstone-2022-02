var i = 0;
window.onload = function () {
    const max = document.getElementsByClassName ("versus").length - 1;
    var session = document.getElementsByClassName ("versus")[i];
    var modal_session = document.getElementsByClassName ("versus")[max];
    var modal = document.getElementById ("modal_bg");   
    session.addEventListener ("click", function extendSession () {        
        document.body.style.overflow = "hidden";
        modal.classList.remove ("hidden");
        session.removeEventListener ("click", extendSession);
        i++;
        if (i >= max) {
            session = null;
            return;
        }
        modal_session.querySelector ("#name1").innerText = session.querySelector ("#name1").innerText;
        modal_session.querySelector ("#name2").innerText = session.querySelector ("#name2").innerText;
        modal_session.querySelector ("#player1").getElementsByTagName ("img")[0].src = session.querySelector ("#player1").getElementsByTagName ("img")[0].src;
        modal_session.querySelector ("#player2").getElementsByTagName ("img")[0].src = session.querySelector ("#player2").getElementsByTagName ("img")[0].src;
        session = document.getElementsByClassName ("versus")[i];
        session.addEventListener ("click", extendSession);
    });
};

window.addEventListener ("load", function () {
    var submit = document.getElementsByClassName ("submit_btn")[0];
    var modal = document.getElementById ("modal_bg");
    submit.addEventListener ("click", function closeSession () {
        var session = document.getElementsByClassName ("versus")[i - 1];
        modal.classList.add ("hidden");
        document.body.style.overflow = "auto";
        session.querySelector ("#point1").textContent = modal.querySelector ("#point1").childNodes[2].textContent;
        session.querySelector ("#point2").textContent = modal.querySelector ("#point2").childNodes[2].textContent;
        modal.querySelector ("#point1").childNodes[2].textContent = "0";
        modal.querySelector ("#point2").childNodes[2].textContent = "0";
    });

    var dbtn1 = modal.getElementsByClassName ("down")[0].getElementsByTagName ("img")[0];
    var ubtn1 = modal.getElementsByClassName ("up")[0].getElementsByTagName ("img")[0];
    var dbtn2 = modal.getElementsByClassName ("down")[1].getElementsByTagName ("img")[0];
    var ubtn2 = modal.getElementsByClassName ("up")[1].getElementsByTagName ("img")[0];
    dbtn1.addEventListener ("click", function () {
        var point = Number (dbtn1.parentNode.parentNode.textContent);
        if (point == 0) {return;}
        point--;
        dbtn1.parentNode.parentNode.childNodes[2].textContent = String (point);
    });
    dbtn2.addEventListener ("click", function () {
        var point = Number (dbtn2.parentNode.parentNode.textContent);
        if (point == 0) {return;}
        point--;
        dbtn2.parentNode.parentNode.childNodes[2].textContent = String (point);
    });
    
    ubtn1.addEventListener ("click", function () {
        var point = Number (ubtn1.parentNode.parentNode.textContent);
        point++;
        dbtn1.parentNode.parentNode.childNodes[2].textContent = String (point);
    });
    ubtn2.addEventListener ("click", function () {
        var point = Number (ubtn2.parentNode.parentNode.textContent);
        point++;
        ubtn2.parentNode.parentNode.childNodes[2].textContent = String (point);
    });
});