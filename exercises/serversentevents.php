<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>Server Sent Events PHP Example - Stock Tickets</title>

<style media="screen" type="text/css">

h1 {
	text-align: center;
	font-size: 150%;
	margin-bottom: 60px;
}

h2 {
	text-align: center;
	font-size: 125%;
	margin-bottom: 15px;
}

div#tickets {
	margin: 10px auto 80px auto;
}

div.ticket {
	margin: 5px auto;
	width: 160px;
	font-size: 115%;
}

div.name {
	display: inline-block;
	width: 80px;
	padding: 3px;
}

div.price {
	display: inline-block;
	width: 60px;
	padding: 3px;
	text-align: right;
	transition: all 0.2s ease-out;
}

div#log {
	margin: 10px auto;
	width: 600px;
	height: 200px;
	background: #dcdcdc;
	padding: 5px;
	overflow-y: scroll;
}

div#notSupported {
	display: none;
	margin: 10px auto;
	text-align: center;
	color: red;
	font-size: 150%;
}

p.hint {
	width: 600px;
	margin: 10px auto;
	text-align: justify;
	text-indent: 20px;
	line-height: 135%;
}

</style>

<script type="text/javascript">

	window.onload = function setDataSource() {
		if (window.EventSource) {
			var source = new EventSource("stocks.php");

			source.addEventListener("message", function(e) {
				updatePrice(e.data);
				logMessage(e);
			}, false);
			
			source.addEventListener("open", function(e) {
				logMessage("OPENED");
			}, false);

			source.addEventListener("error", function(e) {
				logMessage("ERROR");
				if (e.readyState == EventSource.CLOSED) {
					logMessage("CLOSED");
				}
			}, false);
		} else {
			document.getElementById("notSupported").style.display = "block";
		}
	}

	function updatePrice(data) {
		var ar = data.split(":");
		var ticket = ar[0];
		var price = ar[1];
		var el = document.getElementById("t_" + ticket);
		var oldPrice = el.innerHTML;
		el.innerHTML = price;
		if (parseFloat(oldPrice) < parseFloat(price)) {
			el.style.backgroundColor = "lightgreen";
		} else {
			el.style.backgroundColor = "tomato";
		}
		window.setTimeout(function clearBackground() {
			el.style.backgroundColor = "white";
		}, 500);
	}

	function logMessage(obj) {
		var el = document.getElementById("log");
		if (typeof obj === "string") {
			el.innerHTML += obj + "<br>";
		} else {
			el.innerHTML += obj.lastEventId + " - " + obj.data + "<br>";
		}
		el.scrollTop += 20;
	}

</script>

</head>

<body>

<h1>Server Sent Events PHP Example</h1>

<div id="notSupported">
	Your browser does not support Server Sent Events.
	Please use <a href="https://www.mozilla.org/firefox/new/">Firefox</a>
	or <a href="https://www.google.com/chrome/browser">Google Chrome</a>.
</div>

<p class="hint">
	This is simple Server Sent Events (SSE) example that updates stock prices when market moves.
	Data source is predefined array with prices. These is random delay between 1 and 3 seconds
	between each event. Feel free to download and study source code.
</p>

<h2>Tickets</h2>

<div id="tickets">
	<div class="ticket"><div class="name">IBM</div><div class="price" id="t_IBM">161.57</div></div>
	<div class="ticket"><div class="name">AAPL</div><div class="price" id="t_AAPL">114.45</div></div>
	<div class="ticket"><div class="name">GOOG</div><div class="price" id="t_GOOG">532.94</div></div>
	<div class="ticket"><div class="name">MSFT</div><div class="price" id="t_MSFT">47.12</div></div>
</div>


<h2>Simple Log Console</h2>
<p class="hint">
	This is simple log console. It is useful for testing purposes and to understand better how SSE works.
	Event id and data are logged for each event.
</p>
<div id="log">
</div>

</body>
</html>

