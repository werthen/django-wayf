{% extends "base.html" %}
{% load i18n %}
{% block header %}{% trans "Select your home institution" %}{% endblock %}
{% block content %}
<p>
Ο επιλεγμένος Οικείος Φορέας σας είναι:
</p>
<div align="center">
<h4>{{ currentidp }}</h4>
<form method="post">
	<input type="hidden" name="clear" value="true" />
	<input type="submit" value="{% trans "Clear" %}" />
</form>
</div>
<p>
Η προεπιλογή ενός Οικείου Φορέα έχει ως αποτέλεσμα ότι δε χρειάζεται πλέον να επιλέγετε τον Οικείο Φορέα σας όταν προσπελαύνετε υπηρεσίες που χρησιμοποιούν την Υποδομή Ταυτοποίησης και Εξουσιοδότησης του ΕΔΕΤ με το συγκεκριμένο web browser.
</p>
{% endblock %}