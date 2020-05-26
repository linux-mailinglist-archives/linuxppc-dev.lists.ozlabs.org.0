Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 399311C78E3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 20:05:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HPdm70HzzDqXs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 04:05:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HMx76K8bzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 02:48:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49HMx30S0Xz9v4kF;
 Wed,  6 May 2020 18:48:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id A_ojo4U-QKIf; Wed,  6 May 2020 18:48:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49HMx25RsHz9v4kK;
 Wed,  6 May 2020 18:48:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B4718B7C5;
 Wed,  6 May 2020 18:48:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CfiWEJpgWZlW; Wed,  6 May 2020 18:48:40 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C14A8B7C3;
 Wed,  6 May 2020 18:48:40 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 18C8365911; Wed,  6 May 2020 16:48:40 +0000 (UTC)
Message-Id: <59213d48028b6b4985b059c6bb20c7256f2ff1b5.1588783498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1588783498.git.christophe.leroy@csgroup.eu>
References: <cover.1588783498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 34/45] powerpc/8xx: Remove now unused TLB miss functions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  6 May 2020 16:48:40 +0000 (UTC)
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

The code to setup linear and IMMR mapping via huge TLB entries is
not called anymore. Remove it.

Also remove the handling of removed code exits in the perf driver.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h |  8 +-
 arch/powerpc/kernel/head_8xx.S               | 83 --------------------
 arch/powerpc/perf/8xx-pmu.c                  | 10 ---
 3 files changed, 1 insertion(+), 100 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 4d3ef3841b00..e82368838416 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -240,13 +240,7 @@ static inline unsigned int mmu_psize_to_shift(unsigned int mmu_psize)
 }
 
 /* patch sites */
-extern s32 patch__itlbmiss_linmem_top, patch__itlbmiss_linmem_top8;
-extern s32 patch__dtlbmiss_linmem_top, patch__dtlbmiss_immr_jmp;
-extern s32 patch__fixupdar_linmem_top;
-extern s32 patch__dtlbmiss_romem_top, patch__dtlbmiss_romem_top8;
-
-extern s32 patch__itlbmiss_exit_1, patch__itlbmiss_exit_2;
-extern s32 patch__dtlbmiss_exit_1, patch__dtlbmiss_exit_2, patch__dtlbmiss_exit_3;
+extern s32 patch__itlbmiss_exit_1, patch__dtlbmiss_exit_1;
 extern s32 patch__itlbmiss_perf, patch__dtlbmiss_perf;
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index d1546f379757..fb5d17187772 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -278,33 +278,6 @@ InstructionTLBMiss:
 	rfi
 #endif
 
-#ifndef CONFIG_PIN_TLB_TEXT
-ITLBMissLinear:
-	mtcr	r11
-#if defined(CONFIG_STRICT_KERNEL_RWX) && CONFIG_ETEXT_SHIFT < 23
-	patch_site	0f, patch__itlbmiss_linmem_top8
-
-	mfspr	r10, SPRN_SRR0
-0:	subis	r11, r10, (PAGE_OFFSET - 0x80000000)@ha
-	rlwinm	r11, r11, 4, MI_PS8MEG ^ MI_PS512K
-	ori	r11, r11, MI_PS512K | MI_SVALID
-	rlwinm	r10, r10, 0, 0x0ff80000	/* 8xx supports max 256Mb RAM */
-#else
-	/* Set 8M byte page and mark it valid */
-	li	r11, MI_PS8MEG | MI_SVALID
-	rlwinm	r10, r10, 20, 0x0f800000	/* 8xx supports max 256Mb RAM */
-#endif
-	mtspr	SPRN_MI_TWC, r11
-	ori	r10, r10, 0xf0 | MI_SPS16K | _PAGE_SH | _PAGE_DIRTY | \
-			  _PAGE_PRESENT
-	mtspr	SPRN_MI_RPN, r10	/* Update TLB entry */
-
-0:	mfspr	r10, SPRN_SPRG_SCRATCH0
-	mfspr	r11, SPRN_SPRG_SCRATCH1
-	rfi
-	patch_site	0b, patch__itlbmiss_exit_2
-#endif
-
 	. = 0x1200
 DataStoreTLBMiss:
 	mtspr	SPRN_DAR, r10
@@ -371,62 +344,6 @@ DataStoreTLBMiss:
 	rfi
 	patch_site	0b, patch__dtlbmiss_exit_1
 
-DTLBMissIMMR:
-	mtcr	r11
-	/* Set 512k byte guarded page and mark it valid */
-	li	r10, MD_PS512K | MD_GUARDED | MD_SVALID
-	mtspr	SPRN_MD_TWC, r10
-	mfspr	r10, SPRN_IMMR			/* Get current IMMR */
-	rlwinm	r10, r10, 0, 0xfff80000		/* Get 512 kbytes boundary */
-	ori	r10, r10, 0xf0 | MD_SPS16K | _PAGE_SH | _PAGE_DIRTY | \
-			  _PAGE_PRESENT | _PAGE_NO_CACHE
-	mtspr	SPRN_MD_RPN, r10	/* Update TLB entry */
-
-	li	r11, RPN_PATTERN
-
-0:	mfspr	r10, SPRN_DAR
-	mtspr	SPRN_DAR, r11	/* Tag DAR */
-	mfspr	r11, SPRN_M_TW
-	rfi
-	patch_site	0b, patch__dtlbmiss_exit_2
-
-DTLBMissLinear:
-	mtcr	r11
-	rlwinm	r10, r10, 20, 0x0f800000	/* 8xx supports max 256Mb RAM */
-#if defined(CONFIG_STRICT_KERNEL_RWX) && CONFIG_DATA_SHIFT < 23
-	patch_site	0f, patch__dtlbmiss_romem_top8
-
-0:	subis	r11, r10, (PAGE_OFFSET - 0x80000000)@ha
-	rlwinm	r11, r11, 0, 0xff800000
-	neg	r10, r11
-	or	r11, r11, r10
-	rlwinm	r11, r11, 4, MI_PS8MEG ^ MI_PS512K
-	ori	r11, r11, MI_PS512K | MI_SVALID
-	mfspr	r10, SPRN_MD_EPN
-	rlwinm	r10, r10, 0, 0x0ff80000	/* 8xx supports max 256Mb RAM */
-#else
-	/* Set 8M byte page and mark it valid */
-	li	r11, MD_PS8MEG | MD_SVALID
-#endif
-	mtspr	SPRN_MD_TWC, r11
-#ifdef CONFIG_STRICT_KERNEL_RWX
-	patch_site	0f, patch__dtlbmiss_romem_top
-
-0:	subis	r11, r10, 0
-	rlwimi	r10, r11, 11, _PAGE_RO
-#endif
-	ori	r10, r10, 0xf0 | MD_SPS16K | _PAGE_SH | _PAGE_DIRTY | \
-			  _PAGE_PRESENT
-	mtspr	SPRN_MD_RPN, r10	/* Update TLB entry */
-
-	li	r11, RPN_PATTERN
-
-0:	mfspr	r10, SPRN_DAR
-	mtspr	SPRN_DAR, r11	/* Tag DAR */
-	mfspr	r11, SPRN_M_TW
-	rfi
-	patch_site	0b, patch__dtlbmiss_exit_3
-
 /* This is an instruction TLB error on the MPC8xx.  This could be due
  * to many reasons, such as executing guarded memory or illegal instruction
  * addresses.  There is nothing to do but handle a big time error fault.
diff --git a/arch/powerpc/perf/8xx-pmu.c b/arch/powerpc/perf/8xx-pmu.c
index 1ad03c55c88c..0c56b42a4f91 100644
--- a/arch/powerpc/perf/8xx-pmu.c
+++ b/arch/powerpc/perf/8xx-pmu.c
@@ -99,9 +99,6 @@ static int mpc8xx_pmu_add(struct perf_event *event, int flags)
 			unsigned long target = patch_site_addr(&patch__itlbmiss_perf);
 
 			patch_branch_site(&patch__itlbmiss_exit_1, target, 0);
-#ifndef CONFIG_PIN_TLB_TEXT
-			patch_branch_site(&patch__itlbmiss_exit_2, target, 0);
-#endif
 		}
 		val = itlb_miss_counter;
 		break;
@@ -110,8 +107,6 @@ static int mpc8xx_pmu_add(struct perf_event *event, int flags)
 			unsigned long target = patch_site_addr(&patch__dtlbmiss_perf);
 
 			patch_branch_site(&patch__dtlbmiss_exit_1, target, 0);
-			patch_branch_site(&patch__dtlbmiss_exit_2, target, 0);
-			patch_branch_site(&patch__dtlbmiss_exit_3, target, 0);
 		}
 		val = dtlb_miss_counter;
 		break;
@@ -174,9 +169,6 @@ static void mpc8xx_pmu_del(struct perf_event *event, int flags)
 					    __PPC_SPR(SPRN_SPRG_SCRATCH0);
 
 			patch_instruction_site(&patch__itlbmiss_exit_1, insn);
-#ifndef CONFIG_PIN_TLB_TEXT
-			patch_instruction_site(&patch__itlbmiss_exit_2, insn);
-#endif
 		}
 		break;
 	case PERF_8xx_ID_DTLB_LOAD_MISS:
@@ -186,8 +178,6 @@ static void mpc8xx_pmu_del(struct perf_event *event, int flags)
 					    __PPC_SPR(SPRN_DAR);
 
 			patch_instruction_site(&patch__dtlbmiss_exit_1, insn);
-			patch_instruction_site(&patch__dtlbmiss_exit_2, insn);
-			patch_instruction_site(&patch__dtlbmiss_exit_3, insn);
 		}
 		break;
 	}
-- 
2.25.0

