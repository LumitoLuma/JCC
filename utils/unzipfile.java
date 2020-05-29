import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
 
public class unzipfile {
     
    public static void main(String[] args) {
        try{ 
        String filename = args[0];
        System.out.print("Extracting " + filename + "...");
        File srcFile = new File(filename);
        
        // create a directory with the same name to which the contents will be extracted
        String zipPath = filename.substring(0, filename.length()-4);
        File temp = new File(zipPath);
        temp.mkdir();
         
        ZipFile zipFile = null;
        
        try {
             
            zipFile = new ZipFile(srcFile);
             
            // get an enumeration of the ZIP file entries
            Enumeration e = zipFile.entries();
            int i = 0;
            while (e.hasMoreElements()) {
                 
                ZipEntry entry = (ZipEntry) e.nextElement();
                 
                File destinationPath = new File(zipPath, entry.getName());
                  
                //create parent directories
                destinationPath.getParentFile().mkdirs();
                 
                // if the entry is a file extract it
                if (entry.isDirectory()) {
                    continue;
                }
                else {
                     
                    BufferedInputStream bis = new BufferedInputStream(zipFile.getInputStream(entry));
 
                    int b;
                    byte buffer[] = new byte[1024];
 
                    FileOutputStream fos = new FileOutputStream(destinationPath);
                    
                    BufferedOutputStream bos = new BufferedOutputStream(fos, 1024);
 
                    while ((b = bis.read(buffer, 0, 1024)) != -1) {
                        bos.write(buffer, 0, b);
                    }
                    i++;
                    System.out.print("\r" + "Extracting " + filename + "... " + i + " files extracted.");
                    bos.close();
                    bis.close();
                     
                }
                 
            }
            System.out.println("\r" + "Extracting " + filename + "... " + i + " files extracted. Done!");
             
        }
        catch (IOException ioe) {
            System.out.println("Error opening zip file " + ioe);
            System.exit(1);
        }
         finally {
             try {
                 if (zipFile!=null) {
                     zipFile.close();
                 }
             }
             catch (IOException ioe) {
                    System.out.println("Error while closing zip file " + ioe);
                    System.exit(1);
             }
         }
       
         } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("No valid arguments specified. Usage:\n");
            System.out.println("\'java unzipfile [file path with name]\'");
            System.exit(1);
        }      
    }
 
}