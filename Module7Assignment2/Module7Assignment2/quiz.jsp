<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<%
    // Generate 10 random addition questions
    Random rand = new Random();
    int[] num1Array = new int[10];
    int[] num2Array = new int[10];

    for (int i = 0; i < 10; i++) {
        num1Array[i] = rand.nextInt(50) + 1; // Numbers between 1 and 50
        num2Array[i] = rand.nextInt(50) + 1; // Numbers between 1 and 50
    }

    // Store the numbers in the session to access later in result.jsp
    session.setAttribute("num1Array", num1Array);
    session.setAttribute("num2Array", num2Array);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Addition Quiz</title>
</head>
<body>
    <h1>Addition Quiz</h1>
    <form action="result.jsp" method="post">
        <table>
            <%
                for (int i = 0; i < 10; i++) {
            %>
            <tr>
                <td><%= num1Array[i] %> + <%= num2Array[i] %> = </td>
                <td><input type="number" name="answer<%= i %>" required /></td>
            </tr>
            <%
                }
            %>
        </table>
        <input type="submit" value="Submit" />
        <p>Click the browser's Refresh button to get a new quiz</p>
    </form>
</body>
</html>

