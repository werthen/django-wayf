{% extends "base.html" %}
{% load i18n %}
{% block header %}Επιλογή οικείου φορέα{% endblock %}
{% block content %}
<p>Σε αυτή τη σελίδα μπορείτε να καθορίσετε έναν προεπιλεγμένο Οικείο Φορέα που μπορεί να σας πιστοποιήσει για πρόσβαση σε υπηρεσίες της Ομοσπονδίας AAI του ΕΔΕΤ. Η ρύθμιση θα αποθηκευτεί στο συγκεκριμένο web browser και θα έχει ως αποτέλεσμα να μεταφέρεστε αυτόματα στο σύστημα ταυτοποίησης του ιδρύματός σας όταν προσπελαύνετε υπηρεσίες που χρησιμοποιούν την Υποδομή Ταυτοποίησης και Εξουσιοδότησης του ΕΔΕΤ. Μη χρησιμοποιείτε αυτήν την επιλογή αν διαθέτετε λογαριασμούς σε περισσότερους από έναν φορείς-μέλη της Ομοσπονδίας του ΕΔΕΤ.</p>
<div id="idpform">
<form method="post">
	<select name="user_idp">
	{% include "idp_dropdown.html" %}
	</select>
	<input type="submit" value="{% trans "Confirm" %}" /><br />
	<input type="hidden" name="save" value="true" />
	<input type="hidden" name="savetype" value="perm" />
</form>
</div>
{% endblock %}