Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4323C1BD1B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 03:26:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BgpP46VpzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 11:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ts2Hr3vC; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BgmZ3HCJzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 11:25:02 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 18so284395pfx.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 18:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KrXaJ9lF/izC90du3VhbSiIBYtxCPc5rlyK0Yo+caAY=;
 b=ts2Hr3vCbkbfreo8++eoj/iLZUMA6Kw57ZMTkC7qmxjzgcBmGHoesPDDAh4o3KpgJo
 A+fEkUgsEtzZfUiuTDvRHarA83hslherTc+6DzRehA8O0jemVjA1F+cVET7+uE/z0osr
 /9vFol+qvURo8A4sqrJgapzHBcJSXWSzvOribFz0IDXuK7lEr7rkSLReeNrLosjB5anv
 4KYRDdhaEr++DQMBI4Q16boNa/uNg+BhBjh/uMJzXqqPZh0u9xGaTHEGiUCKyIPax9nV
 7a04ZWayHPsZulW2qfxAgq0tqYIRqyBI28Iy/3icqmhIEW5WxofX1zeJGfdMIxeCsLrq
 w6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KrXaJ9lF/izC90du3VhbSiIBYtxCPc5rlyK0Yo+caAY=;
 b=EWDXf1t+lM/djMPUViZabWuUnZ8eOOXwK0DeMfv2cvwep6cfK012v5bDvia9wvkEvi
 wdBJEHrhqSjjF1OI2KDTTS5rYi4rVmGI64R+4jVZcAkCNJvZahjULIcHMN7U6tHhQjeT
 Np07feYlWiancmexoDdletUFirGbYLWM23BKtfw4O8tmbgUTdUZVzmy9pJepj5mtmmm/
 0hjeAS4umjUznl4BuFYNapM3tNsVKLQ9yzente8GGRjPRuXLoIB6MYiN/79c5SvH6Z+T
 r7h8C50c3RGKIJ13pvrhC0Glje+ibEaWBGZ9jDTXZ6qAM/kynfhKktlU5EaBoaHae7Za
 PAsA==
X-Gm-Message-State: AGi0PuavX4buP2xRcKfDGYg7hmFo1d3GUyItxhYX/BIxlyUbvO29oZKR
 k/geHVtMIkajXK6Y7dbawP2GwwDn
X-Google-Smtp-Source: APiQypINu1M5LO787YqPvWqLeD85n7c5HfkWVpdMZWMttiadFlTZaF+pmkMjMytJhM0lmVnFzw4ZWQ==
X-Received: by 2002:a62:780b:: with SMTP id t11mr32175552pfc.196.1588123498050; 
 Tue, 28 Apr 2020 18:24:58 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id w126sm15910796pfb.117.2020.04.28.18.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 18:24:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc/64: Option to use ELF V2 ABI for big-endian kernels
Date: Wed, 29 Apr 2020 11:19:59 +1000
Message-Id: <20200429011959.1423180-1-npiggin@gmail.com>
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

Provide an option to build big-endian kernels using the ELF V2 ABI. This works
on GCC and clang (since about 2014). it is is not officially supported by the
GNU toolchain, but it can give big-endian kernels  some useful advantages of
the V2 ABI (e.g., less stack usage).

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Improved the override flavour name suggested by Segher.
- Improved changelog wording.

Since v2:
- Improved changelog, help text, to use the name ELF V2 ABI in the spec,
  and clarify things a bit more, suggested by Segher.
- For option name, match the ELF_ABI_v1/2 which is already in the kernel.
- Prefix options with PPC64_ to avoid arch clashes or confusion.
- "elfv2" is the toolchain name of the ABI, so I kept that in the crypto
  perl scripts.

 arch/powerpc/Kconfig            | 21 +++++++++++++++++++++
 arch/powerpc/Makefile           | 15 ++++++++++-----
 arch/powerpc/boot/Makefile      |  4 ++++
 drivers/crypto/vmx/Makefile     |  8 ++++++--
 drivers/crypto/vmx/ppc-xlate.pl | 10 ++++++----
 5 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 924c541a9260..444867e07039 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -147,6 +147,7 @@ config PPC
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
+	select PPC64_BUILD_ELF_ABI_V2		if PPC64 && CPU_LITTLE_ENDIAN
 	select CLONE_BACKWARDS
 	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
 	select DYNAMIC_FTRACE			if FUNCTION_TRACER
@@ -541,6 +542,26 @@ config KEXEC_FILE
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
+config PPC64_BUILD_ELF_ABI_V2
+	bool
+
+config PPC64_BUILD_BIG_ENDIAN_ELF_ABI_V2
+	bool "Build big-endian kernel using ELF V2 ABI (EXPERIMENTAL)"
+	depends on PPC64 && CPU_BIG_ENDIAN && EXPERT
+	default n
+	select PPC64_BUILD_ELF_ABI_V2
+	help
+	  This builds the kernel image using the "Power Architecture 64-Bit ELF
+	  V2 ABI Specification", which has a reduced stack overhead and faster
+	  function calls. This internal kernel ABI option does not affect
+          userspace compatibility.
+
+	  The V2 ABI is standard for 64-bit little-endian, but for big-endian
+	  it is less well tested by kernel and toolchain. However some distros
+	  build userspace this way, and it can produce a functioning kernel.
+
+	  This requires gcc 4.9 or newer and binutils 2.24 or newer.
+
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f310c32e88a4..baf477d100b2 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -92,10 +92,14 @@ endif
 
 ifdef CONFIG_PPC64
 ifndef CONFIG_CC_IS_CLANG
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mcall-aixdesc)
-aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
-aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
+ifdef CONFIG_PPC64_BUILD_ELF_ABI_V2
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
+ifdef CONFIG_PPC64_BUILD_ELF_ABI_V2
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
index c53a1b8bba8b..d27e85413c84 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -41,6 +41,10 @@ endif
 
 BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
+ifdef CONFIG_PPC64_BUILD_ELF_ABI_V2
+BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
+endif
+
 ifdef CONFIG_CPU_BIG_ENDIAN
 BOOTCFLAGS	+= -mbig-endian
 else
diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
index 709670d2b553..751ffca694aa 100644
--- a/drivers/crypto/vmx/Makefile
+++ b/drivers/crypto/vmx/Makefile
@@ -5,18 +5,22 @@ vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
 override flavour := linux-ppc64le
 else
+ifdef CONFIG_PPC64_BUILD_ELF_ABI_V2
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
index 36db2ef09e5b..b583898c11ae 100644
--- a/drivers/crypto/vmx/ppc-xlate.pl
+++ b/drivers/crypto/vmx/ppc-xlate.pl
@@ -9,6 +9,8 @@ open STDOUT,">$output" || die "can't open $output: $!";
 
 my %GLOBALS;
 my $dotinlocallabels=($flavour=~/linux/)?1:0;
+my $elfv2abi=(($flavour =~ /linux-ppc64le/) or ($flavour =~ /linux-ppc64-elfv2/))?1:0;
+my $dotfunctions=($elfv2abi=~1)?0:1;
 
 ################################################################
 # directives which need special treatment on different platforms
@@ -40,7 +42,7 @@ my $globl = sub {
 };
 my $text = sub {
     my $ret = ($flavour =~ /aix/) ? ".csect\t.text[PR],7" : ".text";
-    $ret = ".abiversion	2\n".$ret	if ($flavour =~ /linux.*64le/);
+    $ret = ".abiversion	2\n".$ret	if ($elfv2abi);
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
+my $no_vrsave = ($elfv2abi);
 my $mtspr = sub {
     my ($f,$idx,$ra) = @_;
     if ($idx == 256 && $no_vrsave) {
-- 
2.23.0

