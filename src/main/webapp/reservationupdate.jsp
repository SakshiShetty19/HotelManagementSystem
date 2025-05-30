<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, com.dao.ReservationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Update Reservation | Hotel Management System</title>
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
            max-width: 700px;
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
            background: linear-gradient(135deg, #4ecdc4, #44a08d);
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

        .error {
            background: rgba(220, 53, 69, 0.1);
            color: #ff6b6b;
            padding: 1.5rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            font-weight: 600;
            border: 1px solid rgba(220, 53, 69, 0.3);
            backdrop-filter: blur(10px);
            animation: errorSlide 0.5s ease-out;
        }

        @keyframes errorSlide {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        form {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 20px;
            padding: 2.5rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }

        .form-group {
            margin-bottom: 2rem;
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

        label {
            display: block;
            margin-bottom: 0.8rem;
            font-weight: 600;
            color: #4ecdc4;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        input[type="text"],
        input[type="date"],
        input[type="number"] {
            width: 100%;
            padding: 1rem 1.2rem;
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            font-size: 1rem;
            background: rgba(255, 255, 255, 0.05);
            color: #e1e5e9;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="number"]:focus {
            outline: none;
            border-color: #4ecdc4;
            box-shadow: 0 0 20px rgba(78, 205, 196, 0.3);
            background: rgba(255, 255, 255, 0.08);
        }

        input[type="text"]::placeholder,
        input[type="number"]::placeholder {
            color: rgba(225, 229, 233, 0.5);
        }

        .actions {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            margin-top: 2.5rem;
            flex-wrap: wrap;
        }

        button, .btn {
            padding: 1rem 2.5rem;
            border: none;
            border-radius: 15px;
            font-size: 1rem;
            font-weight: 700;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            text-decoration: none;
            display: inline-block;
            min-width: 150px;
            text-align: center;
        }

        .update-btn {
            background: linear-gradient(45deg, #4ecdc4, #44a08d);
            color: white;
        }

        .update-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #44a08d, #4ecdc4);
            transition: left 0.3s ease;
        }

        .update-btn:hover::before {
            left: 0;
        }

        .update-btn span {
            position: relative;
            z-index: 2;
        }

        .update-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(78, 205, 196, 0.4);
        }

        .cancel-btn {
    background: linear-gradient(to right, #4ef1f1, #3daea8); /* gradient from cyan to teal */
    color: white;
    border: none;
    padding: 12px 24px;
    border-radius: 20px;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    cursor: pointer;
    transition: transform 0.2s ease, opacity 0.2s ease;
}

.cancel-btn:hover {
    transform: translateY(-2px);
    opacity: 0.9;
}



        .hidden-input {
            display: none;
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

            form {
                padding: 2rem;
            }

            .actions {
                flex-direction: column;
                align-items: center;
            }

            button, .btn {
                width: 100%;
                max-width: 300px;
            }
        }
</style>
</head>
<body>

<div class="bg-pattern"></div>

<div class="container">
    <div class="header">
        <h1>Update Reservation</h1>
        <p>Modify reservation details with ease</p>
    </div>
    <div class="content">
        <%
            // Fetch and validate the reservation ID parameter safely
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.trim().isEmpty()) {
                response.sendRedirect("reservationdisplay.jsp");
                return;
            }
            int id = -1;
            try {
                id = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                response.sendRedirect("reservationdisplay.jsp");
                return;
            }

            ReservationDAO reservationDAO = new ReservationDAO();
            Reservation reservation = reservationDAO.selectReservation(id);

            if (reservation == null) {
                response.sendRedirect("reservationdisplay.jsp");
                return;
            }

            // Display error message if present
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
            <div class="error"><%= errorMessage %></div>
        <% } %>

        <form action="UpdateReservationServlet" method="post" novalidate>
            <input type="hidden" name="reservationId" value="<%= reservation.getReservationId() %>" class="hidden-input">

            <div class="form-group">
                <label for="customerName">Customer Name</label>
                <input
                    type="text"
                    id="customerName"
                    name="customerName"
                    value="<%= reservation.getCustomerName() %>"
                    required
                    placeholder="Enter customer name"
                />
            </div>

            <div class="form-group">
                <label for="roomNumber">Room Number</label>
                <input
                    type="text"
                    id="roomNumber"
                    name="roomNumber"
                    value="<%= reservation.getRoomNumber() %>"
                    required
                    placeholder="Enter room number"
                />
            </div>

            <div class="form-group">
                <label for="checkIn">Check-In Date</label>
                <input
                    type="date"
                    id="checkIn"
                    name="checkIn"
                    required
                    value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckIn()) %>"
                />
            </div>

            <div class="form-group">
                <label for="checkOut">Check-Out Date</label>
                <input
                    type="date"
                    id="checkOut"
                    name="checkOut"
                    required
                    value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckOut()) %>"
                />
            </div>

            <div class="form-group">
                <label for="totalAmount">Total Amount ($)</label>
                <input
                    type="number"
                    id="totalAmount"
                    name="totalAmount"
                    step="0.01"
                    min="0"
                    required
                    value="<%= reservation.getTotalAmount() %>"
                    placeholder="0.00"
                />
            </div>

            <div class="actions">
                <button type="submit" class="update-btn">
                    <span>Update Reservation</span>
                </button>
                <a href="reservationdisplay.jsp" class="cancel-btn">Cancel</a>
            </div>
        </form>

        <div style="text-align: center;">
            <a href="reservationdisplay.jsp" class="back-link">Back to Reservations</a>
        </div>
    </div>
</div>

</body>
</html>