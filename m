Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 517C756D089
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 19:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LgvNp1zR6z3cFp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 03:37:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LgvNL5xcYz3bf5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 03:37:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LgvN975d3z9tBg;
	Sun, 10 Jul 2022 19:37:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFYdHpefMfcf; Sun, 10 Jul 2022 19:37:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LgvN95wHnz9sky;
	Sun, 10 Jul 2022 19:37:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A96FF8B766;
	Sun, 10 Jul 2022 19:37:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5X18vOPkBfUb; Sun, 10 Jul 2022 19:37:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (po17996.idsi0.si.c-s.fr [192.168.232.32])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 69EA38B763;
	Sun, 10 Jul 2022 19:37:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 26AHb6DB1332607
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 10 Jul 2022 19:37:06 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 26AHb5PA1332606;
	Sun, 10 Jul 2022 19:37:05 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/32: Don't always pass -mcpu=powerpc to the compiler
Date: Sun, 10 Jul 2022 19:36:58 +0200
Message-Id: <e547df86b7195bb9cc5558afb4c74aeefe286849.1657474606.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657474617; l=4811; s=20211009; h=from:subject:message-id; bh=jPmbUdTK5z1F0Gw1GHFmot5SHRgU7RzNPyx4IiXi7EA=; b=ga5mDMQu9QMVLt+x1Mj8z5lvoroxU6AQ0inO+LQSV9y8xlNx00/KJ60bZkep8K0tYrcQUap7x97Y 5CAwaNmQCsK/u45he3/iwnlt4WXaP1xUP45xp9rE6C/1shFD4q0P
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 4bf4f42a2feb ("powerpc/kbuild: Set default generic
machine type for 32-bit compile"), when building a 32 bits kernel
with a bi-arch version of GCC, or when building a book3s/32 kernel,
the option -mcpu=powerpc is passed to GCC at all time, relying on it
being eventually overriden by a subsequent -mcpu=xxxx.

But when building the same kernel with a 32 bits only version of GCC,
that is not done, relying on gcc being built with the expected default
CPU.

This logic has two problems. First, it is a bit fragile to rely on
whether the GCC version is bi-arch or not, because today we can have
bi-arch versions of GCC configured with a 32 bits default. Second,
there are some versions of GCC which don't support -mcpu=powerpc,
for instance for e500 SPE-only versions.

So, stop relying on this approximative logic and allow the user to
decide whether he/she wants to use the toolchain's default CPU or if
he/she wants to set one, and allow only possible CPUs based on the
selected target.

Reported-by: Pali Rohár <pali@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile                  | 26 +-------------------------
 arch/powerpc/platforms/Kconfig.cputype | 24 ++++++++++++++++++++----
 2 files changed, 21 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a0cd70712061..d54e1fe03551 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -15,23 +15,6 @@ HAS_BIARCH	:= $(call cc-option-yn, -m32)
 # Set default 32 bits cross compilers for vdso and boot wrapper
 CROSS32_COMPILE ?=
 
-ifeq ($(HAS_BIARCH),y)
-ifeq ($(CROSS32_COMPILE),)
-ifdef CONFIG_PPC32
-# These options will be overridden by any -mcpu option that the CPU
-# or platform code sets later on the command line, but they are needed
-# to set a sane 32-bit cpu target for the 64-bit cross compiler which
-# may default to the wrong ISA.
-KBUILD_CFLAGS		+= -mcpu=powerpc
-KBUILD_AFLAGS		+= -mcpu=powerpc
-endif
-endif
-endif
-
-ifdef CONFIG_PPC_BOOK3S_32
-KBUILD_CFLAGS		+= -mcpu=powerpc
-endif
-
 # If we're on a ppc/ppc64/ppc64le machine use that defconfig, otherwise just use
 # ppc64_defconfig because we have nothing better to go on.
 uname := $(shell uname -m)
@@ -183,6 +166,7 @@ endif
 endif
 
 CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
+AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
 
 # Altivec option not allowed with e500mc64 in GCC.
 ifdef CONFIG_ALTIVEC
@@ -193,14 +177,6 @@ endif
 CFLAGS-$(CONFIG_E5500_CPU) += $(E5500_CPU)
 CFLAGS-$(CONFIG_E6500_CPU) += $(call cc-option,-mcpu=e6500,$(E5500_CPU))
 
-ifdef CONFIG_PPC32
-ifdef CONFIG_PPC_E500MC
-CFLAGS-y += $(call cc-option,-mcpu=e500mc,-mcpu=powerpc)
-else
-CFLAGS-$(CONFIG_E500) += $(call cc-option,-mcpu=8540 -msoft-float,-mcpu=powerpc)
-endif
-endif
-
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
 KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 383ed4fe6013..197653442d9f 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -117,7 +117,8 @@ endchoice
 
 choice
 	prompt "CPU selection"
-	default GENERIC_CPU
+	default GENERIC_CPU if PPC64
+	default POWERPC_CPU if PPC32
 	help
 	  This will create a kernel which is optimised for a particular CPU.
 	  The resulting kernel may not run on other CPUs, so use this with care.
@@ -135,9 +136,13 @@ config GENERIC_CPU
 	select ARCH_HAS_FAST_MULTIPLIER
 	select PPC_64S_HASH_MMU
 
-config GENERIC_CPU
+config POWERPC_CPU
 	bool "Generic 32 bits powerpc"
-	depends on PPC32 && !PPC_8xx
+	depends on PPC32 && !PPC_8xx && !E500
+
+config TOOLCHAIN_DEFAULT_CPU
+	bool "Rely on the toolchain's implicit default CPU"
+	depends on PPC32
 
 config CELL_CPU
 	bool "Cell Broadband Engine"
@@ -196,11 +201,19 @@ config G4_CPU
 	depends on PPC_BOOK3S_32
 	select ALTIVEC
 
+config 8540_CPU
+	bool "8540"
+	depends on PPC_85xx && !PPC_E500MC
+
+config E500MC_CPU
+	bool "e500mc"
+	depends on PPC_85xx && PPC_E500MC
+
 endchoice
 
 config TARGET_CPU_BOOL
 	bool
-	default !GENERIC_CPU
+	default !GENERIC_CPU && !TOOLCHAIN_DEFAULT_CPU
 
 config TARGET_CPU
 	string
@@ -215,6 +228,9 @@ config TARGET_CPU
 	default "e300c2" if E300C2_CPU
 	default "e300c3" if E300C3_CPU
 	default "G4" if G4_CPU
+	default "8540" if 8540_CPU
+	default "e500mc" if E500MC_CPU
+	default "powerpc" if POWERPC_CPU
 
 config PPC_BOOK3S
 	def_bool y
-- 
2.36.1

