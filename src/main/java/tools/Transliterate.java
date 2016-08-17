/**
 * Provides tools to apply ICU transliterations
 * through different Java methods
 * <p>
 * It is possible to use both ready made ICU
 * transliteration patterns, but also to define
 * new patterns which can be stored in an external
 * file. {@link tools.Transliterate} class contains
 * methods for both GET and POST requests.
 *
 * @since 1.0
 */
package tools;

import com.ibm.icu.text.Transliterator;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import org.apache.commons.io.IOUtils;
 
@Path("/")
public class Transliterate {
   
   /**
    * String to be transliterated and URL of pattern file.
    */
    @GET
    @Path("/translit")
    @Produces("text/plain")
    public String transliterate(@QueryParam("string") String originalString, @QueryParam("url") String patternUrl) throws MalformedURLException, IOException {
        
        URL currentURL = new URL(patternUrl);

        String rules = IOUtils.toString(currentURL, "utf8");

         Transliterator newTrans = Transliterator.createFromRules("temp", rules, Transliterator.FORWARD);
         String result = newTrans.transform(originalString);
        
        return result;
        
    }
    
    @GET
    @Path("/translit-icu")
    @Produces("text/plain")
    public String transliterateICU(@QueryParam("string") String originalString, @QueryParam("pattern") String userPattern) throws MalformedURLException, IOException {
        
        Transliterator newTrans = Transliterator.getInstance(userPattern);
        String result = newTrans.transform(originalString);
        return result;
        
    }
 
    @POST
    @Path("/translit")
    @Consumes("text/plain")
    @Produces("text/plain")
    public String transliterate(final InputStream input, @QueryParam("url") String patternUrl) throws MalformedURLException, IOException {
        
        StringBuilder inputStringBuilder = new StringBuilder();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(input, "UTF-8"));
        String line = bufferedReader.readLine();
        while (line != null) {
            inputStringBuilder.append(line);
            inputStringBuilder.append('\n');
            line = bufferedReader.readLine();
        }
        String originalString = inputStringBuilder.toString();
        
        
        URL currentURL = new URL(patternUrl);

        String rules = IOUtils.toString(currentURL, "utf8");

         Transliterator newTrans = Transliterator.createFromRules("temp", rules, Transliterator.FORWARD);
         String result = newTrans.transform(originalString);
        
        return result;
        
    }
    
    @POST
    @Path("/translit-icu")
    @Consumes("text/plain")
    @Produces("text/plain")
    public String transliterateICU(final InputStream input, @QueryParam("pattern") String userPattern) throws MalformedURLException, IOException {
        
        StringBuilder inputStringBuilder = new StringBuilder();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(input, "UTF-8"));
        String line = bufferedReader.readLine();
        while (line != null) {
            inputStringBuilder.append(line);
            inputStringBuilder.append('\n');
            line = bufferedReader.readLine();
        }
        String originalString = inputStringBuilder.toString();
        
        Transliterator newTrans = Transliterator.getInstance(userPattern);
        String result = newTrans.transform(originalString);
        return result;
        
    }
    
}
