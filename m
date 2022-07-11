Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 046CE57056B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 16:21:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhR0D6qYNz3fC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 00:21:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhQyd1dVTz3cgR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 00:20:25 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LhQyW0f1Vz9syl;
	Mon, 11 Jul 2022 16:20:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJx6Rx1wImn7; Mon, 11 Jul 2022 16:20:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LhQyT355Zz9sWf;
	Mon, 11 Jul 2022 16:20:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 501358B767;
	Mon, 11 Jul 2022 16:20:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3ukEkA7wFWIv; Mon, 11 Jul 2022 16:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 26F068B763;
	Mon, 11 Jul 2022 16:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 26BEKDuN1585545
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 16:20:13 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 26BEKAD71585544;
	Mon, 11 Jul 2022 16:20:10 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 5/5] powerpc/64e: Fix build failure with GCC 12 (unrecognized opcode: `wrteei')
Date: Mon, 11 Jul 2022 16:19:33 +0200
Message-Id: <77255a5a957967723b84d0356d9e5fb21569f4e8.1657549153.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
References: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657549171; l=3308; s=20211009; h=from:subject:message-id; bh=F08XQ41qHsNwyww07By3SsSsHc2HqIPTLBMOFGw4Qjs=; b=2QNkvFUofsJhheU7la9v8qhfdENheBl+IvRAYTIydDlOEosdhOAl1GWf1opNt33ZEAf5dnI3EKp+ 65C6ptEsD/fa2CrTbwJuyIF6odfjJuqjPlAvxqg5q99oTZjBUtcE
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With GCC 12, corenet64_smp_defconfig leads to the following build errors:

  CC      arch/powerpc/kernel/irq.o
{standard input}: Assembler messages:
{standard input}:3616: Error: unrecognized opcode: `wrteei'
{standard input}:5689: Error: unrecognized opcode: `wrteei'
  CC      arch/powerpc/kernel/pmc.o
{standard input}: Assembler messages:
{standard input}:42: Error: unrecognized opcode: `mfpmr'
{standard input}:53: Error: unrecognized opcode: `mtpmr'
  CC      arch/powerpc/kernel/io.o
{standard input}: Assembler messages:
{standard input}:376: Error: unrecognized opcode: `mbar'
...
  CC      arch/powerpc/mm/nohash/book3e_hugetlbpage.o
{standard input}: Assembler messages:
{standard input}:291: Error: unrecognized opcode: `tlbsx'
{standard input}:482: Error: unrecognized opcode: `tlbwe'
{standard input}:608: Error: unrecognized opcode: `lbarx'
{standard input}:608: Error: unrecognized opcode: `stbcx.'

-mpcu=powerpc64 cannot be used anymore for book3e, it must be a booke CPU.

But then we get:

  CC      arch/powerpc/lib/xor_vmx.o
cc1: error: AltiVec not supported in this target

Altivec is not supported with -mcpu=e5500 so don't allow selection
of altivec when e5500 is selected.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile                  | 8 +-------
 arch/powerpc/platforms/Kconfig.cputype | 8 ++++----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index d54e1fe03551..02742facf895 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -168,13 +168,7 @@ endif
 CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
 AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
 
-# Altivec option not allowed with e500mc64 in GCC.
-ifdef CONFIG_ALTIVEC
-E5500_CPU := -mcpu=powerpc64
-else
-E5500_CPU := $(call cc-option,-mcpu=e500mc64,-mcpu=powerpc64)
-endif
-CFLAGS-$(CONFIG_E5500_CPU) += $(E5500_CPU)
+CFLAGS-$(CONFIG_E5500_CPU) += $(call cc-option,-mcpu=e500mc64,-mcpu=powerpc64)
 CFLAGS-$(CONFIG_E6500_CPU) += $(call cc-option,-mcpu=e6500,$(E5500_CPU))
 
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 3cc8452b8660..5185d942b455 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -126,12 +126,12 @@ choice
 
 config GENERIC_CPU
 	bool "Generic (POWER4 and above)"
-	depends on PPC64 && !CPU_LITTLE_ENDIAN
-	select PPC_64S_HASH_MMU if PPC_BOOK3S_64
+	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	select PPC_64S_HASH_MMU
 
 config GENERIC_CPU
 	bool "Generic (POWER8 and above)"
-	depends on PPC64 && CPU_LITTLE_ENDIAN
+	depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
 	select ARCH_HAS_FAST_MULTIPLIER
 	select PPC_64S_HASH_MMU
 
@@ -358,7 +358,7 @@ config PHYS_64BIT
 
 config ALTIVEC
 	bool "AltiVec Support"
-	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64 || (PPC_E500MC && PPC64)
+	depends on PPC_BOOK3S || (PPC_E500MC && PPC64 && !E5500_CPU)
 	select PPC_FPU
 	help
 	  This option enables kernel support for the Altivec extensions to the
-- 
2.36.1

