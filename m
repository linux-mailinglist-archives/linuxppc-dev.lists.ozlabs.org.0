Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28620A4405
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 12:28:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LCHT0wCwzDrFS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 20:28:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="gfHgEVLn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LC3v2k6GzDrBd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 20:18:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46LC3m17QJz9v4gV;
 Sat, 31 Aug 2019 12:18:28 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gfHgEVLn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DyPPi_S3dDGq; Sat, 31 Aug 2019 12:18:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46LC3m012cz9v4gL;
 Sat, 31 Aug 2019 12:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567246708; bh=92fCzax27IFIsPLZqUhm1kcTWMxYZOXNfdyNWbq/5Zk=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=gfHgEVLnQ/Podo880um3cXztjVFNVx60TwxAFkihOMZQ4CT8XGx8iR6XpJ5kKxE8R
 SYmTMCq5PmVRoDMMKcJ37Pb2d0L7kSYfE5YjFwyJHaG2seE/OZd1joemM/2J8k2Rgn
 jo/pW+qMLPUzI7FdBehSCcxqdHTs4QC8VFFf1/os=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A4328B7B9;
 Sat, 31 Aug 2019 12:18:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id m7fH-8WtNl22; Sat, 31 Aug 2019 12:18:29 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DDCC88B789;
 Sat, 31 Aug 2019 12:18:28 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A0C5C6985C; Sat, 31 Aug 2019 10:18:28 +0000 (UTC)
Message-Id: <26c32466a2cf8a3f56cd872bedf6104d6bb6b2da.1567245404.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1567245404.git.christophe.leroy@c-s.fr>
References: <cover.1567245404.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 04/10] powerpc/8xx: Use alternative scratch registers
 in DTLB miss handler
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, dja@axtens.net
Date: Sat, 31 Aug 2019 10:18:28 +0000 (UTC)
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

In preparation of handling CONFIG_VMAP_STACK, we need DTLB miss handler
to use different scratch registers than other exception handlers in
order to not jeopardise exception entry on stack DTLB misses.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_8xx.S | 28 +++++++++++++++-------------
 arch/powerpc/perf/8xx-pmu.c    | 12 ++++++++----
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 16d68c8575ca..b9e520e52498 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -198,11 +198,13 @@ SystemCall:
 0:	lwz	r10, (dtlb_miss_counter - PAGE_OFFSET)@l(0)
 	addi	r10, r10, 1
 	stw	r10, (dtlb_miss_counter - PAGE_OFFSET)@l(0)
-	mfspr	r10, SPRN_SPRG_SCRATCH0
-	mfspr	r11, SPRN_SPRG_SCRATCH1
+	mfspr	r10, SPRN_DAR
+	mtspr	SPRN_DAR, r11	/* Tag DAR */
+	mfspr	r11, SPRN_M_TW
 	rfi
 #endif
 
+
 	. = 0x1100
 /*
  * For the MPC8xx, this is a software tablewalk to load the instruction
@@ -342,8 +344,8 @@ ITLBMissLinear:
 
 	. = 0x1200
 DataStoreTLBMiss:
-	mtspr	SPRN_SPRG_SCRATCH0, r10
-	mtspr	SPRN_SPRG_SCRATCH1, r11
+	mtspr	SPRN_DAR, r10
+	mtspr	SPRN_M_TW, r11
 	mfcr	r11
 
 	/* If we are faulting a kernel address, we have to use the
@@ -408,10 +410,10 @@ DataStoreTLBMiss:
 	mtspr	SPRN_MD_RPN, r10	/* Update TLB entry */
 
 	/* Restore registers */
-	mtspr	SPRN_DAR, r11	/* Tag DAR */
 
-0:	mfspr	r10, SPRN_SPRG_SCRATCH0
-	mfspr	r11, SPRN_SPRG_SCRATCH1
+0:	mfspr	r10, SPRN_DAR
+	mtspr	SPRN_DAR, r11	/* Tag DAR */
+	mfspr	r11, SPRN_M_TW
 	rfi
 	patch_site	0b, patch__dtlbmiss_exit_1
 
@@ -427,10 +429,10 @@ DTLBMissIMMR:
 	mtspr	SPRN_MD_RPN, r10	/* Update TLB entry */
 
 	li	r11, RPN_PATTERN
-	mtspr	SPRN_DAR, r11	/* Tag DAR */
 
-0:	mfspr	r10, SPRN_SPRG_SCRATCH0
-	mfspr	r11, SPRN_SPRG_SCRATCH1
+0:	mfspr	r10, SPRN_DAR
+	mtspr	SPRN_DAR, r11	/* Tag DAR */
+	mfspr	r11, SPRN_M_TW
 	rfi
 	patch_site	0b, patch__dtlbmiss_exit_2
 
@@ -464,10 +466,10 @@ DTLBMissLinear:
 	mtspr	SPRN_MD_RPN, r10	/* Update TLB entry */
 
 	li	r11, RPN_PATTERN
-	mtspr	SPRN_DAR, r11	/* Tag DAR */
 
-0:	mfspr	r10, SPRN_SPRG_SCRATCH0
-	mfspr	r11, SPRN_SPRG_SCRATCH1
+0:	mfspr	r10, SPRN_DAR
+	mtspr	SPRN_DAR, r11	/* Tag DAR */
+	mfspr	r11, SPRN_M_TW
 	rfi
 	patch_site	0b, patch__dtlbmiss_exit_3
 
diff --git a/arch/powerpc/perf/8xx-pmu.c b/arch/powerpc/perf/8xx-pmu.c
index 19124b0b171a..1ad03c55c88c 100644
--- a/arch/powerpc/perf/8xx-pmu.c
+++ b/arch/powerpc/perf/8xx-pmu.c
@@ -157,10 +157,6 @@ static void mpc8xx_pmu_read(struct perf_event *event)
 
 static void mpc8xx_pmu_del(struct perf_event *event, int flags)
 {
-	/* mfspr r10, SPRN_SPRG_SCRATCH0 */
-	unsigned int insn = PPC_INST_MFSPR | __PPC_RS(R10) |
-			    __PPC_SPR(SPRN_SPRG_SCRATCH0);
-
 	mpc8xx_pmu_read(event);
 
 	/* If it was the last user, stop counting to avoid useles overhead */
@@ -173,6 +169,10 @@ static void mpc8xx_pmu_del(struct perf_event *event, int flags)
 		break;
 	case PERF_8xx_ID_ITLB_LOAD_MISS:
 		if (atomic_dec_return(&itlb_miss_ref) == 0) {
+			/* mfspr r10, SPRN_SPRG_SCRATCH0 */
+			unsigned int insn = PPC_INST_MFSPR | __PPC_RS(R10) |
+					    __PPC_SPR(SPRN_SPRG_SCRATCH0);
+
 			patch_instruction_site(&patch__itlbmiss_exit_1, insn);
 #ifndef CONFIG_PIN_TLB_TEXT
 			patch_instruction_site(&patch__itlbmiss_exit_2, insn);
@@ -181,6 +181,10 @@ static void mpc8xx_pmu_del(struct perf_event *event, int flags)
 		break;
 	case PERF_8xx_ID_DTLB_LOAD_MISS:
 		if (atomic_dec_return(&dtlb_miss_ref) == 0) {
+			/* mfspr r10, SPRN_DAR */
+			unsigned int insn = PPC_INST_MFSPR | __PPC_RS(R10) |
+					    __PPC_SPR(SPRN_DAR);
+
 			patch_instruction_site(&patch__dtlbmiss_exit_1, insn);
 			patch_instruction_site(&patch__dtlbmiss_exit_2, insn);
 			patch_instruction_site(&patch__dtlbmiss_exit_3, insn);
-- 
2.13.3

