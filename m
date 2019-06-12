Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A94431B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 00:40:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PMKH1NjDzDr74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 08:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org; envelope-from=mchehab@bombadil.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="OtKARhVg"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PF0w1ZmWzDrBh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 03:56:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hQn8JT9IM+Dk9B2HR7dQFyU1TyjLhqIp5Y826tu03Ys=; b=OtKARhVgbNe92Vm4WTytqmSWLq
 NT+nM++jswrug2k1ubYPwp/kYsfRUDJPvhpkZes4dm60wveB1/iwb3nNG5H1WIV1jnrx6UpfVMflE
 FaZOZo+hnSwBF0qRxc3lgmnu/2/VzBhvppnOrsvy1+4pHmLSht0vkx1qaO2ZmD4jH6RMu49KDWaX3
 Mq/kC5R6k6BPjOpgJXVM9YzfiUlLOrBDG3mFNU5m2NJZo9rthwhbWHjDhqp4YJISOwP+G3/tIok/r
 BbyCzMcanzM9R6cV03uZs6RnoXi6vY6EwuuLmRPKAdXw5wb9Yd5eOz415BlX8kvpyUmFePDk7I0zI
 gSl3NcTQ==;
Received: from 201.86.169.251.dynamic.adsl.gvt.net.br ([201.86.169.251]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hb7Qt-0002Dw-4e; Wed, 12 Jun 2019 17:53:13 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hb7Qq-0001gT-AC; Wed, 12 Jun 2019 14:53:08 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v4 12/28] docs: kbuild: convert docs to ReST and rename to
 *.rst
Date: Wed, 12 Jun 2019 14:52:48 -0300
Message-Id: <304b1dbb5970b4f761008567c71b096269588a9e.1560361364.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560361364.git.mchehab+samsung@kernel.org>
References: <cover.1560361364.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2019 08:39:12 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 Stanislaw Gruszka <sgruszka@redhat.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 bridge@lists.linux-foundation.org, Palmer Dabbelt <palmer@sifive.com>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Ofer Levi <oferle@mellanox.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Harry Wei <harryxiyou@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 Jonas Bonn <jonas@southpole.se>, Alex Shi <alex.shi@linux.alibaba.com>,
 linux-c6x-dev@linux-c6x.org, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, netdev@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, coreteam@netfilter.org,
 Federico Vaga <federico.vaga@vaga.pv.it>, Mark Salter <msalter@redhat.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, linux-snps-arc@lists.infradead.org,
 Roopa Prabhu <roopa@cumulusnetworks.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, devel@driverdev.osuosl.org,
 Albert Ou <aou@eecs.berkeley.edu>, Johannes Berg <johannes.berg@intel.com>,
 Intel Linux Wireless <linuxwifi@intel.com>,
 Nikolay Aleksandrov <nikolay@cumulusnetworks.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, linuxppc-dev@lists.ozlabs.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, openrisc@lists.librecores.org,
 Greentime Hu <green.hu@gmail.com>, linux-mtd@lists.infradead.org,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Kalle Valo <kvalo@codeaurora.org>, Jon Maloy <jon.maloy@ericsson.com>,
 Michal Simek <monstr@monstr.eu>, Michal Marek <michal.lkml@markovi.net>,
 tipc-discussion@lists.sourceforge.net,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Vineet Gupta <vgupta@synopsys.com>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
 netfilter-devel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Ying Xue <ying.xue@windriver.com>, Luca Coelho <luciano.coelho@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kbuild documentation clearly shows that the documents
there are written at different times: some use markdown,
some use their own peculiar logic to split sections.

Convert everything to ReST without affecting too much
the author's style and avoiding adding uneeded markups.

The conversion is actually:
  - add blank lines and identation in order to identify paragraphs;
  - fix tables markups;
  - add some lists markups;
  - mark literal blocks;
  - adjust title markups.

At its new index.rst, let's add a :orphan: while this is not linked to
the main index.rst file, in order to avoid build warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/admin-guide/README.rst          |   2 +-
 ...eaders_install.txt => headers_install.rst} |   5 +-
 Documentation/kbuild/index.rst                |  27 +
 Documentation/kbuild/issues.rst               |  11 +
 .../kbuild/{kbuild.txt => kbuild.rst}         | 119 ++--
 ...nfig-language.txt => kconfig-language.rst} | 232 ++++----
 ...anguage.txt => kconfig-macro-language.rst} |  37 +-
 .../kbuild/{kconfig.txt => kconfig.rst}       | 136 +++--
 .../kbuild/{makefiles.txt => makefiles.rst}   | 530 +++++++++++-------
 .../kbuild/{modules.txt => modules.rst}       | 168 +++---
 Documentation/kernel-hacking/hacking.rst      |   4 +-
 Documentation/process/coding-style.rst        |   2 +-
 Documentation/process/submit-checklist.rst    |   2 +-
 .../it_IT/kernel-hacking/hacking.rst          |   4 +-
 .../it_IT/process/coding-style.rst            |   2 +-
 .../it_IT/process/submit-checklist.rst        |   2 +-
 .../zh_CN/process/coding-style.rst            |   2 +-
 .../zh_CN/process/submit-checklist.rst        |   2 +-
 Kconfig                                       |   2 +-
 arch/arc/plat-eznps/Kconfig                   |   2 +-
 arch/c6x/Kconfig                              |   2 +-
 arch/microblaze/Kconfig.debug                 |   2 +-
 arch/microblaze/Kconfig.platform              |   2 +-
 arch/nds32/Kconfig                            |   2 +-
 arch/openrisc/Kconfig                         |   2 +-
 arch/powerpc/sysdev/Kconfig                   |   2 +-
 arch/riscv/Kconfig                            |   2 +-
 drivers/auxdisplay/Kconfig                    |   2 +-
 drivers/firmware/Kconfig                      |   2 +-
 drivers/mtd/devices/Kconfig                   |   2 +-
 drivers/net/ethernet/smsc/Kconfig             |   6 +-
 drivers/net/wireless/intel/iwlegacy/Kconfig   |   4 +-
 drivers/net/wireless/intel/iwlwifi/Kconfig    |   2 +-
 drivers/parport/Kconfig                       |   2 +-
 drivers/scsi/Kconfig                          |   4 +-
 drivers/staging/sm750fb/Kconfig               |   2 +-
 drivers/usb/misc/Kconfig                      |   4 +-
 drivers/video/fbdev/Kconfig                   |  14 +-
 net/bridge/netfilter/Kconfig                  |   2 +-
 net/ipv4/netfilter/Kconfig                    |   2 +-
 net/ipv6/netfilter/Kconfig                    |   2 +-
 net/netfilter/Kconfig                         |  16 +-
 net/tipc/Kconfig                              |   2 +-
 scripts/Kbuild.include                        |   4 +-
 scripts/Makefile.host                         |   2 +-
 scripts/kconfig/symbol.c                      |   2 +-
 .../tests/err_recursive_dep/expected_stderr   |  14 +-
 sound/oss/dmasound/Kconfig                    |   6 +-
 48 files changed, 840 insertions(+), 561 deletions(-)
 rename Documentation/kbuild/{headers_install.txt => headers_install.rst} (96%)
 create mode 100644 Documentation/kbuild/index.rst
 create mode 100644 Documentation/kbuild/issues.rst
 rename Documentation/kbuild/{kbuild.txt => kbuild.rst} (72%)
 rename Documentation/kbuild/{kconfig-language.txt => kconfig-language.rst} (85%)
 rename Documentation/kbuild/{kconfig-macro-language.txt => kconfig-macro-language.rst} (94%)
 rename Documentation/kbuild/{kconfig.txt => kconfig.rst} (80%)
 rename Documentation/kbuild/{makefiles.txt => makefiles.rst} (83%)
 rename Documentation/kbuild/{modules.txt => modules.rst} (84%)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index a582c780c3bd..cc6151fc0845 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -227,7 +227,7 @@ Configuring the kernel
      "make tinyconfig"  Configure the tiniest possible kernel.
 
    You can find more information on using the Linux kernel config tools
-   in Documentation/kbuild/kconfig.txt.
+   in Documentation/kbuild/kconfig.rst.
 
  - NOTES on ``make config``:
 
diff --git a/Documentation/kbuild/headers_install.txt b/Documentation/kbuild/headers_install.rst
similarity index 96%
rename from Documentation/kbuild/headers_install.txt
rename to Documentation/kbuild/headers_install.rst
index f0153adb95e2..1ab7294e41ac 100644
--- a/Documentation/kbuild/headers_install.txt
+++ b/Documentation/kbuild/headers_install.rst
@@ -1,3 +1,4 @@
+=============================================
 Exporting kernel headers for use by userspace
 =============================================
 
@@ -22,14 +23,14 @@ older kernel.
 
 The "make headers_install" command can be run in the top level directory of the
 kernel source code (or using a standard out-of-tree build).  It takes two
-optional arguments:
+optional arguments::
 
   make headers_install ARCH=i386 INSTALL_HDR_PATH=/usr
 
 ARCH indicates which architecture to produce headers for, and defaults to the
 current architecture.  The linux/asm directory of the exported kernel headers
 is platform-specific, to see a complete list of supported architectures use
-the command:
+the command::
 
   ls -d include/asm-* | sed 's/.*-//'
 
diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
new file mode 100644
index 000000000000..42d4cbe4460c
--- /dev/null
+++ b/Documentation/kbuild/index.rst
@@ -0,0 +1,27 @@
+:orphan:
+
+===================
+Kernel Build System
+===================
+
+.. toctree::
+    :maxdepth: 1
+
+    kconfig-language
+    kconfig-macro-language
+
+    kbuild
+    kconfig
+    makefiles
+    modules
+
+    headers_install
+
+    issues
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/kbuild/issues.rst b/Documentation/kbuild/issues.rst
new file mode 100644
index 000000000000..9fdded4b681c
--- /dev/null
+++ b/Documentation/kbuild/issues.rst
@@ -0,0 +1,11 @@
+Recursion issue #1
+------------------
+
+ .. include:: Kconfig.recursion-issue-01
+    :literal:
+
+Recursion issue #2
+------------------
+
+ .. include:: Kconfig.recursion-issue-02
+    :literal:
diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.rst
similarity index 72%
rename from Documentation/kbuild/kbuild.txt
rename to Documentation/kbuild/kbuild.rst
index 9c230ea71963..e774e760522d 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.rst
@@ -1,13 +1,19 @@
+======
+Kbuild
+======
+
+
 Output files
+============
 
 modules.order
---------------------------------------------------
+-------------
 This file records the order in which modules appear in Makefiles. This
 is used by modprobe to deterministically resolve aliases that match
 multiple modules.
 
 modules.builtin
---------------------------------------------------
+---------------
 This file lists all modules that are built into the kernel. This is used
 by modprobe to not fail when trying to load something builtin.
 
@@ -18,84 +24,90 @@ Unlike modinfo of a separate module, all fields are prefixed with module name.
 
 
 Environment variables
+=====================
 
 KCPPFLAGS
---------------------------------------------------
+---------
 Additional options to pass when preprocessing. The preprocessing options
 will be used in all cases where kbuild does preprocessing including
 building C files and assembler files.
 
 KAFLAGS
---------------------------------------------------
+-------
 Additional options to the assembler (for built-in and modules).
 
 AFLAGS_MODULE
---------------------------------------------------
+-------------
 Additional module specific options to use for $(AS).
 
 AFLAGS_KERNEL
---------------------------------------------------
+-------------
 Additional options for $(AS) when used for assembler
 code for code that is compiled as built-in.
 
 KCFLAGS
---------------------------------------------------
+-------
 Additional options to the C compiler (for built-in and modules).
 
 CFLAGS_KERNEL
---------------------------------------------------
+-------------
 Additional options for $(CC) when used to compile
 code that is compiled as built-in.
 
 CFLAGS_MODULE
---------------------------------------------------
+-------------
 Additional module specific options to use for $(CC).
 
 LDFLAGS_MODULE
---------------------------------------------------
+--------------
 Additional options used for $(LD) when linking modules.
 
 HOSTCFLAGS
---------------------------------------------------
+----------
 Additional flags to be passed to $(HOSTCC) when building host programs.
 
 HOSTCXXFLAGS
---------------------------------------------------
+------------
 Additional flags to be passed to $(HOSTCXX) when building host programs.
 
 HOSTLDFLAGS
---------------------------------------------------
+-----------
 Additional flags to be passed when linking host programs.
 
 HOSTLDLIBS
---------------------------------------------------
+----------
 Additional libraries to link against when building host programs.
 
 KBUILD_KCONFIG
---------------------------------------------------
+--------------
 Set the top-level Kconfig file to the value of this environment
 variable.  The default name is "Kconfig".
 
 KBUILD_VERBOSE
---------------------------------------------------
+--------------
 Set the kbuild verbosity. Can be assigned same values as "V=...".
+
 See make help for the full list.
+
 Setting "V=..." takes precedence over KBUILD_VERBOSE.
 
 KBUILD_EXTMOD
---------------------------------------------------
+-------------
 Set the directory to look for the kernel source when building external
 modules.
+
 Setting "M=..." takes precedence over KBUILD_EXTMOD.
 
 KBUILD_OUTPUT
---------------------------------------------------
+-------------
 Specify the output directory when building the kernel.
+
 The output directory can also be specified using "O=...".
+
 Setting "O=..." takes precedence over KBUILD_OUTPUT.
 
 KBUILD_DEBARCH
---------------------------------------------------
+--------------
 For the deb-pkg target, allows overriding the normal heuristics deployed by
 deb-pkg. Normally deb-pkg attempts to guess the right architecture based on
 the UTS_MACHINE variable, and on some architectures also the kernel config.
@@ -103,44 +115,48 @@ The value of KBUILD_DEBARCH is assumed (not checked) to be a valid Debian
 architecture.
 
 ARCH
---------------------------------------------------
+----
 Set ARCH to the architecture to be built.
+
 In most cases the name of the architecture is the same as the
 directory name found in the arch/ directory.
+
 But some architectures such as x86 and sparc have aliases.
-x86: i386 for 32 bit, x86_64 for 64 bit
-sh: sh for 32 bit, sh64 for 64 bit
-sparc: sparc32 for 32 bit, sparc64 for 64 bit
+
+- x86: i386 for 32 bit, x86_64 for 64 bit
+- sh: sh for 32 bit, sh64 for 64 bit
+- sparc: sparc32 for 32 bit, sparc64 for 64 bit
 
 CROSS_COMPILE
---------------------------------------------------
+-------------
 Specify an optional fixed part of the binutils filename.
 CROSS_COMPILE can be a part of the filename or the full path.
 
 CROSS_COMPILE is also used for ccache in some setups.
 
 CF
---------------------------------------------------
+--
 Additional options for sparse.
-CF is often used on the command-line like this:
+
+CF is often used on the command-line like this::
 
     make CF=-Wbitwise C=2
 
 INSTALL_PATH
---------------------------------------------------
+------------
 INSTALL_PATH specifies where to place the updated kernel and system map
 images. Default is /boot, but you can set it to other values.
 
 INSTALLKERNEL
---------------------------------------------------
+-------------
 Install script called when using "make install".
 The default name is "installkernel".
 
 The script will be called with the following arguments:
-    $1 - kernel version
-    $2 - kernel image file
-    $3 - kernel map file
-    $4 - default install path (use root directory if blank)
+   - $1 - kernel version
+   - $2 - kernel image file
+   - $3 - kernel map file
+   - $4 - default install path (use root directory if blank)
 
 The implementation of "make install" is architecture specific
 and it may differ from the above.
@@ -149,32 +165,33 @@ INSTALLKERNEL is provided to enable the possibility to
 specify a custom installer when cross compiling a kernel.
 
 MODLIB
---------------------------------------------------
+------
 Specify where to install modules.
-The default value is:
+The default value is::
 
      $(INSTALL_MOD_PATH)/lib/modules/$(KERNELRELEASE)
 
 The value can be overridden in which case the default value is ignored.
 
 INSTALL_MOD_PATH
---------------------------------------------------
+----------------
 INSTALL_MOD_PATH specifies a prefix to MODLIB for module directory
 relocations required by build roots.  This is not defined in the
 makefile but the argument can be passed to make if needed.
 
 INSTALL_MOD_STRIP
---------------------------------------------------
+-----------------
 INSTALL_MOD_STRIP, if defined, will cause modules to be
 stripped after they are installed.  If INSTALL_MOD_STRIP is '1', then
 the default option --strip-debug will be used.  Otherwise,
 INSTALL_MOD_STRIP value will be used as the options to the strip command.
 
 INSTALL_HDR_PATH
---------------------------------------------------
+----------------
 INSTALL_HDR_PATH specifies where to install user space headers when
 executing "make headers_*".
-The default value is:
+
+The default value is::
 
     $(objtree)/usr
 
@@ -184,65 +201,65 @@ The output directory is often set using "O=..." on the commandline.
 The value can be overridden in which case the default value is ignored.
 
 KBUILD_SIGN_PIN
---------------------------------------------------
+---------------
 This variable allows a passphrase or PIN to be passed to the sign-file
 utility when signing kernel modules, if the private key requires such.
 
 KBUILD_MODPOST_WARN
---------------------------------------------------
+-------------------
 KBUILD_MODPOST_WARN can be set to avoid errors in case of undefined
 symbols in the final module linking stage. It changes such errors
 into warnings.
 
 KBUILD_MODPOST_NOFINAL
---------------------------------------------------
+----------------------
 KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
 This is solely useful to speed up test compiles.
 
 KBUILD_EXTRA_SYMBOLS
---------------------------------------------------
+--------------------
 For modules that use symbols from other modules.
 See more details in modules.txt.
 
 ALLSOURCE_ARCHS
---------------------------------------------------
+---------------
 For tags/TAGS/cscope targets, you can specify more than one arch
-to be included in the databases, separated by blank space. E.g.:
+to be included in the databases, separated by blank space. E.g.::
 
     $ make ALLSOURCE_ARCHS="x86 mips arm" tags
 
-To get all available archs you can also specify all. E.g.:
+To get all available archs you can also specify all. E.g.::
 
     $ make ALLSOURCE_ARCHS=all tags
 
 KBUILD_ENABLE_EXTRA_GCC_CHECKS
---------------------------------------------------
+------------------------------
 If enabled over the make command line with "W=1", it turns on additional
 gcc -W... options for more extensive build-time checking.
 
 KBUILD_BUILD_TIMESTAMP
---------------------------------------------------
+----------------------
 Setting this to a date string overrides the timestamp used in the
 UTS_VERSION definition (uname -v in the running kernel). The value has to
 be a string that can be passed to date -d. The default value
 is the output of the date command at one point during build.
 
 KBUILD_BUILD_USER, KBUILD_BUILD_HOST
---------------------------------------------------
+------------------------------------
 These two variables allow to override the user@host string displayed during
 boot and in /proc/version. The default value is the output of the commands
 whoami and host, respectively.
 
 KBUILD_LDS
---------------------------------------------------
+----------
 The linker script with full path. Assigned by the top-level Makefile.
 
 KBUILD_VMLINUX_OBJS
---------------------------------------------------
+-------------------
 All object files for vmlinux. They are linked to vmlinux in the same
 order as listed in KBUILD_VMLINUX_OBJS.
 
 KBUILD_VMLINUX_LIBS
---------------------------------------------------
+-------------------
 All .a "lib" files for vmlinux. KBUILD_VMLINUX_OBJS and KBUILD_VMLINUX_LIBS
 together specify all the object files used to link vmlinux.
diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.rst
similarity index 85%
rename from Documentation/kbuild/kconfig-language.txt
rename to Documentation/kbuild/kconfig-language.rst
index 864e740811da..2bc8a7803365 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -1,8 +1,12 @@
+================
+Kconfig Language
+================
+
 Introduction
 ------------
 
 The configuration database is a collection of configuration options
-organized in a tree structure:
+organized in a tree structure::
 
 	+- Code maturity level options
 	|  +- Prompt for development and/or incomplete code/drivers
@@ -25,9 +29,9 @@ Menu entries
 ------------
 
 Most entries define a config option; all other entries help to organize
-them. A single configuration option is defined like this:
+them. A single configuration option is defined like this::
 
-config MODVERSIONS
+  config MODVERSIONS
 	bool "Set version information on all module symbols"
 	depends on MODULES
 	help
@@ -52,10 +56,12 @@ applicable everywhere (see syntax).
   Every config option must have a type. There are only two basic types:
   tristate and string; the other types are based on these two. The type
   definition optionally accepts an input prompt, so these two examples
-  are equivalent:
+  are equivalent::
 
 	bool "Networking support"
-  and
+
+  and::
+
 	bool
 	prompt "Networking support"
 
@@ -98,8 +104,10 @@ applicable everywhere (see syntax).
 	d) Hardware or infrastructure that everybody expects, such as CONFIG_NET
 	   or CONFIG_BLOCK. These are rare exceptions.
 
-- type definition + default value:
+- type definition + default value::
+
 	"def_bool"/"def_tristate" <expr> ["if" <expr>]
+
   This is a shorthand notation for a type definition plus a value.
   Optionally dependencies for this default value can be added with "if".
 
@@ -107,11 +115,13 @@ applicable everywhere (see syntax).
   This defines a dependency for this menu entry. If multiple
   dependencies are defined, they are connected with '&&'. Dependencies
   are applied to all other options within this menu entry (which also
-  accept an "if" expression), so these two examples are equivalent:
+  accept an "if" expression), so these two examples are equivalent::
 
 	bool "foo" if BAR
 	default y if BAR
-  and
+
+  and::
+
 	depends on BAR
 	bool "foo"
 	default y
@@ -124,6 +134,7 @@ applicable everywhere (see syntax).
   times, the limit is set to the largest selection.
   Reverse dependencies can only be used with boolean or tristate
   symbols.
+
   Note:
 	select should be used with care. select will force
 	a symbol to a value without visiting the dependencies.
@@ -139,24 +150,26 @@ applicable everywhere (see syntax).
   symbol except that the "implied" symbol's value may still be set to n
   from a direct dependency or with a visible prompt.
 
-  Given the following example:
+  Given the following example::
 
-  config FOO
+    config FOO
 	tristate
 	imply BAZ
 
-  config BAZ
+    config BAZ
 	tristate
 	depends on BAR
 
   The following values are possible:
 
+	===		===		=============	==============
 	FOO		BAR		BAZ's default	choice for BAZ
-	---		---		-------------	--------------
+	===		===		=============	==============
 	n		y		n		N/m/y
 	m		y		m		M/y/n
 	y		y		y		Y/n
 	y		n		*		N
+	===		===		=============	==============
 
   This is useful e.g. with multiple drivers that want to indicate their
   ability to hook into a secondary subsystem while allowing the user to
@@ -208,9 +221,9 @@ Menu dependencies
 Dependencies define the visibility of a menu entry and can also reduce
 the input range of tristate symbols. The tristate logic used in the
 expressions uses one more state than normal boolean logic to express the
-module state. Dependency expressions have the following syntax:
+module state. Dependency expressions have the following syntax::
 
-<expr> ::= <symbol>                             (1)
+  <expr> ::= <symbol>                           (1)
            <symbol> '=' <symbol>                (2)
            <symbol> '!=' <symbol>               (3)
            <symbol1> '<' <symbol2>              (4)
@@ -222,7 +235,7 @@ module state. Dependency expressions have the following syntax:
            <expr> '&&' <expr>                   (7)
            <expr> '||' <expr>                   (8)
 
-Expressions are listed in decreasing order of precedence. 
+Expressions are listed in decreasing order of precedence.
 
 (1) Convert the symbol into an expression. Boolean and tristate symbols
     are simply converted into the respective expression values. All
@@ -255,15 +268,15 @@ Menu structure
 --------------
 
 The position of a menu entry in the tree is determined in two ways. First
-it can be specified explicitly:
+it can be specified explicitly::
 
-menu "Network device support"
+  menu "Network device support"
 	depends on NET
 
-config NETDEVICES
+  config NETDEVICES
 	...
 
-endmenu
+  endmenu
 
 All entries within the "menu" ... "endmenu" block become a submenu of
 "Network device support". All subentries inherit the dependencies from
@@ -275,17 +288,18 @@ dependencies. If a menu entry somehow depends on the previous entry, it
 can be made a submenu of it. First, the previous (parent) symbol must
 be part of the dependency list and then one of these two conditions
 must be true:
+
 - the child entry must become invisible, if the parent is set to 'n'
-- the child entry must only be visible, if the parent is visible
+- the child entry must only be visible, if the parent is visible::
 
-config MODULES
+    config MODULES
 	bool "Enable loadable module support"
 
-config MODVERSIONS
+    config MODVERSIONS
 	bool "Set version information on all module symbols"
 	depends on MODULES
 
-comment "module support disabled"
+    comment "module support disabled"
 	depends on !MODULES
 
 MODVERSIONS directly depends on MODULES, this means it's only visible if
@@ -299,6 +313,7 @@ Kconfig syntax
 The configuration file describes a series of menu entries, where every
 line starts with a keyword (except help texts). The following keywords
 end a menu entry:
+
 - config
 - menuconfig
 - choice/endchoice
@@ -306,17 +321,17 @@ end a menu entry:
 - menu/endmenu
 - if/endif
 - source
+
 The first five also start the definition of a menu entry.
 
-config:
-
+config::
 	"config" <symbol>
 	<config options>
 
 This defines a config symbol <symbol> and accepts any of above
 attributes as options.
 
-menuconfig:
+menuconfig::
 	"menuconfig" <symbol>
 	<config options>
 
@@ -325,43 +340,43 @@ hint to front ends, that all suboptions should be displayed as a
 separate list of options. To make sure all the suboptions will really
 show up under the menuconfig entry and not outside of it, every item
 from the <config options> list must depend on the menuconfig symbol.
-In practice, this is achieved by using one of the next two constructs:
+In practice, this is achieved by using one of the next two constructs::
 
-(1):
-menuconfig M
-if M
-    config C1
-    config C2
-endif
+  (1):
+  menuconfig M
+  if M
+      config C1
+      config C2
+  endif
 
-(2):
-menuconfig M
-config C1
-    depends on M
-config C2
-    depends on M
+  (2):
+  menuconfig M
+  config C1
+      depends on M
+  config C2
+      depends on M
 
 In the following examples (3) and (4), C1 and C2 still have the M
 dependency, but will not appear under menuconfig M anymore, because
-of C0, which doesn't depend on M:
+of C0, which doesn't depend on M::
 
-(3):
-menuconfig M
-    config C0
-if M
-    config C1
-    config C2
-endif
+  (3):
+  menuconfig M
+      config C0
+  if M
+      config C1
+      config C2
+  endif
 
-(4):
-menuconfig M
-config C0
-config C1
-    depends on M
-config C2
-    depends on M
+  (4):
+  menuconfig M
+  config C0
+  config C1
+      depends on M
+  config C2
+      depends on M
 
-choices:
+choices::
 
 	"choice" [symbol]
 	<choice options>
@@ -387,7 +402,7 @@ definitions of that choice. If a [symbol] is associated to the choice,
 then you may define the same choice (i.e. with the same entries) in another
 place.
 
-comment:
+comment::
 
 	"comment" <prompt>
 	<comment options>
@@ -396,7 +411,7 @@ This defines a comment which is displayed to the user during the
 configuration process and is also echoed to the output files. The only
 possible options are dependencies.
 
-menu:
+menu::
 
 	"menu" <prompt>
 	<menu options>
@@ -407,7 +422,7 @@ This defines a menu block, see "Menu structure" above for more
 information. The only possible options are dependencies and "visible"
 attributes.
 
-if:
+if::
 
 	"if" <expr>
 	<if block>
@@ -416,13 +431,13 @@ if:
 This defines an if block. The dependency expression <expr> is appended
 to all enclosed menu entries.
 
-source:
+source::
 
 	"source" <prompt>
 
 This reads the specified configuration file. This file is always parsed.
 
-mainmenu:
+mainmenu::
 
 	"mainmenu" <prompt>
 
@@ -452,20 +467,21 @@ that is defined in a common Kconfig file and selected by the relevant
 architectures.
 An example is the generic IOMAP functionality.
 
-We would in lib/Kconfig see:
+We would in lib/Kconfig see::
 
-# Generic IOMAP is used to ...
-config HAVE_GENERIC_IOMAP
+  # Generic IOMAP is used to ...
+  config HAVE_GENERIC_IOMAP
 
-config GENERIC_IOMAP
+  config GENERIC_IOMAP
 	depends on HAVE_GENERIC_IOMAP && FOO
 
-And in lib/Makefile we would see:
-obj-$(CONFIG_GENERIC_IOMAP) += iomap.o
+And in lib/Makefile we would see::
 
-For each architecture using the generic IOMAP functionality we would see:
+	obj-$(CONFIG_GENERIC_IOMAP) += iomap.o
 
-config X86
+For each architecture using the generic IOMAP functionality we would see::
+
+  config X86
 	select ...
 	select HAVE_GENERIC_IOMAP
 	select ...
@@ -484,25 +500,25 @@ Adding features that need compiler support
 
 There are several features that need compiler support. The recommended way
 to describe the dependency on the compiler feature is to use "depends on"
-followed by a test macro.
+followed by a test macro::
 
-config STACKPROTECTOR
+  config STACKPROTECTOR
 	bool "Stack Protector buffer overflow detection"
 	depends on $(cc-option,-fstack-protector)
 	...
 
 If you need to expose a compiler capability to makefiles and/or C source files,
-CC_HAS_ is the recommended prefix for the config option.
+`CC_HAS_` is the recommended prefix for the config option::
 
-config CC_HAS_STACKPROTECTOR_NONE
+  config CC_HAS_STACKPROTECTOR_NONE
 	def_bool $(cc-option,-fno-stack-protector)
 
 Build as module only
 ~~~~~~~~~~~~~~~~~~~~
 To restrict a component build to module-only, qualify its config symbol
-with "depends on m".  E.g.:
+with "depends on m".  E.g.::
 
-config FOO
+  config FOO
 	depends on BAR && m
 
 limits FOO to module (=m) or disabled (=n).
@@ -529,18 +545,18 @@ Simple Kconfig recursive issue
 
 Read: Documentation/kbuild/Kconfig.recursion-issue-01
 
-Test with:
+Test with::
 
-make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-01 allnoconfig
+  make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-01 allnoconfig
 
 Cumulative Kconfig recursive issue
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Read: Documentation/kbuild/Kconfig.recursion-issue-02
 
-Test with:
+Test with::
 
-make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-02 allnoconfig
+  make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-02 allnoconfig
 
 Practical solutions to kconfig recursive issue
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -551,7 +567,9 @@ historical issues resolved through these different solutions.
 
   a) Remove any superfluous "select FOO" or "depends on FOO"
   b) Match dependency semantics:
+
 	b1) Swap all "select FOO" to "depends on FOO" or,
+
 	b2) Swap all "depends on FOO" to "select FOO"
 
 The resolution to a) can be tested with the sample Kconfig file
@@ -566,8 +584,9 @@ Documentation/kbuild/Kconfig.recursion-issue-02.
 Below is a list of examples of prior fixes for these types of recursive issues;
 all errors appear to involve one or more select's and one or more "depends on".
 
+============    ===================================
 commit          fix
-======          ===
+============    ===================================
 06b718c01208    select A -> depends on A
 c22eacfe82f9    depends on A -> depends on B
 6a91e854442c    select A -> depends on A
@@ -590,6 +609,7 @@ d9f9ab51e55e    select A -> depends on A
 0c51a4d8abd6    depends on A -> select A        (3)
 e98062ed6dc4    select A -> depends on A        (3)
 91e5d284a7f1    select A -> (null)
+============    ===================================
 
 (1) Partial (or no) quote of error.
 (2) That seems to be the gist of that fix.
@@ -616,11 +636,11 @@ Semantics of Kconfig
 ~~~~~~~~~~~~~~~~~~~~
 
 The use of Kconfig is broad, Linux is now only one of Kconfig's users:
-one study has completed a broad analysis of Kconfig use in 12 projects [0].
+one study has completed a broad analysis of Kconfig use in 12 projects [0]_.
 Despite its widespread use, and although this document does a reasonable job
 in documenting basic Kconfig syntax a more precise definition of Kconfig
 semantics is welcomed. One project deduced Kconfig semantics through
-the use of the xconfig configurator [1]. Work should be done to confirm if
+the use of the xconfig configurator [1]_. Work should be done to confirm if
 the deduced semantics matches our intended Kconfig design goals.
 
 Having well defined semantics can be useful for tools for practical
@@ -628,42 +648,42 @@ evaluation of depenencies, for instance one such use known case was work to
 express in boolean abstraction of the inferred semantics of Kconfig to
 translate Kconfig logic into boolean formulas and run a SAT solver on this to
 find dead code / features (always inactive), 114 dead features were found in
-Linux using this methodology [1] (Section 8: Threats to validity).
+Linux using this methodology [1]_ (Section 8: Threats to validity).
 
 Confirming this could prove useful as Kconfig stands as one of the the leading
-industrial variability modeling languages [1] [2]. Its study would help
+industrial variability modeling languages [1]_ [2]_. Its study would help
 evaluate practical uses of such languages, their use was only theoretical
 and real world requirements were not well understood. As it stands though
 only reverse engineering techniques have been used to deduce semantics from
-variability modeling languages such as Kconfig [3].
+variability modeling languages such as Kconfig [3]_.
 
-[0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
-[1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
-[2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
-[3] http://gsd.uwaterloo.ca/sites/default/files/icse2011.pdf
+.. [0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
+.. [1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
+.. [2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
+.. [3] http://gsd.uwaterloo.ca/sites/default/files/icse2011.pdf
 
 Full SAT solver for Kconfig
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Although SAT solvers [0] haven't yet been used by Kconfig directly, as noted in
-the previous subsection, work has been done however to express in boolean
+Although SAT solvers [4]_ haven't yet been used by Kconfig directly, as noted
+in the previous subsection, work has been done however to express in boolean
 abstraction the inferred semantics of Kconfig to translate Kconfig logic into
-boolean formulas and run a SAT solver on it [1]. Another known related project
-is CADOS [2] (former VAMOS [3]) and the tools, mainly undertaker [4], which has
-been introduced first with [5].  The basic concept of undertaker is to exract
-variability models from Kconfig, and put them together with a propositional
-formula extracted from CPP #ifdefs and build-rules into a SAT solver in order
-to find dead code, dead files, and dead symbols. If using a SAT solver is
-desirable on Kconfig one approach would be to evaluate repurposing such efforts
-somehow on Kconfig. There is enough interest from mentors of existing projects
-to not only help advise how to integrate this work upstream but also help
-maintain it long term. Interested developers should visit:
+boolean formulas and run a SAT solver on it [5]_. Another known related project
+is CADOS [6]_ (former VAMOS [7]_) and the tools, mainly undertaker [8]_, which
+has been introduced first with [9]_.  The basic concept of undertaker is to
+exract variability models from Kconfig, and put them together with a
+propositional formula extracted from CPP #ifdefs and build-rules into a SAT
+solver in order to find dead code, dead files, and dead symbols. If using a SAT
+solver is desirable on Kconfig one approach would be to evaluate repurposing
+such efforts somehow on Kconfig. There is enough interest from mentors of
+existing projects to not only help advise how to integrate this work upstream
+but also help maintain it long term. Interested developers should visit:
 
 http://kernelnewbies.org/KernelProjects/kconfig-sat
 
-[0] http://www.cs.cornell.edu/~sabhar/chapters/SATSolvers-KR-Handbook.pdf
-[1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
-[2] https://cados.cs.fau.de
-[3] https://vamos.cs.fau.de
-[4] https://undertaker.cs.fau.de
-[5] https://www4.cs.fau.de/Publications/2011/tartler_11_eurosys.pdf
+.. [4] http://www.cs.cornell.edu/~sabhar/chapters/SATSolvers-KR-Handbook.pdf
+.. [5] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
+.. [6] https://cados.cs.fau.de
+.. [7] https://vamos.cs.fau.de
+.. [8] https://undertaker.cs.fau.de
+.. [9] https://www4.cs.fau.de/Publications/2011/tartler_11_eurosys.pdf
diff --git a/Documentation/kbuild/kconfig-macro-language.txt b/Documentation/kbuild/kconfig-macro-language.rst
similarity index 94%
rename from Documentation/kbuild/kconfig-macro-language.txt
rename to Documentation/kbuild/kconfig-macro-language.rst
index 07da2ea68dce..35b3263b7e40 100644
--- a/Documentation/kbuild/kconfig-macro-language.txt
+++ b/Documentation/kbuild/kconfig-macro-language.rst
@@ -1,3 +1,7 @@
+======================
+Kconfig macro language
+======================
+
 Concept
 -------
 
@@ -7,7 +11,7 @@ targets and prerequisites. The other is a macro language for performing textual
 substitution.
 
 There is clear distinction between the two language stages. For example, you
-can write a makefile like follows:
+can write a makefile like follows::
 
     APP := foo
     SRC := foo.c
@@ -17,7 +21,7 @@ can write a makefile like follows:
             $(CC) -o $(APP) $(SRC)
 
 The macro language replaces the variable references with their expanded form,
-and handles as if the source file were input like follows:
+and handles as if the source file were input like follows::
 
     foo: foo.c
             gcc -o foo foo.c
@@ -26,7 +30,7 @@ Then, Make analyzes the dependency graph and determines the targets to be
 updated.
 
 The idea is quite similar in Kconfig - it is possible to describe a Kconfig
-file like this:
+file like this::
 
     CC := gcc
 
@@ -34,7 +38,7 @@ file like this:
             def_bool $(shell, $(srctree)/scripts/gcc-check-foo.sh $(CC))
 
 The macro language in Kconfig processes the source file into the following
-intermediate:
+intermediate::
 
     config CC_HAS_FOO
             def_bool y
@@ -69,7 +73,7 @@ variable. The righthand side of += is expanded immediately if the lefthand
 side was originally defined as a simple variable. Otherwise, its evaluation is
 deferred.
 
-The variable reference can take parameters, in the following form:
+The variable reference can take parameters, in the following form::
 
   $(name,arg1,arg2,arg3)
 
@@ -141,7 +145,7 @@ Make vs Kconfig
 Kconfig adopts Make-like macro language, but the function call syntax is
 slightly different.
 
-A function call in Make looks like this:
+A function call in Make looks like this::
 
   $(func-name arg1,arg2,arg3)
 
@@ -149,14 +153,14 @@ The function name and the first argument are separated by at least one
 whitespace. Then, leading whitespaces are trimmed from the first argument,
 while whitespaces in the other arguments are kept. You need to use a kind of
 trick to start the first parameter with spaces. For example, if you want
-to make "info" function print "  hello", you can write like follows:
+to make "info" function print "  hello", you can write like follows::
 
   empty :=
   space := $(empty) $(empty)
   $(info $(space)$(space)hello)
 
 Kconfig uses only commas for delimiters, and keeps all whitespaces in the
-function call. Some people prefer putting a space after each comma delimiter:
+function call. Some people prefer putting a space after each comma delimiter::
 
   $(func-name, arg1, arg2, arg3)
 
@@ -166,7 +170,7 @@ Make - for example, $(subst .c, .o, $(sources)) is a typical mistake; it
 replaces ".c" with " .o".
 
 In Make, a user-defined function is referenced by using a built-in function,
-'call', like this:
+'call', like this::
 
     $(call my-func,arg1,arg2,arg3)
 
@@ -179,12 +183,12 @@ Likewise, $(info hello, world) prints "hello, world" to stdout. You could say
 this is _useful_ inconsistency.
 
 In Kconfig, for simpler implementation and grammatical consistency, commas that
-appear in the $( ) context are always delimiters. It means
+appear in the $( ) context are always delimiters. It means::
 
   $(shell, echo hello, world)
 
 is an error because it is passing two parameters where the 'shell' function
-accepts only one. To pass commas in arguments, you can use the following trick:
+accepts only one. To pass commas in arguments, you can use the following trick::
 
   comma := ,
   $(shell, echo hello$(comma) world)
@@ -195,7 +199,7 @@ Caveats
 
 A variable (or function) cannot be expanded across tokens. So, you cannot use
 a variable as a shorthand for an expression that consists of multiple tokens.
-The following works:
+The following works::
 
     RANGE_MIN := 1
     RANGE_MAX := 3
@@ -204,7 +208,7 @@ The following works:
             int "foo"
             range $(RANGE_MIN) $(RANGE_MAX)
 
-But, the following does not work:
+But, the following does not work::
 
     RANGES := 1 3
 
@@ -213,7 +217,7 @@ But, the following does not work:
             range $(RANGES)
 
 A variable cannot be expanded to any keyword in Kconfig.  The following does
-not work:
+not work::
 
     MY_TYPE := tristate
 
@@ -223,7 +227,8 @@ not work:
 
 Obviously from the design, $(shell command) is expanded in the textual
 substitution phase. You cannot pass symbols to the 'shell' function.
-The following does not work as expected.
+
+The following does not work as expected::
 
     config ENDIAN_FLAG
             string
@@ -234,7 +239,7 @@ The following does not work as expected.
             def_bool $(shell $(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)
 
 Instead, you can do like follows so that any function call is statically
-expanded.
+expanded::
 
     config CC_HAS_ENDIAN_FLAG
             bool
diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.rst
similarity index 80%
rename from Documentation/kbuild/kconfig.txt
rename to Documentation/kbuild/kconfig.rst
index 68c82914c0f3..88129af7e539 100644
--- a/Documentation/kbuild/kconfig.txt
+++ b/Documentation/kbuild/kconfig.rst
@@ -1,4 +1,8 @@
-This file contains some assistance for using "make *config".
+===================
+Kconfig make config
+===================
+
+This file contains some assistance for using `make *config`.
 
 Use "make help" to list all of the possible configuration targets.
 
@@ -6,9 +10,8 @@ The xconfig ('qconf'), menuconfig ('mconf'), and nconfig ('nconf')
 programs also have embedded help text.  Be sure to check that for
 navigation, search, and other general help text.
 
-======================================================================
 General
---------------------------------------------------
+-------
 
 New kernel releases often introduce new config symbols.  Often more
 important, new kernel releases may rename config symbols.  When
@@ -17,51 +20,55 @@ this happens, using a previously working .config file and running
 for you, so you may find that you need to see what NEW kernel
 symbols have been introduced.
 
-To see a list of new config symbols, use
+To see a list of new config symbols, use::
 
 	cp user/some/old.config .config
 	make listnewconfig
 
 and the config program will list any new symbols, one per line.
 
-Alternatively, you can use the brute force method:
+Alternatively, you can use the brute force method::
 
 	make oldconfig
 	scripts/diffconfig .config.old .config | less
 
-______________________________________________________________________
-Environment variables for '*config'
+----------------------------------------------------------------------
+
+Environment variables for `*config`
 
 KCONFIG_CONFIG
---------------------------------------------------
+--------------
 This environment variable can be used to specify a default kernel config
 file name to override the default name of ".config".
 
 KCONFIG_OVERWRITECONFIG
---------------------------------------------------
+-----------------------
 If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
 break symlinks when .config is a symlink to somewhere else.
 
-CONFIG_
---------------------------------------------------
-If you set CONFIG_ in the environment, Kconfig will prefix all symbols
+`CONFIG_`
+---------
+If you set `CONFIG_` in the environment, Kconfig will prefix all symbols
 with its value when saving the configuration, instead of using the default,
-"CONFIG_".
+`CONFIG_`.
+
+----------------------------------------------------------------------
 
-______________________________________________________________________
 Environment variables for '{allyes/allmod/allno/rand}config'
 
 KCONFIG_ALLCONFIG
---------------------------------------------------
+-----------------
 (partially based on lkml email from/by Rob Landley, re: miniconfig)
+
 --------------------------------------------------
+
 The allyesconfig/allmodconfig/allnoconfig/randconfig variants can also
 use the environment variable KCONFIG_ALLCONFIG as a flag or a filename
 that contains config symbols that the user requires to be set to a
 specific value.  If KCONFIG_ALLCONFIG is used without a filename where
-KCONFIG_ALLCONFIG == "" or KCONFIG_ALLCONFIG == "1", "make *config"
+KCONFIG_ALLCONFIG == "" or KCONFIG_ALLCONFIG == "1", `make *config`
 checks for a file named "all{yes/mod/no/def/random}.config"
-(corresponding to the *config command that was used) for symbol values
+(corresponding to the `*config` command that was used) for symbol values
 that are to be forced.  If this file is not found, it checks for a
 file named "all.config" to contain forced values.
 
@@ -74,43 +81,55 @@ This 'KCONFIG_ALLCONFIG' file is a config file which contains
 (usually a subset of all) preset config symbols.  These variable
 settings are still subject to normal dependency checks.
 
-Examples:
+Examples::
+
 	KCONFIG_ALLCONFIG=custom-notebook.config make allnoconfig
-or
+
+or::
+
 	KCONFIG_ALLCONFIG=mini.config make allnoconfig
-or
+
+or::
+
 	make KCONFIG_ALLCONFIG=mini.config allnoconfig
 
 These examples will disable most options (allnoconfig) but enable or
 disable the options that are explicitly listed in the specified
 mini-config files.
 
-______________________________________________________________________
+----------------------------------------------------------------------
+
 Environment variables for 'randconfig'
 
 KCONFIG_SEED
---------------------------------------------------
+------------
 You can set this to the integer value used to seed the RNG, if you want
 to somehow debug the behaviour of the kconfig parser/frontends.
 If not set, the current time will be used.
 
 KCONFIG_PROBABILITY
---------------------------------------------------
+-------------------
 This variable can be used to skew the probabilities. This variable can
 be unset or empty, or set to three different formats:
+
+    =======================     ==================  =====================
 	KCONFIG_PROBABILITY     y:n split           y:m:n split
-	-----------------------------------------------------------------
+    =======================     ==================  =====================
 	unset or empty          50  : 50            33  : 33  : 34
 	N                        N  : 100-N         N/2 : N/2 : 100-N
     [1] N:M                     N+M : 100-(N+M)      N  :  M  : 100-(N+M)
     [2] N:M:L                    N  : 100-N          M  :  L  : 100-(M+L)
+    =======================     ==================  =====================
 
 where N, M and L are integers (in base 10) in the range [0,100], and so
 that:
+
     [1] N+M is in the range [0,100]
+
     [2] M+L is in the range [0,100]
 
-Examples:
+Examples::
+
 	KCONFIG_PROBABILITY=10
 		10% of booleans will be set to 'y', 90% to 'n'
 		5% of tristates will be set to 'y', 5% to 'm', 90% to 'n'
@@ -121,34 +140,36 @@ Examples:
 		10% of booleans will be set to 'y', 90% to 'n'
 		15% of tristates will be set to 'y', 15% to 'm', 70% to 'n'
 
-______________________________________________________________________
+----------------------------------------------------------------------
+
 Environment variables for 'syncconfig'
 
 KCONFIG_NOSILENTUPDATE
---------------------------------------------------
+----------------------
 If this variable has a non-blank value, it prevents silent kernel
 config updates (requires explicit updates).
 
 KCONFIG_AUTOCONFIG
---------------------------------------------------
+------------------
 This environment variable can be set to specify the path & name of the
 "auto.conf" file.  Its default value is "include/config/auto.conf".
 
 KCONFIG_TRISTATE
---------------------------------------------------
+----------------
 This environment variable can be set to specify the path & name of the
 "tristate.conf" file.  Its default value is "include/config/tristate.conf".
 
 KCONFIG_AUTOHEADER
---------------------------------------------------
+------------------
 This environment variable can be set to specify the path & name of the
 "autoconf.h" (header) file.
 Its default value is "include/generated/autoconf.h".
 
 
-======================================================================
+----------------------------------------------------------------------
+
 menuconfig
---------------------------------------------------
+----------
 
 SEARCHING for CONFIG symbols
 
@@ -158,7 +179,8 @@ Searching in menuconfig:
 	names, so you have to know something close to what you are
 	looking for.
 
-	Example:
+	Example::
+
 		/hotplug
 		This lists all config symbols that contain "hotplug",
 		e.g., HOTPLUG_CPU, MEMORY_HOTPLUG.
@@ -166,48 +188,55 @@ Searching in menuconfig:
 	For search help, enter / followed by TAB-TAB (to highlight
 	<Help>) and Enter.  This will tell you that you can also use
 	regular expressions (regexes) in the search string, so if you
-	are not interested in MEMORY_HOTPLUG, you could try
+	are not interested in MEMORY_HOTPLUG, you could try::
 
 		/^hotplug
 
 	When searching, symbols are sorted thus:
+
 	  - first, exact matches, sorted alphabetically (an exact match
 	    is when the search matches the complete symbol name);
 	  - then, other matches, sorted alphabetically.
+
 	For example: ^ATH.K matches:
+
 	    ATH5K ATH9K ATH5K_AHB ATH5K_DEBUG [...] ATH6KL ATH6KL_DEBUG
 	    [...] ATH9K_AHB ATH9K_BTCOEX_SUPPORT ATH9K_COMMON [...]
+
 	of which only ATH5K and ATH9K match exactly and so are sorted
 	first (and in alphabetical order), then come all other symbols,
 	sorted in alphabetical order.
 
-______________________________________________________________________
+----------------------------------------------------------------------
+
 User interface options for 'menuconfig'
 
 MENUCONFIG_COLOR
---------------------------------------------------
+----------------
 It is possible to select different color themes using the variable
-MENUCONFIG_COLOR.  To select a theme use:
+MENUCONFIG_COLOR.  To select a theme use::
 
 	make MENUCONFIG_COLOR=<theme> menuconfig
 
-Available themes are:
-  mono       => selects colors suitable for monochrome displays
-  blackbg    => selects a color scheme with black background
-  classic    => theme with blue background. The classic look
-  bluetitle  => a LCD friendly version of classic. (default)
+Available themes are::
+
+  - mono       => selects colors suitable for monochrome displays
+  - blackbg    => selects a color scheme with black background
+  - classic    => theme with blue background. The classic look
+  - bluetitle  => a LCD friendly version of classic. (default)
 
 MENUCONFIG_MODE
---------------------------------------------------
+---------------
 This mode shows all sub-menus in one large tree.
 
-Example:
+Example::
+
 	make MENUCONFIG_MODE=single_menu menuconfig
 
+----------------------------------------------------------------------
 
-======================================================================
 nconfig
---------------------------------------------------
+-------
 
 nconfig is an alternate text-based configurator.  It lists function
 keys across the bottom of the terminal (window) that execute commands.
@@ -231,16 +260,16 @@ Searching in nconfig:
 	given string or regular expression (regex).
 
 NCONFIG_MODE
---------------------------------------------------
+------------
 This mode shows all sub-menus in one large tree.
 
-Example:
+Example::
 	make NCONFIG_MODE=single_menu nconfig
 
+----------------------------------------------------------------------
 
-======================================================================
 xconfig
---------------------------------------------------
+-------
 
 Searching in xconfig:
 
@@ -260,13 +289,12 @@ Searching in xconfig:
 	to return to the main menu.
 
 
-======================================================================
+----------------------------------------------------------------------
+
 gconfig
---------------------------------------------------
+-------
 
 Searching in gconfig:
 
 	There is no search command in gconfig.  However, gconfig does
 	have several different viewing choices, modes, and options.
-
-###
diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.rst
similarity index 83%
rename from Documentation/kbuild/makefiles.txt
rename to Documentation/kbuild/makefiles.rst
index d65ad5746f94..9274cdcc9bd2 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.rst
@@ -1,8 +1,10 @@
+======================
 Linux Kernel Makefiles
+======================
 
 This document describes the Linux kernel Makefiles.
 
-=== Table of Contents
+.. Table of Contents
 
 	=== 1 Overview
 	=== 2 Who does what
@@ -54,9 +56,10 @@ This document describes the Linux kernel Makefiles.
 	=== 10 Credits
 	=== 11 TODO
 
-=== 1 Overview
+1 Overview
+==========
 
-The Makefiles have five parts:
+The Makefiles have five parts::
 
 	Makefile		the top Makefile.
 	.config			the kernel configuration file.
@@ -85,7 +88,8 @@ scripts/Makefile.* contains all the definitions/rules etc. that
 are used to build the kernel based on the kbuild makefiles.
 
 
-=== 2 Who does what
+2 Who does what
+===============
 
 People have four different relationships with the kernel Makefiles.
 
@@ -110,7 +114,8 @@ These people need to know about all aspects of the kernel Makefiles.
 This document is aimed towards normal developers and arch developers.
 
 
-=== 3 The kbuild files
+3 The kbuild files
+==================
 
 Most Makefiles within the kernel are kbuild Makefiles that use the
 kbuild infrastructure. This chapter introduces the syntax used in the
@@ -122,7 +127,8 @@ file will be used.
 Section 3.1 "Goal definitions" is a quick intro, further chapters provide
 more details, with real examples.
 
---- 3.1 Goal definitions
+3.1 Goal definitions
+--------------------
 
 	Goal definitions are the main part (heart) of the kbuild Makefile.
 	These lines define the files to be built, any special compilation
@@ -130,7 +136,8 @@ more details, with real examples.
 
 	The most simple kbuild makefile contains one line:
 
-	Example:
+	Example::
+
 		obj-y += foo.o
 
 	This tells kbuild that there is one object in that directory, named
@@ -139,14 +146,16 @@ more details, with real examples.
 	If foo.o shall be built as a module, the variable obj-m is used.
 	Therefore the following pattern is often used:
 
-	Example:
+	Example::
+
 		obj-$(CONFIG_FOO) += foo.o
 
 	$(CONFIG_FOO) evaluates to either y (for built-in) or m (for module).
 	If CONFIG_FOO is neither y nor m, then the file will not be compiled
 	nor linked.
 
---- 3.2 Built-in object goals - obj-y
+3.2 Built-in object goals - obj-y
+---------------------------------
 
 	The kbuild Makefile specifies object files for vmlinux
 	in the $(obj-y) lists.  These lists depend on the kernel
@@ -167,14 +176,16 @@ more details, with real examples.
 	order may e.g. change the order in which your SCSI
 	controllers are detected, and thus your disks are renumbered.
 
-	Example:
+	Example::
+
 		#drivers/isdn/i4l/Makefile
 		# Makefile for the kernel ISDN subsystem and device drivers.
 		# Each configuration option enables a list of files.
 		obj-$(CONFIG_ISDN_I4L)         += isdn.o
 		obj-$(CONFIG_ISDN_PPP_BSDCOMP) += isdn_bsdcomp.o
 
---- 3.3 Loadable module goals - obj-m
+3.3 Loadable module goals - obj-m
+---------------------------------
 
 	$(obj-m) specifies object files which are built as loadable
 	kernel modules.
@@ -183,7 +194,8 @@ more details, with real examples.
 	files. In the case of one source file, the kbuild makefile
 	simply adds the file to $(obj-m).
 
-	Example:
+	Example::
+
 		#drivers/isdn/i4l/Makefile
 		obj-$(CONFIG_ISDN_PPP_BSDCOMP) += isdn_bsdcomp.o
 
@@ -195,7 +207,8 @@ more details, with real examples.
 	module from, so you have to tell it by setting a $(<module_name>-y)
 	variable.
 
-	Example:
+	Example::
+
 		#drivers/isdn/i4l/Makefile
 		obj-$(CONFIG_ISDN_I4L) += isdn.o
 		isdn-y := isdn_net_lib.o isdn_v110.o isdn_common.o
@@ -205,10 +218,11 @@ more details, with real examples.
 	"$(LD) -r" on the list of these files to generate isdn.o.
 
 	Due to kbuild recognizing $(<module_name>-y) for composite objects,
-	you can use the value of a CONFIG_ symbol to optionally include an
+	you can use the value of a `CONFIG_` symbol to optionally include an
 	object file as part of a composite object.
 
-	Example:
+	Example::
+
 		#fs/ext2/Makefile
 	        obj-$(CONFIG_EXT2_FS) += ext2.o
 		ext2-y := balloc.o dir.o file.o ialloc.o inode.o ioctl.o \
@@ -225,12 +239,14 @@ more details, with real examples.
 	kbuild will build an ext2.o file for you out of the individual
 	parts and then link this into built-in.a, as you would expect.
 
---- 3.4 Objects which export symbols
+3.4 Objects which export symbols
+--------------------------------
 
 	No special notation is required in the makefiles for
 	modules exporting symbols.
 
---- 3.5 Library file goals - lib-y
+3.5 Library file goals - lib-y
+------------------------------
 
 	Objects listed with obj-* are used for modules, or
 	combined in a built-in.a for that specific directory.
@@ -247,18 +263,21 @@ more details, with real examples.
 	and to be part of a library. Therefore the same directory
 	may contain both a built-in.a and a lib.a file.
 
-	Example:
+	Example::
+
 		#arch/x86/lib/Makefile
 		lib-y    := delay.o
 
 	This will create a library lib.a based on delay.o. For kbuild to
 	actually recognize that there is a lib.a being built, the directory
 	shall be listed in libs-y.
+
 	See also "6.4 List directories to visit when descending".
 
-	Use of lib-y is normally restricted to lib/ and arch/*/lib.
+	Use of lib-y is normally restricted to `lib/` and `arch/*/lib`.
 
---- 3.6 Descending down in directories
+3.6 Descending down in directories
+----------------------------------
 
 	A Makefile is only responsible for building objects in its own
 	directory. Files in subdirectories should be taken care of by
@@ -270,7 +289,8 @@ more details, with real examples.
 	ext2 lives in a separate directory, and the Makefile present in fs/
 	tells kbuild to descend down using the following assignment.
 
-	Example:
+	Example::
+
 		#fs/Makefile
 		obj-$(CONFIG_EXT2_FS) += ext2/
 
@@ -281,11 +301,12 @@ more details, with real examples.
 	the directory, it is the Makefile in the subdirectory that
 	specifies what is modular and what is built-in.
 
-	It is good practice to use a CONFIG_ variable when assigning directory
+	It is good practice to use a `CONFIG_` variable when assigning directory
 	names. This allows kbuild to totally skip the directory if the
-	corresponding CONFIG_ option is neither 'y' nor 'm'.
+	corresponding `CONFIG_` option is neither 'y' nor 'm'.
 
---- 3.7 Compilation flags
+3.7 Compilation flags
+---------------------
 
     ccflags-y, asflags-y and ldflags-y
 	These three flags apply only to the kbuild makefile in which they
@@ -297,7 +318,8 @@ more details, with real examples.
 
 	ccflags-y specifies options for compiling with $(CC).
 
-	Example:
+	Example::
+
 		# drivers/acpi/acpica/Makefile
 		ccflags-y			:= -Os -D_LINUX -DBUILDING_ACPICA
 		ccflags-$(CONFIG_ACPI_DEBUG)	+= -DACPI_DEBUG_OUTPUT
@@ -308,13 +330,15 @@ more details, with real examples.
 
 	asflags-y specifies options for assembling with $(AS).
 
-	Example:
+	Example::
+
 		#arch/sparc/kernel/Makefile
 		asflags-y := -ansi
 
 	ldflags-y specifies options for linking with $(LD).
 
-	Example:
+	Example::
+
 		#arch/cris/boot/compressed/Makefile
 		ldflags-y += -T $(srctree)/$(src)/decompress_$(arch-y).lds
 
@@ -325,18 +349,19 @@ more details, with real examples.
 	Options specified using subdir-* are added to the commandline before
 	the options specified using the non-subdir variants.
 
-	Example:
+	Example::
+
 		subdir-ccflags-y := -Werror
 
     CFLAGS_$@, AFLAGS_$@
-
 	CFLAGS_$@ and AFLAGS_$@ only apply to commands in current
 	kbuild makefile.
 
 	$(CFLAGS_$@) specifies per-file options for $(CC).  The $@
 	part has a literal value which specifies the file that it is for.
 
-	Example:
+	Example::
+
 		# drivers/scsi/Makefile
 		CFLAGS_aha152x.o =   -DAHA152X_STAT -DAUTOCONF
 		CFLAGS_gdth.o    = # -DDEBUG_GDTH=2 -D__SERIAL__ -D__COM2__ \
@@ -347,24 +372,27 @@ more details, with real examples.
 	$(AFLAGS_$@) is a similar feature for source files in assembly
 	languages.
 
-	Example:
+	Example::
+
 		# arch/arm/kernel/Makefile
 		AFLAGS_head.o        := -DTEXT_OFFSET=$(TEXT_OFFSET)
 		AFLAGS_crunch-bits.o := -Wa,-mcpu=ep9312
 		AFLAGS_iwmmxt.o      := -Wa,-mcpu=iwmmxt
 
 
---- 3.9 Dependency tracking
+3.9 Dependency tracking
+-----------------------
 
 	Kbuild tracks dependencies on the following:
-	1) All prerequisite files (both *.c and *.h)
-	2) CONFIG_ options used in all prerequisite files
+	1) All prerequisite files (both `*.c` and `*.h`)
+	2) `CONFIG_` options used in all prerequisite files
 	3) Command-line used to compile target
 
 	Thus, if you change an option to $(CC) all affected files will
 	be re-compiled.
 
---- 3.10 Special Rules
+3.10 Special Rules
+------------------
 
 	Special rules are used when the kbuild infrastructure does
 	not provide the required support. A typical example is
@@ -379,43 +407,47 @@ more details, with real examples.
 
 	Two variables are used when defining special rules:
 
-    $(src)
-	$(src) is a relative path which points to the directory
-	where the Makefile is located. Always use $(src) when
-	referring to files located in the src tree.
+	$(src)
+	    $(src) is a relative path which points to the directory
+	    where the Makefile is located. Always use $(src) when
+	    referring to files located in the src tree.
 
-    $(obj)
-	$(obj) is a relative path which points to the directory
-	where the target is saved. Always use $(obj) when
-	referring to generated files.
+	$(obj)
+	    $(obj) is a relative path which points to the directory
+	    where the target is saved. Always use $(obj) when
+	    referring to generated files.
+
+	    Example::
 
-	Example:
 		#drivers/scsi/Makefile
 		$(obj)/53c8xx_d.h: $(src)/53c7,8xx.scr $(src)/script_asm.pl
 			$(CPP) -DCHIP=810 - < $< | ... $(src)/script_asm.pl
 
-	This is a special rule, following the normal syntax
-	required by make.
-	The target file depends on two prerequisite files. References
-	to the target file are prefixed with $(obj), references
-	to prerequisites are referenced with $(src) (because they are not
-	generated files).
-
-    $(kecho)
-	echoing information to user in a rule is often a good practice
-	but when execution "make -s" one does not expect to see any output
-	except for warnings/errors.
-	To support this kbuild defines $(kecho) which will echo out the
-	text following $(kecho) to stdout except if "make -s" is used.
-
-	Example:
+	    This is a special rule, following the normal syntax
+	    required by make.
+
+	    The target file depends on two prerequisite files. References
+	    to the target file are prefixed with $(obj), references
+	    to prerequisites are referenced with $(src) (because they are not
+	    generated files).
+
+	$(kecho)
+	    echoing information to user in a rule is often a good practice
+	    but when execution "make -s" one does not expect to see any output
+	    except for warnings/errors.
+	    To support this kbuild defines $(kecho) which will echo out the
+	    text following $(kecho) to stdout except if "make -s" is used.
+
+	Example::
+
 		#arch/blackfin/boot/Makefile
 		$(obj)/vmImage: $(obj)/vmlinux.gz
 			$(call if_changed,uimage)
 			@$(kecho) 'Kernel: $@ is ready'
 
 
---- 3.11 $(CC) support functions
+3.11 $(CC) support functions
+----------------------------
 
 	The kernel may be built with several different versions of
 	$(CC), each supporting a unique set of features and options.
@@ -425,10 +457,11 @@ more details, with real examples.
 
     as-option
 	as-option is used to check if $(CC) -- when used to compile
-	assembler (*.S) files -- supports the given option. An optional
+	assembler (`*.S`) files -- supports the given option. An optional
 	second option may be specified if the first option is not supported.
 
-	Example:
+	Example::
+
 		#arch/sh/Makefile
 		cflags-y += $(call as-option,-Wa$(comma)-isa=$(isa-y),)
 
@@ -437,6 +470,21 @@ more details, with real examples.
 	The second argument is optional, and if supplied will be used
 	if first argument is not supported.
 
+    cc-ldoption
+	cc-ldoption is used to check if $(CC) when used to link object files
+	supports the given option.  An optional second option may be
+	specified if first option are not supported.
+
+	Example::
+
+		#arch/x86/kernel/Makefile
+		vsyscall-flags += $(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
+
+	In the above example, vsyscall-flags will be assigned the option
+	-Wl$(comma)--hash-style=sysv if it is supported by $(CC).
+	The second argument is optional, and if supplied will be used
+	if first argument is not supported.
+
     as-instr
 	as-instr checks if the assembler reports a specific instruction
 	and then outputs either option1 or option2
@@ -447,7 +495,8 @@ more details, with real examples.
 	cc-option is used to check if $(CC) supports a given option, and if
 	not supported to use an optional second option.
 
-	Example:
+	Example::
+
 		#arch/x86/Makefile
 		cflags-y += $(call cc-option,-march=pentium-mmx,-march=i586)
 
@@ -461,7 +510,8 @@ more details, with real examples.
 	cc-option-yn is used to check if gcc supports a given option
 	and return 'y' if supported, otherwise 'n'.
 
-	Example:
+	Example::
+
 		#arch/ppc/Makefile
 		biarch := $(call cc-option-yn, -m32)
 		aflags-$(biarch) += -a32
@@ -479,7 +529,8 @@ more details, with real examples.
 	because gcc 4.4 and later accept any unknown -Wno-* option and only
 	warn about it if there is another warning in the source file.
 
-	Example:
+	Example::
+
 		KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
 
 	In the above example, -Wno-unused-but-set-variable will be added to
@@ -490,7 +541,8 @@ more details, with real examples.
 	if version expression is true, or the fifth (if given) if the version
 	expression is false.
 
-	Example:
+	Example::
+
 		#fs/reiserfs/Makefile
 		ccflags-y := $(call cc-ifversion, -lt, 0402, -O1)
 
@@ -515,7 +567,8 @@ more details, with real examples.
 	build (host arch is different from target arch). And if CROSS_COMPILE
 	is already set then leave it with the old value.
 
-	Example:
+	Example::
+
 		#arch/m68k/Makefile
 		ifneq ($(SUBARCH),$(ARCH))
 		        ifeq ($(CROSS_COMPILE),)
@@ -523,7 +576,8 @@ more details, with real examples.
 			endif
 		endif
 
---- 3.12 $(LD) support functions
+3.12 $(LD) support functions
+----------------------------
 
     ld-option
 	ld-option is used to check if $(LD) supports the supplied option.
@@ -531,12 +585,14 @@ more details, with real examples.
 	The second argument is an optional option that can be used if the
 	first option is not supported by $(LD).
 
-	Example:
+	Example::
+
 		#Makefile
 		LDFLAGS_vmlinux += $(call ld-option, -X)
 
 
-=== 4 Host Program support
+4 Host Program support
+======================
 
 Kbuild supports building executables on the host for use during the
 compilation stage.
@@ -550,21 +606,24 @@ This can be done in two ways. Either add the dependency in a rule,
 or utilise the variable $(always).
 Both possibilities are described in the following.
 
---- 4.1 Simple Host Program
+4.1 Simple Host Program
+-----------------------
 
 	In some cases there is a need to compile and run a program on the
 	computer where the build is running.
 	The following line tells kbuild that the program bin2hex shall be
 	built on the build host.
 
-	Example:
+	Example::
+
 		hostprogs-y := bin2hex
 
 	Kbuild assumes in the above example that bin2hex is made from a single
 	c-source file named bin2hex.c located in the same directory as
 	the Makefile.
 
---- 4.2 Composite Host Programs
+4.2 Composite Host Programs
+---------------------------
 
 	Host programs can be made up based on composite objects.
 	The syntax used to define composite objects for host programs is
@@ -572,7 +631,8 @@ Both possibilities are described in the following.
 	$(<executable>-objs) lists all objects used to link the final
 	executable.
 
-	Example:
+	Example::
+
 		#scripts/lxdialog/Makefile
 		hostprogs-y   := lxdialog
 		lxdialog-objs := checklist.o lxdialog.o
@@ -580,16 +640,19 @@ Both possibilities are described in the following.
 	Objects with extension .o are compiled from the corresponding .c
 	files. In the above example, checklist.c is compiled to checklist.o
 	and lxdialog.c is compiled to lxdialog.o.
+
 	Finally, the two .o files are linked to the executable, lxdialog.
 	Note: The syntax <executable>-y is not permitted for host-programs.
 
---- 4.3 Using C++ for host programs
+4.3 Using C++ for host programs
+-------------------------------
 
 	kbuild offers support for host programs written in C++. This was
 	introduced solely to support kconfig, and is not recommended
 	for general use.
 
-	Example:
+	Example::
+
 		#scripts/kconfig/Makefile
 		hostprogs-y   := qconf
 		qconf-cxxobjs := qconf.o
@@ -600,13 +663,15 @@ Both possibilities are described in the following.
 	If qconf is composed of a mixture of .c and .cc files, then an
 	additional line can be used to identify this.
 
-	Example:
+	Example::
+
 		#scripts/kconfig/Makefile
 		hostprogs-y   := qconf
 		qconf-cxxobjs := qconf.o
 		qconf-objs    := check.o
 
---- 4.4 Controlling compiler options for host programs
+4.4 Controlling compiler options for host programs
+--------------------------------------------------
 
 	When compiling host programs, it is possible to set specific flags.
 	The programs will always be compiled utilising $(HOSTCC) passed
@@ -614,27 +679,31 @@ Both possibilities are described in the following.
 	To set flags that will take effect for all host programs created
 	in that Makefile, use the variable HOST_EXTRACFLAGS.
 
-	Example:
+	Example::
+
 		#scripts/lxdialog/Makefile
 		HOST_EXTRACFLAGS += -I/usr/include/ncurses
 
 	To set specific flags for a single file the following construction
 	is used:
 
-	Example:
+	Example::
+
 		#arch/ppc64/boot/Makefile
 		HOSTCFLAGS_piggyback.o := -DKERNELBASE=$(KERNELBASE)
 
 	It is also possible to specify additional options to the linker.
 
-	Example:
+	Example::
+
 		#scripts/kconfig/Makefile
 		HOSTLDLIBS_qconf := -L$(QTDIR)/lib
 
 	When linking qconf, it will be passed the extra option
 	"-L$(QTDIR)/lib".
 
---- 4.5 When host programs are actually built
+4.5 When host programs are actually built
+-----------------------------------------
 
 	Kbuild will only build host-programs when they are referenced
 	as a prerequisite.
@@ -642,7 +711,8 @@ Both possibilities are described in the following.
 
 	(1) List the prerequisite explicitly in a special rule.
 
-	Example:
+	Example::
+
 		#drivers/pci/Makefile
 		hostprogs-y := gen-devlist
 		$(obj)/devlist.h: $(src)/pci.ids $(obj)/gen-devlist
@@ -653,11 +723,13 @@ Both possibilities are described in the following.
 	the host programs in special rules must be prefixed with $(obj).
 
 	(2) Use $(always)
+
 	When there is no suitable special rule, and the host program
 	shall be built when a makefile is entered, the $(always)
 	variable shall be used.
 
-	Example:
+	Example::
+
 		#scripts/lxdialog/Makefile
 		hostprogs-y   := lxdialog
 		always        := $(hostprogs-y)
@@ -665,11 +737,13 @@ Both possibilities are described in the following.
 	This will tell kbuild to build lxdialog even if not referenced in
 	any rule.
 
---- 4.6 Using hostprogs-$(CONFIG_FOO)
+4.6 Using hostprogs-$(CONFIG_FOO)
+---------------------------------
 
 	A typical pattern in a Kbuild file looks like this:
 
-	Example:
+	Example::
+
 		#scripts/Makefile
 		hostprogs-$(CONFIG_KALLSYMS) += kallsyms
 
@@ -679,7 +753,8 @@ Both possibilities are described in the following.
 	like hostprogs-y. But only hostprogs-y is recommended to be used
 	when no CONFIG symbols are involved.
 
-=== 5 Kbuild clean infrastructure
+5 Kbuild clean infrastructure
+=============================
 
 "make clean" deletes most generated files in the obj tree where the kernel
 is compiled. This includes generated files such as host programs.
@@ -691,7 +766,8 @@ generated by kbuild are deleted all over the kernel src tree when
 
 Additional files can be specified in kbuild makefiles by use of $(clean-files).
 
-	Example:
+	Example::
+
 		#lib/Makefile
 		clean-files := crc32table.h
 
@@ -701,7 +777,8 @@ Makefile, except if prefixed with $(objtree).
 
 To delete a directory hierarchy use:
 
-	Example:
+	Example::
+
 		#scripts/package/Makefile
 		clean-dirs := $(objtree)/debian/
 
@@ -711,7 +788,8 @@ subdirectories.
 To exclude certain files from make clean, use the $(no-clean-files) variable.
 This is only a special case used in the top level Kbuild file:
 
-	Example:
+	Example::
+
 		#Kbuild
 		no-clean-files := $(bounds-file) $(offsets-file)
 
@@ -719,7 +797,8 @@ Usually kbuild descends down in subdirectories due to "obj-* := dir/",
 but in the architecture makefiles where the kbuild infrastructure
 is not sufficient this sometimes needs to be explicit.
 
-	Example:
+	Example::
+
 		#arch/x86/boot/Makefile
 		subdir- := compressed/
 
@@ -729,7 +808,8 @@ directory compressed/ when "make clean" is executed.
 To support the clean infrastructure in the Makefiles that build the
 final bootimage there is an optional target named archclean:
 
-	Example:
+	Example::
+
 		#arch/x86/Makefile
 		archclean:
 			$(Q)$(MAKE) $(clean)=arch/x86/boot
@@ -745,7 +825,8 @@ is not operational at that point.
 Note 2: All directories listed in core-y, libs-y, drivers-y and net-y will
 be visited during "make clean".
 
-=== 6 Architecture Makefiles
+6 Architecture Makefiles
+========================
 
 The top level Makefile sets up the environment and does the preparation,
 before starting to descend down in the individual directories.
@@ -756,6 +837,7 @@ To do so, arch/$(ARCH)/Makefile sets up a number of variables and defines
 a few targets.
 
 When kbuild executes, the following steps are followed (roughly):
+
 1) Configuration of the kernel => produce .config
 2) Store kernel version in include/linux/version.h
 3) Updating all other prerequisites to the target prepare:
@@ -773,37 +855,45 @@ When kbuild executes, the following steps are followed (roughly):
    - Preparing initrd images and the like
 
 
---- 6.1 Set variables to tweak the build to the architecture
+6.1 Set variables to tweak the build to the architecture
+--------------------------------------------------------
 
-    LDFLAGS		Generic $(LD) options
+    LDFLAGS
+	Generic $(LD) options
 
 	Flags used for all invocations of the linker.
 	Often specifying the emulation is sufficient.
 
-	Example:
+	Example::
+
 		#arch/s390/Makefile
 		LDFLAGS         := -m elf_s390
+
 	Note: ldflags-y can be used to further customise
 	the flags used. See chapter 3.7.
 
-    LDFLAGS_vmlinux	Options for $(LD) when linking vmlinux
+    LDFLAGS_vmlinux
+	Options for $(LD) when linking vmlinux
 
 	LDFLAGS_vmlinux is used to specify additional flags to pass to
 	the linker when linking the final vmlinux image.
 	LDFLAGS_vmlinux uses the LDFLAGS_$@ support.
 
-	Example:
+	Example::
+
 		#arch/x86/Makefile
 		LDFLAGS_vmlinux := -e stext
 
-    OBJCOPYFLAGS	objcopy flags
+    OBJCOPYFLAGS
+	objcopy flags
 
 	When $(call if_changed,objcopy) is used to translate a .o file,
 	the flags specified in OBJCOPYFLAGS will be used.
 	$(call if_changed,objcopy) is often used to generate raw binaries on
 	vmlinux.
 
-	Example:
+	Example::
+
 		#arch/s390/Makefile
 		OBJCOPYFLAGS := -O binary
 
@@ -814,30 +904,34 @@ When kbuild executes, the following steps are followed (roughly):
 	In this example, the binary $(obj)/image is a binary version of
 	vmlinux. The usage of $(call if_changed,xxx) will be described later.
 
-    KBUILD_AFLAGS		$(AS) assembler flags
+    KBUILD_AFLAGS
+	$(AS) assembler flags
 
 	Default value - see top level Makefile
 	Append or modify as required per architecture.
 
-	Example:
+	Example::
+
 		#arch/sparc64/Makefile
 		KBUILD_AFLAGS += -m64 -mcpu=ultrasparc
 
-    KBUILD_CFLAGS		$(CC) compiler flags
+    KBUILD_CFLAGS
+	$(CC) compiler flags
 
 	Default value - see top level Makefile
 	Append or modify as required per architecture.
 
 	Often, the KBUILD_CFLAGS variable depends on the configuration.
 
-	Example:
+	Example::
+
 		#arch/x86/boot/compressed/Makefile
 		cflags-$(CONFIG_X86_32) := -march=i386
 		cflags-$(CONFIG_X86_64) := -mcmodel=small
 		KBUILD_CFLAGS += $(cflags-y)
 
 	Many arch Makefiles dynamically run the target C compiler to
-	probe supported options:
+	probe supported options::
 
 		#arch/x86/Makefile
 
@@ -853,32 +947,39 @@ When kbuild executes, the following steps are followed (roughly):
 	The first example utilises the trick that a config option expands
 	to 'y' when selected.
 
-    KBUILD_AFLAGS_KERNEL	$(AS) options specific for built-in
+    KBUILD_AFLAGS_KERNEL
+	$(AS) options specific for built-in
 
 	$(KBUILD_AFLAGS_KERNEL) contains extra C compiler flags used to compile
 	resident kernel code.
 
-    KBUILD_AFLAGS_MODULE   Options for $(AS) when building modules
+    KBUILD_AFLAGS_MODULE
+	Options for $(AS) when building modules
 
 	$(KBUILD_AFLAGS_MODULE) is used to add arch-specific options that
 	are used for $(AS).
+
 	From commandline AFLAGS_MODULE shall be used (see kbuild.txt).
 
-    KBUILD_CFLAGS_KERNEL	$(CC) options specific for built-in
+    KBUILD_CFLAGS_KERNEL
+	$(CC) options specific for built-in
 
 	$(KBUILD_CFLAGS_KERNEL) contains extra C compiler flags used to compile
 	resident kernel code.
 
-    KBUILD_CFLAGS_MODULE   Options for $(CC) when building modules
+    KBUILD_CFLAGS_MODULE
+	Options for $(CC) when building modules
 
 	$(KBUILD_CFLAGS_MODULE) is used to add arch-specific options that
 	are used for $(CC).
 	From commandline CFLAGS_MODULE shall be used (see kbuild.txt).
 
-    KBUILD_LDFLAGS_MODULE   Options for $(LD) when linking modules
+    KBUILD_LDFLAGS_MODULE
+	Options for $(LD) when linking modules
 
 	$(KBUILD_LDFLAGS_MODULE) is used to add arch-specific options
 	used when linking modules. This is often a linker script.
+
 	From commandline LDFLAGS_MODULE shall be used (see kbuild.txt).
 
     KBUILD_ARFLAGS   Options for $(AR) when creating archives
@@ -894,7 +995,8 @@ When kbuild executes, the following steps are followed (roughly):
 	means for an architecture to override the defaults.
 
 
---- 6.2 Add prerequisites to archheaders:
+6.2 Add prerequisites to archheaders
+------------------------------------
 
 	The archheaders: rule is used to generate header files that
 	may be installed into user space by "make header_install" or
@@ -907,13 +1009,15 @@ When kbuild executes, the following steps are followed (roughly):
 	architecture itself.
 
 
---- 6.3 Add prerequisites to archprepare:
+6.3 Add prerequisites to archprepare
+------------------------------------
 
 	The archprepare: rule is used to list prerequisites that need to be
 	built before starting to descend down in the subdirectories.
 	This is usually used for header files containing assembler constants.
 
-		Example:
+	Example::
+
 		#arch/arm/Makefile
 		archprepare: maketools
 
@@ -923,7 +1027,8 @@ When kbuild executes, the following steps are followed (roughly):
 	generating offset header files.
 
 
---- 6.4 List directories to visit when descending
+6.4 List directories to visit when descending
+---------------------------------------------
 
 	An arch Makefile cooperates with the top Makefile to define variables
 	which specify how to build the vmlinux file.  Note that there is no
@@ -931,28 +1036,34 @@ When kbuild executes, the following steps are followed (roughly):
 	machinery is all architecture-independent.
 
 
-    head-y, init-y, core-y, libs-y, drivers-y, net-y
+	head-y, init-y, core-y, libs-y, drivers-y, net-y
+	    $(head-y) lists objects to be linked first in vmlinux.
 
-	$(head-y) lists objects to be linked first in vmlinux.
-	$(libs-y) lists directories where a lib.a archive can be located.
-	The rest list directories where a built-in.a object file can be
-	located.
+	    $(libs-y) lists directories where a lib.a archive can be located.
 
-	$(init-y) objects will be located after $(head-y).
-	Then the rest follows in this order:
-	$(core-y), $(libs-y), $(drivers-y) and $(net-y).
+	    The rest list directories where a built-in.a object file can be
+	    located.
 
-	The top level Makefile defines values for all generic directories,
-	and arch/$(ARCH)/Makefile only adds architecture-specific directories.
+	    $(init-y) objects will be located after $(head-y).
+
+	    Then the rest follows in this order:
+
+		$(core-y), $(libs-y), $(drivers-y) and $(net-y).
+
+	    The top level Makefile defines values for all generic directories,
+	    and arch/$(ARCH)/Makefile only adds architecture-specific
+	    directories.
+
+	    Example::
 
-	Example:
 		#arch/sparc64/Makefile
 		core-y += arch/sparc64/kernel/
 		libs-y += arch/sparc64/prom/ arch/sparc64/lib/
 		drivers-$(CONFIG_OPROFILE)  += arch/sparc64/oprofile/
 
 
---- 6.5 Architecture-specific boot images
+6.5 Architecture-specific boot images
+-------------------------------------
 
 	An arch Makefile specifies goals that take the vmlinux file, compress
 	it, wrap it in bootstrapping code, and copy the resulting files
@@ -970,7 +1081,8 @@ When kbuild executes, the following steps are followed (roughly):
 	arch/$(ARCH)/Makefile, and use the full path when calling down
 	into the arch/$(ARCH)/boot/Makefile.
 
-	Example:
+	Example::
+
 		#arch/x86/Makefile
 		boot := arch/x86/boot
 		bzImage: vmlinux
@@ -983,7 +1095,8 @@ When kbuild executes, the following steps are followed (roughly):
 	but executing "make help" will list all relevant targets.
 	To support this, $(archhelp) must be defined.
 
-	Example:
+	Example::
+
 		#arch/x86/Makefile
 		define archhelp
 		  echo  '* bzImage      - Image (arch/$(ARCH)/boot/bzImage)'
@@ -997,25 +1110,30 @@ When kbuild executes, the following steps are followed (roughly):
 	Add a new prerequisite to all: to select a default goal different
 	from vmlinux.
 
-	Example:
+	Example::
+
 		#arch/x86/Makefile
 		all: bzImage
 
 	When "make" is executed without arguments, bzImage will be built.
 
---- 6.6 Building non-kbuild targets
+6.6 Building non-kbuild targets
+-------------------------------
 
     extra-y
-
 	extra-y specifies additional targets created in the current
-	directory, in addition to any targets specified by obj-*.
+	directory, in addition to any targets specified by `obj-*`.
 
 	Listing all targets in extra-y is required for two purposes:
+
 	1) Enable kbuild to check changes in command lines
+
 	   - When $(call if_changed,xxx) is used
+
 	2) kbuild knows what files to delete during "make clean"
 
-	Example:
+	Example::
+
 		#arch/x86/kernel/Makefile
 		extra-y := head.o init_task.o
 
@@ -1023,16 +1141,17 @@ When kbuild executes, the following steps are followed (roughly):
 	shall be built, but shall not be linked as part of built-in.a.
 
 
---- 6.7 Commands useful for building a boot image
+6.7 Commands useful for building a boot image
+---------------------------------------------
 
-	Kbuild provides a few macros that are useful when building a
-	boot image.
+    Kbuild provides a few macros that are useful when building a
+    boot image.
 
     if_changed
-
 	if_changed is the infrastructure used for the following commands.
 
-	Usage:
+	Usage::
+
 		target: source(s) FORCE
 			$(call if_changed,ld/objcopy/gzip/...)
 
@@ -1050,12 +1169,16 @@ When kbuild executes, the following steps are followed (roughly):
 	Note: It is a typical mistake to forget the FORCE prerequisite.
 	Another common pitfall is that whitespace is sometimes
 	significant; for instance, the below will fail (note the extra space
-	after the comma):
+	after the comma)::
+
 		target: source(s) FORCE
-	#WRONG!#	$(call if_changed, ld/objcopy/gzip/...)
 
-        Note: if_changed should not be used more than once per target.
+	**WRONG!**	$(call if_changed, ld/objcopy/gzip/...)
+
+        Note:
+	      if_changed should not be used more than once per target.
               It stores the executed command in a corresponding .cmd
+
         file and multiple calls would result in overwrites and
         unwanted results when the target is up to date and only the
         tests on changed commands trigger execution of commands.
@@ -1063,7 +1186,8 @@ When kbuild executes, the following steps are followed (roughly):
     ld
 	Link target. Often, LDFLAGS_$@ is used to set specific options to ld.
 
-	Example:
+	Example::
+
 		#arch/x86/boot/Makefile
 		LDFLAGS_bootsect := -Ttext 0x0 -s --oformat binary
 		LDFLAGS_setup    := -Ttext 0x0 -s --oformat binary -e begtext
@@ -1077,12 +1201,15 @@ When kbuild executes, the following steps are followed (roughly):
 	LDFLAGS_$@ syntax - one for each potential target.
 	$(targets) are assigned all potential targets, by which kbuild knows
 	the targets and will:
+
 		1) check for commandline changes
 		2) delete target during make clean
 
 	The ": %: %.o" part of the prerequisite is a shorthand that
 	frees us from listing the setup.o and bootsect.o files.
-	Note: It is a common mistake to forget the "targets :=" assignment,
+
+	Note:
+	      It is a common mistake to forget the "targets :=" assignment,
 	      resulting in the target file being recompiled for no
 	      obvious reason.
 
@@ -1094,7 +1221,8 @@ When kbuild executes, the following steps are followed (roughly):
     gzip
 	Compress target. Use maximum compression to compress target.
 
-	Example:
+	Example::
+
 		#arch/x86/boot/compressed/Makefile
 		$(obj)/vmlinux.bin.gz: $(vmlinux.bin.all-y) FORCE
 			$(call if_changed,gzip)
@@ -1105,26 +1233,30 @@ When kbuild executes, the following steps are followed (roughly):
 	in an init section in the image. Platform code *must* copy the
 	blob to non-init memory prior to calling unflatten_device_tree().
 
-	To use this command, simply add *.dtb into obj-y or targets, or make
-	some other target depend on %.dtb
+	To use this command, simply add `*.dtb` into obj-y or targets, or make
+	some other target depend on `%.dtb`
 
-	A central rule exists to create $(obj)/%.dtb from $(src)/%.dts;
+	A central rule exists to create `$(obj)/%.dtb` from `$(src)/%.dts`;
 	architecture Makefiles do no need to explicitly write out that rule.
 
-	Example:
+	Example::
+
 		targets += $(dtb-y)
 		DTC_FLAGS ?= -p 1024
 
---- 6.8 Custom kbuild commands
+6.8 Custom kbuild commands
+--------------------------
 
 	When kbuild is executing with KBUILD_VERBOSE=0, then only a shorthand
 	of a command is normally displayed.
 	To enable this behaviour for custom commands kbuild requires
-	two variables to be set:
-	quiet_cmd_<command>	- what shall be echoed
-	      cmd_<command>	- the command to execute
+	two variables to be set::
+
+		quiet_cmd_<command>	- what shall be echoed
+		      cmd_<command>	- the command to execute
+
+	Example::
 
-	Example:
 		#
 		quiet_cmd_image = BUILD   $@
 		      cmd_image = $(obj)/tools/build $(BUILDFLAGS) \
@@ -1135,9 +1267,9 @@ When kbuild executes, the following steps are followed (roughly):
 			$(call if_changed,image)
 			@echo 'Kernel: $@ is ready'
 
-	When updating the $(obj)/bzImage target, the line
+	When updating the $(obj)/bzImage target, the line:
 
-	BUILD    arch/x86/boot/bzImage
+		BUILD    arch/x86/boot/bzImage
 
 	will be displayed with "make KBUILD_VERBOSE=0".
 
@@ -1148,9 +1280,10 @@ When kbuild executes, the following steps are followed (roughly):
 	arch/$(ARCH)/kernel/vmlinux.lds is used.
 	The script is a preprocessed variant of the file vmlinux.lds.S
 	located in the same directory.
-	kbuild knows .lds files and includes a rule *lds.S -> *lds.
+	kbuild knows .lds files and includes a rule `*lds.S` -> `*lds`.
+
+	Example::
 
-	Example:
 		#arch/x86/kernel/Makefile
 		always := vmlinux.lds
 
@@ -1162,17 +1295,19 @@ When kbuild executes, the following steps are followed (roughly):
 	The assignment to $(CPPFLAGS_vmlinux.lds) tells kbuild to use the
 	specified options when building the target vmlinux.lds.
 
-	When building the *.lds target, kbuild uses the variables:
-	KBUILD_CPPFLAGS	: Set in top-level Makefile
-	cppflags-y	: May be set in the kbuild makefile
-	CPPFLAGS_$(@F)  : Target-specific flags.
-	                  Note that the full filename is used in this
-	                  assignment.
+	When building the `*.lds` target, kbuild uses the variables::
 
-	The kbuild infrastructure for *lds files is used in several
+		KBUILD_CPPFLAGS	: Set in top-level Makefile
+		cppflags-y	: May be set in the kbuild makefile
+		CPPFLAGS_$(@F)  : Target-specific flags.
+				Note that the full filename is used in this
+				assignment.
+
+	The kbuild infrastructure for `*lds` files is used in several
 	architecture-specific files.
 
---- 6.10 Generic header files
+6.10 Generic header files
+-------------------------
 
 	The directory include/asm-generic contains the header files
 	that may be shared between individual architectures.
@@ -1180,7 +1315,8 @@ When kbuild executes, the following steps are followed (roughly):
 	to list the file in the Kbuild file.
 	See "7.2 generic-y" for further info on syntax etc.
 
---- 6.11 Post-link pass
+6.11 Post-link pass
+-------------------
 
 	If the file arch/xxx/Makefile.postlink exists, this makefile
 	will be invoked for post-link objects (vmlinux and modules.ko)
@@ -1195,15 +1331,17 @@ When kbuild executes, the following steps are followed (roughly):
 	For example, powerpc uses this to check relocation sanity of
 	the linked vmlinux file.
 
-=== 7 Kbuild syntax for exported headers
+7 Kbuild syntax for exported headers
+------------------------------------
 
 The kernel includes a set of headers that is exported to userspace.
 Many headers can be exported as-is but other headers require a
 minimal pre-processing before they are ready for user-space.
 The pre-processing does:
+
 - drop kernel-specific annotations
 - drop include of compiler.h
-- drop all sections that are kernel internal (guarded by ifdef __KERNEL__)
+- drop all sections that are kernel internal (guarded by `ifdef __KERNEL__`)
 
 All headers under include/uapi/, include/generated/uapi/,
 arch/<arch>/include/uapi/ and arch/<arch>/include/generated/uapi/
@@ -1213,40 +1351,45 @@ A Kbuild file may be defined under arch/<arch>/include/uapi/asm/ and
 arch/<arch>/include/asm/ to list asm files coming from asm-generic.
 See subsequent chapter for the syntax of the Kbuild file.
 
---- 7.1 no-export-headers
+7.1 no-export-headers
+---------------------
 
 	no-export-headers is essentially used by include/uapi/linux/Kbuild to
 	avoid exporting specific headers (e.g. kvm.h) on architectures that do
 	not support it. It should be avoided as much as possible.
 
---- 7.2 generic-y
+7.2 generic-y
+-------------
 
 	If an architecture uses a verbatim copy of a header from
 	include/asm-generic then this is listed in the file
 	arch/$(ARCH)/include/asm/Kbuild like this:
 
-		Example:
+		Example::
+
 			#arch/x86/include/asm/Kbuild
 			generic-y += termios.h
 			generic-y += rtc.h
 
 	During the prepare phase of the build a wrapper include
-	file is generated in the directory:
+	file is generated in the directory::
 
 		arch/$(ARCH)/include/generated/asm
 
 	When a header is exported where the architecture uses
 	the generic header a similar wrapper is generated as part
-	of the set of exported headers in the directory:
+	of the set of exported headers in the directory::
 
 		usr/include/asm
 
 	The generated wrapper will in both cases look like the following:
 
-		Example: termios.h
+		Example: termios.h::
+
 			#include <asm-generic/termios.h>
 
---- 7.3 generated-y
+7.3 generated-y
+---------------
 
 	If an architecture generates other header files alongside generic-y
 	wrappers, generated-y specifies them.
@@ -1254,11 +1397,13 @@ See subsequent chapter for the syntax of the Kbuild file.
 	This prevents them being treated as stale asm-generic wrappers and
 	removed.
 
-		Example:
+		Example::
+
 			#arch/x86/include/asm/Kbuild
 			generated-y += syscalls_32.h
 
---- 7.4 mandatory-y
+7.4 mandatory-y
+---------------
 
 	mandatory-y is essentially used by include/(uapi/)asm-generic/Kbuild
 	to define the minimum set of ASM headers that all architectures must have.
@@ -1270,12 +1415,12 @@ See subsequent chapter for the syntax of the Kbuild file.
 	The convention is to list one subdir per line and
 	preferably in alphabetic order.
 
-=== 8 Kbuild Variables
+8 Kbuild Variables
+==================
 
 The top Makefile exports the following variables:
 
     VERSION, PATCHLEVEL, SUBLEVEL, EXTRAVERSION
-
 	These variables define the current kernel version.  A few arch
 	Makefiles actually use these values directly; they should use
 	$(KERNELRELEASE) instead.
@@ -1289,32 +1434,28 @@ The top Makefile exports the following variables:
 	such as "-pre4", and is often blank.
 
     KERNELRELEASE
-
 	$(KERNELRELEASE) is a single string such as "2.4.0-pre4", suitable
 	for constructing installation directory names or showing in
 	version strings.  Some arch Makefiles use it for this purpose.
 
     ARCH
-
 	This variable defines the target architecture, such as "i386",
 	"arm", or "sparc". Some kbuild Makefiles test $(ARCH) to
 	determine which files to compile.
 
 	By default, the top Makefile sets $(ARCH) to be the same as the
 	host system architecture.  For a cross build, a user may
-	override the value of $(ARCH) on the command line:
+	override the value of $(ARCH) on the command line::
 
 	    make ARCH=m68k ...
 
 
     INSTALL_PATH
-
 	This variable defines a place for the arch Makefiles to install
 	the resident kernel image and System.map file.
 	Use this for architecture-specific install targets.
 
     INSTALL_MOD_PATH, MODLIB
-
 	$(INSTALL_MOD_PATH) specifies a prefix to $(MODLIB) for module
 	installation.  This variable is not defined in the Makefile but
 	may be passed in by the user if desired.
@@ -1325,7 +1466,6 @@ The top Makefile exports the following variables:
 	override this value on the command line if desired.
 
     INSTALL_MOD_STRIP
-
 	If this variable is specified, it will cause modules to be stripped
 	after they are installed.  If INSTALL_MOD_STRIP is '1', then the
 	default option --strip-debug will be used.  Otherwise, the
@@ -1333,7 +1473,8 @@ The top Makefile exports the following variables:
 	command.
 
 
-=== 9 Makefile language
+9 Makefile language
+===================
 
 The kernel Makefiles are designed to be run with GNU Make.  The Makefiles
 use only the documented features of GNU Make, but they do use many
@@ -1352,18 +1493,17 @@ time the left-hand side is used.
 There are some cases where "=" is appropriate.  Usually, though, ":="
 is the right choice.
 
-=== 10 Credits
+10 Credits
+==========
 
-Original version made by Michael Elizabeth Chastain, <mailto:mec@shout.net>
-Updates by Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
-Updates by Sam Ravnborg <sam@ravnborg.org>
-Language QA by Jan Engelhardt <jengelh@gmx.de>
+- Original version made by Michael Elizabeth Chastain, <mailto:mec@shout.net>
+- Updates by Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
+- Updates by Sam Ravnborg <sam@ravnborg.org>
+- Language QA by Jan Engelhardt <jengelh@gmx.de>
 
-=== 11 TODO
+11 TODO
+=======
 
 - Describe how kbuild supports shipped files with _shipped.
 - Generating offset header files.
 - Add more variables to section 7?
-
-
-
diff --git a/Documentation/kbuild/modules.txt b/Documentation/kbuild/modules.rst
similarity index 84%
rename from Documentation/kbuild/modules.txt
rename to Documentation/kbuild/modules.rst
index 80295c613e37..24e763482650 100644
--- a/Documentation/kbuild/modules.txt
+++ b/Documentation/kbuild/modules.rst
@@ -1,8 +1,10 @@
+=========================
 Building External Modules
+=========================
 
 This document describes how to build an out-of-tree kernel module.
 
-=== Table of Contents
+.. Table of Contents
 
 	=== 1 Introduction
 	=== 2 How to Build External Modules
@@ -31,7 +33,8 @@ This document describes how to build an out-of-tree kernel module.
 
 
 
-=== 1. Introduction
+1. Introduction
+===============
 
 "kbuild" is the build system used by the Linux kernel. Modules must use
 kbuild to stay compatible with changes in the build infrastructure and
@@ -48,7 +51,8 @@ easily accomplished, and a complete example will be presented in
 section 3.
 
 
-=== 2. How to Build External Modules
+2. How to Build External Modules
+================================
 
 To build external modules, you must have a prebuilt kernel available
 that contains the configuration and header files used in the build.
@@ -65,25 +69,27 @@ NOTE: "modules_prepare" will not build Module.symvers even if
 CONFIG_MODVERSIONS is set; therefore, a full kernel build needs to be
 executed to make module versioning work.
 
---- 2.1 Command Syntax
+2.1 Command Syntax
+==================
 
-	The command to build an external module is:
+	The command to build an external module is::
 
 		$ make -C <path_to_kernel_src> M=$PWD
 
 	The kbuild system knows that an external module is being built
 	due to the "M=<dir>" option given in the command.
 
-	To build against the running kernel use:
+	To build against the running kernel use::
 
 		$ make -C /lib/modules/`uname -r`/build M=$PWD
 
 	Then to install the module(s) just built, add the target
-	"modules_install" to the command:
+	"modules_install" to the command::
 
 		$ make -C /lib/modules/`uname -r`/build M=$PWD modules_install
 
---- 2.2 Options
+2.2 Options
+===========
 
 	($KDIR refers to the path of the kernel source directory.)
 
@@ -100,7 +106,8 @@ executed to make module versioning work.
 		directory where the external module (kbuild file) is
 		located.
 
---- 2.3 Targets
+2.3 Targets
+===========
 
 	When building an external module, only a subset of the "make"
 	targets are available.
@@ -130,26 +137,29 @@ executed to make module versioning work.
 	help
 		List the available targets for external modules.
 
---- 2.4 Building Separate Files
+2.4 Building Separate Files
+===========================
 
 	It is possible to build single files that are part of a module.
 	This works equally well for the kernel, a module, and even for
 	external modules.
 
-	Example (The module foo.ko, consist of bar.o and baz.o):
+	Example (The module foo.ko, consist of bar.o and baz.o)::
+
 		make -C $KDIR M=$PWD bar.lst
 		make -C $KDIR M=$PWD baz.o
 		make -C $KDIR M=$PWD foo.ko
 		make -C $KDIR M=$PWD ./
 
 
-=== 3. Creating a Kbuild File for an External Module
+3. Creating a Kbuild File for an External Module
+================================================
 
 In the last section we saw the command to build a module for the
 running kernel. The module is not actually built, however, because a
 build file is required. Contained in this file will be the name of
 the module(s) being built, along with the list of requisite source
-files. The file may be as simple as a single line:
+files. The file may be as simple as a single line::
 
 	obj-m := <module_name>.o
 
@@ -157,15 +167,15 @@ The kbuild system will build <module_name>.o from <module_name>.c,
 and, after linking, will result in the kernel module <module_name>.ko.
 The above line can be put in either a "Kbuild" file or a "Makefile."
 When the module is built from multiple sources, an additional line is
-needed listing the files:
+needed listing the files::
 
 	<module_name>-y := <src1>.o <src2>.o ...
 
 NOTE: Further documentation describing the syntax used by kbuild is
-located in Documentation/kbuild/makefiles.txt.
+located in Documentation/kbuild/makefiles.rst.
 
 The examples below demonstrate how to create a build file for the
-module 8123.ko, which is built from the following files:
+module 8123.ko, which is built from the following files::
 
 	8123_if.c
 	8123_if.h
@@ -181,7 +191,8 @@ module 8123.ko, which is built from the following files:
 	but should be filtered out from kbuild due to possible name
 	clashes.
 
-	Example 1:
+	Example 1::
+
 		--> filename: Makefile
 		ifneq ($(KERNELRELEASE),)
 		# kbuild part of makefile
@@ -209,14 +220,16 @@ module 8123.ko, which is built from the following files:
 	line; the second pass is by the kbuild system, which is
 	initiated by the parameterized "make" in the default target.
 
---- 3.2 Separate Kbuild File and Makefile
+3.2 Separate Kbuild File and Makefile
+-------------------------------------
 
 	In newer versions of the kernel, kbuild will first look for a
 	file named "Kbuild," and only if that is not found, will it
 	then look for a makefile. Utilizing a "Kbuild" file allows us
 	to split up the makefile from example 1 into two files:
 
-	Example 2:
+	Example 2::
+
 		--> filename: Kbuild
 		obj-m  := 8123.o
 		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
@@ -238,7 +251,8 @@ module 8123.ko, which is built from the following files:
 
 	The next example shows a backward compatible version.
 
-	Example 3:
+	Example 3::
+
 		--> filename: Kbuild
 		obj-m  := 8123.o
 		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
@@ -266,7 +280,8 @@ module 8123.ko, which is built from the following files:
 	makefiles, to be used when the "make" and kbuild parts are
 	split into separate files.
 
---- 3.3 Binary Blobs
+3.3 Binary Blobs
+----------------
 
 	Some external modules need to include an object file as a blob.
 	kbuild has support for this, but requires the blob file to be
@@ -277,7 +292,7 @@ module 8123.ko, which is built from the following files:
 
 	Throughout this section, 8123_bin.o_shipped has been used to
 	build the kernel module 8123.ko; it has been included as
-	8123_bin.o.
+	8123_bin.o::
 
 		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
 
@@ -285,11 +300,12 @@ module 8123.ko, which is built from the following files:
 	files and the binary file, kbuild will pick up different rules
 	when creating the object file for the module.
 
---- 3.4 Building Multiple Modules
+3.4 Building Multiple Modules
+=============================
 
 	kbuild supports building multiple modules with a single build
 	file. For example, if you wanted to build two modules, foo.ko
-	and bar.ko, the kbuild lines would be:
+	and bar.ko, the kbuild lines would be::
 
 		obj-m := foo.o bar.o
 		foo-y := <foo_srcs>
@@ -298,7 +314,8 @@ module 8123.ko, which is built from the following files:
 	It is that simple!
 
 
-=== 4. Include Files
+4. Include Files
+================
 
 Within the kernel, header files are kept in standard locations
 according to the following rule:
@@ -310,22 +327,25 @@ according to the following rule:
 	  of the kernel that are located in different directories, then
 	  the file is placed in include/linux/.
 
-	  NOTE: There are two notable exceptions to this rule: larger
-	  subsystems have their own directory under include/, such as
-	  include/scsi; and architecture specific headers are located
-	  under arch/$(ARCH)/include/.
+	  NOTE:
+	      There are two notable exceptions to this rule: larger
+	      subsystems have their own directory under include/, such as
+	      include/scsi; and architecture specific headers are located
+	      under arch/$(ARCH)/include/.
 
---- 4.1 Kernel Includes
+4.1 Kernel Includes
+-------------------
 
 	To include a header file located under include/linux/, simply
-	use:
+	use::
 
 		#include <linux/module.h>
 
 	kbuild will add options to "gcc" so the relevant directories
 	are searched.
 
---- 4.2 Single Subdirectory
+4.2 Single Subdirectory
+-----------------------
 
 	External modules tend to place header files in a separate
 	include/ directory where their source is located, although this
@@ -334,7 +354,7 @@ according to the following rule:
 
 	Using the example from section 3, if we moved 8123_if.h to a
 	subdirectory named include, the resulting kbuild file would
-	look like:
+	look like::
 
 		--> filename: Kbuild
 		obj-m := 8123.o
@@ -346,23 +366,24 @@ according to the following rule:
 	the path. This is a limitation of kbuild: there must be no
 	space present.
 
---- 4.3 Several Subdirectories
+4.3 Several Subdirectories
+--------------------------
 
 	kbuild can handle files that are spread over several directories.
-	Consider the following example:
+	Consider the following example::
 
-	.
-	|__ src
-	|   |__ complex_main.c
-	|   |__ hal
-	|	|__ hardwareif.c
-	|	|__ include
-	|	    |__ hardwareif.h
-	|__ include
-	    |__ complex.h
+		.
+		|__ src
+		|   |__ complex_main.c
+		|   |__ hal
+		|	|__ hardwareif.c
+		|	|__ include
+		|	    |__ hardwareif.h
+		|__ include
+		|__ complex.h
 
 	To build the module complex.ko, we then need the following
-	kbuild file:
+	kbuild file::
 
 		--> filename: Kbuild
 		obj-m := complex.o
@@ -385,7 +406,8 @@ according to the following rule:
 	file is located.
 
 
-=== 5. Module Installation
+5. Module Installation
+======================
 
 Modules which are included in the kernel are installed in the
 directory:
@@ -396,11 +418,12 @@ And external modules are installed in:
 
 	/lib/modules/$(KERNELRELEASE)/extra/
 
---- 5.1 INSTALL_MOD_PATH
+5.1 INSTALL_MOD_PATH
+--------------------
 
 	Above are the default directories but as always some level of
 	customization is possible. A prefix can be added to the
-	installation path using the variable INSTALL_MOD_PATH:
+	installation path using the variable INSTALL_MOD_PATH::
 
 		$ make INSTALL_MOD_PATH=/frodo modules_install
 		=> Install dir: /frodo/lib/modules/$(KERNELRELEASE)/kernel/
@@ -410,20 +433,22 @@ And external modules are installed in:
 	calling "make." This has effect when installing both in-tree
 	and out-of-tree modules.
 
---- 5.2 INSTALL_MOD_DIR
+5.2 INSTALL_MOD_DIR
+-------------------
 
 	External modules are by default installed to a directory under
 	/lib/modules/$(KERNELRELEASE)/extra/, but you may wish to
 	locate modules for a specific functionality in a separate
 	directory. For this purpose, use INSTALL_MOD_DIR to specify an
-	alternative name to "extra."
+	alternative name to "extra."::
 
 		$ make INSTALL_MOD_DIR=gandalf -C $KDIR \
 		       M=$PWD modules_install
 		=> Install dir: /lib/modules/$(KERNELRELEASE)/gandalf/
 
 
-=== 6. Module Versioning
+6. Module Versioning
+====================
 
 Module versioning is enabled by the CONFIG_MODVERSIONS tag, and is used
 as a simple ABI consistency check. A CRC value of the full prototype
@@ -435,14 +460,16 @@ module.
 Module.symvers contains a list of all exported symbols from a kernel
 build.
 
---- 6.1 Symbols From the Kernel (vmlinux + modules)
+6.1 Symbols From the Kernel (vmlinux + modules)
+-----------------------------------------------
 
 	During a kernel build, a file named Module.symvers will be
 	generated. Module.symvers contains all exported symbols from
 	the kernel and compiled modules. For each symbol, the
 	corresponding CRC value is also stored.
 
-	The syntax of the Module.symvers file is:
+	The syntax of the Module.symvers file is::
+
 		<CRC>	    <Symbol>	       <module>
 
 		0x2d036834  scsi_remove_host   drivers/scsi/scsi_mod
@@ -451,10 +478,12 @@ build.
 	would read 0x00000000.
 
 	Module.symvers serves two purposes:
+
 	1) It lists all exported symbols from vmlinux and all modules.
 	2) It lists the CRC if CONFIG_MODVERSIONS is enabled.
 
---- 6.2 Symbols and External Modules
+6.2 Symbols and External Modules
+--------------------------------
 
 	When building an external module, the build system needs access
 	to the symbols from the kernel to check if all external symbols
@@ -481,17 +510,17 @@ build.
 		foo.ko needs symbols from bar.ko, you can use a
 		common top-level kbuild file so both modules are
 		compiled in the same build. Consider the following
-		directory layout:
+		directory layout::
 
-		./foo/ <= contains foo.ko
-		./bar/ <= contains bar.ko
+			./foo/ <= contains foo.ko
+			./bar/ <= contains bar.ko
 
-		The top-level kbuild file would then look like:
+		The top-level kbuild file would then look like::
 
-		#./Kbuild (or ./Makefile):
-			obj-y := foo/ bar/
+			#./Kbuild (or ./Makefile):
+				obj-y := foo/ bar/
 
-		And executing
+		And executing::
 
 			$ make -C $KDIR M=$PWD
 
@@ -518,14 +547,16 @@ build.
 		initialization of its symbol tables.
 
 
-=== 7. Tips & Tricks
+7. Tips & Tricks
+================
 
---- 7.1 Testing for CONFIG_FOO_BAR
+7.1 Testing for CONFIG_FOO_BAR
+------------------------------
 
-	Modules often need to check for certain CONFIG_ options to
+	Modules often need to check for certain `CONFIG_` options to
 	decide if a specific feature is included in the module. In
-	kbuild this is done by referencing the CONFIG_ variable
-	directly.
+	kbuild this is done by referencing the `CONFIG_` variable
+	directly::
 
 		#fs/ext2/Makefile
 		obj-$(CONFIG_EXT2_FS) += ext2.o
@@ -534,8 +565,7 @@ build.
 		ext2-$(CONFIG_EXT2_FS_XATTR) += xattr.o
 
 	External modules have traditionally used "grep" to check for
-	specific CONFIG_ settings directly in .config. This usage is
+	specific `CONFIG_` settings directly in .config. This usage is
 	broken. As introduced before, external modules should use
 	kbuild for building and can therefore use the same methods as
-	in-tree modules when testing for CONFIG_ definitions.
-
+	in-tree modules when testing for `CONFIG_` definitions.
diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index d824e4feaff3..5891a701a159 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -718,7 +718,7 @@ make a neat patch, there's administrative work to be done:
 -  Usually you want a configuration option for your kernel hack. Edit
    ``Kconfig`` in the appropriate directory. The Config language is
    simple to use by cut and paste, and there's complete documentation in
-   ``Documentation/kbuild/kconfig-language.txt``.
+   ``Documentation/kbuild/kconfig-language.rst``.
 
    In your description of the option, make sure you address both the
    expert user and the user who knows nothing about your feature.
@@ -728,7 +728,7 @@ make a neat patch, there's administrative work to be done:
 
 -  Edit the ``Makefile``: the CONFIG variables are exported here so you
    can usually just add a "obj-$(CONFIG_xxx) += xxx.o" line. The syntax
-   is documented in ``Documentation/kbuild/makefiles.txt``.
+   is documented in ``Documentation/kbuild/makefiles.rst``.
 
 -  Put yourself in ``CREDITS`` if you've done something noteworthy,
    usually beyond a single file (your name should be at the top of the
diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index fa864a51e6ea..f4a2198187f9 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -686,7 +686,7 @@ filesystems) should advertise this prominently in their prompt string::
 	...
 
 For full documentation on the configuration files, see the file
-Documentation/kbuild/kconfig-language.txt.
+Documentation/kbuild/kconfig-language.rst.
 
 
 11) Data structures
diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
index c88867b173d9..365efc9e4aa8 100644
--- a/Documentation/process/submit-checklist.rst
+++ b/Documentation/process/submit-checklist.rst
@@ -39,7 +39,7 @@ and elsewhere regarding submitting Linux kernel patches.
 
 6) Any new or modified ``CONFIG`` options do not muck up the config menu and
    default to off unless they meet the exception criteria documented in
-   ``Documentation/kbuild/kconfig-language.txt`` Menu attributes: default value.
+   ``Documentation/kbuild/kconfig-language.rst`` Menu attributes: default value.
 
 7) All new ``Kconfig`` options have help text.
 
diff --git a/Documentation/translations/it_IT/kernel-hacking/hacking.rst b/Documentation/translations/it_IT/kernel-hacking/hacking.rst
index 7178e517af0a..24c592852bf1 100644
--- a/Documentation/translations/it_IT/kernel-hacking/hacking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/hacking.rst
@@ -755,7 +755,7 @@ anche per avere patch pulite, c'è del lavoro amministrativo da fare:
 -  Solitamente vorrete un'opzione di configurazione per la vostra modifica
    al kernel. Modificate ``Kconfig`` nella cartella giusta. Il linguaggio
    Config è facile con copia ed incolla, e c'è una completa documentazione
-   nel file ``Documentation/kbuild/kconfig-language.txt``.
+   nel file ``Documentation/kbuild/kconfig-language.rst``.
 
    Nella descrizione della vostra opzione, assicuratevi di parlare sia agli
    utenti esperti sia agli utente che non sanno nulla del vostro lavoro.
@@ -767,7 +767,7 @@ anche per avere patch pulite, c'è del lavoro amministrativo da fare:
 -  Modificate il file ``Makefile``: le variabili CONFIG sono esportate qui,
    quindi potete solitamente aggiungere una riga come la seguete
    "obj-$(CONFIG_xxx) += xxx.o". La sintassi è documentata nel file
-   ``Documentation/kbuild/makefiles.txt``.
+   ``Documentation/kbuild/makefiles.rst``.
 
 -  Aggiungete voi stessi in ``CREDITS`` se avete fatto qualcosa di notevole,
    solitamente qualcosa che supera il singolo file (comunque il vostro nome
diff --git a/Documentation/translations/it_IT/process/coding-style.rst b/Documentation/translations/it_IT/process/coding-style.rst
index a6559d25a23d..8995d2d19f20 100644
--- a/Documentation/translations/it_IT/process/coding-style.rst
+++ b/Documentation/translations/it_IT/process/coding-style.rst
@@ -696,7 +696,7 @@ nella stringa di titolo::
 	...
 
 Per la documentazione completa sui file di configurazione, consultate
-il documento Documentation/kbuild/kconfig-language.txt
+il documento Documentation/kbuild/kconfig-language.rst
 
 
 11) Strutture dati
diff --git a/Documentation/translations/it_IT/process/submit-checklist.rst b/Documentation/translations/it_IT/process/submit-checklist.rst
index 70e65a7b3620..ea74cae958d7 100644
--- a/Documentation/translations/it_IT/process/submit-checklist.rst
+++ b/Documentation/translations/it_IT/process/submit-checklist.rst
@@ -43,7 +43,7 @@ sottomissione delle patch, in particolare
 
 6) Le opzioni ``CONFIG``, nuove o modificate, non scombussolano il menu
    di configurazione e sono preimpostate come disabilitate a meno che non
-   soddisfino i criteri descritti in ``Documentation/kbuild/kconfig-language.txt``
+   soddisfino i criteri descritti in ``Documentation/kbuild/kconfig-language.rst``
    alla punto "Voci di menu: valori predefiniti".
 
 7) Tutte le nuove opzioni ``Kconfig`` hanno un messaggio di aiuto.
diff --git a/Documentation/translations/zh_CN/process/coding-style.rst b/Documentation/translations/zh_CN/process/coding-style.rst
index 5479c591c2f7..4f6237392e65 100644
--- a/Documentation/translations/zh_CN/process/coding-style.rst
+++ b/Documentation/translations/zh_CN/process/coding-style.rst
@@ -599,7 +599,7 @@ Documentation/doc-guide/ 和 scripts/kernel-doc 以获得详细信息。
 	depends on ADFS_FS
 	...
 
-要查看配置文件的完整文档，请看 Documentation/kbuild/kconfig-language.txt。
+要查看配置文件的完整文档，请看 Documentation/kbuild/kconfig-language.rst。
 
 
 11) 数据结构
diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
index 89061aa8fdbe..f4785d2b0491 100644
--- a/Documentation/translations/zh_CN/process/submit-checklist.rst
+++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
@@ -38,7 +38,7 @@ Linux内核补丁提交清单
    违规行为。
 
 6) 任何新的或修改过的 ``CONFIG`` 选项都不会弄脏配置菜单，并默认为关闭，除非
-   它们符合 ``Documentation/kbuild/kconfig-language.txt`` 中记录的异常条件,
+   它们符合 ``Documentation/kbuild/kconfig-language.rst`` 中记录的异常条件,
    菜单属性：默认值.
 
 7) 所有新的 ``kconfig`` 选项都有帮助文本。
diff --git a/Kconfig b/Kconfig
index 990b0c390dfc..e10b3ee084d4 100644
--- a/Kconfig
+++ b/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 #
 mainmenu "Linux/$(ARCH) $(KERNELVERSION) Kernel Configuration"
 
diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
index 2eaecfb063a7..a376a50d3fea 100644
--- a/arch/arc/plat-eznps/Kconfig
+++ b/arch/arc/plat-eznps/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 #
 
 menuconfig ARC_PLAT_EZNPS
diff --git a/arch/c6x/Kconfig b/arch/c6x/Kconfig
index eeb0471268a0..c5e6b70e1510 100644
--- a/arch/c6x/Kconfig
+++ b/arch/c6x/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 #
 
 config C6X
diff --git a/arch/microblaze/Kconfig.debug b/arch/microblaze/Kconfig.debug
index 3a343188d86c..865527ac332a 100644
--- a/arch/microblaze/Kconfig.debug
+++ b/arch/microblaze/Kconfig.debug
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 
 config TRACE_IRQFLAGS_SUPPORT
 	def_bool y
diff --git a/arch/microblaze/Kconfig.platform b/arch/microblaze/Kconfig.platform
index 5bf54c1d4f60..7795f90dad86 100644
--- a/arch/microblaze/Kconfig.platform
+++ b/arch/microblaze/Kconfig.platform
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 #
 # Platform selection Kconfig menu for MicroBlaze targets
 #
diff --git a/arch/nds32/Kconfig b/arch/nds32/Kconfig
index 3299e287a477..fd0d0639454f 100644
--- a/arch/nds32/Kconfig
+++ b/arch/nds32/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 #
 
 config NDS32
diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index 7cfb20555b10..bf326f0edd2f 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 #
 
 config OPENRISC
diff --git a/arch/powerpc/sysdev/Kconfig b/arch/powerpc/sysdev/Kconfig
index e0dbec780fe9..d23288c4abf6 100644
--- a/arch/powerpc/sysdev/Kconfig
+++ b/arch/powerpc/sysdev/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 #
 
 config PPC4xx_PCI_EXPRESS
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4961deaa3b1d..376bc759b9ab 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 #
 
 config 64BIT
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index c52c738e554a..dd61fdd400f0 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 #
 # Auxiliary display drivers configuration.
 #
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 9026df923542..35078c6f334a 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 #
 
 menu "Firmware Drivers"
diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index ef0e476b2525..49abbc52457d 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -48,7 +48,7 @@ config MTD_MS02NV
 
 	  If you want to compile this driver as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you want),
-	  say M here and read <file:Documentation/kbuild/modules.txt>.
+	  say M here and read <file:Documentation/kbuild/modules.rst>.
 	  The module will be called ms02-nv.
 
 config MTD_DATAFLASH
diff --git a/drivers/net/ethernet/smsc/Kconfig b/drivers/net/ethernet/smsc/Kconfig
index d1b6a78557ec..9e1c3752b200 100644
--- a/drivers/net/ethernet/smsc/Kconfig
+++ b/drivers/net/ethernet/smsc/Kconfig
@@ -49,7 +49,7 @@ config SMC91X
 	  This driver is also available as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you want).
 	  The module will be called smc91x.  If you want to compile it as a
-	  module, say M here and read <file:Documentation/kbuild/modules.txt>.
+	  module, say M here and read <file:Documentation/kbuild/modules.rst>.
 
 config PCMCIA_SMC91C92
 	tristate "SMC 91Cxx PCMCIA support"
@@ -86,7 +86,7 @@ config SMC911X
 
 	  This driver is also available as a module. The module will be
 	  called smc911x.  If you want to compile it as a module, say M
-	  here and read <file:Documentation/kbuild/modules.txt>
+	  here and read <file:Documentation/kbuild/modules.rst>
 
 config SMSC911X
 	tristate "SMSC LAN911x/LAN921x families embedded ethernet support"
@@ -121,6 +121,6 @@ config SMSC9420
 
 	  This driver is also available as a module. The module will be
 	  called smsc9420.  If you want to compile it as a module, say M
-	  here and read <file:Documentation/kbuild/modules.txt>
+	  here and read <file:Documentation/kbuild/modules.rst>
 
 endif # NET_VENDOR_SMSC
diff --git a/drivers/net/wireless/intel/iwlegacy/Kconfig b/drivers/net/wireless/intel/iwlegacy/Kconfig
index aa01c83e0060..e329fd7b09c0 100644
--- a/drivers/net/wireless/intel/iwlegacy/Kconfig
+++ b/drivers/net/wireless/intel/iwlegacy/Kconfig
@@ -32,7 +32,7 @@ config IWL4965
 
 	  If you want to compile the driver as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you want),
-	  say M here and read <file:Documentation/kbuild/modules.txt>.  The
+	  say M here and read <file:Documentation/kbuild/modules.rst>.  The
 	  module will be called iwl4965.
 
 config IWL3945
@@ -58,7 +58,7 @@ config IWL3945
 
 	  If you want to compile the driver as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you want),
-	  say M here and read <file:Documentation/kbuild/modules.txt>.  The
+	  say M here and read <file:Documentation/kbuild/modules.rst>.  The
 	  module will be called iwl3945.
 
 menu "iwl3945 / iwl4965 Debugging Options"
diff --git a/drivers/net/wireless/intel/iwlwifi/Kconfig b/drivers/net/wireless/intel/iwlwifi/Kconfig
index e5528189163f..235349a33a3c 100644
--- a/drivers/net/wireless/intel/iwlwifi/Kconfig
+++ b/drivers/net/wireless/intel/iwlwifi/Kconfig
@@ -40,7 +40,7 @@ config IWLWIFI
 
 	  If you want to compile the driver as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you want),
-	  say M here and read <file:Documentation/kbuild/modules.txt>.  The
+	  say M here and read <file:Documentation/kbuild/modules.rst>.  The
 	  module will be called iwlwifi.
 
 if IWLWIFI
diff --git a/drivers/parport/Kconfig b/drivers/parport/Kconfig
index 24189c3399e0..1791830e7a71 100644
--- a/drivers/parport/Kconfig
+++ b/drivers/parport/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
+# see Documentation/kbuild/kconfig-language.rst.
 #
 # Parport configuration.
 #
diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
index 73bce9b6d037..75f66f8ad3ea 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -161,7 +161,7 @@ config CHR_DEV_SCH
 	
 	  If you want to compile this as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you want),
-	  say M here and read <file:Documentation/kbuild/modules.txt> and
+	  say M here and read <file:Documentation/kbuild/modules.rst> and
 	  <file:Documentation/scsi/scsi.txt>. The module will be called ch.o.
 	  If unsure, say N.
 
@@ -1487,7 +1487,7 @@ config ZFCP
 
           This driver is also available as a module. This module will be
           called zfcp. If you want to compile it as a module, say M here
-          and read <file:Documentation/kbuild/modules.txt>.
+          and read <file:Documentation/kbuild/modules.rst>.
 
 config SCSI_PMCRAID
 	tristate "PMC SIERRA Linux MaxRAID adapter support"
diff --git a/drivers/staging/sm750fb/Kconfig b/drivers/staging/sm750fb/Kconfig
index fb5a086bf9b1..8c0d8a873d5b 100644
--- a/drivers/staging/sm750fb/Kconfig
+++ b/drivers/staging/sm750fb/Kconfig
@@ -12,4 +12,4 @@ config FB_SM750
 
 	  This driver is also available as a module. The module will be
 	  called sm750fb. If you want to compile it as a module, say M
-	  here and read <file:Documentation/kbuild/modules.txt>.
+	  here and read <file:Documentation/kbuild/modules.rst>.
diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index c97f270338bf..4a88e1ca25c0 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -16,7 +16,7 @@ config USB_EMI62
 	  This code is also available as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you want).
 	  The module will be called audio. If you want to compile it as a
-	  module, say M here and read <file:Documentation/kbuild/modules.txt>.
+	  module, say M here and read <file:Documentation/kbuild/modules.rst>.
 
 config USB_EMI26
 	tristate "EMI 2|6 USB Audio interface support"
@@ -67,7 +67,7 @@ config USB_LEGOTOWER
 	  inserted in and removed from the running kernel whenever you want).
 	  The module will be called legousbtower. If you want to compile it as
 	  a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.
+	  <file:Documentation/kbuild/modules.rst>.
 
 config USB_LCD
 	tristate "USB LCD driver support"
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 2315a5b72d71..702d6d53fb55 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -289,7 +289,7 @@ config FB_ARMCLCD
 
 	  If you want to compile this as a module (=code which can be
 	  inserted into and removed from the running kernel), say M
-	  here and read <file:Documentation/kbuild/modules.txt>.  The module
+	  here and read <file:Documentation/kbuild/modules.rst>.  The module
 	  will be called amba-clcd.
 
 config FB_ACORN
@@ -1757,7 +1757,7 @@ config FB_PXA
 	  This driver is also available as a module ( = code which can be
 	  inserted and removed from the running kernel whenever you want). The
 	  module will be called pxafb. If you want to compile it as a module,
-	  say M here and read <file:Documentation/kbuild/modules.txt>.
+	  say M here and read <file:Documentation/kbuild/modules.rst>.
 
 	  If unsure, say N.
 
@@ -1838,7 +1838,7 @@ config FB_W100
 	  This driver is also available as a module ( = code which can be
 	  inserted and removed from the running kernel whenever you want). The
 	  module will be called w100fb. If you want to compile it as a module,
-	  say M here and read <file:Documentation/kbuild/modules.txt>.
+	  say M here and read <file:Documentation/kbuild/modules.rst>.
 
 	  If unsure, say N.
 
@@ -1867,7 +1867,7 @@ config FB_TMIO
 	  This driver is also available as a module ( = code which can be
 	  inserted and removed from the running kernel whenever you want). The
 	  module will be called tmiofb. If you want to compile it as a module,
-	  say M here and read <file:Documentation/kbuild/modules.txt>.
+	  say M here and read <file:Documentation/kbuild/modules.rst>.
 
 	  If unsure, say N.
 
@@ -1913,7 +1913,7 @@ config FB_S3C2410
 	  This driver is also available as a module ( = code which can be
 	  inserted and removed from the running kernel whenever you want). The
 	  module will be called s3c2410fb. If you want to compile it as a module,
-	  say M here and read <file:Documentation/kbuild/modules.txt>.
+	  say M here and read <file:Documentation/kbuild/modules.rst>.
 
 	  If unsure, say N.
 config FB_S3C2410_DEBUG
@@ -1950,7 +1950,7 @@ config FB_SM501
 	  This driver is also available as a module ( = code which can be
 	  inserted and removed from the running kernel whenever you want). The
 	  module will be called sm501fb. If you want to compile it as a module,
-	  say M here and read <file:Documentation/kbuild/modules.txt>.
+	  say M here and read <file:Documentation/kbuild/modules.rst>.
 
 	  If unsure, say N.
 
@@ -2283,7 +2283,7 @@ config FB_SM712
 
 	  This driver is also available as a module. The module will be
 	  called sm712fb. If you want to compile it as a module, say M
-	  here and read <file:Documentation/kbuild/modules.txt>.
+	  here and read <file:Documentation/kbuild/modules.rst>.
 
 source "drivers/video/fbdev/omap/Kconfig"
 source "drivers/video/fbdev/omap2/Kconfig"
diff --git a/net/bridge/netfilter/Kconfig b/net/bridge/netfilter/Kconfig
index f4fb0b9b927d..d978f6d820f3 100644
--- a/net/bridge/netfilter/Kconfig
+++ b/net/bridge/netfilter/Kconfig
@@ -128,7 +128,7 @@ config BRIDGE_EBT_LIMIT
 	  equivalent of the iptables limit match.
 
 	  If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.
+	  <file:Documentation/kbuild/modules.rst>.  If unsure, say `N'.
 
 config BRIDGE_EBT_MARK
 	tristate "ebt: mark filter support"
diff --git a/net/ipv4/netfilter/Kconfig b/net/ipv4/netfilter/Kconfig
index 3e6494269501..69e76d677f9e 100644
--- a/net/ipv4/netfilter/Kconfig
+++ b/net/ipv4/netfilter/Kconfig
@@ -308,7 +308,7 @@ config IP_NF_RAW
 	  and OUTPUT chains.
 	
 	  If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.
+	  <file:Documentation/kbuild/modules.rst>.  If unsure, say `N'.
 
 # security table for MAC policy
 config IP_NF_SECURITY
diff --git a/net/ipv6/netfilter/Kconfig b/net/ipv6/netfilter/Kconfig
index f7c6f5be9f76..6120a7800975 100644
--- a/net/ipv6/netfilter/Kconfig
+++ b/net/ipv6/netfilter/Kconfig
@@ -241,7 +241,7 @@ config IP6_NF_RAW
 	  and OUTPUT chains.
 
 	  If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.
+	  <file:Documentation/kbuild/modules.rst>.  If unsure, say `N'.
 
 # security table for MAC policy
 config IP6_NF_SECURITY
diff --git a/net/netfilter/Kconfig b/net/netfilter/Kconfig
index 21025c2c605b..dd2af7be3eea 100644
--- a/net/netfilter/Kconfig
+++ b/net/netfilter/Kconfig
@@ -1056,7 +1056,7 @@ config NETFILTER_XT_TARGET_TRACE
 	  the tables, chains, rules.
 
 	  If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.
+	  <file:Documentation/kbuild/modules.rst>.  If unsure, say `N'.
 
 config NETFILTER_XT_TARGET_SECMARK
 	tristate '"SECMARK" target support'
@@ -1115,7 +1115,7 @@ config NETFILTER_XT_MATCH_ADDRTYPE
 	  eg. UNICAST, LOCAL, BROADCAST, ...
 
 	  If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.
+	  <file:Documentation/kbuild/modules.rst>.  If unsure, say `N'.
 
 config NETFILTER_XT_MATCH_BPF
 	tristate '"bpf" match support'
@@ -1160,7 +1160,7 @@ config NETFILTER_XT_MATCH_COMMENT
 	  comments in your iptables ruleset.
 
 	  If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.
+	  <file:Documentation/kbuild/modules.rst>.  If unsure, say `N'.
 
 config NETFILTER_XT_MATCH_CONNBYTES
 	tristate  '"connbytes" per-connection counter match support'
@@ -1171,7 +1171,7 @@ config NETFILTER_XT_MATCH_CONNBYTES
 	  number of bytes and/or packets for each direction within a connection.
 
 	  If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.
+	  <file:Documentation/kbuild/modules.rst>.  If unsure, say `N'.
 
 config NETFILTER_XT_MATCH_CONNLABEL
 	tristate '"connlabel" match support'
@@ -1237,7 +1237,7 @@ config NETFILTER_XT_MATCH_DCCP
 	  and DCCP flags.
 
 	  If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.
+	  <file:Documentation/kbuild/modules.rst>.  If unsure, say `N'.
 
 config NETFILTER_XT_MATCH_DEVGROUP
 	tristate '"devgroup" match support'
@@ -1473,7 +1473,7 @@ config NETFILTER_XT_MATCH_QUOTA
 	  byte counter.
 
 	  If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.
+	  <file:Documentation/kbuild/modules.rst>.  If unsure, say `N'.
 
 config NETFILTER_XT_MATCH_RATEEST
 	tristate '"rateest" match support'
@@ -1497,7 +1497,7 @@ config NETFILTER_XT_MATCH_REALM
 	  in tc world.
 
 	  If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.
+	  <file:Documentation/kbuild/modules.rst>.  If unsure, say `N'.
 
 config NETFILTER_XT_MATCH_RECENT
 	tristate '"recent" match support'
@@ -1519,7 +1519,7 @@ config NETFILTER_XT_MATCH_SCTP
 	  and SCTP chunk types.
 
 	  If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.
+	  <file:Documentation/kbuild/modules.rst>.  If unsure, say `N'.
 
 config NETFILTER_XT_MATCH_SOCKET
 	tristate '"socket" match support'
diff --git a/net/tipc/Kconfig b/net/tipc/Kconfig
index b93bb7bdb04a..b83e16ade4d2 100644
--- a/net/tipc/Kconfig
+++ b/net/tipc/Kconfig
@@ -17,7 +17,7 @@ menuconfig TIPC
 	  This protocol support is also available as a module ( = code which
 	  can be inserted in and removed from the running kernel whenever you
 	  want). The module will be called tipc. If you want to compile it
-	  as a module, say M here and read <file:Documentation/kbuild/modules.txt>.
+	  as a module, say M here and read <file:Documentation/kbuild/modules.rst>.
 
 	  If in doubt, say N.
 
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index f641bb0aa63f..ee58cde8ee3b 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -68,7 +68,7 @@ endef
 
 ######
 # gcc support functions
-# See documentation in Documentation/kbuild/makefiles.txt
+# See documentation in Documentation/kbuild/makefiles.rst
 
 # cc-cross-prefix
 # Usage: CROSS_COMPILE := $(call cc-cross-prefix, m68k-linux-gnu- m68k-linux-)
@@ -210,7 +210,7 @@ objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
 # if_changed_dep  - as if_changed, but uses fixdep to reveal dependencies
 #                   including used config symbols
 # if_changed_rule - as if_changed but execute rule instead
-# See Documentation/kbuild/makefiles.txt for more info
+# See Documentation/kbuild/makefiles.rst for more info
 
 ifneq ($(KBUILD_NOCMDDEP),1)
 # Check if both arguments are the same including their order. Result is empty
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index b6a54bdf0965..a316d368b697 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -6,7 +6,7 @@
 #
 # Both C and C++ are supported, but preferred language is C for such utilities.
 #
-# Sample syntax (see Documentation/kbuild/makefiles.txt for reference)
+# Sample syntax (see Documentation/kbuild/makefiles.rst for reference)
 # hostprogs-y := bin2hex
 # Will compile bin2hex.c and create an executable named bin2hex
 #
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 1f9266dadedf..09fd6fa18e1a 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1114,7 +1114,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 	}
 
 	fprintf(stderr,
-		"For a resolution refer to Documentation/kbuild/kconfig-language.txt\n"
+		"For a resolution refer to Documentation/kbuild/kconfig-language.rst\n"
 		"subsection \"Kconfig recursive dependency limitations\"\n"
 		"\n");
 
diff --git a/scripts/kconfig/tests/err_recursive_dep/expected_stderr b/scripts/kconfig/tests/err_recursive_dep/expected_stderr
index 84679b104655..c9f4abf9a791 100644
--- a/scripts/kconfig/tests/err_recursive_dep/expected_stderr
+++ b/scripts/kconfig/tests/err_recursive_dep/expected_stderr
@@ -1,38 +1,38 @@
 Kconfig:11:error: recursive dependency detected!
 Kconfig:11:	symbol B is selected by B
-For a resolution refer to Documentation/kbuild/kconfig-language.txt
+For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
 Kconfig:5:error: recursive dependency detected!
 Kconfig:5:	symbol A depends on A
-For a resolution refer to Documentation/kbuild/kconfig-language.txt
+For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
 Kconfig:17:error: recursive dependency detected!
 Kconfig:17:	symbol C1 depends on C2
 Kconfig:21:	symbol C2 depends on C1
-For a resolution refer to Documentation/kbuild/kconfig-language.txt
+For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
 Kconfig:32:error: recursive dependency detected!
 Kconfig:32:	symbol D2 is selected by D1
 Kconfig:27:	symbol D1 depends on D2
-For a resolution refer to Documentation/kbuild/kconfig-language.txt
+For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
 Kconfig:37:error: recursive dependency detected!
 Kconfig:37:	symbol E1 depends on E2
 Kconfig:42:	symbol E2 is implied by E1
-For a resolution refer to Documentation/kbuild/kconfig-language.txt
+For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
 Kconfig:60:error: recursive dependency detected!
 Kconfig:60:	symbol G depends on G
-For a resolution refer to Documentation/kbuild/kconfig-language.txt
+For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
 Kconfig:51:error: recursive dependency detected!
 Kconfig:51:	symbol F2 depends on F1
 Kconfig:49:	symbol F1 default value contains F2
-For a resolution refer to Documentation/kbuild/kconfig-language.txt
+For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
diff --git a/sound/oss/dmasound/Kconfig b/sound/oss/dmasound/Kconfig
index 12e42165b4a5..1a3339859840 100644
--- a/sound/oss/dmasound/Kconfig
+++ b/sound/oss/dmasound/Kconfig
@@ -11,7 +11,7 @@ config DMASOUND_ATARI
 	  This driver is also available as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you
 	  want). If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.
+	  <file:Documentation/kbuild/modules.rst>.
 
 config DMASOUND_PAULA
 	tristate "Amiga DMA sound support"
@@ -25,7 +25,7 @@ config DMASOUND_PAULA
 	  This driver is also available as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you
 	  want). If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.
+	  <file:Documentation/kbuild/modules.rst>.
 
 config DMASOUND_Q40
 	tristate "Q40 sound support"
@@ -39,7 +39,7 @@ config DMASOUND_Q40
 	  This driver is also available as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you
 	  want). If you want to compile it as a module, say M here and read
-	  <file:Documentation/kbuild/modules.txt>.
+	  <file:Documentation/kbuild/modules.rst>.
 
 config DMASOUND
 	tristate
-- 
2.21.0

