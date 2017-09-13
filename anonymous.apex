List<User> users = [SELECT Id, FirstName, LastName, Email FROM User];
for (User user : users) {
	System.debug(user.Id + ', ' + user.FirstName + ' ' + user.LastName);
}