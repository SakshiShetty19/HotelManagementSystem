<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management System</title>
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

        header {
            background: rgba(26, 32, 56, 0.9);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-container {
            max-width: 1300px;
            margin: 0 auto;
            padding: 1.2rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 800;
            background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .nav-links {
            display: flex;
            gap: 0;
            list-style: none;
        }

        .nav-links a {
            color: #b4bcd0;
            text-decoration: none;
            font-weight: 500;
            padding: 0.8rem 1.5rem;
            border-radius: 25px;
            transition: all 0.3s ease;
            position: relative;
            margin: 0 0.5rem;
        }

        .nav-links a::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
            border-radius: 25px;
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: -1;
        }

        .nav-links a:hover::before {
            opacity: 1;
        }

        .nav-links a:hover {
            color: white;
            transform: translateY(-2px);
        }

        .main-container {
            max-width: 1300px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .hero-section {
            padding: 6rem 0;
            text-align: center;
            position: relative;
        }

        .hero-content h1 {
            font-size: clamp(2.5rem, 6vw, 4rem);
            font-weight: 900;
            margin-bottom: 1.5rem;
            background: linear-gradient(135deg, #ff6b6b 0%, #4ecdc4 50%, #45b7d1 100%);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            text-transform: uppercase;
            letter-spacing: 3px;
        }

        .hero-content p {
            font-size: 1.2rem;
            max-width: 650px;
            margin: 0 auto 3rem auto;
            color: #b4bcd0;
            font-weight: 300;
        }

        .cta-button {
            display: inline-block;
            background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
            color: white;
            padding: 1.2rem 3rem;
            border-radius: 50px;
            font-weight: 700;
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .cta-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #4ecdc4, #ff6b6b);
            transition: left 0.3s ease;
        }

        .cta-button:hover::before {
            left: 0;
        }

        .cta-button span {
            position: relative;
            z-index: 2;
        }

        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(255, 107, 107, 0.4);
        }

        .services-section {
            padding: 5rem 0;
            background: rgba(26, 32, 56, 0.5);
            margin: 3rem 2rem;
            border-radius: 30px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .section-title {
            text-align: center;
            font-size: 2.8rem;
            font-weight: 800;
            margin-bottom: 4rem;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 2.5rem;
        }

        .service-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            padding: 2.5rem 2rem;
            border-radius: 20px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
        }

        .service-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(255, 107, 107, 0.1), rgba(78, 205, 196, 0.1));
            opacity: 0;
            transition: opacity 0.4s ease;
        }

        .service-card:hover::before {
            opacity: 1;
        }

        .service-card:hover {
            transform: translateY(-8px) scale(1.02);
            border-color: rgba(255, 107, 107, 0.5);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        }

        .service-icon {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            display: block;
            filter: grayscale(100%) brightness(1.2);
            transition: filter 0.3s ease;
        }

        .service-card:hover .service-icon {
            filter: grayscale(0%) brightness(1);
        }

        .service-card h3 {
            font-size: 1.6rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .service-card p {
            color: #b4bcd0;
            margin-bottom: 2rem;
            line-height: 1.7;
        }

        .service-button {
            background: transparent;
            color: #ff6b6b;
            padding: 0.9rem 2rem;
            border: 2px solid #ff6b6b;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            display: inline-block;
            position: relative;
            overflow: hidden;
        }

        .service-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: #ff6b6b;
            transition: left 0.3s ease;
            z-index: -1;
        }

        .service-button:hover::before {
            left: 0;
        }

        .service-button:hover {
            color: white;
            transform: translateY(-2px);
        }

        footer {
            background: #0f1419;
            color: #64748b;
            text-align: center;
            padding: 3rem 2rem;
            margin-top: 4rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
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
            .header-container {
                flex-direction: column;
                gap: 1rem;
            }

            .services-section {
                margin: 2rem 1rem;
                padding: 3rem 1rem;
            }

            .services-grid {
                grid-template-columns: 1fr;
                gap: 2rem;
            }

            .service-card {
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
    String toastMessage = "";
    String toastTitle = "";

    if ("success".equals(status)) {
        toastTitle = "Success!";
        toastMessage = "Your reservation has been successfully created.";
    } else if ("deleted".equals(status)) {
        toastTitle = "Success!";
        toastMessage = "Your reservation has been successfully deleted.";
    } else if ("done".equals(status)) {
        toastTitle = "Success!";
        toastMessage = "Your reservation has been successfully updated.";
    }

    if (!toastMessage.isEmpty()) {
%>
    <div id="toast" class="toast success">
        <div class="toast-header">
            <span class="toast-title"><%= toastTitle %></span>
            <button class="toast-close" onclick="closeToast()">×</button>
        </div>
        <div class="toast-message"><%= toastMessage %></div>
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
<% } %>

<header>
    <div class="header-container">
        <div class="logo">Hotel Management System</div>
        <nav>
            <ul class="nav-links">
                <li><a href="#home">Home</a></li>
                <li><a href="#services">Services</a></li>
            </ul>
        </nav>
    </div>
</header>

<section class="hero-section" id="home">
    <div class="main-container">
        <div class="hero-content">
            <h1>Hotel Management System</h1>
            <p>Experience next-generation hotel management with our cutting-edge reservation platform designed for efficiency and elegance.</p>
            <a href="#services" class="cta-button"><span>Discover More</span></a>
        </div>
    </div>
</section>

<section class="services-section" id="services">
    <div class="main-container">
        <h2 class="section-title">Management Hub</h2>
        <div class="services-grid">
            <div class="service-card">
                <span class="service-icon">🎯</span>
                <h3>New Reservation</h3>
                <p>Create new bookings with our advanced reservation system featuring real-time availability and instant confirmation.</p>
                <a href="reservationadd.jsp" class="service-button">Start Booking</a>
            </div>

            <div class="service-card">
                <span class="service-icon">⚡</span>
                <h3>Booking Control</h3>
                <p>Manage all your reservations from a centralized dashboard with powerful editing and tracking capabilities.</p>
                <a href="reservationdisplay" class="service-button">Access Panel</a>
            </div>

            <div class="service-card">
                <span class="service-icon">📈</span>
                <h3>Analytics Hub</h3>
                <p>Generate comprehensive reports and gain valuable insights into your booking patterns and business performance.</p>
                <a href="reports.jsp" class="service-button">View Analytics</a>
            </div>
        </div>
    </div>
</section>

<footer>
    <p>&copy; 2025 - Advanced Hotel Management Solutions</p>
</footer>

<script>
    // Smooth scrolling with offset for sticky header
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                const offsetTop = target.offsetTop - 80;
                window.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Add scroll effect to service cards
    const observerOptions = {
        threshold: 0.2,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach((entry, index) => {
            if (entry.isIntersecting) {
                setTimeout(() => {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }, index * 200);
            }
        });
    }, observerOptions);

    // Initially hide cards for animation
    document.querySelectorAll('.service-card').forEach((card, index) => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(50px)';
        card.style.transition = 'all 0.6s ease';
        observer.observe(card);
    });
</script>

</body>
</html>