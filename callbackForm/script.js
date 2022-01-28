"use strict"

document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('form');
    form.addEventListener('submit', formSend)

    async function formSend(e) {
        e.preventDefault();

        let error = formValidate(form);

        let formData = new FormData(form);
        formData.append('file', formFile.files[0]);

        if(error === 0){
            form.classList.add('_sending');
            let response = await fetch('serverValidate.php',{
                method: 'POST',
                body:formData
            });
            if(response.ok){
                let result = await response.json();
                alert(result.message);
                filePreview.innerHTML = '';
                form.reset();
                form.classList.remove('_sending');
            }else {
                alert("Ошибка")
                form.classList.remove('_sending');
            }
        }else{
            alert('Заполните обязательные поля');
        }
    }

    function formValidate(form) {
       let error = 0;
       let formReq = document.querySelectorAll('._req');

       for (let index = 0; index < formReq.length; index++){
           const input = formReq[index];
           formRemoveError(input);

           if (input.value === ''){
               formAddError(input);
               error++;
           }
       }
       return error;
    }

    function formAddError(input){
        input.parentElement.classList.add('_error');
        input.classList.add('_error');
    }

    function formRemoveError(input){
        input.parentElement.classList.remove('_error');
        input.classList.remove('_error');
    }

    const formFile = document.getElementById('formFile');
    const filePreview = document.getElementById('formPreview');

    formFile.addEventListener('change', () => {
        uploadFile(formFile.files[0]);
    });

    function uploadFile(file){
        var reader = new FileReader();
        reader.onload = function (e){
            filePreview.innerHTML = '<br>Файл загружен: ' + file.name;
        }
        reader.readAsDataURL(file);
    }

});