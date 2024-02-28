const id = JSON.parse(document.getElementById('json-id-receiver').textContent);
const message_username = JSON.parse(document.getElementById('json-message-sender').textContent)

const socket = new WebSocket(
    'ws://'
    + window.location.host
    + '/ws/chat/'
    + id
    + '/'
);
// function scrollToBottom() {
//     const chatContainer = document.addEventListener('#chat-body')
//     chatContainer.scrollTop = chatContainer.scrollHeight;
// }

document.querySelector("#message_input").addEventListener("keydown", (event) => {
    if (event.key === "Enter") {
        // Prevent the default behavior of the Enter key
        event.preventDefault();

        // Send the message to the server
        document.querySelector('#chat-message-submit').click();
        // Clear the input field
        document.querySelector("#message_input").value = "";
    }
});

socket.onopen = function (e){
    console.log("Connection Established");

}

socket.onclose = function (e){
    console.log("CONNECTION Lost")
}

socket.onerror = function (e){
    console.log(e);
}

socket.onmessage = function (e){
    console.log(e);
    const data = JSON.parse(e.data);
    if(data.sender == message_username){
        document.querySelector('#chat-body').innerHTML += `<div class="my-messages-container">
            <p class="my-messages">
                ${data.message}
            </p>
        </div>`
    }
    else{
        document.querySelector('#chat-body').innerHTML += `<div class="not-my-messages-container">
        <p class="not-my-messages">
            ${data.message}
        </p>
    </div>`
    }
    console.log(data);
}

document.querySelector("#chat-message-submit").onclick  =  ( ) => {
    const message_input = document.querySelector("#message_input");
    const message = message_input.value;

    if (message !== ''){
        socket.send(JSON.stringify({
            'message': message,
            'sender': message_username
        }));
        message_input.value = '';
    }
    else{
        alert("Enter a none Null Message");
    }
}