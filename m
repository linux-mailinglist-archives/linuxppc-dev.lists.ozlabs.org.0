Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5A9371B9C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 18:46:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYplf72nQz30H2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 02:46:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYplG3YXpz2xZ3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 02:46:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FYpl71cbKz9sTm;
 Mon,  3 May 2021 18:46:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bKQXAsNS0dTN; Mon,  3 May 2021 18:46:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FYpl70gF0z9sTl;
 Mon,  3 May 2021 18:46:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E91FF8B781;
 Mon,  3 May 2021 18:46:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tU4iKblBdZFQ; Mon,  3 May 2021 18:46:10 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B18AA8B763;
 Mon,  3 May 2021 18:46:10 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 72ACF642A7; Mon,  3 May 2021 16:46:10 +0000 (UTC)
Message-Id: <f38728dbe96df5fef84c868640def5f6d7c114bc.1620060357.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/2] powerpc/asm-offset: Remove unused items related to paca
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Mon,  3 May 2021 16:46:10 +0000 (UTC)
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

PACA_SIZE, PACACONTEXTID, PACALOWSLICESPSIZE, PACAHIGHSLICEPSIZE,
PACA_SLB_ADDR_LIMIT, MMUPSIZEDEFSIZE, PACASLBCACHE, PACASLBCACHEPTR,
PACASTABRR, PACAVMALLOCSLLP, MMUPSIZESLLP, PACACONTEXTSLLP,
PACALPPACAPTR, LPPACA_DTLIDX and PACA_DTL_RIDX are not used anymore
by ASM code.

Remove them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/asm-offsets.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 28af4efb4587..419ab4a89114 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -197,7 +197,6 @@ int main(void)
 	OFFSET(ICACHEL1LOGBLOCKSIZE, ppc64_caches, l1i.log_block_size);
 	OFFSET(ICACHEL1BLOCKSPERPAGE, ppc64_caches, l1i.blocks_per_page);
 	/* paca */
-	DEFINE(PACA_SIZE, sizeof(struct paca_struct));
 	OFFSET(PACAPACAINDEX, paca_struct, paca_index);
 	OFFSET(PACAPROCSTART, paca_struct, cpu_start);
 	OFFSET(PACAKSAVE, paca_struct, kstack);
@@ -212,15 +211,6 @@ int main(void)
 	OFFSET(PACAIRQSOFTMASK, paca_struct, irq_soft_mask);
 	OFFSET(PACAIRQHAPPENED, paca_struct, irq_happened);
 	OFFSET(PACA_FTRACE_ENABLED, paca_struct, ftrace_enabled);
-#ifdef CONFIG_PPC_BOOK3S
-	OFFSET(PACACONTEXTID, paca_struct, mm_ctx_id);
-#ifdef CONFIG_PPC_MM_SLICES
-	OFFSET(PACALOWSLICESPSIZE, paca_struct, mm_ctx_low_slices_psize);
-	OFFSET(PACAHIGHSLICEPSIZE, paca_struct, mm_ctx_high_slices_psize);
-	OFFSET(PACA_SLB_ADDR_LIMIT, paca_struct, mm_ctx_slb_addr_limit);
-	DEFINE(MMUPSIZEDEFSIZE, sizeof(struct mmu_psize_def));
-#endif /* CONFIG_PPC_MM_SLICES */
-#endif
 
 #ifdef CONFIG_PPC_BOOK3E
 	OFFSET(PACAPGD, paca_struct, pgd);
@@ -241,21 +231,9 @@ int main(void)
 #endif /* CONFIG_PPC_BOOK3E */
 
 #ifdef CONFIG_PPC_BOOK3S_64
-	OFFSET(PACASLBCACHE, paca_struct, slb_cache);
-	OFFSET(PACASLBCACHEPTR, paca_struct, slb_cache_ptr);
-	OFFSET(PACASTABRR, paca_struct, stab_rr);
-	OFFSET(PACAVMALLOCSLLP, paca_struct, vmalloc_sllp);
-#ifdef CONFIG_PPC_MM_SLICES
-	OFFSET(MMUPSIZESLLP, mmu_psize_def, sllp);
-#else
-	OFFSET(PACACONTEXTSLLP, paca_struct, mm_ctx_sllp);
-#endif /* CONFIG_PPC_MM_SLICES */
 	OFFSET(PACA_EXGEN, paca_struct, exgen);
 	OFFSET(PACA_EXMC, paca_struct, exmc);
 	OFFSET(PACA_EXNMI, paca_struct, exnmi);
-#ifdef CONFIG_PPC_PSERIES
-	OFFSET(PACALPPACAPTR, paca_struct, lppaca_ptr);
-#endif
 	OFFSET(PACA_SLBSHADOWPTR, paca_struct, slb_shadow_ptr);
 	OFFSET(SLBSHADOW_STACKVSID, slb_shadow, save_area[SLB_NUM_BOLTED - 1].vsid);
 	OFFSET(SLBSHADOW_STACKESID, slb_shadow, save_area[SLB_NUM_BOLTED - 1].esid);
@@ -264,9 +242,7 @@ int main(void)
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	OFFSET(PACA_PMCINUSE, paca_struct, pmcregs_in_use);
 #endif
-	OFFSET(LPPACA_DTLIDX, lppaca, dtl_idx);
 	OFFSET(LPPACA_YIELDCOUNT, lppaca, yield_count);
-	OFFSET(PACA_DTL_RIDX, paca_struct, dtl_ridx);
 #endif /* CONFIG_PPC_BOOK3S_64 */
 	OFFSET(PACAEMERGSP, paca_struct, emergency_sp);
 #ifdef CONFIG_PPC_BOOK3S_64
-- 
2.25.0

