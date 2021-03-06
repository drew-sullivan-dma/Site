<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/jsp/headerLinks.jsp" />
<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container-fluid bg-0 text-center home-page">
	<h1 class="border-radius-top book-recommendations-header bg-navbar"><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="logo" /></h1>
	<h2 class="book-recommendations-header bg-15">Hi, I'm Drew.</br><small>I built this site, and I read a lot of books.</small></h2>
	<div class="mid-page bg-white">
	    <div class="row">
	        <div class="col-md-12">
		        <p>This site is my book journal. Lots of people ask me for recommendations, 
		        so I figured I would combine my interests in reading and software. 
		        You can check out the book recommendations or even the code.
		        Please say hi, if you've got an opinion on either.
		        I love getting feedback on projects, and I love meeting new people. 
		        </p> 
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12 home-page-buttons">
	        	<!-- <div class="col-md-3"> -->
	        		<a href="${pageContext.request.contextPath}/bookRecommendations"><button class="btn bg-white home-page-button" type="button">Book Recommendations</button></a>
	        	<!-- </div>
	        	<div class="col-md-3"> -->
					<a href="${pageContext.request.contextPath}/aboutMe"><button class="btn bg-white home-page-button" type="button">About Me</button></a>
				<!-- </div>
	        	<div class="col-md-3"> -->
					<a href="https://github.com/drew-sullivan-dma/Personal-Site"><button class="btn bg-white home-page-button" type="button">The Code</button></a>
				<!-- </div>
	        	<div class="col-md-3"> -->
				<a href="mailto:drew.sullivan.dma@gmail.com"><button class="btn bg-white home-page-button pull-right" type="button">Contact Me</button></a>
				<!-- </div> -->
	        </div>
    	</div>
	</div>
</div> <!-- container -->

<c:import url="/WEB-INF/jsp/footer.jsp" />