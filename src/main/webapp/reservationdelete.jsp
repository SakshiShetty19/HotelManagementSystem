<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, com.dao.ReservationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Delete Reservation | Hotel Management System</title>
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
            background: linear-gradient(135deg, #dc3545, #ff6b6b);
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

        .content-section {
            padding: 3rem 2.5rem;
            background: rgba(255, 255, 255, 0.02);
        }

        .reservation-details {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 20px;
            padding: 2rem;
            margin-bottom: 2.5rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }

        .detail-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            animation: detailSlide 0.6s ease-out;
            animation-fill-mode: both;
        }

        .detail-item:last-child {
            border-bottom: none;
        }

        .detail-item:nth-child(1) { animation-delay: 0.1s; }
        .detail-item:nth-child(2) { animation-delay: 0.2s; }
        .detail-item:nth-child(3) { animation-delay: 0.3s; }
        .detail-item:nth-child(4) { animation-delay: 0.4s; }
        .detail-item:nth-child(5) { animation-delay: 0.5s; }
        .detail-item:nth-child(6) { animation-delay: 0.6s; }

        @keyframes detailSlide {
            from {
                opacity: 0;
                transform: translateX(-30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .detail-label {
            font-weight: 600;
            color: #b4bcd0;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9rem;
        }

        .detail-value {
            font-weight: 700;
            color: #e1e5e9;
            font-size: 1rem;
        }

        .detail-value.highlight {
            color: #ff6b6b;
            font-size: 1.1rem;
        }

        .button-group {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
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

        .btn-delete {
            background: linear-gradient(45deg, #dc3545, #ff6b6b);
            color: white;
        }

        .btn-delete::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #ff6b6b, #dc3545);
            transition: left 0.3s ease;
        }

        .btn-delete:hover::before {
            left: 0;
        }

        .btn-delete span {
            position: relative;
            z-index: 2;
        }

        .btn-delete:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(220, 53, 69, 0.4);
        }

        .btn-cancel {
            background: transparent;
            color: #4ecdc4;
            border: 2px solid #4ecdc4;
        }

        .btn-cancel::before {
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

        .btn-cancel:hover::before {
            left: 0;
        }

        .btn-cancel:hover {
            color: white;
            transform: translateY(-2px);
        }

        /* Modal Styles */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(5px);
            z-index: 1000;
            display: none;
            align-items: center;
            justify-content: center;
            animation: modalFadeIn 0.3s ease;
        }

        .modal-overlay.show {
            display: flex;
        }

        @keyframes modalFadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .modal-content {
            background: rgba(26, 32, 56, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 2.5rem;
            max-width: 500px;
            width: 90%;
            border: 1px solid rgba(255, 255, 255, 0.1);
            animation: modalSlideIn 0.3s ease;
            position: relative;
        }

        @keyframes modalSlideIn {
            from {
                opacity: 0;
                transform: translateY(-50px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .modal-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .modal-header h2 {
            color: #ff6b6b;
            font-size: 1.5rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0.5rem;
        }

        .modal-body {
            color: #e1e5e9;
            font-size: 1.1rem;
            text-align: center;
            margin-bottom: 2.5rem;
            line-height: 1.6;
        }

        .modal-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .modal-close {
            position: absolute;
            top: 15px;
            right: 20px;
            background: none;
            border: none;
            color: #b4bcd0;
            font-size: 1.8rem;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }

        .modal-close:hover {
            background: rgba(255, 107, 107, 0.2);
            color: #ff6b6b;
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

            .content-section {
                padding: 2rem 1.5rem;
            }

            .detail-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }

            .button-group {
                flex-direction: column;
                align-items: center;
            }

            .btn {
                width: 100%;
                max-width: 300px;
            }

            .modal-content {
                margin: 1rem;
                padding: 2rem;
            }

            .modal-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

<div class="bg-pattern"></div>

<%
    String idParam = request.getParameter("id");
    if (idParam == null) {
        response.sendRedirect("reservationdisplay.jsp");
        return;
    }

    int id = Integer.parseInt(idParam);
    ReservationDAO reservationDAO = new ReservationDAO();
    Reservation reservation = reservationDAO.selectReservation(id);

    if (reservation == null) {
        response.sendRedirect("reservationdisplay.jsp");
        return;
    }
%>

<div class="container">
    <div class="header">
        <h1>Delete Reservation</h1>
        <p>Please confirm the reservation details before deletion</p>
    </div>

    <div class="content-section">
        <div class="reservation-details">
            <div class="detail-item">
                <span class="detail-label">Reservation ID:</span>
                <span class="detail-value highlight">#<%= reservation.getReservationId() %></span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Customer Name:</span>
                <span class="detail-value"><%= reservation.getCustomerName() %></span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Room Number:</span>
                <span class="detail-value"><%= reservation.getRoomNumber() %></span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Check-In Date:</span>
                <span class="detail-value"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckIn()) %></span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Check-Out Date:</span>
                <span class="detail-value"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckOut()) %></span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Total Amount:</span>
                <span class="detail-value highlight">$<%= String.format("%.2f", reservation.getTotalAmount()) %></span>
            </div>
        </div>

        <div class="button-group">
            <button class="btn btn-delete" onclick="showModal()">
                <span>Delete Reservation</span>
            </button>
            <a href="reservationdisplay.jsp" class="btn btn-cancel">Cancel</a>
        </div>

        <div style="text-align: center;">
            <a href="reservationdisplay.jsp" class="back-link">Back to Reservations</a>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div id="confirmModal" class="modal-overlay">
    <div class="modal-content">
        <button class="modal-close" onclick="hideModal()">&times;</button>
        <div class="modal-header">
            <h2>Confirm Deletion</h2>
        </div>
        <div class="modal-body">
            Are you sure you want to permanently delete this reservation? This action cannot be undone.
        </div>
        <div class="modal-buttons">
            <form action="DeleteReservationServlet" method="post" style="display: inline;">
                <input type="hidden" name="reservationId" value="<%= reservation.getReservationId() %>">
                <button type="submit" class="btn btn-delete">
                    <span>Yes, Delete</span>
                </button>
            </form>
            <button type="button" class="btn btn-cancel" onclick="hideModal()">Cancel</button>
        </div>
    </div>
</div>

<script>
function showModal() {
    document.getElementById('confirmModal').classList.add('show');
}

function hideModal() {
    document.getElementById('confirmModal').classList.remove('show');
}

// Close modal when clicking outside
document.getElementById('confirmModal').addEventListener('click', function(e) {
    if (e.target === this) {
        hideModal();
    }
});

// Close modal with Escape key
document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
        hideModal();
    }
});
</script>

</body>
</html>