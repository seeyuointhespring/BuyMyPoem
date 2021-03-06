package com.buymypoem.springmvc.dao;

import com.buymypoem.springmvc.model.Author;
import com.buymypoem.springmvc.model.Customer;
import com.buymypoem.springmvc.model.MsgSupport;
import com.buymypoem.springmvc.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Calendar;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.List;

public class UserDAO {
    JdbcTemplate temp;

    public void setTemp(JdbcTemplate temp) {
        this.temp = temp;
    }

    private static Logger LOGGER = LoggerFactory.getLogger(CompositionDAO.class);

    public User getUserByLogin(String login){
        String sql ="Select * from user where login=?";

        try {
            List<User> uList = temp.query(sql, new Object[]{login}, new RowMapper<User>() {
                public User mapRow(ResultSet resultSet, int i) throws SQLException {
                    User u = new User();
                    u.setUserID(resultSet.getInt("userID"));
                    u.setLogin(resultSet.getString("login"));
                    u.setBirthdate(resultSet.getDate("birthdate"));
                    u.setEmail(resultSet.getString("email"));
                    u.setPassword(resultSet.getString("password"));
                    u.setPhoto(resultSet.getString("photo"));
                    u.setAbout(resultSet.getString("about"));
                    u.setRegistredate(resultSet.getDate("registerdate"));
                    u.setRole(resultSet.getString("role"));
                    return u;
                }
            });

            return uList.get(0);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public Author getAuthorById(int id){
        String sql ="Select * from author where userId=?";

        try {
            List<Author> uList = temp.query(sql, new Object[]{id}, new RowMapper<Author>() {
                public Author mapRow(ResultSet resultSet, int i) throws SQLException {
                    Author a = new Author();
                    a.setAuthorID(resultSet.getInt("authorID"));
                    a.setFinishedcompositions(resultSet.getInt("finisedcompositions"));
                    a.setRating(resultSet.getFloat("rating"));
                    a.setCardNumber(resultSet.getString("cardNumber"));
                    return a;
                }
            });

            return uList.get(0);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public Customer getCustomerById(int id){
        String sql ="Select * from customer where userId=?";

        try {
            List<Customer> uList = temp.query(sql, new Object[]{id}, new RowMapper<Customer>() {
                public Customer mapRow(ResultSet resultSet, int i) throws SQLException {
                    Customer c =  new Customer();
                    c.setCustomerID(resultSet.getInt("customerID"));
                    c.setPaidcompositionnumber(resultSet.getInt("paidcompositionnumber"));
                    return c;
                }
            });

            return uList.get(0);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }



    public int insertUser(User user) {
        String dateRegisterdate=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
        String dateBirthdate=new SimpleDateFormat("yyyy-MM-dd").format(user.getBirthdate());
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String password = bCryptPasswordEncoder.encode(user.getPassword());
        String sql = "insert into user (login, password, email, birthdate, registerdate, role) values (?,?,?,?,?,?);";
        Object[] params = {user.getLogin(), password, user.getEmail(), dateBirthdate, dateRegisterdate, user.getRole()};
        int[] types = {Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.DATE, Types.DATE, Types.VARCHAR};
        temp.update(sql,params,types);

        user = getUserByLogin(user.getLogin());

        if (user.getRole().equals("Author")){
            insertAuthor(user.getUserID());
        }
        else if (user.getRole().equals("Customer")){
            insertCustomer(user.getUserID());
        }
        return user.getUserID();
    }

    public int insertAuthor(int id) {
        String sqlAuthor="insert into author (userId) VALUES  (?);";
        return temp.update(sqlAuthor, new  Object[]{id}, new int[]{Types.INTEGER});
    }

    public int insertCustomer(int id) {
        String sqlCustomer="insert into customer (userId) VALUES  (?);";
        return temp.update(sqlCustomer, new  Object[]{id}, new int[]{Types.INTEGER});
    }

    public int updateUser(User user) {
        String sql="UPDATE user SET photo = ? WHERE userID = ?;";
        Object[] params = {user.getPhoto(), user.getUserID()};
        int[] types = {Types.VARCHAR, Types.INTEGER};
        return temp.update(sql,params,types);
    }

    public boolean updateUserInfo(User user) {
        String sql="UPDATE user SET user.login=?, user.email=?, user.about=? WHERE userID=?;";
        Object[] params = {user.getLogin(), user.getEmail(), user.getAbout(), user.getUserID()};
        int[] types = {Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.INTEGER};

        if ((temp.update(sql,params,types)>0)&&(user.getRole().equals("Author")))
            if (updateAuthorInfo(user)>0) return true;
        return false;
    }

    public int updateAuthorInfo(User user) {
        String sql="UPDATE author SET author.cardNumber=? WHERE userID=?;";
        Object[] params = {user.getCardNumber(), user.getUserID()};
        int[] types = {Types.VARCHAR, Types.INTEGER};
        return temp.update(sql,params,types);
    }

    public int techSupport(int idUser, String msg){
        String sql = "INSERT INTO `support` (`userID`, `msg`) VALUES (?, ?)";
        Object[] params = {idUser, msg};
        int[] types = {Types.INTEGER, Types.VARCHAR};
        return temp.update(sql,params,types);
    }

    public List<MsgSupport> techSupportAll(){
        String sql = "SELECT * FROM support JOIN user where support.userID=user.userID";
        try {
             List<MsgSupport> uList = temp.query(sql, new RowMapper<MsgSupport>() {
                public MsgSupport mapRow(ResultSet resultSet, int i) throws SQLException {
                    MsgSupport a = new MsgSupport();
                    a.setId(resultSet.getInt("id"));
                    a.setMsg(resultSet.getString("msg"));
                    a.setEmail(resultSet.getString("email"));
                    a.setLogin(resultSet.getString("login"));
                    return a;
                }
            });
            return uList;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public int delete(int id){
        String sql = "Delete from support where id=?";
        try {
            Object[] params = {id};
            int[] types = {4};
            return temp.update(sql,params,types);
        }catch (Exception e){
            LOGGER.error("error: ",e);
            return 0;
        }
    }
}
