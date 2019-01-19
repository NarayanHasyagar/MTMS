<%@ page language="java" import="javax.naming.*,java.io.*,javax.mail.*,
javax.mail.internet.*,com.sun.mail.smtp.*, java.util.*,
javax.activation.*"%>

<%
String host="", user="", pass="";
host = "smtp.gmail.com"; user = "@gmail.com"; //"
 // email id to send the emails
pass = "@19"; //Your gmail password
String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
String to = "@gmail.com"; // out going email id
String from = "@gmail.com"; //Email id of the recipient
String subject = "Testing Email";

//String fileAttachment "C:/workspace/WEBTESTING/WebContent/Output-File/SmartHome.txt";
boolean WasEmailSent ;
boolean sessionDebug = true;
Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); // use setText if you want to

//DataSource source = new FileDataSource(fileAttachment);
//msg.setDataHandler(new DataHandler(source));
//msg.setFileName("Sugam.txt");
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
out.println("Message sent");
try {
transport.sendMessage(msg, msg.getAllRecipients());
WasEmailSent = true; // assume it was sent
}
catch (Exception err) {
WasEmailSent = false; // assume it's a fail
}
transport.close();
%>
</body>
</html> 