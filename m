Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 205AA570566
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 16:21:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhQzh0RJtz3f72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 00:21:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhQyX6MZCz3c6n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 00:20:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LhQyT4Vhcz9t1p;
	Mon, 11 Jul 2022 16:20:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-0GJUldNXWa; Mon, 11 Jul 2022 16:20:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LhQyS32Kbz9syk;
	Mon, 11 Jul 2022 16:20:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 546588B763;
	Mon, 11 Jul 2022 16:20:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0Wg31UiOYWHL; Mon, 11 Jul 2022 16:20:16 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 29FA28B76E;
	Mon, 11 Jul 2022 16:20:16 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 26BEK4kM1585541
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 16:20:05 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 26BEK4Sf1585529;
	Mon, 11 Jul 2022 16:20:04 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 4/5] powerpc/44x: Fix build failure with GCC 12 (unrecognized opcode: `wrteei')
Date: Mon, 11 Jul 2022 16:19:32 +0200
Message-Id: <b0d982e223314ed82ab959f5d4ad2c4c00bedb99.1657549153.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
References: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657549171; l=6141; s=20211009; h=from:subject:message-id; bh=++/30QlSJ8vkqeESZh8XVzHeyFmX60G9YMu3JnOoFos=; b=haDTntHgoktJ85zE5iG0rkUYAdj/MyWUebuCiYl4fSW1PrmmiDRBZUzXlAlBA6bflAZG+fMoMaS+ R9PcLUzrD2sDxdLRR7jR4kFyZ7UxL4f2Nzb2ufjXflj9/4Fh0oN7
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

Building ppc40x_defconfig leads to following error

  CC      arch/powerpc/kernel/idle.o
{standard input}: Assembler messages:
{standard input}:67: Error: unrecognized opcode: `wrteei'
{standard input}:78: Error: unrecognized opcode: `wrteei'

Add -mcpu=440 by default and alternatively 464 and 476.

Once that's done, -mcpu=powerpc is only for book3s/32 now.

But then comes

  CC      arch/powerpc/kernel/io.o
{standard input}: Assembler messages:
{standard input}:198: Error: unrecognized opcode: `eieio'
{standard input}:230: Error: unrecognized opcode: `eieio'
{standard input}:245: Error: unrecognized opcode: `eieio'
{standard input}:254: Error: unrecognized opcode: `eieio'
{standard input}:273: Error: unrecognized opcode: `eieio'
{standard input}:396: Error: unrecognized opcode: `eieio'
{standard input}:404: Error: unrecognized opcode: `eieio'
{standard input}:423: Error: unrecognized opcode: `eieio'
{standard input}:512: Error: unrecognized opcode: `eieio'
{standard input}:520: Error: unrecognized opcode: `eieio'
{standard input}:539: Error: unrecognized opcode: `eieio'
{standard input}:628: Error: unrecognized opcode: `eieio'
{standard input}:636: Error: unrecognized opcode: `eieio'
{standard input}:655: Error: unrecognized opcode: `eieio'

Fix it by replacing eieio by mbar on booke.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/barrier.h        |  2 ++
 arch/powerpc/include/asm/nohash/pgtable.h |  2 +-
 arch/powerpc/include/asm/synch.h          |  5 ++++-
 arch/powerpc/mm/nohash/tlb_low.S          |  4 ++--
 arch/powerpc/platforms/Kconfig.cputype    | 17 ++++++++++++++++-
 arch/powerpc/sysdev/fsl_rio.c             | 12 ++++++++++--
 6 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index f0e687236484..ef2d8b15eaab 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -42,6 +42,8 @@
 /* The sub-arch has lwsync */
 #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
 #    define SMPWMB      LWSYNC
+#elif defined(CONFIG_BOOKE)
+#    define SMPWMB      mbar
 #else
 #    define SMPWMB      eieio
 #endif
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index ac75f4ab0dba..b499da6c1a99 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -193,7 +193,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 	if (IS_ENABLED(CONFIG_PPC32) && IS_ENABLED(CONFIG_PTE_64BIT) && !percpu) {
 		__asm__ __volatile__("\
 			stw%X0 %2,%0\n\
-			eieio\n\
+			mbar\n\
 			stw%X1 %L2,%1"
 		: "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
 		: "r" (pte) : "memory");
diff --git a/arch/powerpc/include/asm/synch.h b/arch/powerpc/include/asm/synch.h
index 1d67bc8d7bc6..7130176d8cb8 100644
--- a/arch/powerpc/include/asm/synch.h
+++ b/arch/powerpc/include/asm/synch.h
@@ -14,7 +14,10 @@ extern void do_lwsync_fixups(unsigned long value, void *fixup_start,
 
 static inline void eieio(void)
 {
-	__asm__ __volatile__ ("eieio" : : : "memory");
+	if (IS_ENABLED(CONFIG_BOOKE))
+		__asm__ __volatile__ ("mbar" : : : "memory");
+	else
+		__asm__ __volatile__ ("eieio" : : : "memory");
 }
 
 static inline void isync(void)
diff --git a/arch/powerpc/mm/nohash/tlb_low.S b/arch/powerpc/mm/nohash/tlb_low.S
index dd39074de9af..d62b613a0d5d 100644
--- a/arch/powerpc/mm/nohash/tlb_low.S
+++ b/arch/powerpc/mm/nohash/tlb_low.S
@@ -186,7 +186,7 @@ _GLOBAL(_tlbivax_bcast)
 	isync
 	PPC_TLBIVAX(0, R3)
 	isync
-	eieio
+	mbar
 	tlbsync
 BEGIN_FTR_SECTION
 	b	1f
@@ -355,7 +355,7 @@ _GLOBAL(_tlbivax_bcast)
 	rlwimi	r4,r6,MAS6_SIND_SHIFT,MAS6_SIND
 1:	mtspr	SPRN_MAS6,r4		/* assume AS=0 for now */
 	PPC_TLBIVAX(0,R3)
-	eieio
+	mbar
 	tlbsync
 	sync
 	wrtee	r10
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index e14000557ebd..3cc8452b8660 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -137,7 +137,7 @@ config GENERIC_CPU
 
 config POWERPC_CPU
 	bool "Generic 32 bits powerpc"
-	depends on PPC32 && !PPC_8xx && !PPC_85xx && !40x
+	depends on PPC_BOOK3S_32
 
 config CELL_CPU
 	bool "Cell Broadband Engine"
@@ -183,6 +183,18 @@ config 405_CPU
 	bool "40x family"
 	depends on 40x
 
+config 440_CPU
+	bool "440 (44x family)"
+	depends on 44x
+
+config 464_CPU
+	bool "464 (44x family)"
+	depends on 44x
+
+config 476_CPU
+	bool "476 (47x family)"
+	depends on PPC_47x
+
 config 860_CPU
 	bool "8xx family"
 	depends on PPC_8xx
@@ -228,6 +240,9 @@ config TARGET_CPU
 	default "power8" if POWER8_CPU
 	default "power9" if POWER9_CPU
 	default "405" if 405_CPU
+	default "440" if 440_CPU
+	default "464" if 464_CPU
+	default "476" if 476_CPU
 	default "860" if 860_CPU
 	default "e300c2" if E300C2_CPU
 	default "e300c3" if E300C3_CPU
diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index 1bfc9afa8a1a..4647c6074f3b 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -69,10 +69,10 @@
 
 static DEFINE_SPINLOCK(fsl_rio_config_lock);
 
-#define __fsl_read_rio_config(x, addr, err, op)		\
+#define ___fsl_read_rio_config(x, addr, err, op, barrier)	\
 	__asm__ __volatile__(				\
 		"1:	"op" %1,0(%2)\n"		\
-		"	eieio\n"			\
+		"	"barrier"\n"			\
 		"2:\n"					\
 		".section .fixup,\"ax\"\n"		\
 		"3:	li %1,-1\n"			\
@@ -83,6 +83,14 @@ static DEFINE_SPINLOCK(fsl_rio_config_lock);
 		: "=r" (err), "=r" (x)			\
 		: "b" (addr), "i" (-EFAULT), "0" (err))
 
+#ifdef CONFIG_BOOKE
+#define __fsl_read_rio_config(x, addr, err, op)	\
+	___fsl_read_rio_config(x, addr, err, op, "mbar")
+#else
+#define __fsl_read_rio_config(x, addr, err, op)	\
+	___fsl_read_rio_config(x, addr, err, op, "eieio")
+#endif
+
 void __iomem *rio_regs_win;
 void __iomem *rmu_regs_win;
 resource_size_t rio_law_start;
-- 
2.36.1

