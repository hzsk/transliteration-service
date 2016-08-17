<html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<body>
<h2>Welcome to a new Web Service!</h2>
<p>Currently following web services are available here</p>
<h3>Custom ICU transliteration</h3>
<p>The trick here is that the transliteration patterns can be stored in an external file which is provided for the webservice.
The service can be called both as a GET and POST request depending from the wanted use.</p>
<code><a href="http://localhost:8080/HZSK-Stringtools/tools/translit?string=ефремов-2000-dlg-1&url=https://gist.githubusercontent.com/nikopartanen/5c38f1868594bd4cd65c9fab268cce3d/raw/f849ddf48601a5a74ce06fde046a2686a7cf3de3/icu-ruscyr2bib.txt">http://localhost:8080/HZSK-Stringtools/tools/translit?string=ефремов-2000-dlg-1&url=https://gist.githubusercontent.com/nikopartanen/5c38f1868594bd4cd65c9fab268cce3d/raw/f849ddf48601a5a74ce06fde046a2686a7cf3de3/icu-ruscyr2bib.txt</a></code>
<p>The result in browser should be something like:</p>
<code>efremov-2000-dlg-1</code>
<p>It is somewhat understandable that long parameters like these do not look so nice, but probably the tool would in many cases be accessed programmatically anyway.</p>
<p>For the sake of convenience the web service also can be used to call the transliterations already available in ICU at the moment.</p>
<code><a href="http://localhost:8080/HZSK-Stringtools/tools/translit-icu?string=ефремов-2000-dlg-1&pattern=Any-Thai">http://localhost:8080/HZSK-Stringtools/tools/translit-icu?string=ефремов-2000-dlg-1&pattern=Any-Thai</a></code>
<p>This returns:</p>
<code>เฟเรโมฤ-๒๐๐๐-ดลก-๑</code>
<p>Both web services accept also similar POST requests, in which the text file is given as input. Below is an example of how to use it.</p>
<code>curl -X POST --data-binary @snss4-dlg-1-dlg.txt --header "Content-Type:text/plain" "http://localhost:8080/HZSK-Stringtools/tools/translit?url=https://gist.githubusercontent.com/nikopartanen/47f69b966ca72c3f730b600d687e9869/raw/6932ddf715ece565d0275202d2545be58e900023/snss4-dlg2inel.txt"</code>
<p>This is very similar with ICU patterns:</p>
<code>curl -X POST --data-binary @snss4-dlg-1-dlg.txt --header "Content-Type:text/plain" "http://localhost:8080/HZSK-Stringtools/tools/translit-icu?pattern=Any-Telugu"</code>
<p>This returns something like:</p>
<code>౨౮౬) ఎనిగిత్తెన్ అ: త్య్న్ కిమ్ బిℓఎజ్.
౨౮౭) క్ఒల్క్ఒ : స్తక్తర్ క్ఒ̈ర్ఒ̈ℓℓఒ̈ర్ ఒӊఒɦఉల్లుబుత్ ఉ̈ℓఅ̈ℓఅ̈రిన్.
౨౮౮) తు̈:న్ ఒర్తొతుగర్ పసఒల్లక్అ హ్ఉగɦఅ:త్య్బ్య్త్.
౨౮౯) గిని అగత్య్న్ త్య్ల్య్న్ (హ్అ-ӊఅత్య్న్) ఇస్తిబెతెగ్అ̈.
౨౯౦) తు_ఒగు-ద హ్అӊఅర్బƙƙఅ బర్బ్య్త.
౨౯౧) మిన్ ఉ_ఒతు:తన్ క్అజ్ ది_ఎక్-ద అ:రక్పతగ్య్మ్.
౨౯౨) ఇతి త్య్ల్లర్య్ గిని బర:-ర్య్ హ్అӊఅర్బ్య్త.
౨౯౪) హ్అర్సి_ఎర్ద ఇℓఇమ్ క్ఒ̈రు̈నె బర్బ్య్త.
౨౯౫) క్అమ్న:ర్య్ ఇ_ఎదెజ్అ̈బిన్.
౨౯౬) ఇ_ఎస్ బెరి_ఎమ్. ఇ_ఎస్పిన్ బెరి_ఎమ్.
౨౯౭) ఉలక్అన్ హ్ఉ̈:రు̈క్కె తు̈ర్గెంనిక్ ఎర్త్.
౨౯౯) హ్అӊఅరర్ బు_ఒలర్గ్య్న్, హ్అӊఅర్.
</code>
<p>Now this doesn't look like so useful, but even with very simple pattern it is possible to get from this:</p>
<code>25) äмä:ксин мäн'и:тин бöкчöӊнöтöр.
26) табалары табала:.
27) ыл олдо:ну.
</code>
<p>To this:</p>
<code>25) ämä:ksin män'i:tin bökchöŋnötör.
26) tabalary tabala:.
27) yl oldo:nu.
</code>
<h2>Patterns</h2>
<p>Currently following patterns are available in HZSK Git repository:</p>
<p>Standard Russian-Latin</p>
<script src="https://gist.github.com/nikopartanen/5c38f1868594bd4cd65c9fab268cce3d.js"></script>
<p>Preliminary Dolgan (SNSS4 variant) to INEL Standard</p>
<script src="https://gist.github.com/nikopartanen/47f69b966ca72c3f730b600d687e9869.js"></script>
</body>
</html>
