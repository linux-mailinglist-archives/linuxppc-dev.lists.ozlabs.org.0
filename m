Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA162CF46F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 19:57:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnhm14FYSzDrdk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 05:57:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cnhjc0hZqzDrYj
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 05:55:24 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CnhjJ3znWz9tyjR;
 Fri,  4 Dec 2020 19:55:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8sGgF9z2MTOk; Fri,  4 Dec 2020 19:55:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CnhjJ2flYz9tyjQ;
 Fri,  4 Dec 2020 19:55:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 38A548B812;
 Fri,  4 Dec 2020 19:55:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 50zL9u75NiCT; Fri,  4 Dec 2020 19:55:18 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF5718B75E;
 Fri,  4 Dec 2020 19:55:17 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8798F66890; Fri,  4 Dec 2020 18:55:17 +0000 (UTC)
Message-Id: <2c4d67fdef72ce27e0374e11b98c574ac33c6610.1607108093.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/powermac: Fix low_sleep_handler with CONFIG_VMAP_STACK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 giuseppe@sguazz.it
Date: Fri,  4 Dec 2020 18:55:17 +0000 (UTC)
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

low_sleep_handler() can't restore the context from standard
stack because the stack can hardly be accessed with MMU OFF.

Store everything in a global storage area instead of storing
a pointer to the stack in that global storage area.

To avoid a complete churn of the function, still use r1 as
the pointer to the storage area during restore.

Reported-by: Giuseppe Sacco <giuseppe@sguazz.it>
Fixes: cd08f109e262 ("powerpc/32s: Enable CONFIG_VMAP_STACK")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
This is only build tested. Giuseppe can you test it ? Thanks.
---
 arch/powerpc/platforms/Kconfig.cputype  |   2 +-
 arch/powerpc/platforms/powermac/sleep.S | 130 +++++++++++-------------
 2 files changed, 59 insertions(+), 73 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index c194c4ae8bc7..32a9c4c09b98 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -36,7 +36,7 @@ config PPC_BOOK3S_6xx
 	select PPC_HAVE_PMU_SUPPORT
 	select PPC_HAVE_KUEP
 	select PPC_HAVE_KUAP
-	select HAVE_ARCH_VMAP_STACK if !ADB_PMU
+	select HAVE_ARCH_VMAP_STACK
 
 config PPC_85xx
 	bool "Freescale 85xx"
diff --git a/arch/powerpc/platforms/powermac/sleep.S b/arch/powerpc/platforms/powermac/sleep.S
index 7e0f8ba6e54a..ce56082a392a 100644
--- a/arch/powerpc/platforms/powermac/sleep.S
+++ b/arch/powerpc/platforms/powermac/sleep.S
@@ -44,7 +44,8 @@
 #define SL_TB		0xa0
 #define SL_R2		0xa8
 #define SL_CR		0xac
-#define SL_R12		0xb0	/* r12 to r31 */
+#define SL_LR		0xb0
+#define SL_R12		0xb4	/* r12 to r31 */
 #define SL_SIZE		(SL_R12 + 80)
 
 	.section .text
@@ -63,105 +64,107 @@ _GLOBAL(low_sleep_handler)
 	blr
 #else
 	mflr	r0
-	stw	r0,4(r1)
-	stwu	r1,-SL_SIZE(r1)
+	lis	r11,sleep_storage@ha
+	addis	r11,r11,sleep_storage@l
+	stw	r0,SL_LR(r11)
 	mfcr	r0
-	stw	r0,SL_CR(r1)
-	stw	r2,SL_R2(r1)
-	stmw	r12,SL_R12(r1)
+	stw	r0,SL_CR(r11)
+	stw	r1,SL_SP(r11)
+	stw	r2,SL_R2(r11)
+	stmw	r12,SL_R12(r11)
 
 	/* Save MSR & SDR1 */
 	mfmsr	r4
-	stw	r4,SL_MSR(r1)
+	stw	r4,SL_MSR(r11)
 	mfsdr1	r4
-	stw	r4,SL_SDR1(r1)
+	stw	r4,SL_SDR1(r11)
 
 	/* Get a stable timebase and save it */
 1:	mftbu	r4
-	stw	r4,SL_TB(r1)
+	stw	r4,SL_TB(r11)
 	mftb	r5
-	stw	r5,SL_TB+4(r1)
+	stw	r5,SL_TB+4(r11)
 	mftbu	r3
 	cmpw	r3,r4
 	bne	1b
 
 	/* Save SPRGs */
 	mfsprg	r4,0
-	stw	r4,SL_SPRG0(r1)
+	stw	r4,SL_SPRG0(r11)
 	mfsprg	r4,1
-	stw	r4,SL_SPRG0+4(r1)
+	stw	r4,SL_SPRG0+4(r11)
 	mfsprg	r4,2
-	stw	r4,SL_SPRG0+8(r1)
+	stw	r4,SL_SPRG0+8(r11)
 	mfsprg	r4,3
-	stw	r4,SL_SPRG0+12(r1)
+	stw	r4,SL_SPRG0+12(r11)
 
 	/* Save BATs */
 	mfdbatu	r4,0
-	stw	r4,SL_DBAT0(r1)
+	stw	r4,SL_DBAT0(r11)
 	mfdbatl	r4,0
-	stw	r4,SL_DBAT0+4(r1)
+	stw	r4,SL_DBAT0+4(r11)
 	mfdbatu	r4,1
-	stw	r4,SL_DBAT1(r1)
+	stw	r4,SL_DBAT1(r11)
 	mfdbatl	r4,1
-	stw	r4,SL_DBAT1+4(r1)
+	stw	r4,SL_DBAT1+4(r11)
 	mfdbatu	r4,2
-	stw	r4,SL_DBAT2(r1)
+	stw	r4,SL_DBAT2(r11)
 	mfdbatl	r4,2
-	stw	r4,SL_DBAT2+4(r1)
+	stw	r4,SL_DBAT2+4(r11)
 	mfdbatu	r4,3
-	stw	r4,SL_DBAT3(r1)
+	stw	r4,SL_DBAT3(r11)
 	mfdbatl	r4,3
-	stw	r4,SL_DBAT3+4(r1)
+	stw	r4,SL_DBAT3+4(r11)
 	mfibatu	r4,0
-	stw	r4,SL_IBAT0(r1)
+	stw	r4,SL_IBAT0(r11)
 	mfibatl	r4,0
-	stw	r4,SL_IBAT0+4(r1)
+	stw	r4,SL_IBAT0+4(r11)
 	mfibatu	r4,1
-	stw	r4,SL_IBAT1(r1)
+	stw	r4,SL_IBAT1(r11)
 	mfibatl	r4,1
-	stw	r4,SL_IBAT1+4(r1)
+	stw	r4,SL_IBAT1+4(r11)
 	mfibatu	r4,2
-	stw	r4,SL_IBAT2(r1)
+	stw	r4,SL_IBAT2(r11)
 	mfibatl	r4,2
-	stw	r4,SL_IBAT2+4(r1)
+	stw	r4,SL_IBAT2+4(r11)
 	mfibatu	r4,3
-	stw	r4,SL_IBAT3(r1)
+	stw	r4,SL_IBAT3(r11)
 	mfibatl	r4,3
-	stw	r4,SL_IBAT3+4(r1)
+	stw	r4,SL_IBAT3+4(r11)
 
 BEGIN_MMU_FTR_SECTION
 	mfspr	r4,SPRN_DBAT4U
-	stw	r4,SL_DBAT4(r1)
+	stw	r4,SL_DBAT4(r11)
 	mfspr	r4,SPRN_DBAT4L
-	stw	r4,SL_DBAT4+4(r1)
+	stw	r4,SL_DBAT4+4(r11)
 	mfspr	r4,SPRN_DBAT5U
-	stw	r4,SL_DBAT5(r1)
+	stw	r4,SL_DBAT5(r11)
 	mfspr	r4,SPRN_DBAT5L
-	stw	r4,SL_DBAT5+4(r1)
+	stw	r4,SL_DBAT5+4(r11)
 	mfspr	r4,SPRN_DBAT6U
-	stw	r4,SL_DBAT6(r1)
+	stw	r4,SL_DBAT6(r11)
 	mfspr	r4,SPRN_DBAT6L
-	stw	r4,SL_DBAT6+4(r1)
+	stw	r4,SL_DBAT6+4(r11)
 	mfspr	r4,SPRN_DBAT7U
-	stw	r4,SL_DBAT7(r1)
+	stw	r4,SL_DBAT7(r11)
 	mfspr	r4,SPRN_DBAT7L
-	stw	r4,SL_DBAT7+4(r1)
+	stw	r4,SL_DBAT7+4(r11)
 	mfspr	r4,SPRN_IBAT4U
-	stw	r4,SL_IBAT4(r1)
+	stw	r4,SL_IBAT4(r11)
 	mfspr	r4,SPRN_IBAT4L
-	stw	r4,SL_IBAT4+4(r1)
+	stw	r4,SL_IBAT4+4(r11)
 	mfspr	r4,SPRN_IBAT5U
-	stw	r4,SL_IBAT5(r1)
+	stw	r4,SL_IBAT5(r11)
 	mfspr	r4,SPRN_IBAT5L
-	stw	r4,SL_IBAT5+4(r1)
+	stw	r4,SL_IBAT5+4(r11)
 	mfspr	r4,SPRN_IBAT6U
-	stw	r4,SL_IBAT6(r1)
+	stw	r4,SL_IBAT6(r11)
 	mfspr	r4,SPRN_IBAT6L
-	stw	r4,SL_IBAT6+4(r1)
+	stw	r4,SL_IBAT6+4(r11)
 	mfspr	r4,SPRN_IBAT7U
-	stw	r4,SL_IBAT7(r1)
+	stw	r4,SL_IBAT7(r11)
 	mfspr	r4,SPRN_IBAT7L
-	stw	r4,SL_IBAT7+4(r1)
+	stw	r4,SL_IBAT7+4(r11)
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 
 	/* Backup various CPU config stuffs */
@@ -180,9 +183,9 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	lis	r5,grackle_wake_up@ha
 	addi	r5,r5,grackle_wake_up@l
 	tophys(r5,r5)
-	stw	r5,SL_PC(r1)
+	stw	r5,SL_PC(r11)
 	lis	r4,KERNELBASE@h
-	tophys(r5,r1)
+	tophys(r5,r11)
 	addi	r5,r5,SL_PC
 	lis	r6,MAGIC@ha
 	addi	r6,r6,MAGIC@l
@@ -194,12 +197,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	tophys(r3,r3)
 	stw	r3,0x80(r4)
 	stw	r5,0x84(r4)
-	/* Store a pointer to our backup storage into
-	 * a kernel global
-	 */
-	lis r3,sleep_storage@ha
-	addi r3,r3,sleep_storage@l
-	stw r5,0(r3)
 
 	.globl	low_cpu_offline_self
 low_cpu_offline_self:
@@ -279,7 +276,7 @@ _GLOBAL(core99_wake_up)
 	lis	r3,sleep_storage@ha
 	addi	r3,r3,sleep_storage@l
 	tophys(r3,r3)
-	lwz	r1,0(r3)
+	addi	r1,r3,SL_PC
 
 	/* Pass thru to older resume code ... */
 _ASM_NOKPROBE_SYMBOL(core99_wake_up)
@@ -399,13 +396,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	blt	1b
 	sync
 
-	/* restore the MSR and turn on the MMU */
-	lwz	r3,SL_MSR(r1)
-	bl	turn_on_mmu
-
-	/* get back the stack pointer */
-	tovirt(r1,r1)
-
 	/* Restore TB */
 	li	r3,0
 	mttbl	r3
@@ -419,28 +409,24 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	mtcr	r0
 	lwz	r2,SL_R2(r1)
 	lmw	r12,SL_R12(r1)
-	addi	r1,r1,SL_SIZE
-	lwz	r0,4(r1)
-	mtlr	r0
-	blr
-_ASM_NOKPROBE_SYMBOL(grackle_wake_up)
 
-turn_on_mmu:
-	mflr	r4
-	tovirt(r4,r4)
+	/* restore the MSR and SP and turn on the MMU and return */
+	lwz	r3,SL_MSR(r1)
+	lwz	r4,SL_LR(r1)
+	lwz	r1,SL_SP(r1)
 	mtsrr0	r4
 	mtsrr1	r3
 	sync
 	isync
 	rfi
-_ASM_NOKPROBE_SYMBOL(turn_on_mmu)
+_ASM_NOKPROBE_SYMBOL(grackle_wake_up)
 
 #endif /* defined(CONFIG_PM) || defined(CONFIG_CPU_FREQ) */
 
 	.section .data
 	.balign	L1_CACHE_BYTES
 sleep_storage:
-	.long 0
+	.space SL_SIZE
 	.balign	L1_CACHE_BYTES, 0
 
 #endif /* CONFIG_PPC_BOOK3S_32 */
-- 
2.25.0

