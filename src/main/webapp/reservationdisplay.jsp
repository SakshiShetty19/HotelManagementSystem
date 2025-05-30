<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>View Reservations | Hotel Management System</title>
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
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

        /* Header */
        header {
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            padding: 3rem 2.5rem;
            border-radius: 25px;
            color: white;
            box-shadow: 0 20px 50px rgba(255, 107, 107, 0.3);
            margin-bottom: 3rem;
            text-align: center;
            position: relative;
            overflow: hidden;
            animation: headerSlideIn 0.8s ease-out;
        }

        @keyframes headerSlideIn {
            from {
                opacity: 0;
                transform: translateY(-50px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        header::before {
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

        header h1 {
            font-weight: 800;
            font-size: 2.8rem;
            margin-bottom: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 3px;
            position: relative;
            z-index: 2;
        }

        header p {
            font-weight: 400;
            font-size: 1.2rem;
            opacity: 0.9;
            position: relative;
            z-index: 2;
        }

        /* Stats */
        .stats {
            display: inline-block;
            background: rgba(78, 205, 196, 0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(78, 205, 196, 0.3);
            color: #4ecdc4;
            padding: 1rem 2rem;
            border-radius: 50px;
            font-weight: 700;
            font-size: 1.3rem;
            margin-bottom: 2rem;
            box-shadow: 0 10px 30px rgba(78, 205, 196, 0.2);
            text-transform: uppercase;
            letter-spacing: 1px;
            animation: statsFloat 0.8s ease-out 0.2s both;
        }

        @keyframes statsFloat {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Action bar */
        .action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2.5rem;
            flex-wrap: wrap;
            gap: 1rem;
            animation: actionBarSlide 0.8s ease-out 0.4s both;
        }

        @keyframes actionBarSlide {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .btn {
            display: inline-block;
            font-weight: 700;
            font-size: 1rem;
            padding: 1rem 2rem;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
            border: none;
        }

        .btn-primary {
            background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
            color: white;
            box-shadow: 0 10px 30px rgba(255, 107, 107, 0.3);
        }

        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #4ecdc4, #ff6b6b);
            transition: left 0.3s ease;
        }

        .btn-primary:hover::before {
            left: 0;
        }

        .btn-primary span {
            position: relative;
            z-index: 2;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(255, 107, 107, 0.4);
        }

        .btn-secondary {
            background: transparent;
            color: #4ecdc4;
            border: 2px solid #4ecdc4;
        }

        .btn-secondary::before {
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

        .btn-secondary:hover::before {
            left: 0;
        }

        .btn-secondary:hover {
            color: white;
            transform: translateY(-2px);
        }

        /* Table container */
        .table-container {
            background: rgba(26, 32, 56, 0.8);
            backdrop-filter: blur(15px);
            border-radius: 25px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
            animation: tableSlideIn 0.8s ease-out 0.6s both;
        }

        @keyframes tableSlideIn {
            from {
                opacity: 0;
                transform: translateY(50px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            min-width: 900px;
        }

        thead {
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
        }

        thead th {
            padding: 1.5rem 1.5rem;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            text-align: left;
            color: white;
            font-size: 0.9rem;
            position: relative;
        }

        thead th:first-child {
            border-top-left-radius: 25px;
        }

        thead th:last-child {
            border-top-right-radius: 25px;
        }

        tbody tr {
            background: rgba(255, 255, 255, 0.05);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
            animation: rowSlideIn 0.6s ease-out both;
        }

        tbody tr:nth-child(1) { animation-delay: 0.8s; }
        tbody tr:nth-child(2) { animation-delay: 0.9s; }
        tbody tr:nth-child(3) { animation-delay: 1.0s; }
        tbody tr:nth-child(4) { animation-delay: 1.1s; }
        tbody tr:nth-child(5) { animation-delay: 1.2s; }

        @keyframes rowSlideIn {
            from {
                opacity: 0;
                transform: translateX(-30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        tbody tr:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(10px);
            box-shadow: 0 10px 30px rgba(255, 107, 107, 0.2);
        }

        tbody tr:last-child {
            border-bottom: none;
        }

        tbody td {
            padding: 1.5rem 1.5rem;
            font-size: 1rem;
            vertical-align: middle;
            border: none;
        }

        /* Text styling */
        .reservation-id {
            font-weight: 800;
            color: #ff6b6b;
            font-size: 1.1rem;
        }

        .customer-name {
            font-weight: 600;
            color: #e1e5e9;
        }

        .room-number {
            display: inline-block;
            padding: 0.5rem 1rem;
            background: linear-gradient(45deg, rgba(78, 205, 196, 0.2), rgba(255, 107, 107, 0.2));
            backdrop-filter: blur(10px);
            color: #4ecdc4;
            border-radius: 15px;
            font-weight: 700;
            font-size: 0.9rem;
            border: 1px solid rgba(78, 205, 196, 0.3);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .amount {
            font-weight: 800;
            color: #4ecdc4;
            font-size: 1.1rem;
        }

        .date-cell {
            color: #b4bcd0;
            font-weight: 500;
        }

        /* Action buttons */
        .actions {
            display: flex;
            gap: 0.8rem;
            flex-wrap: wrap;
        }

        .action-btn {
            padding: 0.6rem 1.2rem;
            border-radius: 12px;
            font-size: 0.85rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            border: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            position: relative;
            overflow: hidden;
        }

        .update-btn {
            background: rgba(78, 205, 196, 0.2);
            color: #4ecdc4;
            border: 1px solid rgba(78, 205, 196, 0.3);
        }

        .update-btn:hover {
            background: rgba(78, 205, 196, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(78, 205, 196, 0.3);
        }

        .delete-btn {
            background: rgba(255, 107, 107, 0.2);
            color: #ff6b6b;
            border: 1px solid rgba(255, 107, 107, 0.3);
        }

        .delete-btn:hover {
            background: rgba(255, 107, 107, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(255, 107, 107, 0.3);
        }

        /* No data */
        .no-data {
            text-align: center;
            padding: 4rem 2rem;
            color: #b4bcd0;
            font-style: italic;
            font-size: 1.2rem;
            background: rgba(255, 255, 255, 0.05);
        }

        .no-data a {
            color: #4ecdc4;
            font-weight: 600;
            text-decoration: none;
            border-bottom: 2px solid transparent;
            transition: border-color 0.3s ease;
        }

        .no-data a:hover {
            border-bottom-color: #4ecdc4;
        }

        /* Loading animation */
        .loading {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 4rem;
        }

        .loading-spinner {
            width: 50px;
            height: 50px;
            border: 4px solid rgba(78, 205, 196, 0.3);
            border-top: 4px solid #4ecdc4;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .container {
                max-width: 100%;
                padding: 0 1rem;
            }
        }

        @media (max-width: 900px) {
            body {
                padding: 1rem;
            }
            
            header {
                padding: 2rem 1.5rem;
            }
            
            header h1 {
                font-size: 2.2rem;
            }
            
            .action-bar {
                flex-direction: column;
                align-items: stretch;
                gap: 1rem;
            }
            
            .table-wrapper {
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }
            
            table {
                min-width: 800px;
            }
            
            tbody td, thead th {
                padding: 1rem;
                font-size: 0.9rem;
            }
            
            .actions {
                flex-direction: column;
                gap: 0.5rem;
            }
            
            .action-btn {
                padding: 0.5rem 1rem;
                font-size: 0.8rem;
            }
        }

        @media (max-width: 600px) {
            header h1 {
                font-size: 1.8rem;
            }
            
            .stats {
                font-size: 1.1rem;
                padding: 0.8rem 1.5rem;
            }
            
            tbody td, thead th {
                padding: 0.8rem;
            }
        }
    </style>
</head>
<body>
    <div class="bg-pattern"></div>
    
    <div class="container">
        <header>
            <h1>Current Reservations</h1>
            <p>Manage all your hotel bookings in one place</p>
        </header>

        <%
        List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
        int totalReservations = (reservations != null) ? reservations.size() : 0;
        %>

        <div class="stats">🎯 Total Reservations: <%= totalReservations %></div>

        <div class="action-bar">
            <a href="reservationadd.jsp" class="btn btn-primary"><span>+ Add New Reservation</span></a>
            <a href="index.jsp" class="btn btn-secondary">← Back to Home</a>
        </div>

        <div class="table-container">
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>Reservation ID</th>
                            <th>Customer Name</th>
                            <th>Room Number</th>
                            <th>Check-In Date</th>
                            <th>Check-Out Date</th>
                            <th>Total Amount</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    if (reservations != null && !reservations.isEmpty()) {
                        for (Reservation reservation : reservations) {
                    %>
                        <tr>
                            <td class="reservation-id">#<%= reservation.getReservationId() %></td>
                            <td class="customer-name"><%= reservation.getCustomerName() %></td>
                            <td><span class="room-number"><%= reservation.getRoomNumber() %></span></td>
                            <td class="date-cell"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckIn()) %></td>
                            <td class="date-cell"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckOut()) %></td>
                            <td class="amount">$<%= String.format("%.2f", reservation.getTotalAmount()) %></td>
                            <td class="actions">
                                <a href="reservationupdate.jsp?id=<%= reservation.getReservationId() %>" class="action-btn update-btn">
                                    ✏️ Update
                                </a>
                                <a href="reservationdelete.jsp?id=<%= reservation.getReservationId() %>" class="action-btn delete-btn">
                                    🗑️ Delete
                                </a>
                            </td>
                        </tr>
                    <%
                        }
                    } else {
                    %>
                        <tr>
                            <td colspan="7" class="no-data">
                                🏨 No reservations found yet.<br>
                                <a href="reservationadd.jsp">Create your first reservation</a> to get started!
                            </td>
                        </tr>
                    <%
                    }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Add scroll effect for table rows
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -20px 0px'
        };

        const observer = new IntersectionObserver(function(entries) {
            entries.forEach((entry, index) => {
                if (entry.isIntersecting) {
                    setTimeout(() => {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateX(0)';
                    }, index * 100);
                }
            });
        }, observerOptions);

        // Smooth loading animation for rows
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('tbody tr');
            
            // Add hover effects and smooth interactions
            rows.forEach((row, index) => {
                if (row.querySelector('.no-data')) return;
                
                row.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateX(10px) scale(1.02)';
                });
                
                row.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateX(0) scale(1)';
                });
            });

            // Add click to copy functionality for reservation IDs
            document.querySelectorAll('.reservation-id').forEach(id => {
                id.style.cursor = 'pointer';
                id.title = 'Click to copy reservation ID';
                
                id.addEventListener('click', function() {
                    const text = this.textContent;
                    navigator.clipboard.writeText(text).then(() => {
                        // Simple toast notification
                        const toast = document.createElement('div');
                        toast.textContent = 'Reservation ID copied!';
                        toast.style.cssText = `
                            position: fixed;
                            top: 30px;
                            right: 30px;
                            background: rgba(78, 205, 196, 0.9);
                            color: white;
                            padding: 1rem 2rem;
                            border-radius: 15px;
                            z-index: 1000;
                            font-weight: 600;
                            animation: slideIn 0.3s ease;
                        `;
                        document.body.appendChild(toast);
                        
                        setTimeout(() => {
                            toast.style.animation = 'slideOut 0.3s ease forwards';
                            setTimeout(() => document.body.removeChild(toast), 300);
                        }, 2000);
                    });
                });
            });
        });

        // Add CSS for toast animations
        const style = document.createElement('style');
        style.textContent = `
            @keyframes slideIn {
                from {
                    opacity: 0;
                    transform: translateX(100%);
                }
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }
            
            @keyframes slideOut {
                from {
                    opacity: 1;
                    transform: translateX(0);
                }
                to {
                    opacity: 0;
                    transform: translateX(100%);
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>