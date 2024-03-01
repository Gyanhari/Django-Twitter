function getusername(){
    let currentUrl = window.location.href;
    let urlParts = currentUrl.split("/");
    let username = urlParts[urlParts.length - 2];
    console.log(username)
    const mylink=document.querySelector("#chatwithuser")
    mylink.href=`http://127.0.0.1:8000/chat/${username}`
}
window.onload=() => {getusername()}