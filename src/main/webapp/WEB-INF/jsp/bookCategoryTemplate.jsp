<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/jsp/headerLinks.jsp" />
<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container-fluid bg-0 text-center book-recommendations-template">
	<h1 class="book-recommendations-header bg-${categoryId} border-radius-top">${categoryName}</h1>
	<div class="mid-page bg-white">
		<div class="row">
	        <div class="col-md-12">
	            <div class="dropdown">
					<button class="btn bg-white dropdown-toggle" type="button" data-toggle="dropdown">Visit Another Category
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
					    <c:forEach items="${categories}" var="category">
                        	<li><a href="${pageContext.request.contextPath}/bookRecommendations/${category.categoryId}">${category.name}</a></li>
                        </c:forEach>
					</ul>
				</div>
	        </div>
    	</div>
       	<c:forEach items="${books}" var="book">
       		<input id="book" name="book-id-${book.id}" type="hidden" value="${book.id}"></input>
    		<div class="row book-info">
     			<div class="col-xs-11 book-title-and-author">
      				<h3 class="truncate"><a target="_blank" href="https://www.amazon.com/gp/search?ie=UTF8&tag=drewsullivand-20&linkCode=ur2&linkId=fb8b29794ada8afbd24c93c9f7a08f58&camp=1789&creative=9325&index=books&keywords=${book.title}">${book.title}</a></h3>
   					<div class="book-author truncate">
   						<c:forEach items="${book.authors}" var="author" varStatus="loop">
   							<c:choose>
   								<c:when test="${fn:length(author.middleInitials) lt 1 && fn:length(author.postNominalInitials) lt 1}">
   									${author.firstName}&nbsp;${author.lastName}
   								</c:when>
   								<c:when test="${fn:length(author.middleInitials) gt 0 && fn:length(author.postNominalInitials) lt 1}">
   									${author.firstName}&nbsp;${author.middleInitials}&nbsp;${author.lastName}
   								</c:when>
   								<c:when test="${fn:length(author.middleInitials) lt 1 && fn:length(author.postNominalInitials) gt 0}">
   									${author.firstName}&nbsp;${author.lastName}&nbsp;${author.postNominalInitials}
   								</c:when>
   								<c:otherwise>
   									${author.firstName}&nbsp;${author.middleInitials}&nbsp;${author.lastName}&nbsp;${author.postNominalInitials}
   								</c:otherwise>
   							</c:choose>
     						<c:choose>
      						<c:when test="${fn:length(book.authors) == 2}">
      							<c:if test="${!loop.last}">
      								and
      							</c:if>
      						</c:when>
      						<c:when test="${fn:length(book.authors) gt 2}">
      							<c:if test="${!loop.last}">
       							<c:choose>
        							<c:when test="${loop.index == fn:length(book.authors) - 2}">,&nbsp;and&nbsp;</c:when>
        							<c:otherwise>,&nbsp;</c:otherwise>
       							</c:choose>
      							</c:if>
      						</c:when>
     						</c:choose>
   						</c:forEach>
   					</div>
    				<c:forEach items="${book.descriptions}" var="description">
						<div class="modal fade" id="largeModal${book.id}" role="dialog">
							<div class="modal-dialog">
							    <!-- Modal content-->
								<div class="modal-content bg-2">
									<div class="modal-header border-radius-bottom-0 bg-white">
										<a target="_blank" href="https://www.amazon.com/gp/search?ie=UTF8&tag=drewsullivand-20&linkCode=ur2&linkId=fb8b29794ada8afbd24c93c9f7a08f58&camp=1789&creative=9325&index=books&keywords=${book.title}">
				    						<h3 class="modal-title">${book.title}</h3>
				    					</a>
									</div>
									<div class="modal-body border-radius-top-0 bg-white">
										<p>${description.description}</p>
										<button type="button" class="btn bg-white modal-close" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div> <!-- .modal -->
					</c:forEach>
    			</div> <!-- .col-sm-11 -->
  				<div class="col-xs-1 btn-box">
   					<a class="clickable" type="button" data-toggle="modal" data-target="#largeModal${book.id}">
		    			<i class="fa fa-question-circle"></i>
		    		</a>
		    		<img src="//ir-na.amazon-adsystem.com/e/ir?t=drewsullivand-20&l=ur2&o=1" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
				</div> <!-- .col-sm-1 -->
 			</div> <!-- .row -->
       	</c:forEach>
	</div>
</div> <!-- container -->

<c:import url="/WEB-INF/jsp/footer.jsp" />