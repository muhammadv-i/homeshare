# REST API Endpoints
## POST
| **Endpoint**                        | **Description**                                         | **Request Body**                                                                               | **Response**                                                                          | **Notes**                                                                                                                                                                                      |
|-------------------------------------|---------------------------------------------------------|------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `/recommend/owner`                  | Recommends owners to a seeker? _**need clarification**_ | `target_user`: id of the user _**(need clarification on whose `id` it is)**_                   | JSON array of `{ "common_interests": decimal, "id": integer, "similarity": decimal }` | Response is an array of owners, sorted by `similarity`, from highest to lowest.                                                                                                                |
| `/recommend/seeker`                 | Recommends seekers to an owner? _**need clarification**_ | `seeker_id`: id of the seeker                                                                  | JSON array of `{ "apts": [], "common_interests": decimal, "id": integer}`.            | Response is an array of seekers, sorted by `common_interests`, from highest to lowest. _**(need clarification on what `id` refers to. Is it the owner of the apartments or another seeker?)**_ |
| `/login`                            |                                                         | `email` and `password`                                                                         | `{ status: true/false, success: success/failure message }`                            |                                                                                                                                                                                                |
| `/registration`                     |                                                         | `username`, `email`, `password`, `picture`, `dob`, `job`, `move_in_date`, `type`, `interests` & `traits`: array of strings, and `gender` | `{ success: boolean, message: success/error message string }`                            |                                                                                                                                                                                                |
| `/invite`                           | Generates an invite                                     | `to`: recepient ID, `from`: sender ID, `apt`: apartment ID                                     | Same as in request body, but also includes `id`: the newly created invite's ID, `rejected`: boolean, `accepted`: boolean       |                                                                                                                                                                                                |
| `/invite/:inviteid/<accept/reject>` | Reject or accept the invite with ID `inviteid`          | | `success`: boolean, `message`

---
<br>

## GET
| **Endpoint**        | **Description**                               | **Request Body** | **Response**                                                                                                            | **Notes** |
|---------------------|-----------------------------------------------|------------------|-------------------------------------------------------------------------------------------------------------------------|-----------|
| `/invite/:inviteid` | Gets information of invite with ID `inviteid` |                  | `_id`: invite ID, `to`: recepient ID, `from`: sender ID, `apt`: apartment ID, `rejeceted`: boolean, `accepted`: boolean |

---
<br>

# TODO
- [ ] fix the Flask implementation of seeker recommendations such that it includes `apts`
- [ ] replace the local datasets with MongoDB 
- [ ] implement jwt token authorization for invites