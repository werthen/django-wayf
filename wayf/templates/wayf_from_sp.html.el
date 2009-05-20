{% extends "base.html" %}
{% load i18n %}
{% block header %}Επιλογή οικείου φορέα{% endblock %}
{% block content %}
<p>Βρίσκεστε σε αυτήν τη σελίδα επειδή προσπαθήσατε να προσπελάσετε μια υπηρεσία που χρησιμοποιεί την Υποδομή Ταυτοποίησης και Εξουσιοδότησης του ΕΔΕΤ. Προκειμένου να προχωρήσετε, θα πρέπει να επιλέξετε τον Οικείο Φορέα σας από τον παρακάτω κατάλογο. Προαιρετικά, μπορείτε να αποθηκεύσετε την επιλογή αυτή, ώστε να μην ερωτηθείτε σε επόμενες χρήσεις της υποδομής.</p>

<div id="idpform">
<form method="post">
	<select name="user_idp">
	{% include "idp_dropdown.html" %}
	</select>
	<input type="submit" value="{% trans "Confirm" %}" /><br />
	<script type="text/javascript">
	function toggleRadios(){
		var state;
		state = ! document.forms[0].save.checked;
		document.getElementById('permsave').disabled = state;
		document.getElementById('sesssave').disabled = state;
	}
	</script>
	<div id="userprefs">
	<input type="checkbox" name="save" value="1" onclick="toggleRadios();"/>Αποθήκευση της προτίμησης:</input>
	<input type="radio" id="sesssave" name="savetype" value="session" disabled="true" checked="true" />Μέχρι να κλείσω το browser</input>
	<input type="radio" id="permsave" name="savetype" value="perm" disabled="true" />Μόνιμα</input><br />
	</div>
</form>
</div>

{% endblock %}

{% comment %} vim: set ft=htmldjango: {% endcomment %}