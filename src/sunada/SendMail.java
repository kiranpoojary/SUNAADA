/**
 * 
 */
package sunada;

/**
 * @author KIRAN
 *
 *
 */


import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.smtp.SMTPTransport;

public class SendMail {

	// for example, smtp.mailgun.org
	String Server = "smtp.gmail.com";
	String Username = "kiranpoojary483@gmail.com";
	String Password = "ki1997ran#";

	 String From = "kiranpoojary483@gmail.com";
	 String To = "kiranpjr97@gmail.com";
	String CC = "";

	String Subject = "Sunada";
	 String Text = "Rent Success";

	public  void SendEmail() {

		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", Server); // optional, defined in
											// SMTPTransport
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587"); // default port 25
		prop.put("mail.smtp.starttls.enable", "true"); //TLS
		Session session = Session.getInstance(prop, null);
		Message msg = new MimeMessage(session);

		try {

			// From
			msg.setFrom(new InternetAddress(From));

			// To
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(To, false));

			// cc
			msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(CC, false));

			// subject
			msg.setSubject(Subject);

			// content
			msg.setText(Text);

			msg.setSentDate(new Date());

			// Get SMTPTransport
			SMTPTransport t = (SMTPTransport) session.getTransport("smtp");

			// connect
			t.connect(Server, Username, Password);

			// send
			t.sendMessage(msg, msg.getAllRecipients());

			System.out.println("Response: " + t.getLastServerResponse());

			t.close();

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
