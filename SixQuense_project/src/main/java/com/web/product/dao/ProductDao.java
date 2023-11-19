package com.web.product.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Properties;

import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductattachmentDto;
import com.web.product.dto.ProductcourseDto;
import com.web.product.dto.ProductsreviewDto;
import com.web.product.dto.ProductwishilistDto;
import static com.web.common.JDBCTemplate.*;

public class ProductDao {
	private Properties sql = new Properties();
	{
		String path = ProductDao.class.getResource("/sql/product/product_sql.properties").getPath();
		try (FileReader fr = new FileReader(path)) {
			sql.load(fr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 최신순으로 조회해서 가져오는 메소드
	public List<ProductDto> selectRecentproductByCountry(Connection conn, int coodinateNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDto> recentProducts = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectRecentproductAndImageByCoun"));
			pstmt.setInt(1, coodinateNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				addProductAndImage(recentProducts, rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return recentProducts;
	}

	// 할인율로 조회해서 가져오는 메소드
	public List<ProductDto> selectDicountproductByCountry(Connection conn, int coodinateNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDto> discountProducts = new ArrayList<ProductDto>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectDiscountproductAndImageByCoun"));
			pstmt.setInt(1, coodinateNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				addProductAndImage(discountProducts, rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return discountProducts;
	}

	// 베스트 상품(조회순) 조회해서 가져오는 메소드
	public List<ProductDto> selectBestproductByCountry(Connection conn, int coodinateNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDto> bestProducts = new ArrayList<ProductDto>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBestproductAndImageByCoun"));
			pstmt.setInt(1, coodinateNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				addProductAndImage(bestProducts, rs);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return bestProducts;
	}

	// 상품 번호별로 가져오는 메소드
	public ProductDto selectProductByNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDto> products = new ArrayList<ProductDto>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectProductByNo"));
			//System.out.println(sql.getProperty("selectProductByNo"));
			pstmt.setInt(1, productNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				addProductAndImage(products, rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return products.get(0);
	}

	// 조회수 변경하는 메소드
	public int updateProductReadCount(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("updateProductReadCount"));
			pstmt.setInt(1, productNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 댓글 인서트 메소드
	public int insertProductComment(Connection conn, ProductsreviewDto pr) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertProductComment"));
			pstmt.setString(1, pr.getUserId());
			pstmt.setString(2, pr.getCommentContent());
			pstmt.setString(3, pr.getCommentRef() == 0 ? null : String.valueOf(pr.getCommentRef()));
			pstmt.setInt(4, pr.getCommentLevel());
			pstmt.setInt(5, pr.getProductNo());
			pstmt.setInt(6, pr.getMemberNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 댓글 조회하는 메소드

	public List<ProductsreviewDto> selectProductComment(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductsreviewDto> comments = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectProductComment"));
			pstmt.setInt(1, productNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				comments.add(getReview(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return comments;

	}

	// 댓글 숫자 카운트 메소드
	public int selectProductCountByNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int commentCount = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectProductCountByno"));
			pstmt.setInt(1, productNo);
			rs = pstmt.executeQuery();
			if (rs.next())
				commentCount = rs.getInt("count");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return commentCount;
	}
	
	//위시리스트 인서트 하는 메소드
	public int insertwishlist(Connection conn, ProductwishilistDto wishlist) {
			PreparedStatement pstmt = null;
			int result = 0;
			try {
				pstmt = conn.prepareStatement(sql.getProperty("insertwishlist"));
				pstmt.setInt(1, wishlist.getMemberNo());
				pstmt.setInt(2, wishlist.getProductNo());	
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
	}
	
	//위시리스트 삭제하는 메소드
	public int removewishlist(Connection conn, ProductwishilistDto wishlist) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("removewishlist"));
			pstmt.setInt(1, wishlist.getMemberNo());
			pstmt.setInt(2, wishlist.getProductNo());	
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//위시리스트 카운트 하는 메소드
	
	public int selectWishlistCountByNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int commentCount = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectWishlistCountByNo"));
			pstmt.setInt(1, productNo);
			rs = pstmt.executeQuery();
			if (rs.next())
				commentCount = rs.getInt("count");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return commentCount;
	}

	// list 있는 상품 조회 가능하게 하는 메소드
	private void addProductAndImage(List<ProductDto> products, ResultSet rs) throws SQLException {
		int pk = rs.getInt("product_no");
		if (products.stream().anyMatch(e -> pk == e.getProductNo())) {
			products.stream().filter(e -> Objects.equals(e.getProductNo(), pk)).forEach(e -> {
				try {
					if (rs.getString("original_filename") != null) {
						e.getAttachment().add(getImage(rs));
					}
					if (rs.getInt("course_no") != 0) {
						e.getCourse().add(getCourse(rs));
					}
					if (rs.getInt("products_review_no") != 0) {
						e.getReview().add(getReview(rs));
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			});
		} else {
			ProductDto product = getProduct(rs);
			if (rs.getString("original_filename") != null) {
				product.getAttachment().add(getImage(rs));
				products.add(product);
			}
			if (rs.getInt("course_no") != 0) {
				product.getCourse().add(getCourse(rs));
				products.add(product);
			}
			if (rs.getInt("products_review_no") != 0) {
				product.getReview().add(getReview(rs));
				products.add(product);
			}
		}
	}

	// 첨부파일 조회해서 가져오는 메소드
	public List<ProductattachmentDto> selectImages(Connection conn, int ProductNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductattachmentDto> images = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectImages"));
			pstmt.setInt(1, ProductNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				images.add(getImage(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return images;
	}

	// 빌더 조인 하는 것들도 적어서 수정 해야됨
	public static ProductDto getProduct(ResultSet rs) throws SQLException {
		return ProductDto.builder().ProductNo(rs.getInt("product_no")).ProductName(rs.getString("product_name"))
				.ProductReadcount(rs.getInt("product_readcount")).ProductInsertdate(rs.getDate("product_insertdate"))
				.MinCount(rs.getInt("min_count")).MaxCount(rs.getInt("max_count"))
				.ProductPrice(rs.getInt("prodcut_price")).GuideNo(rs.getInt("guide_no"))
				.ProductDiscountRate(rs.getDouble("product_discount_rate"))
				.ProductDetail(rs.getString("product_detail")).ProductDuration(rs.getInt("product_duration"))
				.ProductDay(rs.getString("product_day").split(",")).CoodinateNo(rs.getInt("coordinate_no"))
				.EditorNote(rs.getString("editor_note")).attachment(new ArrayList<ProductattachmentDto>())
				.review(new ArrayList<ProductsreviewDto>()).course(new ArrayList<ProductcourseDto>()).build();
	}

	// 상품 첨부파일 구체화 하는 메소드
	public static ProductattachmentDto getImage(ResultSet rs) throws SQLException {

		return ProductattachmentDto.builder().OrginalFilename(rs.getString("original_filename"))
				.RenameFilename(rs.getString("rename_filename")).ProductNo(rs.getInt("product_no")).build();
	}

	public static ProductcourseDto getCourse(ResultSet rs) throws SQLException {
		return ProductcourseDto.builder().
				CourseNo(rs.getInt("course_no"))
				.CourseName(rs.getString("course_name"))
				.CourseDetail(rs.getString("course_detail"))
				.ProductNo(rs.getInt("product_no"))
				.build();
	}

	public static ProductsreviewDto getReview(ResultSet rs) throws SQLException {
		return ProductsreviewDto.builder()
				.ProductNo(rs.getInt("product_no"))
				.UserId(rs.getString("user_id_re"))
				.CommentContent(rs.getString("comment_content"))
				.CommentDate(rs.getDate("comment_date"))
				.CommentRef(rs.getInt("comment_ref"))
				.CommentLevel(rs.getInt("comment_level"))
				.CommentNo(rs.getInt("products_review_no"))
				.memberNo(rs.getInt("member_no"))
				.build();

	}

}
