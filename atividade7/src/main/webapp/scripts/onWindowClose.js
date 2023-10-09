/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


window.addEventListener("beforeunload", function (e) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "Controller", false);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.send("operacao=sair");
});