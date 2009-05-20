{% extends "base.html" %}
{% load i18n %}
{% block header %}{% trans "User support" %}{% endblock %}
{% block content %}
Παρουσιάστηκε πρόβλημα κατά τη χρήση της Υποδομής Ταυτοποίησης και Εξουσιοδότησης του ΕΔΕΤ. Παρακαλούμε επικοινωνήστε με τον οικείο φορέα σας.
{% if idpname %}
Σύμφωνα με την επιλεγμένο φορέα σας, «<strong>{{ idpname }}</strong>», 
μπορείτε να επικοινωνήσετε με έναν από τους παρακάτω τρόπους:
<ul>
{% if idp.contact.email %}
	<li><b>E-mail:</b> <a href="mailto:{{ idp.contact.email }}?subject={% trans "Shibboleth Authentication Issue" %}">{{ idp.contact.email }}</a></li>
{% endif %}
{% if idp.contact.telephone %}
	<li><b>{% trans "Telephone" %}</b>: {{ idp.contact.telephone }}</li>
{% endif %}
</ul>
{% endif %}
{% endblock %}