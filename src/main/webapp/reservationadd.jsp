<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Reservation | Hotel Management System</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #0a0e27;
    color: #e1e5e9;
    line-height: 1.6;
    overflow-x: hidden;
    min-height: 100vh;
    padding: 2rem 1rem;
}

/* Animated Background */
.bg-pattern {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: 
        radial-gradient(circle at 20% 50%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
        radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%),
        radial-gradient(circle at 40% 80%, rgba(120, 219, 255, 0.3) 0%, transparent 50%);
    z-index: -1;
    animation: moveBackground 20s ease-in-out infinite;
}

@keyframes moveBackground {
    0%, 100% { transform: translateX(0) translateY(0); }
    25% { transform: translateX(-5px) translateY(-10px); }
    50% { transform: translateX(10px) translateY(5px); }
    75% { transform: translateX(-3px) translateY(8px); }
}

.container {
    max-width: 600px;
    margin: 0 auto;
    background: rgba(26, 32, 56, 0.9);
    backdrop-filter: blur(15px);
    border-radius: 25px;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
    overflow: hidden;
    border: 1px solid rgba(255, 255, 255, 0.1);
    position: relative;
    animation: formSlideIn 0.8s ease-out;
}

@keyframes formSlideIn {
    from {
        opacity: 0;
        transform: translateY(50px) scale(0.95);
    }
    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

.header {
    background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
    color: white;
    padding: 3rem 2.5rem;
    text-align: center;
    position: relative;
    overflow: hidden;
}

.header::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(45deg, rgba(255, 255, 255, 0.1), transparent);
    animation: headerShine 3s ease-in-out infinite;
}

@keyframes headerShine {
    0% { left: -100%; }
    50% { left: 100%; }
    100% { left: 100%; }
}

.header h1 {
    font-size: 2.2rem;
    margin-bottom: 0.8rem;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    position: relative;
    z-index: 2;
}

.header p {
    font-size: 1rem;
    font-weight: 400;
    opacity: 0.9;
    position: relative;
    z-index: 2;
}

.form-section {
    padding: 3rem 2.5rem;
    background: rgba(255, 255, 255, 0.02);
}

.form-group {
    margin-bottom: 2rem;
    position: relative;
}

label {
    display: block;
    margin-bottom: 0.8rem;
    font-weight: 600;
    color: #e1e5e9;
    font-size: 0.95rem;
    text-transform: uppercase;
    letter-spacing: 1px;
    position: relative;
}

label::after {
    content: '';
    position: absolute;
    bottom: -3px;
    left: 0;
    width: 0;
    height: 2px;
    background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
    transition: width 0.3s ease;
}

.form-group:focus-within label::after {
    width: 100%;
}

input {
    width: 100%;
    padding: 1rem 1.2rem;
    border: 2px solid rgba(255, 255, 255, 0.1);
    border-radius: 15px;
    font-size: 1rem;
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(10px);
    color: #e1e5e9;
    transition: all 0.3s ease;
    position: relative;
}

input::placeholder {
    color: #b4bcd0;
}

input:focus {
    outline: none;
    border-color: #ff6b6b;
    box-shadow: 0 0 0 4px rgba(255, 107, 107, 0.2);
    background: rgba(255, 255, 255, 0.08);
    transform: translateY(-2px);
}

input:hover {
    border-color: rgba(255, 255, 255, 0.2);
    background: rgba(255, 255, 255, 0.07);
}

.submit-btn {
    width: 100%;
    background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
    color: white;
    border: none;
    padding: 1.2rem;
    border-radius: 15px;
    font-size: 1.1rem;
    font-weight: 700;
    cursor: pointer;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    margin-top: 1rem;
}

.submit-btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(45deg, #4ecdc4, #ff6b6b);
    transition: left 0.3s ease;
}

.submit-btn:hover::before {
    left: 0;
}

.submit-btn span {
    position: relative;
    z-index: 2;
}

.submit-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 30px rgba(255, 107, 107, 0.4);
}

.submit-btn:active {
    transform: translateY(-1px);
}

.back-link {
    display: inline-block;
    margin-top: 2rem;
    background: transparent;
    color: #4ecdc4;
    font-weight: 600;
    text-decoration: none;
    padding: 0.8rem 2rem;
    border-radius: 25px;
    transition: all 0.3s ease;
    border: 2px solid #4ecdc4;
    text-transform: uppercase;
    letter-spacing: 1px;
    position: relative;
    overflow: hidden;
}

.back-link::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: #4ecdc4;
    transition: left 0.3s ease;
    z-index: -1;
}

.back-link:hover::before {
    left: 0;
}

.back-link:hover {
    color: white;
    transform: translateY(-2px);
}

.back-link::after {
    content: '← ';
    margin-right: 0.5rem;
}

/* Toast Notification */
.toast {
    position: fixed;
    top: 30px;
    right: 30px;
    background: rgba(26, 32, 56, 0.95);
    backdrop-filter: blur(15px);
    border: 1px solid rgba(255, 107, 107, 0.5);
    border-radius: 15px;
    padding: 1.5rem 2rem;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
    z-index: 1000;
    max-width: 400px;
    animation: toastSlide 0.5s ease;
    color: #e1e5e9;
}

.toast-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 0.8rem;
}

.toast-title {
    font-weight: 700;
    font-size: 1.1rem;
    color: #ff6b6b;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.toast-close {
    background: none;
    border: none;
    color: #b4bcd0;
    font-size: 1.5rem;
    cursor: pointer;
    transition: all 0.3s ease;
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
}

.toast-close:hover {
    background: rgba(255, 107, 107, 0.2);
    color: #ff6b6b;
}

.toast-message {
    color: #e1e5e9;
    line-height: 1.5;
}

@keyframes toastSlide {
    from {
        opacity: 0;
        transform: translateX(100%) scale(0.8);
    }
    to {
        opacity: 1;
        transform: translateX(0) scale(1);
    }
}

.toast.slide-out {
    animation: toastSlideOut 0.5s ease forwards;
}

@keyframes toastSlideOut {
    from {
        opacity: 1;
        transform: translateX(0) scale(1);
    }
    to {
        opacity: 0;
        transform: translateX(100%) scale(0.8);
    }
}

/* Input animations */
.form-group {
    animation: formGroupSlide 0.6s ease-out;
    animation-fill-mode: both;
}

.form-group:nth-child(1) { animation-delay: 0.1s; }
.form-group:nth-child(2) { animation-delay: 0.2s; }
.form-group:nth-child(3) { animation-delay: 0.3s; }
.form-group:nth-child(4) { animation-delay: 0.4s; }
.form-group:nth-child(5) { animation-delay: 0.5s; }

@keyframes formGroupSlide {
    from {
        opacity: 0;
        transform: translateX(-30px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

@media (max-width: 640px) {
    body {
        padding: 1rem;
    }

    .container {
        margin: 0;
    }

    .header {
        padding: 2rem 1.5rem;
    }

    .header h1 {
        font-size: 1.8rem;
    }

    .form-section {
        padding: 2rem 1.5rem;
    }

    .toast {
        right: 15px;
        left: 15px;
        max-width: none;
    }
}
</style>
</head>
<body>

<div class="bg-pattern"></div>

<%
String status = request.getParameter("status");
String errorMessage = (String) request.getAttribute("error");
if ("fail".equals(status) && errorMessage != null) {
%>
<div id="toast" class="toast">
    <div class="toast-header">
        <span class="toast-title">Error!</span>
        <button class="toast-close" onclick="closeToast()">×</button>
    </div>
    <div class="toast-message">Reservation failed: <%= errorMessage.replace("\"", "\\\"") %></div>
</div>
<script>
function closeToast() {
    const toast = document.getElementById('toast');
    toast.classList.add('slide-out');
    setTimeout(() => toast.style.display = 'none', 500);
}

window.onload = function () {
    setTimeout(() => closeToast(), 5000);
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.pathname);
    }
};
</script>
<%
}
%>

<div class="container">
    <div class="header">
        <h1>Add New Reservation</h1>
        <p>Fill in the details below to create your booking</p>
    </div>

    <div class="form-section">
        <form action="AddReservationServlet" method="post">
            <div class="form-group">
                <label for="customerName">Customer Name:</label>
                <input type="text" id="customerName" name="customerName" placeholder="Enter customer name" required>
            </div>

            <div class="form-group">
                <label for="roomNumber">Room Number:</label>
                <input type="text" id="roomNumber" name="roomNumber" placeholder="Enter room number" required>
            </div>

            <div class="form-group">
                <label for="checkIn">Check-In Date:</label>
                <input type="date" id="checkIn" name="checkIn" required>
            </div>

            <div class="form-group">
                <label for="checkOut">Check-Out Date:</label>
                <input type="date" id="checkOut" name="checkOut" required>
            </div>

            <div class="form-group">
                <label for="totalAmount">Total Amount:</label>
                <input type="number" id="totalAmount" name="totalAmount" step="0.01" placeholder="Enter total amount" required>
            </div>

            <button type="submit" class="submit-btn"><span>Add Reservation</span></button>
        </form>

        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</div>

<script>
// Form validation and animations
document.addEventListener('DOMContentLoaded', function() {
    const inputs = document.querySelectorAll('input');
    
    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
        });
    });

    // Date validation
    const checkInInput = document.getElementById('checkIn');
    const checkOutInput = document.getElementById('checkOut');
    
    checkInInput.addEventListener('change', function() {
        checkOutInput.min = this.value;
        if (checkOutInput.value && checkOutInput.value <= this.value) {
            checkOutInput.value = '';
        }
    });

    // Set minimum date to today
    const today = new Date().toISOString().split('T')[0];
    checkInInput.min = today;
    checkOutInput.min = today;
});
</script>

</body>
</html>