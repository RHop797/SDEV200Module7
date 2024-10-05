<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    // Retrieve the numbers from the session
    int[] num1Array = (int[]) session.getAttribute("num1Array");
    int[] num2Array = (int[]) session.getAttribute("num2Array");
    int score = 0;

    // Build the response content
%>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Result</title>
</head>
<body>
    <h1>Quiz Result</h1>
    <table>
        <%
            for (int i = 0; i < 10; i++) {
                int correctAnswer = num1Array[i] + num2Array[i];
                String userAnswerStr = request.getParameter("answer" + i);
                int userAnswer = Integer.parseInt(userAnswerStr);
                
                if (userAnswer == correctAnswer) {
                    score++;
                }
        %>
        <tr>
            <td><%= num1Array[i] %> + <%= num2Array[i] %> = <%= correctAnswer %></td>
            <td>Your answer: <%= userAnswer %></td>
            <td><%= (userAnswer == correctAnswer) ? "Correct!" : "Incorrect" %></td>
        </tr>
        <%
            }
        %>
    </table>
    <p>Your total score: <%= score %> out of 10</p>
    <a href="quiz.jsp">Try Another Quiz</a>
</body>
</html>
