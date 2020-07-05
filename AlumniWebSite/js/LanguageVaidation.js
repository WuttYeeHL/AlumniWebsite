function isEnglishOnly(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || (charCode == 32))
        return true;

    return false;
}

function isEnglishOnlyforEmail(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || (charCode >= 33 && charCode <= 64))
        return true;

    return false;
}

function isEnglishOnlyforNumber(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode >= 48 && charCode <= 57)
        return true;

    return false;
}
function isEnglishNumber(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || (charCode >= 32 && charCode <= 47) || (charCode >= 48 && charCode <= 57))
  
        return true;

    return false;
}