// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

window.chooseTool =  function(toolName) {
    console.log(toolName)
    const backdrop = document.getElementById("backdrop")
    const popup = document.getElementById("popup")
    const yourChoice = document.getElementById("your-choice")
    yourChoice.src = document.getElementById(`${toolName}-image`).src

    backdrop.classList.remove("hidden")
    popup.classList.remove("hidden")
}

window.closePopup = function (){
    const backdrop = document.getElementById("backdrop")
    const popup = document.getElementById("popup")
    popup.classList.add("hidden")
    backdrop.classList.add("hidden")
}

window.addEventListener('keydown', event =>{
    if(event.key == 'Escape'){
        closePopup()
    }
})

