<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, com.model.Event, java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    String role = (String) session.getAttribute("userRole");
    if (!"MEMBER".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
    SimpleDateFormat timeFormatter = new SimpleDateFormat("hh:mm a");
    Date today = new Date();
%>

<!DOCTYPE html>
<html>
    <head>
        <title>UniVents - Browse Events</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <style>
            .event-catalog {
                display: flex;
                flex-wrap: wrap;
                gap: 25px;
                padding: 20px;
            }

            .event-card {
                width: 320px;
                background: #fff;
                border-radius: 12px;
                padding: 20px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.08);
                transition: transform 0.3s ease;
                display: flex;
                flex-direction: column;
            }

            .event-card:hover {
                transform: translateY(-5px);
            }

            .seat-progress {
                margin: 15px 0;
            }
            .progress-bar {
                height: 8px;
                background: #eee;
                border-radius: 4px;
            }
            .progress-fill {
                height: 100%;
                background: #28a745;
                border-radius: 4px;
            }

            .past-events .event-card {
                background: #f0f0f0; /* Kelabu muda untuk event lepas */
                filter: grayscale(1);
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />

        <div class="main-content">
            <h1 class="page-title">Upcoming UniVents Events</h1>

            <%-- SEKSYEN: UPCOMING EVENTS --%>
            <div class="event-catalog">
                <%
                    List<Event> events = (List<Event>) request.getAttribute("availableEvents");
                    boolean hasUpcoming = false;
                    if (events != null) {
                        for (Event e : events) {
                            if (e.getEventDate() != null && e.getEventDate().after(today)) {
                                hasUpcoming = true;
                                int registered = e.getRegisteredCount();
                                int capacity = e.getCapacity();
                                int available = capacity - registered;
                                int percentage = (capacity > 0) ? (registered * 100 / capacity) : 100;
                %>
                <div class="event-card">
                    <h3><%= e.getEventName()%></h3>
                    <p><strong>📅 Date:</strong> <%= e.getEventDate()%></p>
                    <p><strong>📍 Venue:</strong> <%= e.getVenue()%></p>

                    <%-- Seat Counter Progress Bar --%>
                    <div class="seat-progress">
                        <small>Seats Taken: <%= registered%> / <%= capacity%></small>
                        <div class="progress-bar"><div class="progress-fill" style="width: <%= percentage%>%"></div></div>
                    </div>

                    <div class="event-footer">
                        <% if (available > 0) {%>
                        <form action="EventServlet" method="POST">
                            <input type="hidden" name="action" value="rsvp">
                            <input type="hidden" name="eventID" value="<%= e.getEventID()%>">
                            <button type="submit" class="btn btn-green" style="width: 100%;">RSVP Now</button>
                        </form>
                        <% } else { %>
                        <button class="btn btn-gray" disabled style="width:100%">Event Full</button>
                        <% } %>
                    </div>
                </div>
                <%      }
                        }
                    }
                    if (!hasUpcoming) { %>
                <p style="text-align:center;">No upcoming events at this time.</p>
                <% } %>
            </div>

            <hr style="margin: 50px 0;">

            <%-- SEKSYEN: PAST EVENTS --%>
            <h2 class="page-title">Past Events</h2>
            <div class="event-catalog past-events">
                <%
                    if (events != null) {
                        for (Event e : events) {
                            if (e.getEventDate() != null && e.getEventDate().before(today)) {
                %>
                <div class="event-card past">
                    <h3><%= e.getEventName()%></h3>
                    <p>Date: <%= e.getEventDate()%></p>
                    <button class="btn btn-gray" disabled>Completed</button>
                </div>
                <%      }
                        }
                    }%>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
    </body>
</html>