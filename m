Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C61BBC77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 13:32:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BKHs0jHfzDqXw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 21:32:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m/a/BR/u; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BKFL1gVFzDqGJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 21:30:13 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id p25so10531790pfn.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 04:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=roHarkpCbXd6I6ExLgRnvnlHy4th8Dwn/cfQ+aL+Axo=;
 b=m/a/BR/upGvnPAMtPlJtq+MrZpXpq9qQnejAs+DdmmsQ49Yk8Hg669cdMewZrIb4Mr
 M/nkzZ2nQIxiTP4wI4BaP7XNzENVhZIH3JlR3PJQj5Dpp85WkcPcXa7+2/Mhxs5fuJeU
 0VZBMsTw7Fb2PIGMV6glUjJGPDzj3UpHQUi7enhxTgtpQNxKv938aueAbMqwFKDnILGH
 Twlam38yuLe7/2DpBmjFiyfrmP+AI+pWVqZUkWYsx+N+owty0zqz8fFtM7DbSe9jtb4v
 Fn1+c/xRl9rNZ21eZfQl/+SMiDCy7vXXZoa0JcsLeasLZtWr8CkGfQyW8p7HwMSlBtgD
 C/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=roHarkpCbXd6I6ExLgRnvnlHy4th8Dwn/cfQ+aL+Axo=;
 b=nhBSEqRZBK8eCTAtDejkd3ffKcmjFtY4l0weowSJQSs/ylsgdSUGi21XBWoL0bMVyd
 dRLsAl+fIAqyf15xBO7LsD8cEDkQqOunHHel7NL2DoY+N3zS/ZXknQHpxwhbaFYPEpA8
 TgUk80Hw5Gb/Sv33rJOrwXoDb2+KD9ei7hfZJBqLiBIcMI4Kzus8nEh64iTB9gHZ6CpD
 Lkp9YzM2cmcGJyr1P0Md+Po7m81sWkTThLWkeFOHMPh8413edOrwhMD2S2uZaZDt7173
 RnWBQV0TkD+g2cCf7Lvc6OrE748oN2XLaBHAHSDMHC1b3XxF6oQpYhHo8WM1fPBMaWZy
 JR+A==
X-Gm-Message-State: AGi0PubQVQugqMcWd9f9Nm4o6HTFgkc7fdrzX+NHItVtE2OfBd/H6D38
 TXD480bWcm5y0cgPu3CNx4NEUOll
X-Google-Smtp-Source: APiQypJs/GhLGX+Z3dWyNQhQgrAeph7u/PTgfJqXJeDDAri5VORfj6tUHR/gHvFs52tL+aYG27tRtw==
X-Received: by 2002:aa7:8594:: with SMTP id w20mr29840924pfn.137.1588073409617; 
 Tue, 28 Apr 2020 04:30:09 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id s145sm13049335pgs.57.2020.04.28.04.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 04:30:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
Date: Tue, 28 Apr 2020 21:25:17 +1000
Message-Id: <20200428112517.1402927-1-npiggin@gmail.com>
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
GCC and clang (since 2014). It is less well tested and supported by the
GNU toolchain, but it can give some useful advantages of the ELFv2 ABI
for BE (e.g., less stack usage). Some distros even build BE ELFv2
userspace.

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Improved the override flavour name suggested by Segher.
- Improved changelog wording.


 arch/powerpc/Kconfig            | 19 +++++++++++++++++++
 arch/powerpc/Makefile           | 15 ++++++++++-----
 arch/powerpc/boot/Makefile      |  4 ++++
 drivers/crypto/vmx/Makefile     |  8 ++++++--
 drivers/crypto/vmx/ppc-xlate.pl | 10 ++++++----
 5 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 924c541a9260..d9d2abc06c2c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -147,6 +147,7 @@ config PPC
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
+	select BUILD_ELF_V2			if PPC64 && CPU_LITTLE_ENDIAN
 	select CLONE_BACKWARDS
 	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
 	select DYNAMIC_FTRACE			if FUNCTION_TRACER
@@ -541,6 +542,24 @@ config KEXEC_FILE
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
+	  this is an experimental option that is less tested (kernel and
+	  toolchain). This requires gcc 4.9 or newer and binutils 2.24 or
+	  newer.
+
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f310c32e88a4..e306b39d847e 100644
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
index c53a1b8bba8b..03942d08695d 100644
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
index 709670d2b553..9aea34602beb 100644
--- a/drivers/crypto/vmx/Makefile
+++ b/drivers/crypto/vmx/Makefile
@@ -5,18 +5,22 @@ vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
 override flavour := linux-ppc64le
 else
+ifdef CONFIG_BUILD_ELF_V2
+override flavour := linux-ppc64-elfv2
+else
 override flavour := linux-ppc64
 endif
+endif
 
 quiet_cmd_perl = PERL $@
       cmd_perl = $(PERL) $(<) $(flavour) > $(@)
 
 targets += aesp8-ppc.S ghashp8-ppc.S
 
-$(obj)/aesp8-ppc.S: $(src)/aesp8-ppc.pl FORCE
+$(obj)/aesp8-ppc.S: $(src)/aesp8-ppc.pl $(src)/ppc-xlate.pl FORCE
 	$(call if_changed,perl)
   
-$(obj)/ghashp8-ppc.S: $(src)/ghashp8-ppc.pl FORCE
+$(obj)/ghashp8-ppc.S: $(src)/ghashp8-ppc.pl $(src)/ppc-xlate.pl FORCE
 	$(call if_changed,perl)
 
 clean-files := aesp8-ppc.S ghashp8-ppc.S
diff --git a/drivers/crypto/vmx/ppc-xlate.pl b/drivers/crypto/vmx/ppc-xlate.pl
index 36db2ef09e5b..9db0937d318b 100644
--- a/drivers/crypto/vmx/ppc-xlate.pl
+++ b/drivers/crypto/vmx/ppc-xlate.pl
@@ -9,6 +9,8 @@ open STDOUT,">$output" || die "can't open $output: $!";
 
 my %GLOBALS;
 my $dotinlocallabels=($flavour=~/linux/)?1:0;
+my $abielfv2=(($flavour =~ /linux-ppc64le/) or ($flavour =~ /linux-ppc64-elfv2/))?1:0;
+my $dotfunctions=($abielfv2=~1)?0:1;
 
 ################################################################
 # directives which need special treatment on different platforms
@@ -40,7 +42,7 @@ my $globl = sub {
 };
 my $text = sub {
     my $ret = ($flavour =~ /aix/) ? ".csect\t.text[PR],7" : ".text";
-    $ret = ".abiversion	2\n".$ret	if ($flavour =~ /linux.*64le/);
+    $ret = ".abiversion	2\n".$ret	if ($abielfv2);
     $ret;
 };
 my $machine = sub {
@@ -56,8 +58,8 @@ my $size = sub {
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
@@ -142,7 +144,7 @@ my $vmr = sub {
 
 # Some ABIs specify vrsave, special-purpose register #256, as reserved
 # for system use.
-my $no_vrsave = ($flavour =~ /linux-ppc64le/);
+my $no_vrsave = ($abielfv2);
 my $mtspr = sub {
     my ($f,$idx,$ra) = @_;
     if ($idx == 256 && $no_vrsave) {
-- 
2.23.0

