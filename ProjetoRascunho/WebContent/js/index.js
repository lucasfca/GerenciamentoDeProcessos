const element =  document.querySelector('#eProcessos')
element.classList.add('animated', 'swingOutLeft')

const element =  document.querySelector('#eProcessos')
element.classList.add('animated', 'swingOutLeft')

element.addEventListener('animationend', function() { doSomething() })

function animateCSS(element, animationName, callback) {
    const node = document.querySelector(element)
    node.classList.add('animated', animationName)

    function handleAnimationEnd() {
        node.classList.remove('animated', animationName)
        node.removeEventListener('animationend', handleAnimationEnd)

        if (typeof callback === 'function') callback()
    }

    node.addEventListener('animationend', handleAnimationEnd)
}