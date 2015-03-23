require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
# from: https://github.com/xlfe/homebrew-gnuradio

class Gqrx < Formula
  homepage 'https://github.com/csete/gqrx'
  url 'http://iweb.dl.sourceforge.net/project/gqrx/2.3.0/gqrx-2.3.0.tar.xz'
  sha1 '90ae85926865c2ea51c786907997d43fcfa538a3'
  head 'https://github.com/csete/gqrx.git'

  depends_on 'cmake' => :build
  depends_on 'qt'
#brew install --with-c+11 --universal boost
  depends_on 'boost'
  depends_on 'gnuradio'

  def patches
    DATA
  end

  def install
    #system "qmake -set PKG_CONFIG /usr/local/bin/pkg-config"
    #system "qmake -set prefix /usr/local"
    #system "qmake gqrx.pro"
    #system "make"
    args = "PREFIX=#{prefix} PKGCONFIG=/usr/local/bin/pkg-config"
    mkdir "build" do
      system "qmake", "..", *args
      system "make"
    end
    bin.install 'gqrx.app/Contents/MacOS/gqrx'
  end
end

__END__
diff --git a/gqrx.pro b/gqrx.pro
index c8877c6..8d5fe16 100644
--- a/gqrx.pro
+++ b/gqrx.pro
@@ -58,13 +58,14 @@ CONFIG(debug, debug|release) {
     #QMAKE_CFLAGS_DEBUG += '-g -O0'
 
     # Define version string (see below for releases)
-    VER = $$system(git describe --abbrev=8)
+    # VER = $$system(git describe --abbrev=8)
+    VER = v2.3.1-37-g78ea9469
 
 } else {
     DEFINES += QT_NO_DEBUG
     DEFINES += QT_NO_DEBUG_OUTPUT
-    VER = $$system(git describe --abbrev=1)
-    ## VER = v2.3.1-37-g78ea9469
+    # VER = $$system(git describe --abbrev=1)
+    VER = v2.3.1-37-g78ea9469
 
     # Release binaries with gr bundled
     # QMAKE_RPATH & co won't work with origin
