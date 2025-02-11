/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


       document.addEventListener('DOMContentLoaded', function() {
    // Initialize sidenav for mobile navbar
    var sidenav = document.querySelectorAll('.sidenav');
    M.Sidenav.init(sidenav);

    // Initialize scrollspy for smooth scrolling
    var scrollspy = document.querySelectorAll('.scrollspy');
    M.ScrollSpy.init(scrollspy, {
        throttle: 100
    });
});



