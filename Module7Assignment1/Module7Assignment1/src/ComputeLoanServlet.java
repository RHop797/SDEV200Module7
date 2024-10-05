import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet("/ComputeLoanServlet")
public class ComputeLoanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get form parameters
            double loanAmount = Double.parseDouble(request.getParameter("loanAmount"));
            double annualInterestRate = Double.parseDouble(request.getParameter("interestRate"));
            int numYears = Integer.parseInt(request.getParameter("numYears"));

            Loan loan = new Loan(annualInterestRate, numYears, loanAmount);

            // Compute monthly and total payments
            double monthlyPayment = loan.getMonthlyPayment();
            double totalPayment = loan.getTotalPayment();

            // Display results
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h2>Loan Payment Results</h2>");
            out.println("<p>Monthly Payment: " + String.format("%.2f", monthlyPayment) + "</p>");
            out.println("<p>Total Payment: " + String.format("%.2f", totalPayment) + "</p>");
            out.println("</body></html>");
        } catch (Exception e) {
            
            e.printStackTrace();

            // Display an error message to the user
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h2>Error computing loan payments</h2>");
            out.println("<p>Please make sure all inputs are valid numbers.</p>");
            out.println("</body></html>");
        }
    }
}
