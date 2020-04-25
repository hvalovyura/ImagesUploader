<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <div>List of users</div>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        {{#users}}
        <tr>
            <td>{{username}}</td>
            <td>{{roles}}</td>
            <td><a href="/user/{{id}}">Edit</a></td>
        </tr>
        {{/users}}
        </tbody>
    </table>
</body>
</html>