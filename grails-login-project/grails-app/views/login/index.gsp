<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css">
			label{
				float:left;
				width:200;
			}
		</style>
		<script type="text/javascript">
			var ids = new Array();
			var titles = new Array();

			function showGallery(){
				var sel = document.getElementById("Galleries");
				var selectedID = sel.options[sel.selectedIndex].value;

				var arr = selectedID.split('~');
				$("#frame").attr("src", "http://farm"+arr[0]+".static.flickr.com/"+arr[1]+"/"+arr[2]+"_"+arr[3]+"_b.jpg");

				$("#hdnSelectedURL").val("http://farm"+arr[0]+".static.flickr.com/"+arr[1]+"/"+arr[2]+"_"+arr[3]+"_b.jpg");

				var hdnObj = document.getElementById("hdnSelectedURL").value;
				//alert(hdnObj);
			}

			$(function(){
			$("#search").on('click', function(){
				$.getJSON("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=cad6efab3a4cbc7b30649276f95cd04d&format=json&jsoncallback=?&text="+$("input#categorySearch").val(),
								function(data){
									var photosetID = "";
									var title = "";
									$.each(data.photos.photo, function(i,set){
										photosetID = set.farm+'~'+set.server+'~'+set.id+'~'+set.secret;
										title = set.title;
										ids.push(photosetID);
										titles.push(title);
										});

									for(i=0; i<ids.length;i++){
										var option = new Option(titles[i],ids[i]);
										var dropDown = document.getElementById("Galleries");
										dropDown.options[i] = option;
									}

									//var arr = ids[0].split('~');
									//$("#frame").attr("src", "http://farm"+arr[0]+".static.flickr.com/"+arr[1]+"/"+arr[2]+"_"+arr[3]+"_b.jpg");
								});
			});
			});
							
			
		</script>	
	</head>
	<body>
			<font color="blue">${flash.message}</font>
			
			<h1> Welcome to Grails Demo : <font color="red">${session.user }</font> </h1>
			
			
			<span>&nbsp;</span>
			<g:form action="storeurl" name="choose_gallery" id="choose_gallery">
				<table>
				<tr>
					<td>
					<label> Category Search : </label>
					<input type="text" id="categorySearch" name="categorySearch" value=""/>
					<input type="button" id="search" name="search" value="Search" />
					</td>
				</tr>	
				<tr>
				<td>
				<label>Please select a photo from the gallery drop-down to view</label>
					<select name="Galleries" id="Galleries" onchange="showGallery();" width="300px"></select>
				</td>
				</tr>
				</table>
				<input type="hidden" id="hdnSelectedURL" name="hdnSelectedURL"/>
				<input type="submit" value="store"/>
			</g:form>
			
			<iframe id="frame" src="" width="73%" height="700">
     		</iframe>
	
	</body>
</html>