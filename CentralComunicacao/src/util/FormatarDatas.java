package util;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

public class FormatarDatas {

	@SuppressWarnings("deprecation")
	public static String converterData(String dt_prevista) throws ParseException {
		Calendar c = Calendar.getInstance();
		int ano = Integer.parseInt(dt_prevista.substring(0, 4));
		int mes = Integer.parseInt(dt_prevista.substring(5, 7));
		int dia = Integer.parseInt(dt_prevista.substring(8, 10));
		c.set(ano,mes-1, dia, 23, 59, 59);        
		Date data = c.getTime();
		DateFormat dtHora = DateFormat.getDateTimeInstance();
		String dataFormatada = dtHora.format(data);
		return dataFormatada;
	}

	public static String dataAtual() throws ParseException {
		Calendar c1 = Calendar.getInstance();
		Date data1 = c1.getTime();
		DateFormat dtHora = DateFormat.getDateTimeInstance();
		String dataFormatada = dtHora.format(data1);
		return dataFormatada;
	}

}
