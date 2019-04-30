        for(var event of ['input', 'keyup', 'wheel']) {
            inputBegin.addEventListener(event, keyProcess)
            inputEnd.addEventListener(event, keyProcess)
        }

        var say = 0;
        function keyProcess(e) {
            if(e.deltaY && Date.now() - say > 200){
                say = Date.now();
                let change = Math.sign(e.deltaY);
                this.value = Math.min(9, Math.max(0, Number(this.value) + change));
            }

            if (e.keyCode == 38) {
                var value = Math.min(Number(this.value) + 1, 9);
                this.value = value;
            }
            if (e.keyCode == 40) {
                var value = Math.max(Number(this.value) - 1, 0);
                this.value = value;
            }

            var begin = Number(inputBegin.value)
            var end = Number(inputEnd.value)

            var arr = []
            var arrayElements = document.querySelectorAll('.boxes .box')
            for(var ele of arrayElements) {
                ele.classList.remove('selected')
                arr.push(ele)
            }

            var slicedElements = arr.slice(begin, end)
            for(var ele of slicedElements) {
                ele.classList.add('selected')
            }

        }