<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Report | Hotel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            max-width: 800px;
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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

        .content {
            padding: 3rem 2.5rem;
            background: rgba(255, 255, 255, 0.02);
        }

        .error-alert {
            background: rgba(244, 67, 54, 0.1);
            border-left: 5px solid #f44336;
            border-radius: 15px;
            padding: 1.2rem 1.5rem;
            margin-bottom: 2rem;
            color: #ff8a80;
            backdrop-filter: blur(10px);
            animation: errorSlide 0.5s ease-out;
        }

        @keyframes errorSlide {
            from {
                opacity: 0;
                transform: translateX(-30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .report-type-info {
            margin-bottom: 2rem;
            animation: infoSlide 0.6s ease-out;
        }

        @keyframes infoSlide {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .report-type-info h2 {
            font-size: 1.8rem;
            color: #667eea;
            margin-bottom: 1rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
        }

        .report-type-info h2::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 60px;
            height: 3px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            border-radius: 2px;
        }

        .report-type-info p {
            font-size: 1rem;
            color: #b4bcd0;
            line-height: 1.6;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .form-group {
            position: relative;
            animation: formGroupSlide 0.6s ease-out;
            animation-fill-mode: both;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }

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

        .form-label {
            display: block;
            margin-bottom: 0.8rem;
            font-weight: 600;
            color: #e1e5e9;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
        }

        .form-label::after {
            content: '';
            position: absolute;
            bottom: -3px;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            transition: width 0.3s ease;
        }

        .form-group:focus-within .form-label::after {
            width: 100%;
        }

        .form-label i {
            margin-right: 0.5rem;
            color: #667eea;
        }

        .form-input {
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

        .form-input::placeholder {
            color: #b4bcd0;
        }

        .form-input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.2);
            background: rgba(255, 255, 255, 0.08);
            transform: translateY(-2px);
        }

        .form-input:hover {
            border-color: rgba(255, 255, 255, 0.2);
            background: rgba(255, 255, 255, 0.07);
        }

        .hidden-input {
            display: none;
        }

        .btn {
            width: 100%;
            background: linear-gradient(45deg, #667eea, #764ba2);
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
            margin-top: 2rem;
            animation: btnSlide 0.8s ease-out 0.4s;
            animation-fill-mode: both;
        }

        @keyframes btnSlide {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #764ba2, #667eea);
            transition: left 0.3s ease;
        }

        .btn:hover::before {
            left: 0;
        }

        .btn span {
            position: relative;
            z-index: 2;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
        }

        .btn:active {
            transform: translateY(-1px);
        }

        .btn:disabled,
        .btn.loading {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        .btn.loading::before {
            left: 0;
            animation: loadingPulse 1.5s ease-in-out infinite;
        }

        @keyframes loadingPulse {
            0%, 100% { opacity: 0.6; }
            50% { opacity: 1; }
        }

        .back-link {
            text-align: center;
            margin-top: 2rem;
            animation: linkSlide 0.8s ease-out 0.5s;
            animation-fill-mode: both;
        }

        @keyframes linkSlide {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .back-link a {
            display: inline-block;
            background: transparent;
            color: #667eea;
            font-weight: 600;
            text-decoration: none;
            padding: 0.8rem 2rem;
            border-radius: 25px;
            transition: all 0.3s ease;
            border: 2px solid #667eea;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }

        .back-link a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: #667eea;
            transition: left 0.3s ease;
            z-index: -1;
        }

        .back-link a:hover::before {
            left: 0;
        }

        .back-link a:hover {
            color: white;
            transform: translateY(-2px);
        }

        .back-link a::after {
            content: '← ';
            margin-right: 0.5rem;
        }

        .no-params-message {
            font-size: 1rem;
            padding: 1.2rem 1.5rem;
            background: rgba(102, 126, 234, 0.1);
            color: #667eea;
            border-left: 4px solid #667eea;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            animation: messageSlide 0.5s ease-out;
        }

        @keyframes messageSlide {
            from {
                opacity: 0;
                transform: translateX(30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Icon styling */
        .date-range-icon::before {
            content: "\f073";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            margin-right: 8px;
            color: #667eea;
        }

        .revenue-icon::before {
            content: "\f201";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            margin-right: 8px;
            color: #667eea;
        }

        .popular-rooms-icon::before {
            content: "\f015";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            margin-right: 8px;
            color: #667eea;
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

            .content {
                padding: 2rem 1.5rem;
            }

            .form-container {
                gap: 1.5rem;
            }
        }
    </style>
</head>
<body>

<div class="bg-pattern"></div>

<div class="container">
    <div class="header">
        <h1>Generate Report</h1>
        <p>Create detailed analytics and insights</p>
    </div>

    <div class="content">
        <%
        String error = request.getParameter("error");
        if (error != null && !error.isEmpty()) {
        %>
            <div class="error-alert">
                <%= error.replaceAll("\"", "&quot;") %>
            </div>
        <%
        }
        %>

        <%
        String reportType = request.getParameter("reportType");
        if (reportType == null) {
        %>
            <div class="error-alert">
                No report type selected. Please select a report type from the main menu.
            </div>
            <div class="back-link">
                <a href="dashboard.jsp">Back to Dashboard</a>
            </div>
        <%
        } else {
        %>
            <div class="report-type-info">
                <h2 class="<%= reportType.equals("dateRange") ? "date-range-icon" : 
                              reportType.equals("revenue") ? "revenue-icon" : 
                              reportType.equals("popularRooms") ? "popular-rooms-icon" : "" %>">
                    <%= reportType.equals("dateRange") ? "Reservations by Date Range" :
                        reportType.equals("revenue") ? "Revenue Report" :
                        reportType.equals("popularRooms") ? "Popular Rooms Report" : "Unknown Report" %>
                </h2>
                <p>
                    <%= reportType.equals("dateRange") ? "Generate a comprehensive list of all reservations within your specified date range." :
                        reportType.equals("revenue") ? "Analyze your revenue performance and financial metrics for the selected period." :
                        reportType.equals("popularRooms") ? "Discover which rooms are most frequently booked and generate insights." : "Report description not available." %>
                </p>
            </div>

            <form action="ReportServlet" method="post" class="report-form">
    <div class="form-container">
        <input type="hidden" name="reportType" value="<%= reportType %>" class="hidden-input">

        <% if ("dateRange".equals(reportType) || "revenue".equals(reportType)) { %>
            <div class="form-group">
                <label for="startDate" class="form-label">
                    <i class="fas fa-calendar-alt"></i> Start Date
                </label>
                <input type="date" id="startDate" name="startDate" class="form-input" required>
            </div>

            <div class="form-group">
                <label for="endDate" class="form-label">
                    <i class="fas fa-calendar-check"></i> End Date
                </label>
                <input type="date" id="endDate" name="endDate" class="form-input" required>
            </div>
        <% } %>

        <%-- Add more input fields here for other report types if needed --%>
    </div>

    <button type="submit" class="btn">
        <span>Generate Report</span>
    </button>
</form>


            <div class="back-link">
                <a href="index.jsp">Back to Home</a>
            </div>
        <%
        }
        %>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('.report-form');
    const submitBtn = document.querySelector('.btn');
    const startDateInput = document.getElementById('startDate');
    const endDateInput = document.getElementById('endDate');

    function validateDates() {
        if (startDateInput && endDateInput) {
            const startDate = new Date(startDateInput.value);
            const endDate = new Date(endDateInput.value);
            const today = new Date();
            today.setHours(23, 59, 59, 999);

            if (startDate > today) {
                startDateInput.setCustomValidity('Start date cannot be in the future');
                return false;
            } else if (endDate < startDate) {
                endDateInput.setCustomValidity('End date must be after start date');
                return false;
            } else {
                startDateInput.setCustomValidity('');
                endDateInput.setCustomValidity('');
                return true;
            }
        }
        return true;
    }

    if (startDateInput && endDateInput) {
        startDateInput.addEventListener('change', validateDates);
        endDateInput.addEventListener('change', validateDates);

        const today = new Date().toISOString().split('T')[0];
        startDateInput.setAttribute('max', today);
        endDateInput.setAttribute('max', today);
    }

    if (form) {
        form.addEventListener('submit', function(e) {
            if (!validateDates()) {
                e.preventDefault();
                return;
            }
            submitBtn.disabled = true;
            submitBtn.classList.add('loading');
            submitBtn.innerHTML = '<span>Generating...</span>';
        });
    }

    // Enhanced form interactions
    const inputs = document.querySelectorAll('.form-input');
    
    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
        });
    });
});
</script>

</body>
</html>