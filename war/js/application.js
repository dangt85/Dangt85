function confirmDelete(entity, formId) {
	if(confirm("Are you sure you want to delete this " + entity + "?")){
		$(formId).submit();
	} else {
		return false;
	}
}