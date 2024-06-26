class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler

    def help
        help_object = {
            "message": "Help",
            "data": {
                "todo": [
                    "base": "/todos -> Returns all todo",
                    "read one": "/todos/(:id) -> Returns :id",
                    "insert": "POST /todos (params) -> Insert new todo",
                    "update": "PUT /todos/(:id) (params) -> Update param(s) in :id",
                    "delete": "DELETE /todos/(:id) -> Deletes :id"
                ],
                "items": [
                    "base": "/todos/(:todo id)/items -> Returns all items in :todo_id",
                    "read one": "/todos/(:todo id)/items/(:id) -> Returns :id",
                    "insert": "POST /todos/(:todo id)/items (params) -> Insert new item",
                    "update": "PUT /todos/(:todo id)/items/(:id) (params) -> Update param(s) in :id",
                    "delete": "DELETE /todos/(:todo id)/items/(:id) -> Deletes :id"
                ],
                "notification": [
                    "base": "/notify -> Lists tasks that reached and past deadline"
                ]
            }
        }

        json_response(help_object)
    end
end
