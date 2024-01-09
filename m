Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA9D828732
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 14:36:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zp01BxRQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8X5f6c8kz3cSt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 00:36:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zp01BxRQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8X4r2bx5z2yts
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 00:35:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F2A25CE18C1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 13:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7132C433F1;
	Tue,  9 Jan 2024 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704807352;
	bh=duWloYHiG4aCNna2GOMdbN5p1HXeQGIkD/W4DJmd1I4=;
	h=From:To:Subject:Date:From;
	b=Zp01BxRQuCOpE069m3Cb5IgqUJ389OXQgL1panmYP5yXa3zhCfjCZUqBsi1sOPp5R
	 iRGCu/NAtmTNXSFNql1gJXUkDXbECHyJfSlYqLrUYXLF87pno8E59Cgy4g6gmtREfm
	 qrtZ7FmHdINLBczq4Pv5cS8h1kFlyjiTA4hm5iYBRGXRbFUfbHqoxScERtIqq9HaCc
	 W8u+aGR3tkh9YOSTonQZSj3tpDyRyFLViPUGLtopUBYsHZRnHLq2IdCTM4NfFkcoV3
	 p8ud3RGjPR27GJ+pcOLaMUDeT82ErpsDxBztEaT55QoIsdI7xuJkjaZ7/Sk74GzRSz
	 26BUoClq1nEng==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/Makefile: Remove bits related to the previous use of -mcmodel=large
Date: Tue,  9 Jan 2024 19:04:20 +0530
Message-ID: <20240109133420.3048719-1-naveen@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All supported compilers today (gcc v5.1+ and clang v11+) have support for
-mcmodel=medium. As such, NO_MINIMAL_TOC is no longer being set. Remove
NO_MINIMAL_TOC as well as the fallback to -mminimal-toc.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Makefile                   | 6 +-----
 arch/powerpc/kernel/Makefile            | 3 ---
 arch/powerpc/lib/Makefile               | 2 --
 arch/powerpc/mm/Makefile                | 2 --
 arch/powerpc/mm/book3s64/Makefile       | 2 --
 arch/powerpc/mm/nohash/Makefile         | 2 --
 arch/powerpc/platforms/pseries/Makefile | 1 -
 arch/powerpc/sysdev/Makefile            | 2 --
 arch/powerpc/xmon/Makefile              | 2 --
 9 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 051247027da0..a0eb0fb1aba8 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -114,7 +114,6 @@ LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
 
 ifdef CONFIG_PPC64
 ifndef CONFIG_PPC_KERNEL_PCREL
-ifeq ($(call cc-option-yn,-mcmodel=medium),y)
 	# -mcmodel=medium breaks modules because it uses 32bit offsets from
 	# the TOC pointer to create pointers where possible. Pointers into the
 	# percpu data area are created by this method.
@@ -124,9 +123,6 @@ ifeq ($(call cc-option-yn,-mcmodel=medium),y)
 	# kernel percpu data space (starting with 0xc...). We need a full
 	# 64bit relocation for this to work, hence -mcmodel=large.
 	KBUILD_CFLAGS_MODULE += -mcmodel=large
-else
-	export NO_MINIMAL_TOC := -mno-minimal-toc
-endif
 endif
 endif
 
@@ -139,7 +135,7 @@ CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
 endif
 endif
-CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
+CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium)
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mlong-double-128)
 
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 2919433be355..2b0567926259 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -3,9 +3,6 @@
 # Makefile for the linux kernel.
 #
 
-ifdef CONFIG_PPC64
-CFLAGS_prom_init.o	+= $(NO_MINIMAL_TOC)
-endif
 ifdef CONFIG_PPC32
 CFLAGS_prom_init.o      += -fPIC
 CFLAGS_btext.o		+= -fPIC
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 6eac63e79a89..50d88651d04f 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -3,8 +3,6 @@
 # Makefile for ppc-specific library files..
 #
 
-ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
-
 CFLAGS_code-patching.o += -fno-stack-protector
 CFLAGS_feature-fixups.o += -fno-stack-protector
 
diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index 503a6e249940..0fe2f085c05a 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for the linux ppc-specific parts of the memory manager.
 #
 
-ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
-
 obj-y				:= fault.o mem.o pgtable.o maccess.o pageattr.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
 				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index cad2abc1730f..33af5795856a 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -1,7 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ccflags-y	:= $(NO_MINIMAL_TOC)
-
 obj-y				+= mmu_context.o pgtable.o trace.o
 ifdef CONFIG_PPC_64S_HASH_MMU
 CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index f3894e79d5f7..b3f0498dd42f 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -1,7 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
-
 obj-y				+= mmu_context.o tlb.o tlb_low.o kup.o
 obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_low_64e.o book3e_pgtable.o
 obj-$(CONFIG_40x)		+= 40x.o
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index f936962a2946..7bf506f6b8c8 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-$(CONFIG_PPC64)			:= $(NO_MINIMAL_TOC)
 ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
 
 obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
index 9cb1d029511a..24a177d164f1 100644
--- a/arch/powerpc/sysdev/Makefile
+++ b/arch/powerpc/sysdev/Makefile
@@ -1,7 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ccflags-$(CONFIG_PPC64)		:= $(NO_MINIMAL_TOC)
-
 mpic-msi-obj-$(CONFIG_PCI_MSI)	+= mpic_msi.o mpic_u3msi.o
 obj-$(CONFIG_MPIC)		+= mpic.o $(mpic-msi-obj-y)
 obj-$(CONFIG_MPIC_TIMER)        += mpic_timer.o
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index 682c7c0a6f77..d778011060a8 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -10,8 +10,6 @@ KCSAN_SANITIZE := n
 # Disable ftrace for the entire directory
 ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
 
-ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
-
 # Clang stores addresses on the stack causing the frame size to blow
 # out. See https://github.com/ClangBuiltLinux/linux/issues/252
 ccflags-$(CONFIG_CC_IS_CLANG) += -Wframe-larger-than=4096

base-commit: 414e92af226ede4935509b0b5e041810c92e003f
-- 
2.43.0

