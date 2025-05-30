<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Reports | Hotel Management System</title>
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
    font-size: 2.4rem;
    margin-bottom: 0.8rem;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    position: relative;
    z-index: 2;
}

.header p {
    font-size: 1.1rem;
    font-weight: 400;
    opacity: 0.9;
    position: relative;
    z-index: 2;
}

.report-options {
    padding: 3rem 2.5rem;
    background: rgba(255, 255, 255, 0.02);
    display: grid;
    gap: 2rem;
}

.report-option {
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(10px);
    border-radius: 20px;
    padding: 2rem;
    color: #e1e5e9;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease;
    border: 1px solid rgba(255, 255, 255, 0.1);
    position: relative;
    overflow: hidden;
    animation: reportOptionSlide 0.6s ease-out;
    animation-fill-mode: both;
}

.report-option:nth-child(1) { animation-delay: 0.1s; }
.report-option:nth-child(2) { animation-delay: 0.2s; }
.report-option:nth-child(3) { animation-delay: 0.3s; }

@keyframes reportOptionSlide {
    from {
        opacity: 0;
        transform: translateX(-30px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

.report-option::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(45deg, rgba(255, 107, 107, 0.1), rgba(78, 205, 196, 0.1));
    transition: left 0.3s ease;
    z-index: 0;
}

.report-option:hover::before {
    left: 0;
}

.report-option:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
    border-color: rgba(255, 107, 107, 0.3);
    background: rgba(255, 255, 255, 0.08);
}

.report-option h3 {
    font-size: 1.4rem;
    margin-bottom: 1rem;
    font-weight: 700;
    color: #ff6b6b;
    text-transform: uppercase;
    letter-spacing: 1px;
    position: relative;
    z-index: 2;
}

.report-option p {
    font-size: 1rem;
    color: #b4bcd0;
    margin-bottom: 1.5rem;
    line-height: 1.6;
    position: relative;
    z-index: 2;
}

.report-option a {
    text-decoration: none;
    padding: 0.8rem 1.5rem;
    background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
    color: white;
    font-weight: 600;
    border-radius: 12px;
    transition: all 0.3s ease;
    display: inline-block;
    text-transform: uppercase;
    letter-spacing: 1px;
    position: relative;
    overflow: hidden;
    z-index: 2;
}

.report-option a::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(45deg, #4ecdc4, #ff6b6b);
    transition: left 0.3s ease;
}

.report-option a:hover::before {
    left: 0;
}

.report-option a span {
    position: relative;
    z-index: 2;
}

.report-option a:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(255, 107, 107, 0.4);
}

.back-link {
    display: inline-block;
    margin: 2rem 2.5rem;
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

@media (max-width: 768px) {
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
        font-size: 2rem;
    }

    .report-options {
        padding: 2rem 1.5rem;
    }

    .report-option h3 {
        font-size: 1.2rem;
    }

    .back-link {
        margin: 2rem 1.5rem;
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

<div class="container">
    <div class="header">
        <h1>Reports Dashboard</h1>
        <p>Generate reports and gain hotel insights</p>
    </div>

    <div class="report-options">
        <div class="report-option">
            <h3>Reservations by Date Range</h3>
            <p>View all bookings between specific dates with guest details.</p>
            <a href="report_form.jsp?reportType=dateRange"><span>Generate Report</span></a>
        </div>

        <div class="report-option">
            <h3>Total Revenue</h3>
            <p>Calculate revenue over a time period with financial breakdown.</p>
            <a href="report_form.jsp?reportType=revenue"><span>Generate Report</span></a>
        </div>

        <div class="report-option">
            <h3>Most Popular Rooms</h3>
            <p>See the most frequently booked rooms and their occupancy trends.</p>
            <a href="report_form.jsp?reportType=popularRooms"><span>Generate Report</span></a>
        </div>
    </div>

    <a href="index.jsp" class="back-link">Back to Home</a>
</div>

</body>
</html>