Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 881773443C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 12:17:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J7CN0mBgzDqP2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 20:17:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.75; helo=conuserg-08.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="J+lYbqkD"; 
 dkim-atps=neutral
Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J79G6t5vzDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 20:15:46 +1000 (AEST)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id x54AEC7B032511;
 Tue, 4 Jun 2019 19:14:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x54AEC7B032511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1559643259;
 bh=Oka5YpAg+k5l88SL/bB7/ELT3B4mHTq93jBuR0XeVDU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J+lYbqkDyx5TCbBD+Dn9u83I3HtBZWpgzIStSV9W5m8Vm7NsIAtCgZTTnviNOz2/k
 OIa3qQLjn3LJ7SFdO7cx4WcnlaqSOAOAOumyzJ/LJRtUiJsfCSRsZYwrzkeOJHFloh
 5StGJrqnxtUoL1ZJgKMKnW+FVSO1PQZGYbOztFRAmSmiiFVQv6vKdRLA4xCR4r48yn
 wXht5Fpzui7RHx47kKqdrv4g+1N3wRkcfOsMq3aPvHHshb53vEmzlWyFS9ffiyfLYg
 ENAWvph9pzP8vXv0G83Xee/xAieRnQjeb2MJfRFGjniA0vGhfY5j4gVUCvNpi8ZGY8
 i977mhymYRHng==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH 05/15] kbuild: add CONFIG_HEADERS_INSTALL and loosen the
 dependency of samples
Date: Tue,  4 Jun 2019 19:13:59 +0900
Message-Id: <20190604101409.2078-6-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Vincent Chen <deanbo422@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Jani Nikula <jani.nikula@intel.com>, Greentime Hu <green.hu@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michal Marek <michal.lkml@markovi.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 5318321d367c ("samples: disable CONFIG_SAMPLES for UML") used
a big hammer to fix the build errors under the samples/ directory,
while only some samples actually include uapi headers from usr/include.

Introduce CONFIG_HEADERS_INSTALL since 'depends on HEADERS_INSTALL' is
clearer than 'depends on !UML'. If this option is enabled, uapi headers
are installed before starting directory descending.

I added 'depends on HEADERS_INSTALL' to per-sample CONFIG options.
This allows UML to compile some samples.

$ make ARCH=um allmodconfig samples/
  [ snip ]
  CC [M]  samples/configfs/configfs_sample.o
  CC [M]  samples/kfifo/bytestream-example.o
  CC [M]  samples/kfifo/dma-example.o
  CC [M]  samples/kfifo/inttype-example.o
  CC [M]  samples/kfifo/record-example.o
  CC [M]  samples/kobject/kobject-example.o
  CC [M]  samples/kobject/kset-example.o
  CC [M]  samples/trace_events/trace-events-sample.o
  CC [M]  samples/trace_printk/trace-printk.o
  AR      samples/vfio-mdev/built-in.a
  AR      samples/built-in.a

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                              |  8 ++++----
 arch/arc/configs/tb10x_defconfig      |  1 +
 arch/nds32/configs/defconfig          |  1 +
 arch/parisc/configs/a500_defconfig    |  1 +
 arch/parisc/configs/b180_defconfig    |  1 +
 arch/parisc/configs/c3000_defconfig   |  1 +
 arch/parisc/configs/default_defconfig |  1 +
 arch/powerpc/configs/ppc6xx_defconfig |  1 +
 arch/s390/configs/debug_defconfig     |  1 +
 lib/Kconfig.debug                     | 19 ++++++++++++++-----
 samples/Kconfig                       | 14 +++++++++++---
 samples/Makefile                      |  4 ++--
 12 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 8348939765d3..ce5a9551860d 100644
--- a/Makefile
+++ b/Makefile
@@ -1053,9 +1053,6 @@ vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
 
 targets := vmlinux
 
-# Some samples need headers_install.
-samples: headers_install
-
 # The actual objects are generated when descending,
 # make sure no implicit rule kicks in
 $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
@@ -1199,6 +1196,10 @@ headers_check: headers_install
 	$(Q)$(MAKE) $(hdr-inst)=include/uapi dst=include HDRCHECK=1
 	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi dst=include HDRCHECK=1
 
+ifdef CONFIG_HEADERS_INSTALL
+prepare: headers_install
+endif
+
 ifdef CONFIG_HEADERS_CHECK
 all: headers_check
 endif
@@ -1745,7 +1746,6 @@ build-dir = $(patsubst %/,%,$(dir $(build-target)))
 PHONY += /
 /: ./
 
-samples/: headers_install
 %/: prepare FORCE
 	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
 
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 5b5119d2b5d5..dc739bd093e3 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -94,6 +94,7 @@ CONFIG_CONFIGFS_FS=y
 CONFIG_DEBUG_INFO=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_FS=y
+CONFIG_HEADERS_INSTALL=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_DEBUG_SECTION_MISMATCH=y
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/nds32/configs/defconfig b/arch/nds32/configs/defconfig
index 65ce9259081b..40313a635075 100644
--- a/arch/nds32/configs/defconfig
+++ b/arch/nds32/configs/defconfig
@@ -92,6 +92,7 @@ CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_GDB_SCRIPTS=y
 CONFIG_READABLE_ASM=y
+CONFIG_HEADERS_INSTALL=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_DEBUG_SECTION_MISMATCH=y
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/parisc/configs/a500_defconfig b/arch/parisc/configs/a500_defconfig
index 5acb93dcaabf..390c0bc09179 100644
--- a/arch/parisc/configs/a500_defconfig
+++ b/arch/parisc/configs/a500_defconfig
@@ -167,6 +167,7 @@ CONFIG_NLS_ISO8859_1=m
 CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_UTF8=m
 CONFIG_DEBUG_FS=y
+CONFIG_HEADERS_INSTALL=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_DEBUG_BUGVERBOSE is not set
diff --git a/arch/parisc/configs/b180_defconfig b/arch/parisc/configs/b180_defconfig
index 83ffd161aec5..bdf1fe2b217f 100644
--- a/arch/parisc/configs/b180_defconfig
+++ b/arch/parisc/configs/b180_defconfig
@@ -91,6 +91,7 @@ CONFIG_NLS_ASCII=m
 CONFIG_NLS_ISO8859_1=m
 CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_UTF8=m
+CONFIG_HEADERS_INSTALL=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
diff --git a/arch/parisc/configs/c3000_defconfig b/arch/parisc/configs/c3000_defconfig
index 8d41a73bd71b..ed4d49575b38 100644
--- a/arch/parisc/configs/c3000_defconfig
+++ b/arch/parisc/configs/c3000_defconfig
@@ -140,6 +140,7 @@ CONFIG_NLS_ISO8859_1=m
 CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_UTF8=m
 CONFIG_DEBUG_FS=y
+CONFIG_HEADERS_INSTALL=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_MUTEXES=y
diff --git a/arch/parisc/configs/default_defconfig b/arch/parisc/configs/default_defconfig
index 52c9050a7c5c..fcfd9eaadf9b 100644
--- a/arch/parisc/configs/default_defconfig
+++ b/arch/parisc/configs/default_defconfig
@@ -184,6 +184,7 @@ CONFIG_NLS_KOI8_R=m
 CONFIG_NLS_KOI8_U=m
 CONFIG_NLS_UTF8=y
 CONFIG_DEBUG_FS=y
+CONFIG_HEADERS_INSTALL=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 7c6baf6df139..463aa3e53084 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -1124,6 +1124,7 @@ CONFIG_NLS_KOI8_R=m
 CONFIG_NLS_KOI8_U=m
 CONFIG_DEBUG_INFO=y
 CONFIG_UNUSED_SYMBOLS=y
+CONFIG_HEADERS_INSTALL=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index b0920b35f87b..994e03fad424 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -586,6 +586,7 @@ CONFIG_GDB_SCRIPTS=y
 CONFIG_FRAME_WARN=1024
 CONFIG_READABLE_ASM=y
 CONFIG_UNUSED_SYMBOLS=y
+CONFIG_HEADERS_INSTALL=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_DEBUG_SECTION_MISMATCH=y
 CONFIG_MAGIC_SYSRQ=y
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 7cdcb962358c..6a6ea4219d1e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -305,14 +305,23 @@ config DEBUG_FS
 
 	  If unsure, say N.
 
+config HEADERS_INSTALL
+	bool "Install uapi headers to usr/include"
+	depends on !UML
+	help
+	  This option will install uapi headers (headers exported to user-space)
+	  into the usr/include directory for use during the kernel build.
+	  This is unneeded for building the kernel itself, but needed for some
+	  user-space program samples. It is also needed by some features such
+	  as uapi header sanity checks.
+
 config HEADERS_CHECK
 	bool "Run sanity checks on uapi headers when building 'all'"
-	depends on !UML
+	depends on HEADERS_INSTALL
 	help
-	  This option will extract the user-visible kernel headers when
-	  building the 'all' target, and will run basic sanity checks on them to
-	  ensure that exported files do not attempt to include files which
-	  were not exported, etc.
+	  This option will run basic sanity checks on uapi headers when
+	  building the 'all' target, for example, ensure that they do not
+	  attempt to include files which were not exported, etc.
 
 	  If you're making modifications to header files which are
 	  relevant for userspace, say 'Y', and check the headers
diff --git a/samples/Kconfig b/samples/Kconfig
index d63cc8a3e0df..71b5e833dd9e 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig SAMPLES
 	bool "Sample kernel code"
-	depends on !UML
 	help
 	  You can build and test sample kernel code here.
 
@@ -95,16 +94,24 @@ config SAMPLE_CONFIGFS
 
 config SAMPLE_CONNECTOR
 	tristate "Build connector sample -- loadable modules only"
-	depends on CONNECTOR && m
+	depends on CONNECTOR && HEADERS_INSTALL && m
 	help
 	  When enabled, this builds both a sample kernel module for
 	  the connector interface and a user space tool to communicate
 	  with it.
 	  See also Documentation/connector/connector.txt
 
+config SAMPLE_HIDRAW
+	bool "hidraw sample"
+	depends on HEADERS_INSTALL
+
+config SAMPLE_PIDFD
+	bool "pidfd sample"
+	depends on HEADERS_INSTALL
+
 config SAMPLE_SECCOMP
 	bool "Build seccomp sample code"
-	depends on SECCOMP_FILTER
+	depends on SECCOMP_FILTER && HEADERS_INSTALL
 	help
 	  Build samples of seccomp filters using various methods of
 	  BPF filter construction.
@@ -156,6 +163,7 @@ config SAMPLE_ANDROID_BINDERFS
 
 config SAMPLE_VFS
 	bool "Build example programs that use new VFS system calls"
+	depends on HEADERS_INSTALL
 	help
 	  Build example userspace programs that use new VFS system calls such
 	  as mount API and statx().  Note that this is restricted to the x86
diff --git a/samples/Makefile b/samples/Makefile
index debf8925f06f..7d6e4ca28d69 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -4,14 +4,14 @@
 obj-$(CONFIG_SAMPLE_ANDROID_BINDERFS)	+= binderfs/
 obj-$(CONFIG_SAMPLE_CONFIGFS)		+= configfs/
 obj-$(CONFIG_SAMPLE_CONNECTOR)		+= connector/
-subdir-y				+= hidraw
+subdir-$(CONFIG_SAMPLE_HIDRAW)		+= hidraw
 obj-$(CONFIG_SAMPLE_HW_BREAKPOINT)	+= hw_breakpoint/
 obj-$(CONFIG_SAMPLE_KDB)		+= kdb/
 obj-$(CONFIG_SAMPLE_KFIFO)		+= kfifo/
 obj-$(CONFIG_SAMPLE_KOBJECT)		+= kobject/
 obj-$(CONFIG_SAMPLE_KPROBES)		+= kprobes/
 obj-$(CONFIG_SAMPLE_LIVEPATCH)		+= livepatch/
-subdir-y				+= pidfd
+subdir-$(CONFIG_SAMPLE_PIDFD)		+= pidfd
 obj-$(CONFIG_SAMPLE_QMI_CLIENT)		+= qmi/
 obj-$(CONFIG_SAMPLE_RPMSG_CLIENT)	+= rpmsg/
 subdir-$(CONFIG_SAMPLE_SECCOMP)		+= seccomp
-- 
2.17.1

