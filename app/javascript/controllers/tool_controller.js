import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="tool"
export default class extends Controller {
    static values = {
        currentToolId: Number,
        selectedToolId: Number,
        selected: Boolean,
    }
    static targets = ["element"]

    connect() {
        if (this.selectedValue) {
            this.elementTarget.classList.add('selected')
        }
    }

    togleSelecetdState() {
        this.elementTarget.classList.toggle('selected')
        this.selectedValue = !this.selectedValue
        const csrfToken = document.getElementsByName('csrf-token')[0].content
        fetch(`/tools/${this.currentToolIdValue}/set_beaten_tool`, {
            method: 'post',
            body: JSON.stringify({
                selected_tool_id: this.selectedToolIdValue,
                selected: this.selectedValue
            }),
            headers: {
                'X-CSRF-Token': csrfToken,
                'Content-Type': 'application/json'
            }
        })
    }
}
