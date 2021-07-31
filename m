Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043833DC3B3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 08:03:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GcDFy6Bmnz3cVT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 16:03:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=Ks+HHPyi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.74;
 helo=conuserg-07.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=Ks+HHPyi; 
 dkim-atps=neutral
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GcDFW4Vhtz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jul 2021 16:02:39 +1000 (AEST)
Received: from localhost.localdomain ([133.106.57.58]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id 16V60MNT006940;
 Sat, 31 Jul 2021 15:00:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 16V60MNT006940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1627711224;
 bh=E1KYte6EKYvuOXcazzHUuX4uprDRxjj1nwZUGGg69y0=;
 h=From:To:Cc:Subject:Date:From;
 b=Ks+HHPyiQsB4OoMywyC5471MbAfkkwSCZmNeD3PTw1B3lkQ77LuPVzltS9vjmtHEv
 gj73bxnaUqARREufMNwMwgIeatkcHNp+6iL5DFpOkOZ05S0IRw2JTwUe+pgLfMC2L1
 cEcFnXt4M31ltZPd8C9XlBCW/oU5ZzLVPIHyRUkUYUMicyzf043T8Yh6JSVAuLdhBk
 cp901SEFrI1NoseIv+DFPesUZambG8FswAOb3cMqcFgucI8L/apFEImtob/q4dTCVw
 GXnsE6nm0/tOCQrT/4SXRTAGep0guoXmym5jgKo0iB+B3ILb8JHYquSWBPqdhTHxxV
 F030NsS4YZ7mQ==
X-Nifty-SrcIP: [133.106.57.58]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arch: vdso: remove if-conditionals of $(c-gettimeofday-y)
Date: Sat, 31 Jul 2021 15:00:20 +0900
Message-Id: <20210731060020.12913-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-csky@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arm, arm64, csky, mips, powerpc always select GENERIC_GETTIMEOFDAY,
hence $(gettimeofday-y) never becomes empty.

riscv conditionally selects GENERIC_GETTIMEOFDAY when MMU=y && 64BIT=y,
but arch/riscv/kernel/vdso/vgettimeofday.o is built only under that
condition. So, you can always define CFLAGS_vgettimeofday.o

Remove all the meaningless conditionals.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Fix csky as well

 arch/arm/vdso/Makefile              |  4 ----
 arch/arm64/kernel/vdso/Makefile     |  5 +----
 arch/arm64/kernel/vdso32/Makefile   |  3 ---
 arch/csky/kernel/vdso/Makefile      |  4 +---
 arch/mips/vdso/Makefile             |  2 --
 arch/powerpc/kernel/vdso32/Makefile | 14 ++++++--------
 arch/powerpc/kernel/vdso64/Makefile | 14 ++++++--------
 arch/riscv/kernel/vdso/Makefile     |  5 +----
 8 files changed, 15 insertions(+), 36 deletions(-)

diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index 7c9e395b77f7..d996b57ca19d 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -29,11 +29,7 @@ CFLAGS_REMOVE_vdso.o = -pg
 
 # Force -O2 to avoid libgcc dependencies
 CFLAGS_REMOVE_vgettimeofday.o = -pg -Os $(GCC_PLUGINS_CFLAGS)
-ifeq ($(c-gettimeofday-y),)
-CFLAGS_vgettimeofday.o = -O2
-else
 CFLAGS_vgettimeofday.o = -O2 -include $(c-gettimeofday-y)
-endif
 
 # Disable gcov profiling for VDSO code
 GCOV_PROFILE := n
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 945e6bb326e3..5545c28e0e6e 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -37,10 +37,7 @@ OBJECT_FILES_NON_STANDARD	:= y
 KCOV_INSTRUMENT			:= n
 
 CFLAGS_vgettimeofday.o = -O2 -mcmodel=tiny -fasynchronous-unwind-tables
-
-ifneq ($(c-gettimeofday-y),)
-  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
-endif
+CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
 
 # Disable gcov profiling for VDSO code
 GCOV_PROFILE := n
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 3dba0c4f8f42..330111046afc 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -133,10 +133,7 @@ hostprogs := $(munge)
 
 c-obj-vdso := note.o
 c-obj-vdso-gettimeofday := vgettimeofday.o
-
-ifneq ($(c-gettimeofday-y),)
 VDSO_CFLAGS_gettimeofday_o += -include $(c-gettimeofday-y)
-endif
 
 VDSO_CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
 
diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
index 0b6909f10667..432adf2c78c2 100644
--- a/arch/csky/kernel/vdso/Makefile
+++ b/arch/csky/kernel/vdso/Makefile
@@ -12,9 +12,7 @@ vdso-syms  += vgettimeofday
 # Files to link into the vdso
 obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
 
-ifneq ($(c-gettimeofday-y),)
-	CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
-endif
+CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
 
 ccflags-y := -fno-stack-protector -DBUILD_VDSO32
 
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 1b2ea34c3d3b..c409d551972a 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -36,7 +36,6 @@ cflags-vdso := $(ccflags-vdso) \
 aflags-vdso := $(ccflags-vdso) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
 
-ifneq ($(c-gettimeofday-y),)
 CFLAGS_vgettimeofday.o = -include $(c-gettimeofday-y)
 
 # config-n32-o32-env.c prepares the environment to build a 32bit vDSO
@@ -44,7 +43,6 @@ CFLAGS_vgettimeofday.o = -include $(c-gettimeofday-y)
 # Note: Needs to be included before than the generic library.
 CFLAGS_vgettimeofday-o32.o = -include $(srctree)/$(src)/config-n32-o32-env.c -include $(c-gettimeofday-y)
 CFLAGS_vgettimeofday-n32.o = -include $(srctree)/$(src)/config-n32-o32-env.c -include $(c-gettimeofday-y)
-endif
 
 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
 
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 7d9a6fee0e3d..2386abc6fa58 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -7,14 +7,12 @@ include $(srctree)/lib/vdso/Makefile
 
 obj-vdso32 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o getcpu.o
 
-ifneq ($(c-gettimeofday-y),)
-  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
-  CFLAGS_vgettimeofday.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
-  CFLAGS_vgettimeofday.o += $(call cc-option, -fno-stack-protector)
-  CFLAGS_vgettimeofday.o += -DDISABLE_BRANCH_PROFILING
-  CFLAGS_vgettimeofday.o += -ffreestanding -fasynchronous-unwind-tables
-  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
-endif
+CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
+CFLAGS_vgettimeofday.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
+CFLAGS_vgettimeofday.o += $(call cc-option, -fno-stack-protector)
+CFLAGS_vgettimeofday.o += -DDISABLE_BRANCH_PROFILING
+CFLAGS_vgettimeofday.o += -ffreestanding -fasynchronous-unwind-tables
+CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
 
 # Build rules
 
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index 2813e3f98db6..cdf748ebdcde 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -6,14 +6,12 @@ include $(srctree)/lib/vdso/Makefile
 
 obj-vdso64 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o getcpu.o
 
-ifneq ($(c-gettimeofday-y),)
-  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
-  CFLAGS_vgettimeofday.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
-  CFLAGS_vgettimeofday.o += $(call cc-option, -fno-stack-protector)
-  CFLAGS_vgettimeofday.o += -DDISABLE_BRANCH_PROFILING
-  CFLAGS_vgettimeofday.o += -ffreestanding -fasynchronous-unwind-tables
-  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
-endif
+CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
+CFLAGS_vgettimeofday.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
+CFLAGS_vgettimeofday.o += $(call cc-option, -fno-stack-protector)
+CFLAGS_vgettimeofday.o += -DDISABLE_BRANCH_PROFILING
+CFLAGS_vgettimeofday.o += -ffreestanding -fasynchronous-unwind-tables
+CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
 
 # Build rules
 
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 24d936c147cd..7653767a6100 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -17,10 +17,7 @@ vdso-syms += flush_icache
 obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
 
 ccflags-y := -fno-stack-protector
-
-ifneq ($(c-gettimeofday-y),)
-  CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
-endif
+CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
 
 # Build rules
 targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds vdso-syms.S
-- 
2.27.0

