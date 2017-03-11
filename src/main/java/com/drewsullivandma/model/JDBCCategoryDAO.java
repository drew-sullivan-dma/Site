package com.drewsullivandma.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCCategoryDAO implements CategoryDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCCategoryDAO(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}
	
	@Override
	public List<Category> getAllCategories() {
		List<Category> categoryList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM category;");
		while(results.next()) {
			Category c = new Category();
			c = mapRowToCategory(results);
			categoryList.add(c);
		}
		return categoryList;
	}
	
	private Category mapRowToCategory(SqlRowSet results) {
		Category category = new Category();
		category.setCategoryId(results.getInt("category_id"));
		category.setName(results.getString("name"));
		category.setBooks(getAllBooks(category.getCategoryId()));
		return category;
	}
	
	private List<Book> getAllBooks(int categoryId) {
		List<Book> bookList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM book_category bc "
													  + "JOIN book b ON bc.book_id = b.book_id "
													  + "JOIN category c ON bc.category_id = c.category_id "
													  + "JOIN author_book ab ON b.book_id = ab.book_id "
													  + "JOIN author a ON ab.author_id = a.author_id "
													  + "WHERE c.category_id = ? "
													  + "ORDER BY a.last_name;", categoryId);
		while(results.next()) {
			Book b = new Book();
			b = mapRowToBook(results);
			bookList.add(b);
		}
		return bookList;
	}

	private Book mapRowToBook(SqlRowSet results) {
		Book book = new Book();
		book.setId(results.getInt("book_id"));
		book.setTitle(results.getString("title"));
		book.setAuthors(getAllAuthors(book.getId()));
		book.setDescriptions(getAllDescriptions(book.getId()));
		return book;
	}

	private List<Author> getAllAuthors(int bookId) {
		List<Author> authorList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM author_book ab "
													  + "JOIN author a ON ab.author_id = a.author_id "
													  + "JOIN book b ON ab.book_id = b.book_id "
													  + "WHERE b.book_id = ? "
													  + "ORDER BY a.first_name;", bookId);
		while(results.next()) {
			Author a = new Author();
			a = mapRowToAuthor(results);
			authorList.add(a);
		}
		return authorList;
	}

	private Author mapRowToAuthor(SqlRowSet results) {
		Author author = new Author();
		author.setId(results.getInt("author_id"));
		author.setFirstName(results.getString("first_name"));
		author.setMiddleInitials(results.getString("middle_initials"));
		author.setLastName(results.getString("last_name"));
		author.setPostNominalInitials(results.getString("post_nominal_initials"));
		return author;
	}

	private List<Description> getAllDescriptions(int bookId) {
		List<Description> descriptionList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM book_description bd "
													  + "JOIN book b ON bd.book_id = b.book_id "
													  + "JOIN description d ON bd.description_id = d.description_id "
													  + "WHERE b.book_id = ?;", bookId);
		while(results.next()) {
			Description d = new Description();
			d = mapRowToDescription(results);
			descriptionList.add(d);
		}
		return descriptionList;
	}

	private Description mapRowToDescription(SqlRowSet results) {
		Description description = new Description();
		description.setId(results.getInt("description_id"));
		description.setDescription(results.getString("description"));
		return description;
	}

}









