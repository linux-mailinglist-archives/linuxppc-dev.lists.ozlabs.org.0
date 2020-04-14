Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3226D1A75DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:23:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491dmR1bzlzDqTL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:23:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=LJh8FqNk; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491dgc5x2PzDqdR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 18:19:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 491dgX1hr9z9ty3K;
 Tue, 14 Apr 2020 10:19:20 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LJh8FqNk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id G4Hkvjk8ktmU; Tue, 14 Apr 2020 10:19:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 491dgX0f90z9ty3F;
 Tue, 14 Apr 2020 10:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586852360; bh=jYdFuE/n7jBwlrmrZX6wBz8Bc1OO777rnEXmxyC30Q8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=LJh8FqNkGlyOTJE2BCKWHgIOwuDLT08jXMYQEza5GvEg8AwEpYUliSgWJheVYN+/d
 7C6OxOA2LljU5YMqfDPjHZtoDdP6INM0MhDm6+AJEo4meZ7CiQrm8fKKPZBlhEqnT6
 hrLa3p3t+vuY/C6DzJJx/RoIlYCK5/Z65C3I6ieE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 221618B797;
 Tue, 14 Apr 2020 10:19:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id T_26LB7oGZl5; Tue, 14 Apr 2020 10:19:21 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B96E28B796;
 Tue, 14 Apr 2020 10:19:20 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 8BB466578A; Tue, 14 Apr 2020 08:19:20 +0000 (UTC)
Message-Id: <4c0f3bfa9a0904031f57a4c228f83e09c9cf74b0.1586852082.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1586852082.git.christophe.leroy@c-s.fr>
References: <cover.1586852082.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 04/13] powerpc/40x: Remove support for IBM 403GCX
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Tue, 14 Apr 2020 08:19:20 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_403GCX is not user selectable and is not
selected by any platform.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/cache.h     |  2 +-
 arch/powerpc/include/asm/reg_booke.h | 54 ----------------------------
 arch/powerpc/include/asm/time.h      | 12 -------
 arch/powerpc/kernel/cputable.c       | 37 -------------------
 arch/powerpc/kernel/head_40x.S       | 45 -----------------------
 arch/powerpc/kernel/misc_32.S        |  9 -----
 arch/powerpc/kernel/setup-common.c   |  4 ---
 arch/powerpc/platforms/40x/Kconfig   |  6 ----
 8 files changed, 1 insertion(+), 168 deletions(-)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index 609cab1d58f2..2124b7090db9 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -6,7 +6,7 @@
 
 
 /* bytes per L1 cache line */
-#if defined(CONFIG_PPC_8xx) || defined(CONFIG_403GCX)
+#if defined(CONFIG_PPC_8xx)
 #define L1_CACHE_SHIFT		4
 #define MAX_COPY_PREFETCH	1
 #define IFETCH_ALIGN_SHIFT	2
diff --git a/arch/powerpc/include/asm/reg_booke.h b/arch/powerpc/include/asm/reg_booke.h
index f26fe482fbca..ff30f1076162 100644
--- a/arch/powerpc/include/asm/reg_booke.h
+++ b/arch/powerpc/include/asm/reg_booke.h
@@ -663,60 +663,6 @@
 #define EPC_EPID	0x00003fff
 #define EPC_EPID_SHIFT	0
 
-/*
- * The IBM-403 is an even more odd special case, as it is much
- * older than the IBM-405 series.  We put these down here incase someone
- * wishes to support these machines again.
- */
-#ifdef CONFIG_403GCX
-/* Special Purpose Registers (SPRNs)*/
-#define SPRN_TBHU	0x3CC	/* Time Base High User-mode */
-#define SPRN_TBLU	0x3CD	/* Time Base Low User-mode */
-#define SPRN_CDBCR	0x3D7	/* Cache Debug Control Register */
-#define SPRN_TBHI	0x3DC	/* Time Base High */
-#define SPRN_TBLO	0x3DD	/* Time Base Low */
-#define SPRN_DBCR	0x3F2	/* Debug Control Register */
-#define SPRN_PBL1	0x3FC	/* Protection Bound Lower 1 */
-#define SPRN_PBL2	0x3FE	/* Protection Bound Lower 2 */
-#define SPRN_PBU1	0x3FD	/* Protection Bound Upper 1 */
-#define SPRN_PBU2	0x3FF	/* Protection Bound Upper 2 */
-
-
-/* Bit definitions for the DBCR. */
-#define DBCR_EDM	DBCR0_EDM
-#define DBCR_IDM	DBCR0_IDM
-#define DBCR_RST(x)	(((x) & 0x3) << 28)
-#define DBCR_RST_NONE	0
-#define DBCR_RST_CORE	1
-#define DBCR_RST_CHIP	2
-#define DBCR_RST_SYSTEM	3
-#define DBCR_IC		DBCR0_IC	/* Instruction Completion Debug Evnt */
-#define DBCR_BT		DBCR0_BT	/* Branch Taken Debug Event */
-#define DBCR_EDE	DBCR0_EDE	/* Exception Debug Event */
-#define DBCR_TDE	DBCR0_TDE	/* TRAP Debug Event */
-#define DBCR_FER	0x00F80000	/* First Events Remaining Mask */
-#define DBCR_FT		0x00040000	/* Freeze Timers on Debug Event */
-#define DBCR_IA1	0x00020000	/* Instr. Addr. Compare 1 Enable */
-#define DBCR_IA2	0x00010000	/* Instr. Addr. Compare 2 Enable */
-#define DBCR_D1R	0x00008000	/* Data Addr. Compare 1 Read Enable */
-#define DBCR_D1W	0x00004000	/* Data Addr. Compare 1 Write Enable */
-#define DBCR_D1S(x)	(((x) & 0x3) << 12)	/* Data Adrr. Compare 1 Size */
-#define DAC_BYTE	0
-#define DAC_HALF	1
-#define DAC_WORD	2
-#define DAC_QUAD	3
-#define DBCR_D2R	0x00000800	/* Data Addr. Compare 2 Read Enable */
-#define DBCR_D2W	0x00000400	/* Data Addr. Compare 2 Write Enable */
-#define DBCR_D2S(x)	(((x) & 0x3) << 8)	/* Data Addr. Compare 2 Size */
-#define DBCR_SBT	0x00000040	/* Second Branch Taken Debug Event */
-#define DBCR_SED	0x00000020	/* Second Exception Debug Event */
-#define DBCR_STD	0x00000010	/* Second Trap Debug Event */
-#define DBCR_SIA	0x00000008	/* Second IAC Enable */
-#define DBCR_SDA	0x00000004	/* Second DAC Enable */
-#define DBCR_JOI	0x00000002	/* JTAG Serial Outbound Int. Enable */
-#define DBCR_JII	0x00000001	/* JTAG Serial Inbound Int. Enable */
-#endif /* 403GCX */
-
 /* Some 476 specific registers */
 #define SPRN_SSPCR		830
 #define SPRN_USPCR		831
diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 39ce95016a3a..b287cfc2dd85 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -51,24 +51,12 @@ struct div_result {
 
 static inline unsigned long get_tbl(void)
 {
-#if defined(CONFIG_403GCX)
-	unsigned long tbl;
-	asm volatile("mfspr %0, 0x3dd" : "=r" (tbl));
-	return tbl;
-#else
 	return mftbl();
-#endif
 }
 
 static inline unsigned int get_tbu(void)
 {
-#ifdef CONFIG_403GCX
-	unsigned int tbu;
-	asm volatile("mfspr %0, 0x3dc" : "=r" (tbu));
-	return tbu;
-#else
 	return mftbu();
-#endif
 }
 #endif /* !CONFIG_PPC64 */
 
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index cae9764b929e..61bd8fb408b2 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -1232,43 +1232,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 	},
 #endif /* CONFIG_PPC_8xx */
 #ifdef CONFIG_40x
-	{	/* 403GC */
-		.pvr_mask		= 0xffffff00,
-		.pvr_value		= 0x00200200,
-		.cpu_name		= "403GC",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 16,
-		.dcache_bsize		= 16,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc403",
-	},
-	{	/* 403GCX */
-		.pvr_mask		= 0xffffff00,
-		.pvr_value		= 0x00201400,
-		.cpu_name		= "403GCX",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-		 	PPC_FEATURE_HAS_MMU | PPC_FEATURE_NO_TB,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 16,
-		.dcache_bsize		= 16,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc403",
-	},
-	{	/* 403G ?? */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00200000,
-		.cpu_name		= "403G ??",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 16,
-		.dcache_bsize		= 16,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc403",
-	},
 	{	/* 405GP */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x40110000,
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 08cf4cf083b1..b62b6ab769fc 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -252,21 +252,12 @@ _ENTRY(saved_ksp_limit)
 	START_EXCEPTION(0x1100,	DTLBMiss)
 	mtspr	SPRN_SPRG_SCRATCH0, r10 /* Save some working registers */
 	mtspr	SPRN_SPRG_SCRATCH1, r11
-#ifdef CONFIG_403GCX
-	stw     r12, 0(r0)
-	stw     r9, 4(r0)
-	mfcr    r11
-	mfspr   r12, SPRN_PID
-	stw     r11, 8(r0)
-	stw     r12, 12(r0)
-#else
 	mtspr	SPRN_SPRG_SCRATCH3, r12
 	mtspr	SPRN_SPRG_SCRATCH4, r9
 	mfcr	r11
 	mfspr	r12, SPRN_PID
 	mtspr	SPRN_SPRG_SCRATCH6, r11
 	mtspr	SPRN_SPRG_SCRATCH5, r12
-#endif
 	mfspr	r10, SPRN_DEAR		/* Get faulting address */
 
 	/* If we are faulting a kernel address, we have to use the
@@ -332,21 +323,12 @@ _ENTRY(saved_ksp_limit)
 	/* The bailout.  Restore registers to pre-exception conditions
 	 * and call the heavyweights to help us out.
 	 */
-#ifdef CONFIG_403GCX
-	lwz     r12, 12(r0)
-	lwz     r11, 8(r0)
-	mtspr   SPRN_PID, r12
-	mtcr    r11
-	lwz     r9, 4(r0)
-	lwz     r12, 0(r0)
-#else
 	mfspr	r12, SPRN_SPRG_SCRATCH5
 	mfspr	r11, SPRN_SPRG_SCRATCH6
 	mtspr	SPRN_PID, r12
 	mtcr	r11
 	mfspr	r9, SPRN_SPRG_SCRATCH4
 	mfspr	r12, SPRN_SPRG_SCRATCH3
-#endif
 	mfspr	r11, SPRN_SPRG_SCRATCH1
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	b	DataStorage
@@ -358,21 +340,12 @@ _ENTRY(saved_ksp_limit)
 	START_EXCEPTION(0x1200,	ITLBMiss)
 	mtspr	SPRN_SPRG_SCRATCH0, r10	 /* Save some working registers */
 	mtspr	SPRN_SPRG_SCRATCH1, r11
-#ifdef CONFIG_403GCX
-	stw     r12, 0(r0)
-	stw     r9, 4(r0)
-	mfcr    r11
-	mfspr   r12, SPRN_PID
-	stw     r11, 8(r0)
-	stw     r12, 12(r0)
-#else
 	mtspr	SPRN_SPRG_SCRATCH3, r12
 	mtspr	SPRN_SPRG_SCRATCH4, r9
 	mfcr	r11
 	mfspr	r12, SPRN_PID
 	mtspr	SPRN_SPRG_SCRATCH6, r11
 	mtspr	SPRN_SPRG_SCRATCH5, r12
-#endif
 	mfspr	r10, SPRN_SRR0		/* Get faulting address */
 
 	/* If we are faulting a kernel address, we have to use the
@@ -438,21 +411,12 @@ _ENTRY(saved_ksp_limit)
 	/* The bailout.  Restore registers to pre-exception conditions
 	 * and call the heavyweights to help us out.
 	 */
-#ifdef CONFIG_403GCX
-	lwz     r12, 12(r0)
-	lwz     r11, 8(r0)
-	mtspr   SPRN_PID, r12
-	mtcr    r11
-	lwz     r9, 4(r0)
-	lwz     r12, 0(r0)
-#else
 	mfspr	r12, SPRN_SPRG_SCRATCH5
 	mfspr	r11, SPRN_SPRG_SCRATCH6
 	mtspr	SPRN_PID, r12
 	mtcr	r11
 	mfspr	r9, SPRN_SPRG_SCRATCH4
 	mfspr	r12, SPRN_SPRG_SCRATCH3
-#endif
 	mfspr	r11, SPRN_SPRG_SCRATCH1
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	b	InstructionAccess
@@ -602,21 +566,12 @@ finish_tlb_load:
 
 	/* Done...restore registers and get out of here.
 	*/
-#ifdef CONFIG_403GCX
-	lwz     r12, 12(r0)
-	lwz     r11, 8(r0)
-	mtspr   SPRN_PID, r12
-	mtcr    r11
-	lwz     r9, 4(r0)
-	lwz     r12, 0(r0)
-#else
 	mfspr	r12, SPRN_SPRG_SCRATCH5
 	mfspr	r11, SPRN_SPRG_SCRATCH6
 	mtspr	SPRN_PID, r12
 	mtcr	r11
 	mfspr	r9, SPRN_SPRG_SCRATCH4
 	mfspr	r12, SPRN_SPRG_SCRATCH3
-#endif
 	mfspr	r11, SPRN_SPRG_SCRATCH1
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	PPC405_ERR77_SYNC
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index d80212be8698..70bb885b14c6 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -274,17 +274,8 @@ _GLOBAL(real_writeb)
 #ifndef CONFIG_PPC_8xx
 _GLOBAL(flush_instruction_cache)
 #if defined(CONFIG_4xx)
-#ifdef CONFIG_403GCX
-	li      r3, 512
-	mtctr   r3
-	lis     r4, KERNELBASE@h
-1:	iccci   0, r4
-	addi    r4, r4, 16
-	bdnz    1b
-#else
 	lis	r3, KERNELBASE@h
 	iccci	0,r3
-#endif
 #elif defined(CONFIG_FSL_BOOKE)
 #ifdef CONFIG_E200
 	mfspr   r3,SPRN_L1CSR0
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index f9c0d888ce8a..c376a0588039 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -306,10 +306,6 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		}
 	} else {
 		switch (PVR_VER(pvr)) {
-			case 0x0020:	/* 403 family */
-				maj = PVR_MAJ(pvr) + 1;
-				min = PVR_MIN(pvr);
-				break;
 			case 0x1008:	/* 740P/750P ?? */
 				maj = ((pvr >> 8) & 0xFF) - 1;
 				min = pvr & 0xFF;
diff --git a/arch/powerpc/platforms/40x/Kconfig b/arch/powerpc/platforms/40x/Kconfig
index d06ca51e8443..8669be59948c 100644
--- a/arch/powerpc/platforms/40x/Kconfig
+++ b/arch/powerpc/platforms/40x/Kconfig
@@ -69,12 +69,6 @@ config PPC40x_SIMPLE
 	help
 	  This option enables the simple PowerPC 40x platform support.
 
-# OAK doesn't exist but wanted to keep this around for any future 403GCX boards
-config 403GCX
-	bool
-	#depends on OAK
-	select IBM405_ERR51
-
 config 405GP
 	bool
 	select IBM405_ERR77
-- 
2.25.0

