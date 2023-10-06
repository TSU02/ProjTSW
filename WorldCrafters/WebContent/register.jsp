<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="templates/head.html" %>
    <link rel="stylesheet" type="text/css" href="styles/log-reg.css">
</head>
<body>
	<div class="modal-overlay">
		<div class="modal-content">
			<button class="close-button" onclick="closeModal()">X</button>
			<h2 class="form-title">Sign up</h2>
			<form method="post" action="registration" id="signup-form">
				<div class="form-group">
					<label for="firstName">First name:</label> 
					<input type="text" name="firstName" id="firstName" placeholder="First name" required />
				</div>
				<div class="form-group">
					<label for="lastName">Last name:</label> 
					<input type="text" name="lastName" id="lastName" placeholder="Last name" required />
				</div>
				<div class="form-group">
					<label for="email">Email:</label> <input type="email" name="email"
						id="email" placeholder="Your Email" required />
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						name="password" id="password" placeholder="Password" required />
				</div>
				<div class="form-group">
					<label for="confirm-password">Confirm Password:</label> <input
						type="password" name="confirm-password" id="confirm-password"
						placeholder="Confirm Password" required />
				</div>
				<div class="form-group form-button">
					<input type="submit" name="signup" id="signup" value="Registrati"/>
				</div>
			</form>
			<div class="social-login">
				<span class="social-label">Or register with</span>
				<div class="social-icons">
					<a href="fakeSite/fakeGoogle/index.html"> <img
						src="images/google.png" alt="Google Logo" class="social-icon">
					</a> <a href="fakeSite/fakeFacebook/index.html"> <img
						src="images/facbook.png" alt="Facebook Logo" class="social-icon">
					</a> <a href="fakeSite/fakeTwitter/index.html"> <img
						src="images/twitter.png" alt="Twitter Logo" class="social-icon">
					</a>
				</div>
			</div>

		</div>
	</div>
	
	<script>
		function closeModal() {
			history.back();
		}
	</script>
	
</body>
</html>
