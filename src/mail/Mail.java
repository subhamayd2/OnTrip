package mail;
//import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
//import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
//import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Mail {
	public void sendMail(String u_id, String uname, String uhash) {

        final String username = "ontrip.corps@gmail.com";
        final String password = "ontrip.com";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
          });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("ontrip.corps@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(u_id));
            message.setSubject("Verification mail for OnTrip.com");
            message.setText("Dear "+uname+","
                + "\n\nThanks for signing up!"
                + "\nYour account has been created, you can login after you have activated your account by pressing the url below."
                + "\n\n\nPlease click this link to activate your account:"
                + "\nhttp://localhost:8085/OnTrip/verifyServlet?u_id="+u_id+"&uhash="+uhash);

            Transport.send(message);

            System.out.println("Done");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


	public boolean sendRecoveryMail(String u_id, String uname){
		final String username = "ontrip.corps@gmail.com";
        final String password = "ontrip.com";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
          });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("ontrip.corps@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(u_id));
            message.setSubject("Password recovery mail for OnTrip.com");
            message.setText("Dear "+uname+","
                + "\n\nThis email is sent to you since you have requested for password recovery. Thank you."
                + "\n"
                + "\n\n\nPlease click this link to recover your password:"
                + "\nhttp://localhost:8085/OnTrip/recoverServlet?u_id="+u_id);

            Transport.send(message);

            System.out.println("Done");
            return true;

        } catch (Exception e) {
            return false;
        }
	}
}
