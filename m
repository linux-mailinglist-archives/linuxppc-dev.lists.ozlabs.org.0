Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F55BD31B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 19:04:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWWH45tbqz3fKQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:04:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWWFN5vWXz3cDF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 03:02:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MWWDt2vfxz9skd;
	Mon, 19 Sep 2022 19:02:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmu1OodumcBb; Mon, 19 Sep 2022 19:02:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MWWDr4ZRKz9skp;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7CD188B786;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fRwnER0RnHsC; Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.8])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 456888B76D;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28JH1v1R1549584
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 19:01:57 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28JH1v8q1549579;
	Mon, 19 Sep 2022 19:01:57 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 03/19] powerpc/64e: Remove unnecessary #ifdef CONFIG_PPC_FSL_BOOK3E
Date: Mon, 19 Sep 2022 19:01:27 +0200
Message-Id: <df16255c13b63b0221c9be63b94a6864bed22c12.1663606875.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
References: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663606898; l=2526; s=20211009; h=from:subject:message-id; bh=hspYMu9LvPhbWACx1y6nYpKsJX7vA83g+nU/G466srE=; b=uBfNXqBgCVZu9jd6IIcY7Am4EG0mlXdg0dKYv60OQmINmhada2/0MmFTi4r2UcvNjxME6qz435Kg PXf1Ly8YBIowTc6XEZWNFIuVzd9s8vnGysTCwsj0u/FALfigmJna
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

CONFIG_PPC_BOOK3E_64 implies CONFIG_PPC_FSL_BOOK3E so no need of
additional #ifdefs in files built exclusively for CONFIG_PPC_BOOK3E_64.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/exceptions-64e.S | 8 --------
 arch/powerpc/mm/nohash/tlb_low_64e.S | 6 ------
 2 files changed, 14 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 67dc4e3179a0..3afba070a5d8 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -291,7 +291,6 @@ ret_from_mc_except:
 #define SPRN_MC_SRR0	SPRN_MCSRR0
 #define SPRN_MC_SRR1	SPRN_MCSRR1
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
 #define GEN_BTB_FLUSH			\
 	START_BTB_FLUSH_SECTION		\
 		beq 1f;			\
@@ -307,13 +306,6 @@ ret_from_mc_except:
 #define DBG_BTB_FLUSH CRIT_BTB_FLUSH
 #define MC_BTB_FLUSH CRIT_BTB_FLUSH
 #define GDBELL_BTB_FLUSH GEN_BTB_FLUSH
-#else
-#define GEN_BTB_FLUSH
-#define CRIT_BTB_FLUSH
-#define DBG_BTB_FLUSH
-#define MC_BTB_FLUSH
-#define GDBELL_BTB_FLUSH
-#endif
 
 #define NORMAL_EXCEPTION_PROLOG(n, intnum, addition)			    \
 	EXCEPTION_PROLOG(n, intnum, GEN, addition##_GEN(n))
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index 68ffbfdba894..be26f33a6ac0 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -61,7 +61,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
 	ld	r14,PACAPGD(r13)
 	std	r15,EX_TLB_R15(r12)
 	std	r10,EX_TLB_CR(r12)
-#ifdef CONFIG_PPC_FSL_BOOK3E
 START_BTB_FLUSH_SECTION
 	mfspr r11, SPRN_SRR1
 	andi. r10,r11,MSR_PR
@@ -70,14 +69,11 @@ START_BTB_FLUSH_SECTION
 1:
 END_BTB_FLUSH_SECTION
 	std	r7,EX_TLB_R7(r12)
-#endif
 .endm
 
 .macro tlb_epilog_bolted
 	ld	r14,EX_TLB_CR(r12)
-#ifdef CONFIG_PPC_FSL_BOOK3E
 	ld	r7,EX_TLB_R7(r12)
-#endif
 	ld	r10,EX_TLB_R10(r12)
 	ld	r11,EX_TLB_R11(r12)
 	ld	r13,EX_TLB_R13(r12)
@@ -248,7 +244,6 @@ itlb_miss_fault_bolted:
 	beq	tlb_miss_user_bolted
 	b	itlb_miss_kernel_bolted
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
 /*
  * TLB miss handling for e6500 and derivatives, using hardware tablewalk.
  *
@@ -515,7 +510,6 @@ dtlb_miss_fault_e6500:
 itlb_miss_fault_e6500:
 	tlb_epilog_bolted
 	b	exc_instruction_storage_book3e
-#endif /* CONFIG_PPC_FSL_BOOK3E */
 
 /**********************************************************************
  *                                                                    *
-- 
2.37.1

