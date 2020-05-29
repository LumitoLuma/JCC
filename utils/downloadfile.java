import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;

public class downloadfile {
    
    static byte error;
    
    public static void Download(String downloadfile, String downloadname, String installdir) {
        System.out.print("Downloading " + downloadname + "...");
        try (BufferedInputStream in = new BufferedInputStream(new URL(downloadfile).openStream());
            FileOutputStream fileOutputStream = new FileOutputStream(installdir + downloadname)) {
                byte dataBuffer[] = new byte[1024];
                int bytesRead;
                while ((bytesRead = in.read(dataBuffer, 0, 1024)) != -1) {
                    fileOutputStream.write(dataBuffer, 0, bytesRead);
                }
                System.out.println(" Done!");
                System.exit(0);
        } catch (IOException e) {
            System.out.println(" Error while downloading " + downloadname);
            System.exit(1);
        }
    }
    
    public static void main(String[] args) {
        try {
            Download(args[0], args[1], args[2]);
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("No valid arguments specified. Usage:\n");
            System.out.println("\'java downloadfile [file URL] [file name] [target directory]\'");
            System.exit(1);
        }
    }
}