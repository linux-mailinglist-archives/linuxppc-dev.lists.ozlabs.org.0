Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5DB176A2E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 02:47:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wfyd0r5GzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 12:47:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JIXF1t91; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wfwk6sPCzDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 12:45:42 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id i13so624960pfe.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 17:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PrunASePBAvcfeoGZx+hRUCdv8EJUOACRvB1OJkcpSo=;
 b=JIXF1t91jLQqNGFdlpWuEDPEfb5nf3A7OcFWse1qMUWwdKdDlrGKT2DN/ITnLTBWYt
 KtQuzgOoyT6tktdq/HhmcpXOJCXiZ40DUUU9Z5NczimH3161Nd8g4KUdKuwcZP8vmHPA
 lrcafaa2DEsRfhCUghcxI0o9alDl9VYrCpSONfpdIVe7L1c//UAl9w4nEoeyjLFcpd7x
 s0+B0HBhQIdb4vYn0UpLZNs2ROdqZFj/BMHN+zhEcex7S/gx/84k3ekLFhvT0dLecMF1
 bdtYV4XLBp7L3s0ecvYSFrTKI8PXxEXHzzxzJxZYDtmBDAPk5cDW7w2vaagyDvwds6OB
 rv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PrunASePBAvcfeoGZx+hRUCdv8EJUOACRvB1OJkcpSo=;
 b=TO85vUqoOm7kRwjHZ2Z4jKx66xlNZwsg43Pl8kqMT5TJxE8E6UfC8AIELEaFAMZGOU
 Ar5iTYb/BDA5hrMZv+kPpSSp1FUem4G0IxFCABWRZKcr4IDeUvf8ecVpS5Hq9j+mEE+p
 8i9cDUIHQ2ZgJq4IgJiF5Li0hNMT9kiZjEZea89drT1pLCpALz1XJUBkjXI/p3/tTZcn
 wOngUy1XsPTQ/n1PNQ91AD9ReZZh8DE1arHHwLHKO5j4LERndBkJMB+Tk2c8/jHZfDL0
 d33CuoVHv7gX5HwPMWlasCnUdeSmcXcBypWKhqTCNYJ7WIy5eztVc0JtUu0q57TIT/Xv
 dcdw==
X-Gm-Message-State: ANhLgQ3HxMM3xVlELOhfucAKfM/G/WbWp/dm1wvvCtWMHYTxjZESgEHq
 8yvAZ96dsiuRCKEJAJ0rq/lO1WJ3
X-Google-Smtp-Source: ADFU+vs1MCS75goWMP76lPhZS85Ghf7sjqRWnU0+iM1drX+XOYlz7chnResCc90Dy2EAmR/m+rjuaw==
X-Received: by 2002:a63:67c5:: with SMTP id b188mr1749628pgc.111.1583199936750; 
 Mon, 02 Mar 2020 17:45:36 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-117-248.tpgi.com.au.
 [193.116.117.248])
 by smtp.gmail.com with ESMTPSA id j126sm14208630pfb.129.2020.03.02.17.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 17:45:36 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: BE option to use ELFv2 ABI for big endian kernels
Date: Tue,  3 Mar 2020 11:45:27 +1000
Message-Id: <20200303014527.39377-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide an option to use ELFv2 ABI for big endian builds. This works on
GCC and clang (since 2014). it is is not officially supported by the GNU
toolchain, but it can give some useful advantages of the ELFv2 ABI for
BE (e.g., less stack usage). Some distros build BE ELFv2 userspace.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig            | 19 +++++++++++++++++++
 arch/powerpc/Makefile           | 15 ++++++++++-----
 arch/powerpc/boot/Makefile      |  4 ++++
 drivers/crypto/vmx/Makefile     |  4 ++++
 drivers/crypto/vmx/aesp8-ppc.pl |  2 +-
 drivers/crypto/vmx/ppc-xlate.pl | 11 +++++++----
 6 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 497b7d0b2d7e..31dd921a5145 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -146,6 +146,7 @@ config PPC
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
+	select BUILD_ELF_V2			if PPC64 && CPU_LITTLE_ENDIAN
 	select CLONE_BACKWARDS
 	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
 	select DYNAMIC_FTRACE			if FUNCTION_TRACER
@@ -538,6 +539,24 @@ config KEXEC_FILE
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
+config BUILD_ELF_V2
+	bool
+
+config BUILD_BIG_ENDIAN_ELF_V2
+	bool "Build big-endian kernel using ELFv2 ABI (EXPERIMENTAL)"
+	depends on PPC64 && CPU_BIG_ENDIAN && EXPERT
+	default n
+	select BUILD_ELF_V2
+	help
+	  This builds the kernel image using the ELFv2 ABI, which has a
+	  reduced stack overhead and faster function calls. This does not
+	  affect the userspace ABIs.
+
+	  ELFv2 is the standard ABI for little-endian, but for big-endian
+	  this is an experimental option that is not well tested (kernel and
+	  toolchain). This requires gcc 4.9 or newer and binutils 2.24 or
+	  newer.
+
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f35730548e42..ae8036a0b169 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -92,10 +92,14 @@ endif
 
 ifdef CONFIG_PPC64
 ifndef CONFIG_CC_IS_CLANG
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mcall-aixdesc)
-aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
-aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
+ifdef CONFIG_BUILD_ELF_V2
+cflags-y				+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
+aflags-y				+= $(call cc-option,-mabi=elfv2)
+else
+cflags-y				+= $(call cc-option,-mabi=elfv1)
+cflags-y				+= $(call cc-option,-mcall-aixdesc)
+aflags-y				+= $(call cc-option,-mabi=elfv1)
+endif
 endif
 endif
 
@@ -144,7 +148,7 @@ endif
 
 CFLAGS-$(CONFIG_PPC64)	:= $(call cc-option,-mtraceback=no)
 ifndef CONFIG_CC_IS_CLANG
-ifdef CONFIG_CPU_LITTLE_ENDIAN
+ifdef CONFIG_BUILD_ELF_V2
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
 AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2)
 else
@@ -153,6 +157,7 @@ CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
 AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
 endif
 endif
+
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
 
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 0556bf4fc9e9..137ff20b13f8 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -41,6 +41,10 @@ endif
 
 BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
+ifdef CONFIG_BUILD_ELF_V2
+BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
+endif
+
 ifdef CONFIG_CPU_BIG_ENDIAN
 BOOTCFLAGS	+= -mbig-endian
 else
diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
index 709670d2b553..8d79514eb474 100644
--- a/drivers/crypto/vmx/Makefile
+++ b/drivers/crypto/vmx/Makefile
@@ -5,8 +5,12 @@ vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
 override flavour := linux-ppc64le
 else
+ifdef CONFIG_BUILD_ELF_V2
+override flavour := linux-ppc64v2
+else
 override flavour := linux-ppc64
 endif
+endif
 
 quiet_cmd_perl = PERL $@
       cmd_perl = $(PERL) $(<) $(flavour) > $(@)
diff --git a/drivers/crypto/vmx/aesp8-ppc.pl b/drivers/crypto/vmx/aesp8-ppc.pl
index db874367b602..6733a68f12ed 100644
--- a/drivers/crypto/vmx/aesp8-ppc.pl
+++ b/drivers/crypto/vmx/aesp8-ppc.pl
@@ -100,7 +100,7 @@ if ($flavour =~ /64/) {
 	$SHL	="slwi";
 } else { die "nonsense $flavour"; }
 
-$LITTLE_ENDIAN = ($flavour=~/le$/) ? $SIZE_T : 0;
+$LITTLE_ENDIAN = ($flavour=~/ppc64le/) ? $SIZE_T : 0;
 
 $0 =~ m/(.*[\/\\])[^\/\\]+$/; $dir=$1;
 ( $xlate="${dir}ppc-xlate.pl" and -f $xlate ) or
diff --git a/drivers/crypto/vmx/ppc-xlate.pl b/drivers/crypto/vmx/ppc-xlate.pl
index 36db2ef09e5b..5f9963ae100e 100644
--- a/drivers/crypto/vmx/ppc-xlate.pl
+++ b/drivers/crypto/vmx/ppc-xlate.pl
@@ -9,6 +9,8 @@ open STDOUT,">$output" || die "can't open $output: $!";
 
 my %GLOBALS;
 my $dotinlocallabels=($flavour=~/linux/)?1:0;
+my $abielfv2=(($flavour =~ /linux-ppc64le/) or ($flavour =~ /linux-ppc64v2/))?1:0;
+my $dotfunctions=($abielfv2=~1)?0:1;
 
 ################################################################
 # directives which need special treatment on different platforms
@@ -38,9 +40,10 @@ my $globl = sub {
     $$global = $name;
     $ret;
 };
+
 my $text = sub {
     my $ret = ($flavour =~ /aix/) ? ".csect\t.text[PR],7" : ".text";
-    $ret = ".abiversion	2\n".$ret	if ($flavour =~ /linux.*64le/);
+    $ret = ".abiversion	2\n".$ret	if ($abielfv2);
     $ret;
 };
 my $machine = sub {
@@ -56,8 +59,8 @@ my $size = sub {
     if ($flavour =~ /linux/)
     {	shift;
 	my $name = shift; $name =~ s|^[\.\_]||;
-	my $ret  = ".size	$name,.-".($flavour=~/64$/?".":"").$name;
-	$ret .= "\n.size	.$name,.-.$name" if ($flavour=~/64$/);
+	my $ret  = ".size	$name,.-".($dotfunctions?".":"").$name;
+	$ret .= "\n.size	.$name,.-.$name" if ($dotfunctions);
 	$ret;
     }
     else
@@ -142,7 +145,7 @@ my $vmr = sub {
 
 # Some ABIs specify vrsave, special-purpose register #256, as reserved
 # for system use.
-my $no_vrsave = ($flavour =~ /linux-ppc64le/);
+my $no_vrsave = ($abielfv2);
 my $mtspr = sub {
     my ($f,$idx,$ra) = @_;
     if ($idx == 256 && $no_vrsave) {
-- 
2.23.0

