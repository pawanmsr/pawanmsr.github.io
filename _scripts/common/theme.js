import { icons } from "./feather";

const LIGHT_ICON = "<i data-feather=\"sun\"></i>"
const DARK_ICON = "<i data-feather=\"moon\"></i>"
const ATTRIBUTE = "data-theme"
const DARK = "dark"
const LIGHT = "light"
const MODE = "mode"

function setDarkMode() {
    document.documentElement.setAttribute(ATTRIBUTE, DARK);
    $("#mode").find("svg").replaceWith(LIGHT_ICON);
    icons();
}

function setLightMode() {
    document.documentElement.setAttribute(ATTRIBUTE, LIGHT);
    $("#mode").find("svg").replaceWith(DARK_ICON);
    icons();
}

function setPreferredMode(systemPrefersDark) {
    if (systemPrefersDark.matches) {
        setDarkMode();
    } else {
        setLightMode();
    }

    sessionStorage.setItem(MODE, '');
}

export const setMode = () => {
    let systemPrefersDark = window.matchMedia("(prefers-color-scheme: dark)");
    let mode = sessionStorage.getItem(MODE);
    
    if (mode == DARK) {
        setDarkMode();
    } else if (mode == LIGHT) {
        setLightMode();
    } else {
        setPreferredMode(systemPrefersDark);
    }
}

export const switchMode = () => {
    $("#mode").on("click", () => {
        if ($("#mode").find("svg").hasClass("feather-moon")) {
            setDarkMode();
            sessionStorage.setItem(MODE, DARK);
        } else {
            setLightMode();
            sessionStorage.setItem(MODE, LIGHT);
        }
    });
}

export default {switchMode, setMode};
