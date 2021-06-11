Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859123A3F40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 11:41:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1bSz1CJfz3c0c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 19:41:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lEY1GqkT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lEY1GqkT; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1bRh0FYdz3bsb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 19:40:15 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id u18so3983536pfk.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 02:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4rqJ/ocNcEOM66H6GUGgWlWTMe/FRDaQZvizqSQdvaQ=;
 b=lEY1GqkTCgfml/tRcU0m44hQFVUgbzHoFBuu6mWu7uc3lTWgNYyAZUCLAPZ+ELBx0M
 kQHhZk8W5elifCvDwo1YOQo9OYsk73rcNJ1LUmkLaT0vBiyAH8lh04/Z9dqctk/OH3iV
 t2VWhazUCPTE28rVxSWycjBEnN7jp5W5giCw5o3GjvDaWrCXIePFn7QfYD9RR/KY0MKy
 zrOc0yLsYvhwDPk8wRuX62r4eF+fE/1Pej1qcFLG0qfn1NPjbH8aJXlHfIFPk+D3uBd2
 PPqa0QAHSBKPuUrmMAyqVkQ9zs0wHn18YnsEjZmzgn2hYJbGs/xCs1K2xCInN/08seWF
 1TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4rqJ/ocNcEOM66H6GUGgWlWTMe/FRDaQZvizqSQdvaQ=;
 b=l461Kv5RFf7wWktmpZFLBBHINpBWy24VBuLihViBw4M/xWXSyHtRlfE8sSVNyWW6iZ
 pLHHtlEyPzGnGmcsox7k2i8ArkLhxxURfWoOdzQxR8JPR9+K2BOsjv59wc1uKjUfg02D
 8T1OjUG93mhf5bhFFRkyqYkvgJP/jC6DCh1fCj2rPd9Z7BU0RxBru0Vas6aQ4tnlutHi
 5WbqthNNk+Gbr59ljJWu5iiueHaptYAHbN+2dQ6ptgBq4ILBc7VF8gFcGmm8LQxoHL6J
 +UZAHCK9sJ23O2hTGi9CBLDLQQvrecktlK53JGDLQ/xQIFI6CPelWt8HepjOTt+YHDJ7
 4pyg==
X-Gm-Message-State: AOAM531VQMLMiYk6AxggmK8RItiCFwpNjwRVcoHuua8caERBvbi5NeM4
 dzpo2PDYzfdEspC4CsgSbiZyb8LwWj0=
X-Google-Smtp-Source: ABdhPJxJHzGCRi0XdONVoFL8/v8/mVUBhe2GDICX/XZdXb+DC9CLaLGkwooGD4SRQfR+cz56dDPXHQ==
X-Received: by 2002:a62:2bc6:0:b029:2cc:242f:ab69 with SMTP id
 r189-20020a622bc60000b02902cc242fab69mr7517628pfr.16.1623404412814; 
 Fri, 11 Jun 2021 02:40:12 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id o139sm4981655pfd.96.2021.06.11.02.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 02:40:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/2] powerpc/64: Option to use ELF V2 ABI for big-endian
 kernels
Date: Fri, 11 Jun 2021 19:39:59 +1000
Message-Id: <20210611093959.821525-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210611093959.821525-1-npiggin@gmail.com>
References: <20210611093959.821525-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide an option to build big-endian kernels using the ELFv2 ABI. This
works on GCC only so far, although it is rumored to work with clang
that's not been tested yet. A new module version check ensures the
module ELF ABI level matches the kernel build.

This can give big-endian kernels some useful advantages of the ELFv2 ABI
(e.g., less stack usage, -mprofile-kernel, better compatibility with eBPF
tools).

BE+ELFv2 is not officially supported by the GNU toolchain, but it works
fine in testing and has been used by some userspace for some time (e.g.,
Void Linux).

Tested-by: Michal Suchánek <msuchanek@suse.de>
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                | 22 ++++++++++++++++++++++
 arch/powerpc/Makefile               | 18 ++++++++++++------
 arch/powerpc/boot/Makefile          |  4 +++-
 arch/powerpc/include/asm/module.h   | 24 ++++++++++++++++++++++++
 arch/powerpc/kernel/vdso64/Makefile | 13 +++++++++++++
 drivers/crypto/vmx/Makefile         |  8 ++++++--
 drivers/crypto/vmx/ppc-xlate.pl     | 10 ++++++----
 7 files changed, 86 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 088dd2afcfe4..093f973a28b9 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -163,6 +163,7 @@ config PPC
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
+	select PPC64_BUILD_ELF_V2_ABI		if PPC64 && CPU_LITTLE_ENDIAN
 	select CLONE_BACKWARDS
 	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
 	select DMA_OPS_BYPASS			if PPC64
@@ -561,6 +562,27 @@ config KEXEC_FILE
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
+config PPC64_BUILD_ELF_V2_ABI
+	bool
+
+config PPC64_BUILD_BIG_ENDIAN_ELF_V2_ABI
+	bool "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)"
+	depends on PPC64 && CPU_BIG_ENDIAN && EXPERT
+	depends on CC_IS_GCC && LD_VERSION >= 22400
+	default n
+	select PPC64_BUILD_ELF_V2_ABI
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
+	  This requires GCC and binutils 2.24 or newer.
+
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 3212d076ac6a..b90b5cb799aa 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -91,10 +91,14 @@ endif
 
 ifdef CONFIG_PPC64
 ifndef CONFIG_CC_IS_CLANG
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mcall-aixdesc)
-aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
-aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
+ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
+cflags-y				+= $(call cc-option,-mabi=elfv2)
+aflags-y				+= $(call cc-option,-mabi=elfv2)
+else
+cflags-y				+= $(call cc-option,-mabi=elfv1)
+cflags-y				+= $(call cc-option,-mcall-aixdesc)
+aflags-y				+= $(call cc-option,-mabi=elfv1)
+endif
 endif
 endif
 
@@ -142,15 +146,17 @@ endif
 
 CFLAGS-$(CONFIG_PPC64)	:= $(call cc-option,-mtraceback=no)
 ifndef CONFIG_CC_IS_CLANG
-ifdef CONFIG_CPU_LITTLE_ENDIAN
-CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
+ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
+CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2)
 AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2)
 else
+# Keep these in synch with arch/powerpc/kernel/vdso64/Makefile
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
 AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
 endif
 endif
+
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
 
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 2b8da923ceca..be84a72f8258 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -40,6 +40,9 @@ BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 
 ifdef CONFIG_PPC64_BOOT_WRAPPER
 BOOTCFLAGS	+= -m64
+ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
+BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
+endif
 else
 BOOTCFLAGS	+= -m32
 endif
@@ -50,7 +53,6 @@ ifdef CONFIG_CPU_BIG_ENDIAN
 BOOTCFLAGS	+= -mbig-endian
 else
 BOOTCFLAGS	+= -mlittle-endian
-BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
 endif
 
 BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc
diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
index 857d9ff24295..043e11068ff4 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -52,6 +52,30 @@ struct mod_arch_specific {
 	unsigned int num_bugs;
 };
 
+/*
+ * Check kernel module ELF header architecture specific compatibility.
+ */
+static inline bool elf_check_module_arch(Elf_Ehdr *hdr)
+{
+	if (!elf_check_arch(hdr))
+		return false;
+
+	if (IS_ENABLED(CONFIG_PPC64)) {
+		unsigned long abi_level = hdr->e_flags & 0x3;
+
+		if (IS_ENABLED(CONFIG_PPC64_BUILD_ELF_V2_ABI)) {
+			if (abi_level != 2)
+				return false;
+		} else {
+			if (abi_level >= 2)
+				return false;
+		}
+	}
+
+	return true;
+}
+#define elf_check_module_arch elf_check_module_arch
+
 /*
  * Select ELF headers.
  * Make empty section for module_frob_arch_sections to expand.
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index 2813e3f98db6..d783c07e558f 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -25,6 +25,19 @@ KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
 
+# Always build vdso64 with ELFv1 ABI for BE kernels
+ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
+ifdef CONFIG_CPU_BIG_ENDIAN
+KBUILD_CFLAGS := $(filter-out -mabi=elfv2,$(KBUILD_CFLAGS))
+KBUILD_AFLAGS := $(filter-out -mabi=elfv2,$(KBUILD_AFLAGS))
+
+# These are derived from arch/powerpc/Makefile
+KBUILD_CFLAGS += $(call cc-option,-mabi=elfv1)
+KBUILD_CFLAGS += $(call cc-option,-mcall-aixdesc)
+KBUILD_AFLAGS += $(call cc-option,-mabi=elfv1)
+endif
+endif
+
 ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
 	-Wl,-soname=linux-vdso64.so.1 -Wl,--hash-style=both
 asflags-y := -D__VDSO64__ -s
diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
index 709670d2b553..d9ccf9fc3483 100644
--- a/drivers/crypto/vmx/Makefile
+++ b/drivers/crypto/vmx/Makefile
@@ -5,18 +5,22 @@ vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
 override flavour := linux-ppc64le
 else
+ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
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

