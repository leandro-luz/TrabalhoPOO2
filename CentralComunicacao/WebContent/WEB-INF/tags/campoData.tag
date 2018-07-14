<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="id" required="true"%>
<input id=
"${id}" name=
"${id}" type="text">
<script>
 $("#${id}").datepicker();
</script>	