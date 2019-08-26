Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E79D379
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 17:56:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HGnq0QwMzDqHL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 01:56:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ZwvJaEqp"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HGjH6dVJzDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 01:52:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46HGj653fGz9v7Dn;
 Mon, 26 Aug 2019 17:52:10 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ZwvJaEqp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xVqEVQSEPeck; Mon, 26 Aug 2019 17:52:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46HGj63sfpz9v7Dl;
 Mon, 26 Aug 2019 17:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566834730; bh=Xv6+9QqPtWytKj9Xmtl06i4NAzwUuTtxeQmPUPzQgb4=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=ZwvJaEqpcUMOlM1aSxPr7ddJWf0LPdwMnkem4azGdhTOdLyAbO+IQDySmwaOdJpJ8
 vdAWbJN8L7ApZIGNkY4T3gUhSpfI402tGUyWEaXOhAgUylT6JxXHlVR1SocucIbFHz
 Y9PgfcsYpOFd+HoXw+DYdZPtxtPYKpizMEA55wZM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A99B08B7F0;
 Mon, 26 Aug 2019 17:52:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id axHiljQSDne1; Mon, 26 Aug 2019 17:52:15 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DF7B8B7E1;
 Mon, 26 Aug 2019 17:52:15 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 026B2696D5; Mon, 26 Aug 2019 15:52:14 +0000 (UTC)
Message-Id: <ecdb7194a17dbfa01865df6a82979533adc2c70b.1566834712.git.christophe.leroy@c-s.fr>
In-Reply-To: <d644eaf7dff8cc149260066802af230bdf34fded.1566834712.git.christophe.leroy@c-s.fr>
References: <d644eaf7dff8cc149260066802af230bdf34fded.1566834712.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/6] powerpc/32s: get rid of CPU_FTR_601 feature
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 26 Aug 2019 15:52:14 +0000 (UTC)
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

Now that 601 is exclusive from other 6xx, CPU_FTR_601 and
associated fixups are useless.

Drop this feature and use #ifdefs instead.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/configs/pmac32_defconfig |  1 -
 arch/powerpc/include/asm/cputable.h   | 14 ++++++++------
 arch/powerpc/include/asm/ppc_asm.h    | 28 +++++++---------------------
 arch/powerpc/include/asm/ptrace.h     |  6 +++++-
 arch/powerpc/include/asm/timex.h      | 34 +++-------------------------------
 arch/powerpc/kernel/cputable.c        |  6 ++++--
 arch/powerpc/kernel/entry_32.S        | 22 ++++++++++++++++------
 arch/powerpc/mm/book3s32/mmu.c        | 15 ++++++---------
 arch/powerpc/mm/ptdump/bats.c         |  2 +-
 arch/powerpc/platforms/Kconfig        |  3 ++-
 10 files changed, 52 insertions(+), 79 deletions(-)

diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 7e6654848531..4e6e95f92646 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -20,7 +20,6 @@ CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_PMAC=y
-CONFIG_PPC601_SYNC_FIX=y
 CONFIG_GEN_RTC=y
 CONFIG_HIGHMEM=y
 CONFIG_BINFMT_MISC=m
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index d05f0c28e515..0aad095896d6 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -145,7 +145,6 @@ static inline void cpu_feature_keys_init(void) { }
 
 /* Definitions for features that only exist on 32-bit chips */
 #ifdef CONFIG_PPC32
-#define CPU_FTR_601			ASM_CONST(0x00001000)
 #define CPU_FTR_L2CR			ASM_CONST(0x00002000)
 #define CPU_FTR_SPEC7450		ASM_CONST(0x00004000)
 #define CPU_FTR_TAU			ASM_CONST(0x00008000)
@@ -167,7 +166,6 @@ static inline void cpu_feature_keys_init(void) { }
 
 #else	/* CONFIG_PPC32 */
 /* Define these to 0 for the sake of tests in common code */
-#define CPU_FTR_601			(0)
 #define CPU_FTR_PPC_LE			(0)
 #endif
 
@@ -294,7 +292,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_MAYBE_CAN_NAP	0
 #endif
 
-#define CPU_FTRS_PPC601	(CPU_FTR_COMMON | CPU_FTR_601 | \
+#define CPU_FTRS_PPC601	(CPU_FTR_COMMON | \
 	CPU_FTR_COHERENT_ICACHE | CPU_FTR_UNIFIED_ID_CACHE | CPU_FTR_USE_RTC)
 #define CPU_FTRS_603	(CPU_FTR_COMMON | CPU_FTR_MAYBE_CAN_DOZE | \
 	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_PPC_LE | CPU_FTR_NOEXECUTE)
@@ -498,7 +496,9 @@ static inline void cpu_feature_keys_init(void) { }
 #else
 enum {
 	CPU_FTRS_POSSIBLE =
-#ifdef CONFIG_PPC_BOOK3S_32
+#ifdef CONFIG_PPC_BOOK3S_601
+	    CPU_FTRS_PPC601 |
+#elif defined(CONFIG_PPC_BOOK3S_32)
 	    CPU_FTRS_PPC601 | CPU_FTRS_603 | CPU_FTRS_604 | CPU_FTRS_740_NOTAU |
 	    CPU_FTRS_740 | CPU_FTRS_750 | CPU_FTRS_750FX1 |
 	    CPU_FTRS_750FX2 | CPU_FTRS_750FX | CPU_FTRS_750GX |
@@ -574,8 +574,10 @@ enum {
 #else
 enum {
 	CPU_FTRS_ALWAYS =
-#ifdef CONFIG_PPC_BOOK3S_32
-	    CPU_FTRS_PPC601 & CPU_FTRS_603 & CPU_FTRS_604 & CPU_FTRS_740_NOTAU &
+#ifdef CONFIG_PPC_BOOK3S_601
+	    CPU_FTRS_PPC601 &
+#elif defined(CONFIG_PPC_BOOK3S_32)
+	    CPU_FTRS_603 & CPU_FTRS_604 & CPU_FTRS_740_NOTAU &
 	    CPU_FTRS_740 & CPU_FTRS_750 & CPU_FTRS_750FX1 &
 	    CPU_FTRS_750FX2 & CPU_FTRS_750FX & CPU_FTRS_750GX &
 	    CPU_FTRS_7400_NOTAU & CPU_FTRS_7400 & CPU_FTRS_7450_20 &
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index e0637730a8e7..94279e611c98 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -351,19 +351,9 @@ GLUE(.,name):
 
 /* various errata or part fixups */
 #ifdef CONFIG_PPC601_SYNC_FIX
-#define SYNC				\
-BEGIN_FTR_SECTION			\
-	sync;				\
-	isync;				\
-END_FTR_SECTION_IFSET(CPU_FTR_601)
-#define SYNC_601			\
-BEGIN_FTR_SECTION			\
-	sync;				\
-END_FTR_SECTION_IFSET(CPU_FTR_601)
-#define ISYNC_601			\
-BEGIN_FTR_SECTION			\
-	isync;				\
-END_FTR_SECTION_IFSET(CPU_FTR_601)
+#define SYNC		sync; isync
+#define SYNC_601	sync
+#define ISYNC_601	isync
 #else
 #define	SYNC
 #define SYNC_601
@@ -389,15 +379,11 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 #define MFTBU(dest)			mfspr dest, SPRN_TBRU
 #endif
 
-#ifndef CONFIG_SMP
-#define TLBSYNC
-#else /* CONFIG_SMP */
 /* tlbsync is not implemented on 601 */
-#define TLBSYNC				\
-BEGIN_FTR_SECTION			\
-	tlbsync;			\
-	sync;				\
-END_FTR_SECTION_IFCLR(CPU_FTR_601)
+#if !defined(CONFIG_SMP) || defined(CONFIG_PPC_BOOK3S_601)
+#define TLBSYNC
+#else
+#define TLBSYNC		tlbsync; sync
 #endif
 
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index feee1b21bbd5..ee3ada66deb5 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -203,7 +203,11 @@ do {									      \
 #endif /* __powerpc64__ */
 
 #define arch_has_single_step()	(1)
-#define arch_has_block_step()	(!cpu_has_feature(CPU_FTR_601))
+#ifndef CONFIG_BOOK3S_601
+#define arch_has_block_step()	(true)
+#else
+#define arch_has_block_step()	(false)
+#endif
 #define ARCH_HAS_USER_SINGLE_STEP_REPORT
 
 /*
diff --git a/arch/powerpc/include/asm/timex.h b/arch/powerpc/include/asm/timex.h
index 926b9f91a3ef..d2d2c4bd8435 100644
--- a/arch/powerpc/include/asm/timex.h
+++ b/arch/powerpc/include/asm/timex.h
@@ -17,38 +17,10 @@ typedef unsigned long cycles_t;
 
 static inline cycles_t get_cycles(void)
 {
-#ifdef __powerpc64__
+	if (IS_ENABLED(CONFIG_BOOK3S_601))
+		return 0;
+
 	return mftb();
-#else
-	cycles_t ret;
-
-	/*
-	 * For the "cycle" counter we use the timebase lower half.
-	 * Currently only used on SMP.
-	 */
-
-	ret = 0;
-
-	__asm__ __volatile__(
-#ifdef CONFIG_PPC_8xx
-		"97:	mftb %0\n"
-#else
-		"97:	mfspr %0, %2\n"
-#endif
-		"99:\n"
-		".section __ftr_fixup,\"a\"\n"
-		".align 2\n"
-		"98:\n"
-		"	.long %1\n"
-		"	.long 0\n"
-		"	.long 97b-98b\n"
-		"	.long 99b-98b\n"
-		"	.long 0\n"
-		"	.long 0\n"
-		".previous"
-		: "=r" (ret) : "i" (CPU_FTR_601), "i" (SPRN_TBRL));
-	return ret;
-#endif
 }
 
 #endif	/* __KERNEL__ */
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index bfe5f4a2886b..e745abc5457a 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -569,7 +569,7 @@ static struct cpu_spec __initdata cpu_specs[] = {
 #endif	/* CONFIG_PPC_BOOK3S_64 */
 
 #ifdef CONFIG_PPC32
-#ifdef CONFIG_PPC_BOOK3S_32
+#ifdef CONFIG_PPC_BOOK3S_601
 	{	/* 601 */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x00010000,
@@ -583,6 +583,8 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc601",
 	},
+#endif /* CONFIG_PPC_BOOK3S_601 */
+#ifdef CONFIG_PPC_BOOK3S_6xx
 	{	/* 603 */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x00030000,
@@ -1212,7 +1214,7 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc603",
 	},
-#endif /* CONFIG_PPC_BOOK3S_32 */
+#endif /* CONFIG_PPC_BOOK3S_6xx */
 #ifdef CONFIG_PPC_8xx
 	{	/* 8xx */
 		.pvr_mask		= 0xffff0000,
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 54fab22c9a43..0365d1afbfa5 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -777,11 +777,19 @@ fast_exception_return:
 1:	lis	r3,exc_exit_restart_end@ha
 	addi	r3,r3,exc_exit_restart_end@l
 	cmplw	r12,r3
+#if CONFIG_PPC_BOOK3S_601
+	bge	2b
+#else
 	bge	3f
+#endif
 	lis	r4,exc_exit_restart@ha
 	addi	r4,r4,exc_exit_restart@l
 	cmplw	r12,r4
+#if CONFIG_PPC_BOOK3S_601
+	blt	2b
+#else
 	blt	3f
+#endif
 	lis	r3,fee_restarts@ha
 	tophys(r3,r3)
 	lwz	r5,fee_restarts@l(r3)
@@ -800,9 +808,6 @@ fee_restarts:
 /* aargh, we don't know which trap this is */
 /* but the 601 doesn't implement the RI bit, so assume it's OK */
 3:
-BEGIN_FTR_SECTION
-	b	2b
-END_FTR_SECTION_IFSET(CPU_FTR_601)
 	li	r10,-1
 	stw	r10,_TRAP(r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1270,11 +1275,19 @@ nonrecoverable:
 	lis	r10,exc_exit_restart_end@ha
 	addi	r10,r10,exc_exit_restart_end@l
 	cmplw	r12,r10
+#ifdef CONFIG_PPC_BOOK3S_601
+	bgelr
+#else
 	bge	3f
+#endif
 	lis	r11,exc_exit_restart@ha
 	addi	r11,r11,exc_exit_restart@l
 	cmplw	r12,r11
+#ifdef CONFIG_PPC_BOOK3S_601
+	bltlr
+#else
 	blt	3f
+#endif
 	lis	r10,ee_restarts@ha
 	lwz	r12,ee_restarts@l(r10)
 	addi	r12,r12,1
@@ -1283,9 +1296,6 @@ nonrecoverable:
 	blr
 3:	/* OK, we can't recover, kill this process */
 	/* but the 601 doesn't implement the RI bit, so assume it's OK */
-BEGIN_FTR_SECTION
-	blr
-END_FTR_SECTION_IFSET(CPU_FTR_601)
 	lwz	r3,_TRAP(r1)
 	andi.	r0,r3,1
 	beq	5f
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 50a1991d257f..84d5fab94f8f 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -74,7 +74,7 @@ static int find_free_bat(void)
 {
 	int b;
 
-	if (cpu_has_feature(CPU_FTR_601)) {
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601)) {
 		for (b = 0; b < 4; b++) {
 			struct ppc_bat *bat = BATS[b];
 
@@ -106,7 +106,7 @@ static int find_free_bat(void)
  */
 static unsigned int block_size(unsigned long base, unsigned long top)
 {
-	unsigned int max_size = (cpu_has_feature(CPU_FTR_601) ? 8 : 256) << 20;
+	unsigned int max_size = IS_ENABLED(CONFIG_PPC_BOOK3S_601) ? SZ_8M : SZ_256M;
 	unsigned int base_shift = (ffs(base) - 1) & 31;
 	unsigned int block_shift = (fls(top - base) - 1) & 31;
 
@@ -189,7 +189,7 @@ void mmu_mark_initmem_nx(void)
 	unsigned long top = (unsigned long)_etext - PAGE_OFFSET;
 	unsigned long size;
 
-	if (cpu_has_feature(CPU_FTR_601))
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
 		return;
 
 	for (i = 0; i < nb - 1 && base < top && top - base > (128 << 10);) {
@@ -227,7 +227,7 @@ void mmu_mark_rodata_ro(void)
 	int nb = mmu_has_feature(MMU_FTR_USE_HIGH_BATS) ? 8 : 4;
 	int i;
 
-	if (cpu_has_feature(CPU_FTR_601))
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
 		return;
 
 	for (i = 0; i < nb; i++) {
@@ -259,7 +259,7 @@ void __init setbat(int index, unsigned long virt, phys_addr_t phys,
 		flags &= ~_PAGE_COHERENT;
 
 	bl = (size >> 17) - 1;
-	if (PVR_VER(mfspr(SPRN_PVR)) != 1) {
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_601)) {
 		/* 603, 604, etc. */
 		/* Do DBAT first */
 		wimgxpp = flags & (_PAGE_WRITETHRU | _PAGE_NO_CACHE
@@ -441,7 +441,7 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	BUG_ON(first_memblock_base != 0);
 
 	/* 601 can only access 16MB at the moment */
-	if (PVR_VER(mfspr(SPRN_PVR)) == 1)
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
 		memblock_set_current_limit(min_t(u64, first_memblock_size, 0x01000000));
 	else /* Anything else has 256M mapped */
 		memblock_set_current_limit(min_t(u64, first_memblock_size, 0x10000000));
@@ -459,9 +459,6 @@ void __init setup_kuep(bool disabled)
 {
 	pr_info("Activating Kernel Userspace Execution Prevention\n");
 
-	if (cpu_has_feature(CPU_FTR_601))
-		pr_warn("KUEP is not working on powerpc 601 (No NX bit in Seg Regs)\n");
-
 	if (disabled)
 		pr_warn("KUEP cannot be disabled yet on 6xx when compiled in\n");
 }
diff --git a/arch/powerpc/mm/ptdump/bats.c b/arch/powerpc/mm/ptdump/bats.c
index a0d23e96e841..4154feac1da3 100644
--- a/arch/powerpc/mm/ptdump/bats.c
+++ b/arch/powerpc/mm/ptdump/bats.c
@@ -149,7 +149,7 @@ static int bats_show_603(struct seq_file *m, void *v)
 
 static int bats_open(struct inode *inode, struct file *file)
 {
-	if (cpu_has_feature(CPU_FTR_601))
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
 		return single_open(file, bats_show_601, NULL);
 
 	return single_open(file, bats_show_603, NULL);
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index f3fb79fccc72..d82e3664ffdf 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -197,7 +197,8 @@ endmenu
 
 config PPC601_SYNC_FIX
 	bool "Workarounds for PPC601 bugs"
-	depends on PPC_BOOK3S_32 && PPC_PMAC
+	depends on PPC_BOOK3S_601 && PPC_PMAC
+	default y
 	help
 	  Some versions of the PPC601 (the first PowerPC chip) have bugs which
 	  mean that extra synchronization instructions are required near
-- 
2.13.3

