// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

window.chooseTool = async function (toolName) {
    const backdrop = document.getElementById("backdrop")
    const popup = document.getElementById("popup")
    const yourChoice = document.getElementById("your-choice")
    yourChoice.src = document.getElementById(`${toolName}-image`).src
    backdrop.classList.remove("hidden")
    popup.classList.remove("hidden")
    await timeout(1500) //making sure that that the popup is readable before it closes

    const response = await fetch("/api/throw?" + new URLSearchParams({
        tool_name: toolName
    }))
    const throwResult = await response.json();
    const winner = throwResult['winner']
    const curbChoice = throwResult['curbTool']

    const resultTitle = document.getElementById('result-title')
    const resultDetails = document.getElementById('result-details')
    const curbChoiceImage = document.getElementById('curbs-choice')
    curbChoiceImage.src = document.getElementById(`${curbChoice}-image`).src
    if (winner === 'player') {
        resultTitle.innerHTML = 'YOU WON!'
        resultDetails.innerHTML = `Curb with ${curbChoice} loses`
    } else if (winner === 'curb') {
        resultTitle.innerHTML = 'YOU LOST!'
        resultDetails.innerHTML = `Curb with ${curbChoice} wins`
    } else {
        resultTitle.innerHTML = 'IT IS A TIE!'
        resultDetails.innerHTML = `Curb choose ${curbChoice} as well`
    }
    closePopup()
    openResult()
}

window.closePopup = function () {
    const backdrop = document.getElementById("backdrop")
    const popup = document.getElementById("popup")
    popup.classList.add("hidden")
    backdrop.classList.add("hidden")
}

window.closeResult = function () {
    const backdrop = document.getElementById("backdrop")
    const result = document.getElementById("result")
    result.classList.add("hidden")
    backdrop.classList.add("hidden")
}

window.openResult = function () {
    const backdrop = document.getElementById("backdrop")
    const result = document.getElementById("result")
    backdrop.classList.remove("hidden")
    result.classList.remove("hidden")
}
window.addEventListener('keydown', event => {
    if (event.key == 'Escape') {
        closePopup()
        closeResult()
    }
})

window.timeout = function (ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
window.closePopups = function (){
    closePopup()
    closeResult()
}
