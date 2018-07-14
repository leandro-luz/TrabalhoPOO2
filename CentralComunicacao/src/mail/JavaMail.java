package mail;

import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMail {
	public static void enviarEmail(String email, String senha) {
		Properties props = new Properties();
		/** Par�metros de conex�o com servidor Gmail */
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("centralcomunicacao2018@gmail.com", "Aaa-11111");
			}
		});

		/** Ativa Debug para sess�o */
		session.setDebug(true);

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("centralcomunicacao2018@gmail.com")); // Remetente

			Address[] toUser = InternetAddress // Destinat�rio(s)
					.parse(email);

			message.setRecipients(Message.RecipientType.TO, toUser);
			message.setSubject("Senha provis�ria - Central Plano de A��o");// Assunto
			message.setText("Ol�,\n Sua senha provis�ria �: "+ senha 
					+ "\n Favor logar no sistema com essa senha \n"
					+ " e posteriormente dever� alter�-la. \n\n\n\n\n\n"
					+ " Favor n�o responder este email!");
			/** M�todo para enviar a mensagem criada */
			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}