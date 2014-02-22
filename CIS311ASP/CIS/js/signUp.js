$(function() {
	console.log("working!");
	validateSignup();
});

var validateSignup = function() {
	$("#signup-form").on("submit", function() {
		if (!validateEmail($("#user-email").val())) {
			console.log("invalid email");
			alert("invalid email");
			return false;
		}
		if ($("#user-pass").val() != $("#user-pass2").val()) {
			console.log("passwords don't match");
			alert("passwords do not match");
			return false;
		}
		
		return true;
	});
}

function validateEmail(email) {
	var re = /[a-z0-9!#$%&'*+/=?^_{|}~-]+(?:.[a-z0-9!#$%&'*+/=?^_{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/
    return re.test(email);
}

