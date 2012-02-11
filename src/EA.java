//Author: Janocha

/*     */ import java.io.BufferedReader;
/*     */ import java.io.File;
/*     */ import java.io.FileInputStream;
/*     */ import java.io.FileOutputStream;
/*     */ import java.io.IOException;
/*     */ import java.io.InputStreamReader;
/*     */ import java.io.ObjectInputStream;
/*     */ import java.io.ObjectOutputStream;
/*     */ import java.io.PrintStream;
/*     */ import java.io.Serializable;
/*     */ 
/*     */ public class EA
/*     */ {
/*  30 */   private static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
/*     */ 
/*     */   public static String ein()
/*     */     throws IOException
/*     */   {
/*  37 */     return br.readLine();
/*     */   }
/*     */ 
/*     */   public static void aus(String s)
/*     */   {
/*  42 */     System.out.print(s);
/*     */   }
/*     */ 
/*     */   public static void aus(Object s)
/*     */   {
/*  47 */     System.out.print(s);
/*     */   }
/*     */ 
/*     */   public static void aus(char c)
/*     */   {
/*  52 */     System.out.print(c);
/*     */   }
/*     */ 
/*     */   public static void aus(byte b)
/*     */   {
/*  57 */     System.out.print(b);
/*     */   }

            public static void aus(short s)
/*     */   {
/*  57 */     System.out.print(s);
/*     */   }
/*     */ 
/*     */   public static void aus(int i)
/*     */   {
/*  62 */     System.out.print(i);
/*     */   }
/*     */ 
/*     */   public static void aus(long l)
/*     */   {
/*  67 */     System.out.print(l);
/*     */   }
/*     */ 
/*     */   public static void aus(float f)
/*     */   {
/*  72 */     System.out.print(f);
/*     */   }
/*     */ 
/*     */   public static void aus(double d)
/*     */   {
/*  77 */     System.out.print(d);
/*     */   }
/*     */ 
/*     */   public static void aus(boolean b)
/*     */   {
/*  82 */     System.out.print(b);
/*     */   }
/*     */ 
/*     */   public static void aus(String s, int n)
/*     */   {
/*  87 */     System.out.print(s);
/*  88 */     for (int m = 0; m < n; ++m)
/*  89 */       System.out.println();
/*     */   }
/*     */ 
/*     */   public static void aus(Object ob, int n)
/*     */   {
/*  94 */     System.out.print(ob);
/*  95 */     for (int m = 0; m < n; ++m)
/*  96 */       System.out.println();
/*     */   }
/*     */ 
/*     */   public static void aus(char c, int n)
/*     */   {
/* 101 */     System.out.print(c);
/* 102 */     for (int m = 0; m < n; ++m)
/* 103 */       System.out.println();
/*     */   }
/*     */ 
/*     */   public static void aus(byte b, int n)
/*     */   {
/* 108 */     System.out.print(b);
/* 109 */     for (int m = 0; m < n; ++m)
/* 110 */       System.out.println();
/*     */   }
/*     */ 
/*     */   public static void aus(short s, int n)
/*     */   {
/* 115 */     System.out.print(s);
/* 116 */     for (int m = 0; m < n; ++m)
/* 117 */       System.out.println();
/*     */   }
/*     */ 
/*     */   public static void aus(int s, int n)
/*     */   {
/* 122 */     System.out.print(s);
/* 123 */     for (int m = 0; m < n; ++m)
/* 124 */       System.out.println();
/*     */   }
/*     */ 
/*     */   public static void aus(long s, int n)
/*     */   {
/* 129 */     System.out.print(s);
/* 130 */     for (int m = 0; m < n; ++m)
/* 131 */       System.out.println();
/*     */   }
/*     */ 
/*     */   public static void aus(float s, int n)
/*     */   {
/* 136 */     System.out.print(s);
/* 137 */     for (int m = 0; m < n; ++m)
/* 138 */       System.out.println();
/*     */   }
/*     */ 
/*     */   public static void aus(double s, int n)
/*     */   {
/* 143 */     System.out.print(s);
/* 144 */     for (int m = 0; m < n; ++m)
/* 145 */       System.out.println();
/*     */   }
/*     */ 
/*     */   public static void aus(boolean s, int n)
/*     */   {
/* 150 */     System.out.print(s);
/* 151 */     for (int m = 0; m < n; ++m)
/* 152 */       System.out.println();
/*     */   }
/*     */ 
/*     */   public static void aus(Serializable s, String datei)
/*     */   {
/*     */     try
/*     */     {
/* 159 */       File file = new File(datei);
/* 160 */       FileOutputStream fos = new FileOutputStream(file);
/* 161 */       ObjectOutputStream oos = new ObjectOutputStream(fos);
/*     */ 
/* 163 */       oos.writeObject(s);
/* 164 */       oos.close();
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 168 */       String ausgabe = "Speicherung ist fehlgeschlagen.\n";
/* 169 */       ausgabe = ausgabe + e.getMessage();
/* 170 */       aus(ausgabe, 2);
/*     */     }
/*     */   }
/*     */ 
/*     */   public static Object einDatei(String datei)
/*     */     throws Exception
/*     */   {
/* 177 */     File file = new File(datei);
/* 178 */     FileInputStream fis = new FileInputStream(file);
/* 179 */     ObjectInputStream ois = new ObjectInputStream(fis);
/*     */ 
/* 181 */     Object ob = ois.readObject();
/* 182 */     ois.close();
/* 183 */     return ob;
/*     */   }
/*     */ 
/*     */   public static byte einByte() throws IOException
/*     */   {
/* 188 */     return Byte.parseByte(br.readLine());
/*     */   }
/*     */ 
/*     */   public static int einShort() throws IOException
/*     */   {
/* 193 */     return Short.parseShort(br.readLine());
/*     */   }
/*     */ 
/*     */   public static int einInt() throws IOException
/*     */   {
/* 198 */     return Integer.parseInt(br.readLine());
/*     */   }
/*     */ 
/*     */   public static long einLong() throws IOException
/*     */   {
/* 203 */     return Long.parseLong(br.readLine());
/*     */   }
/*     */ 
/*     */   public static float einFloat() throws IOException
/*     */   {
/* 208 */     return Float.parseFloat(br.readLine());
/*     */   }
/*     */ 
/*     */   public static double einDouble() throws IOException
/*     */   {
/* 213 */     return Double.parseDouble(br.readLine());
/*     */   }
/*     */ 
/*     */   public static boolean einBoolean() throws IOException
/*     */   {
/* 218 */     return Boolean.parseBoolean(br.readLine());
/*     */   }
/*     */ }