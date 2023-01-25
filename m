Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1286067AB10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 08:40:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1wjJ0F7hz3fCD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 18:40:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1whm59LMz3c6s
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 18:39:33 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4P1whb5Xk7z9sZc;
	Wed, 25 Jan 2023 08:39:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MT6z57Ty28-a; Wed, 25 Jan 2023 08:39:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4P1whb4kwSz9sZb;
	Wed, 25 Jan 2023 08:39:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9366E8B76C;
	Wed, 25 Jan 2023 08:39:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xXLeK9_K2_mb; Wed, 25 Jan 2023 08:39:27 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 71CB98B763;
	Wed, 25 Jan 2023 08:39:27 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 30P7dH6q2507485
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 08:39:17 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 30P7dHEt2507480;
	Wed, 25 Jan 2023 08:39:17 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
Date: Wed, 25 Jan 2023 08:38:59 +0100
Message-Id: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674632338; l=4553; s=20211009; h=from:subject:message-id; bh=o5ZG3kS7s56YN6S0PENEuRRm8HrUICRj+MzBkRcmHjo=; b=jwAxWm0+nUIWpzOVipi0FuGhCR25nXlZGvS1cK2r0YHp9W2Mh2eKWVIk9m9AQ0XTb3mKz2DW/nU5 0ZsqrPzlBZxlQF8/Y2dinfmNB0ehv9ENSWVFvC9hVoDJJXOEnGl4
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since 0069f3d14e7a ("powerpc/64e: Tie PPC_BOOK3E_64 to PPC_E500MC"), the
only possible BOOK3E/64 are E500, so no need of a default CPU over the
E5500.

When the user selects book3e, they must have an e500 compatible
compiler, and it won't work anymore with the default -mcpu=power64, see
commit d6b551b8f90c ("powerpc/64e: Fix build failure with GCC 12
(unrecognized opcode: `wrteei')").

For book3s/64, replace GENERIC_CPU by POWERPC64_CPU to match the PPC32
POWERPC_CPU, and set a default mpcu value in Kconfig directly.

When a user selects a particular CPU, they must ensure the compiler has
the requested capability. Therefore, remove hidden fallback, instead
offer user the possibility to say they want to use the toolchain
default.

Fixes: d6b551b8f90c ("powerpc/64e: Fix build failure with GCC 12 (unrecognized opcode: `wrteei')")
Reported-by: Pali Rohár <pali@kernel.org>
Tested-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/3fd60c2d8a28668a42b766b18362a526ef47e757.1670420281.git.christophe.leroy@csgroup.eu
---
 arch/powerpc/Makefile                  | 22 +++++-----------------
 arch/powerpc/platforms/Kconfig.cputype | 12 +++++++-----
 2 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index dc4cbf0a5ca9..bf5f0a998273 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -146,19 +146,6 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
 
 CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 
-ifdef CONFIG_PPC_BOOK3S_64
-ifdef CONFIG_CPU_LITTLE_ENDIAN
-CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power8
-else
-CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power4
-endif
-CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power10,	\
-				  $(call cc-option,-mtune=power9,	\
-				  $(call cc-option,-mtune=power8)))
-else ifdef CONFIG_PPC_BOOK3E_64
-CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
-endif
-
 ifdef CONFIG_FUNCTION_TRACER
 CC_FLAGS_FTRACE := -pg
 ifdef CONFIG_MPROFILE_KERNEL
@@ -166,11 +153,12 @@ CC_FLAGS_FTRACE += -mprofile-kernel
 endif
 endif
 
-CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
-AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
+CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
+AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
 
-CFLAGS-$(CONFIG_E5500_CPU) += $(call cc-option,-mcpu=e500mc64,-mcpu=powerpc64)
-CFLAGS-$(CONFIG_E6500_CPU) += $(call cc-option,-mcpu=e6500,$(E5500_CPU))
+CFLAGS-$(CONFIG_POWERPC64_CPU) += $(call cc-option,-mtune=power10,	\
+				  $(call cc-option,-mtune=power9,	\
+				  $(call cc-option,-mtune=power8)))
 
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 9563336e3348..31cea2eeb59e 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -118,19 +118,18 @@ endchoice
 
 choice
 	prompt "CPU selection"
-	default GENERIC_CPU
 	help
 	  This will create a kernel which is optimised for a particular CPU.
 	  The resulting kernel may not run on other CPUs, so use this with care.
 
 	  If unsure, select Generic.
 
-config GENERIC_CPU
+config POWERPC64_CPU
 	bool "Generic (POWER5 and PowerPC 970 and above)"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
 	select PPC_64S_HASH_MMU
 
-config GENERIC_CPU
+config POWERPC64_CPU
 	bool "Generic (POWER8 and above)"
 	depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
 	select ARCH_HAS_FAST_MULTIPLIER
@@ -233,13 +232,12 @@ config E500MC_CPU
 
 config TOOLCHAIN_DEFAULT_CPU
 	bool "Rely on the toolchain's implicit default CPU"
-	depends on PPC32
 
 endchoice
 
 config TARGET_CPU_BOOL
 	bool
-	default !GENERIC_CPU && !TOOLCHAIN_DEFAULT_CPU
+	default !TOOLCHAIN_DEFAULT_CPU
 
 config TARGET_CPU
 	string
@@ -251,6 +249,10 @@ config TARGET_CPU
 	default "power8" if POWER8_CPU
 	default "power9" if POWER9_CPU
 	default "power10" if POWER10_CPU
+	default "e500mc64" if E5500_CPU
+	default "e6500" if E6500_CPU
+	default "power4" if POWERPC64_CPU && !CPU_LITTLE_ENDIAN
+	default "power8" if POWERPC64_CPU && CPU_LITTLE_ENDIAN
 	default "405" if 405_CPU
 	default "440" if 440_CPU
 	default "464" if 464_CPU
-- 
2.38.1

