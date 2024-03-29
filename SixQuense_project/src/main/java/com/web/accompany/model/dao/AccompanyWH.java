package com.web.accompany.model.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Properties;

import com.web.accompany.model.dto.AccompanyAttachment;
import com.web.accompany.model.dto.AccompanyComment;
import com.web.accompany.model.dto.AccompanyDTO;
import com.web.accompany.model.dto.AccompanyOffer;
import com.web.accompany.model.dto.Continent;
import com.web.accompany.model.dto.Coordinate;
import com.web.member.dto.MemberToAcompanyWH;
import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductattachmentDto;



public class AccompanyWH {
   private Properties sql=new Properties();
   {
      String path=AccompanyWH.class.getResource("/sql/accompany/accompany_sql.properties").getPath();
      try(FileReader fr=new FileReader(path)) {
         sql.load(fr);
      }catch(IOException e) {
         e.printStackTrace();
      }
   }
      
   public AccompanyDTO getAccompanyDTO(ResultSet rs) throws SQLException{
      return AccompanyDTO.builder()
               .accompanyNo(rs.getInt("ACCOMPANY_NO"))
               .accompanyTitle(rs.getString("ACCOMPANY_TITLE"))
               .accompanyContent(rs.getString("ACCOMPANY_CONTENT"))
               .accompanyCount(rs.getInt("ACCOMPANY_COUNT"))
               .accompanyDate(rs.getDate("ACCOMPANY_DATE"))
               .memberNo(rs.getInt("MEMBER_NO"))
               .accompanyReadCount(rs.getInt("ACCOMPANY_READCOUNT"))
               .coordinate(getCoordinate(rs))      
               .originalFilename(rs.getString("ORIGINAL_FILENAME"))
               .renameFilename(rs.getString("RENAME_FILENAME"))
               .accompanyStatus(rs.getString("ACCOMPANY_STATUS"))
               .openChattingLink(rs.getString("OPENCHATTING_LINK"))
               .AcOffer(new ArrayList<>())
               .userId(rs.getString("USER_ID"))
               .renameProfilename(rs.getString("PROFILE_RE_FILNAME"))
               .userIntroduce(rs.getString("USER_INTRODUCE"))
               .build();
   }
   private AccompanyOffer getAccompanyOffer (ResultSet rs) throws SQLException{
      return AccompanyOffer.builder()
            .accompanyNo(rs.getInt("ACCOMPANY_NO"))
            .memberNo(rs.getInt("MEMBER_NO"))
            .accompanyOfferStatus(rs.getString("ACCOMPANY_OFFER_STATUS"))
            .offerRename(rs.getString("PROFILE_RE_FILNAME"))
            .userId(rs.getString("USER_ID"))
            .build();
   }
   private AccompanyOffer getOffer (ResultSet rs) throws SQLException{
      return AccompanyOffer.builder()
            .accompanyNo(rs.getInt("ACCOMPANY_NO"))
            .memberNo(rs.getInt("MEMBER_NO"))
            .accompanyOfferStatus(rs.getString("ACCOMPANY_OFFER_STATUS"))
            .build();
   }
   
   private List<AccompanyAttachment> getAttachment(ResultSet rs) throws SQLException {
       return Collections.singletonList(
           AccompanyAttachment.builder()
               .originalFilename(rs.getString("ORIGINAL_FILENAME"))
               .renameFilename(rs.getString("RENAME_FILENAME"))
               .build()
       );
   }

   
   public Coordinate getCoordinate(ResultSet rs) throws SQLException{
      return Coordinate.builder()
            .coordinateNo(rs.getInt("COORDINATE_NO"))
            .nation(rs.getString("NATION"))
            .latitude(rs.getDouble("LATITUDE"))
            .longitude(rs.getDouble("LONGITUDE"))
            .continent(getContinent(rs))
            .build();
   }
   
   private Continent getContinent(ResultSet rs) throws SQLException{
      return Continent.builder()
            .continentNo(rs.getInt("CONTINENT_NO"))
            .continentName(rs.getString("CONTINENT_NAME"))
            .build();
   }
   
   //댓글 빌더 
   private AccompanyComment getAccompanyComment(ResultSet rs) throws SQLException {
      return AccompanyComment.builder()
            .accompanyComtNo(rs.getInt("ACCOMPANY_COMMENT_NO"))
            .accompanyComtLevel(rs.getInt("ACCOMPANY_COMMENT_LEVEL"))
            .accompanyComtContent(rs.getString("ACCOMPANY_COMMENT_CONTENT"))
            .accompanyComtRef(rs.getInt("ACCOMPANY_COMMENT_REF"))
            .accompanyComtDate(rs.getDate("COMMENT_DATE"))
            .accompanyNo(rs.getInt("ACCOMPANY_NO"))
            .userId(rs.getString("USER_ID"))
            .build();


	}
	private MemberToAcompanyWH getMemberToAccompanyWH(ResultSet rs) throws SQLException {
		return MemberToAcompanyWH.builder()
				.userNo(rs.getInt("MEMBER_NO"))
				.accompany(rs.getInt("ACCOMPANY_NO"))
				.AcOffer(rs.getString("ACCOMPANY_OFFER_STATUS"))
				.build();
				
		}
	public static ProductattachmentDto getImage(ResultSet rs) throws SQLException {
		return ProductattachmentDto.builder().OrginalFilename(rs.getString("original_filename"))
				.RenameFilename(rs.getString("rename_filename")).ProductNo(rs.getInt("product_no")).build();
	}
	public static ProductDto getProduct(ResultSet rs) throws SQLException {
		return ProductDto.builder().ProductNo(rs.getInt("product_no")).ProductName(rs.getString("product_name"))
				.ProductReadcount(rs.getInt("product_readcount")).ProductInsertdate(rs.getDate("product_insertdate"))
				.MinCount(rs.getInt("min_count")).MaxCount(rs.getInt("max_count"))
				.ProductPrice(rs.getInt("prodcut_price")).GuideNo(rs.getInt("guide_no"))
				.ProductDiscountRate(rs.getDouble("product_discount_rate"))
				.ProductDetail(rs.getString("product_detail")).ProductDuration(rs.getInt("product_duration"))
				.ProductDay(rs.getString("product_day") != null ? rs.getString("product_day").split(",") : null)
				.CoodinateNo(rs.getInt("coordinate_no")).EditorNote(rs.getString("editor_note"))
				.attachment(new ArrayList())
				.build();
	}
	
	//상품 검색해서 들고오는 메소드 
	public List<ProductDto> selectsearchAll(Connection conn, String searchValue) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDto> result = new ArrayList<ProductDto>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectsearchAll"));
			pstmt.setString(1, "%" + searchValue + "%");
			pstmt.setString(2, "%" + searchValue + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				addProductAndAttachment(result, rs);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}
	
	private void addProductAndAttachment(List<ProductDto> products, ResultSet rs) throws SQLException {
		int pk = rs.getInt("product_no");
		if (products.stream().anyMatch(e -> pk == e.getProductNo())) {
			products.stream().filter(e -> Objects.equals(e.getProductNo(), pk)).forEach(e -> {
				try {
					if (rs.getString("original_filename") != null) {
						e.getAttachment().add(getImage(rs));
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			});
		} else {
			ProductDto product = getProduct(rs);
			if (rs.getString("original_filename") != null)
				product.getAttachment().add(getImage(rs));
			products.add(product);
		}
	}
	
	
	//게시물 번호를 받아서 게시물을 가져오는 메소드 
	public AccompanyDTO selectAccompanyByNo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AccompanyDTO> board = new ArrayList<AccompanyDTO>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectAccompanyByNo"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
			 while (rs.next()) {
				//a = getAccompanyDTO(rs);
				addselectOffer(board,rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		//System.out.println(board.get(0));
		return board.get(0);
		
	} 
	public MemberToAcompanyWH selectMemberToAcompany(Connection conn, int userNo, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//List<MemberToAcompanyWH> member = new ArrayList<MemberToAcompanyWH>();
		MemberToAcompanyWH member =  null;
		System.out.println(userNo+" "+ no);
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectMemberToAcompany"));
			pstmt.setInt(1, no);
			pstmt.setInt(2, userNo);
			rs=pstmt.executeQuery();
			
			 if (rs.next()) {
				member = getMemberToAccompanyWH(rs);
				//addMemberOffer(member,rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(member+"dao");
		return member;
			
	}
		
//	private void addMemberOffer(List<MemberToAcompanyWH> member, ResultSet rs) {
//		int pk = rs.getInt("ACCOMPANY_NO");
//		if (member.stream().anyMatch(e -> pk == e.getUserNo())) {
//			member.stream().filter(e -> Objects.equals(e.getUserNo(), pk)).forEach(e -> {
//	            try {
//	               if (rs.getInt("ACCOMPANY_NO") != 0) {
//	                  e.getAcOffer().add(getAccompanyOffer(rs));
//	               }
//	               
//	            } catch (SQLException e1) {
//	               e1.printStackTrace();
//	            }
//	         });
//	      } else {
//	    	  AccompanyDTO members = getAccompanyDTO(rs);
//	         if( rs.getInt("ACCOMPANY_NO") != 0) {
//	        	 members.getAcOffer().add(getAccompanyOffer(rs));
//	        	 member.add(members);
//	         }
//	         
//	      }
//		
//	}
	private void addselectOffer(List<AccompanyDTO> board, ResultSet rs) throws SQLException {
		  int pk = rs.getInt("ACCOMPANY_NO");
	      if (board.stream().anyMatch(e -> pk == e.getAccompanyNo())) {
	    	  board.stream().filter(e -> Objects.equals(e.getAccompanyNo(), pk)).forEach(e -> {
	            try {
	               if (rs.getInt("ACCOMPANY_NO") != 0) {
	                  e.getAcOffer().add(getAccompanyOffer(rs));
	               }
	               
	            } catch (SQLException e1) {
	               e1.printStackTrace();
	            }
	         });
	      } else {
	    	  AccompanyDTO boards = getAccompanyDTO(rs);
	         if( rs.getInt("ACCOMPANY_NO") != 0) {
	        	 boards.getAcOffer().add(getAccompanyOffer(rs));
	        	 board.add(boards);
	         }
	         
	      }
	}
	
	
	//댓글 가져오는 메소드 
	public List<AccompanyComment> selectAccompanyComment(Connection conn, int no) {
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		List <AccompanyComment> result= new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectAccompanyComment"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next())result.add(getAccompanyComment(rs));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<AccompanyOffer> selectOfferByNo(Connection conn, int no) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<AccompanyOffer> result = new ArrayList<>();
		//System.out.println(no +"dao 번호1!!!!!!!!!!!!");
		try {
			pstm = conn.prepareStatement(sql.getProperty("selectselectOffer"));
			pstm.setInt(1, no);
			rs=pstm.executeQuery();
			while(rs.next())result.add(getAccompanyOffer(rs));
			//System.out.println(rs.next() +"rs.next() 번호1!!!!!!!!!!!!");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		System.out.println(result);
		return result;
		
	}
	


   public int insertAccompanyComment(Connection conn, AccompanyComment ac) {
      PreparedStatement pstmt = null;
      int result = 0;
      try {
         pstmt= conn.prepareStatement(sql.getProperty("insertAccompanyComment"));
         pstmt.setInt(1,ac.getAccompanyComtLevel());
         pstmt.setString(2,ac.getAccompanyComtContent());
         pstmt.setString(3,ac.getAccompanyComtRef()==0?null:String.valueOf(ac.getAccompanyComtRef()));
         pstmt.setInt(4,ac.getAccompanyNo());
         pstmt.setString(5,ac.getUserId());
         result=pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }

      return result;
   }
   public int deletecomment(Connection conn, int commentNo) {
      PreparedStatement pstmt = null;
      int result = 0;
      System.out.println("dao"+commentNo+"댓글번호");

      try {
         pstmt= conn.prepareStatement(sql.getProperty("deletecomment"));
         pstmt.setInt(1,commentNo);
         result=pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      System.out.println(result+"dao 결과");
      return result;
   }
   
   
   //조회수 카운트 메소드 
   public int updateAccompanyReadCount(Connection conn, int no) {
      PreparedStatement pstmt = null;
      int result = 0;
      try {
         pstmt = conn.prepareStatement(sql.getProperty("updateAccompanyReadCount"));
         pstmt.setInt(1, no);
         result=pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }return result;
      
   }


	public int insertAccompanyOffer(Connection conn, int userNo, int acompanyBNo) {
		PreparedStatement pstmt=null;
		int result=0;
		//System.out.println(userNo +"유저값 "+acompanyBNo +" 게시물 값 여기는 dao");
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertAccompanyOffer"));
			pstmt.setInt(1, acompanyBNo);
			pstmt.setInt(2, userNo);
			result=pstmt.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public int deleteAccompanyOffer(Connection conn, int userNo, int acompanyBNo) {
		PreparedStatement pstmt=null;
		int result=0;
		System.out.println(userNo +"유저값 "+acompanyBNo +" 게시물 값 여기는 dao");
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteAccompanyOffer"));
			pstmt.setInt(1, acompanyBNo);
			pstmt.setInt(2, userNo);
			result=pstmt.executeUpdate();
			System.out.println(result  +"dao삭제 결과");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}	
	
	
	
	public int updateAccompanyOffer(Connection conn, int acompanyBNo, String value) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateAccompanyOffer"));
			pstmt.setString(1, value);
			pstmt.setInt(2, acompanyBNo);
			result=pstmt.executeUpdate();
			//System.out.println(result +"이건 dao");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int updateAcceptOffer(Connection conn, int acompanyBNo, int memberNo) {
		PreparedStatement pstmt=null;
		int result=0;
		//System.out.println(acompanyBNo+" " +memberNo);
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateAcceptOffer"));
			pstmt.setInt(1, acompanyBNo);
			pstmt.setInt(2, memberNo);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int updateDeclineOffer(Connection conn, int acompanyBNo, int memberNo) {
		PreparedStatement pstmt=null;
		int result=0;
		//System.out.println(acompanyBNo+" " +memberNo);
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateDeclineOffer"));
			pstmt.setInt(1, acompanyBNo);
			pstmt.setInt(2, memberNo);
			result=pstmt.executeUpdate();
			System.out.println(result+"거절결과");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	public List<AccompanyDTO> selectsearchAccompanyAll(Connection conn, String searchValue) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<AccompanyDTO> result=new ArrayList<>();
		try {
			pstmt=conn.prepareCall(sql.getProperty("selectsearchAccompanyAll"));
			pstmt.setString(1, "%" + searchValue + "%");
			pstmt.setString(2, "%" + searchValue + "%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getAccompanyDTO(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		//System.out.println(result);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
