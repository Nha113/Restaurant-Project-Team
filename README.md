# 🌟 Restaurant Web Application (LittleStar Restaurant)

ប្រូជេស្ដនេះគឺជាប្រព័ន្ធវេបសាយបញ្ជាទិញអាហារ (Food Ordering System) ដែលបង្កើតឡើងសម្រាប់បំពេញកិច្ចការក្រុមក្នុងវគ្គសិក្សា។

## 🚀 បច្ចេកវិទ្យាដែលប្រើប្រាស់ (Tech Stack)
- **Backend:** Java Servlets, Jakarta Server Pages (JSP)
- **Build Tool:** Apache Maven
- **Server:** Apache Tomcat
- **Frontend:** HTML5, CSS3, JavaScript,Tailwind CSS
- **Database:** MySQL
- **Tools:** Eclipse IDE, Git & GitHub, Figma

## ✨ លក្ខណៈពិសេសរបស់ប្រូជេស្ដ (Features)
- **Home Page:** បង្ហាញពីមុខម្ហូប និងព័ត៌មានលម្អិតរបស់ភោជនីយដ្ឋាន។
- **Food Ordering:** ប្រព័ន្ធជ្រើសរើស និងបញ្ជាទិញមុខម្ហូប។
- **Contact Page:** ទំព័រទំនាក់ទំនងសម្រាប់ឱ្យអតិថិជនផ្ញើសារ ឬសំណូមពរផ្សេងៗ។
- **Admin/User Management:** ការគ្រប់គ្រងទិន្នន័យក្នុងប្រព័ន្ធ។

## 👥 សមាជិកក្នុងក្រុម (Team Members)
| ឈ្មោះ (Name) | តួនាទី (Role) |
| :--- | :--- |
| **Bun Davorn** | Team Leader & Backend Developer & feature-menu(Home,Gallery,about us, menu, popular food,) |
| [Chhin ChhengE] | feature-footer |
| [Chea Chansokkanha] | feature-contact |

## ⚙️ របៀបRun Project (How to Run)
1. Clone យក Project នេះមកកាន់កុំព្យូទ័ររបស់អ្នក៖
   ```bash
   git clone [https://github.com/Nha113/Restaurant-Project-Team.git](https://github.com/Nha113/Restaurant-Project-Team.git)

   
# StarRestaurant - Complete User + Admin Version

## Stack
Java 17, Jakarta Servlet 6, JSP/JSTL, MySQL, Maven, Apache Tomcat 10+.

## Database
All database access uses:
- Database: `littlestardb`
- MySQL user: `root`
- MySQL password: `1234`

If your MySQL password is different, change it in:
`src/main/java/com/littlestar/util/DBUtil.java`

## First setup
1. Open MySQL Workbench.
2. Run all of `src/main/java/database.sql`.
3. In Eclipse, Maven > Update Project.
4. Run on Tomcat 10+.
5. Open the project root URL.

## Admin
URL: http://localhost:8080/Restaurant-Project-Team/admin/login


Demo:
- Username: `admin`
- Password: `admin123`

## User
Register from the restaurant Login modal.
Then:
Home -> Add to Cart -> Checkout -> enter phone/address -> Order saved.
User Dashboard: http://localhost:8080/Restaurant-Project-Team/user/dashboard

## Admin features
- Dashboard statistics
- Food list
- Add food
- Delete food
- View users
- View orders
- Update order status
- Delete orders

## Important
The old project had different database names in different classes. This version unifies them to `littlestardb`.
   