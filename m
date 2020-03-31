Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0009A198C73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 08:41:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s09Z47KkzDrCC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:41:54 +1100 (AEDT)
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
 header.s=mail header.b=jaKNuyK6; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rzny1TFTzDqsN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 17:24:54 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48rznt2T4yz9v0KM;
 Tue, 31 Mar 2020 08:24:50 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jaKNuyK6; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9kuhmWDyt8Bq; Tue, 31 Mar 2020 08:24:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48rznt15Xdz9v0KC;
 Tue, 31 Mar 2020 08:24:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585635890; bh=5nryEhu9ZdC3QcAPQtb5kgYfw9XZ6OdDGR/6oi4BLng=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=jaKNuyK6imUrD0z/gXSulBayGXCSDh5ddaOBzDwXFhD347QfkMc3G6yP/0mjYg7mg
 WmhKQ2co9HZdZ3DzX3DyqGaG22Nbl/bFJ+U9ocKuUmRW2Bmua0yo/POE7imAjTVql4
 dZ+CsL+92TSom13PA6Y1cwqI5Qlcu9nxn+yHhfbM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C83458B784;
 Tue, 31 Mar 2020 08:24:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6QJLOOAWpn2c; Tue, 31 Mar 2020 08:24:50 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 832DD8B752;
 Tue, 31 Mar 2020 08:24:50 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 829B865673; Tue, 31 Mar 2020 06:24:50 +0000 (UTC)
Message-Id: <0b7974a0400563d4cd1b607462940db4d4526605.1585635837.git.christophe.leroy@c-s.fr>
In-Reply-To: <40899eb1b8f10da3706acd06c3d46d2418c8886e.1585635837.git.christophe.leroy@c-s.fr>
References: <40899eb1b8f10da3706acd06c3d46d2418c8886e.1585635837.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 10/10] powerpc/32: Replace RFI by rfi
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 31 Mar 2020 06:24:50 +0000 (UTC)
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

RFI was a macro waving the rfi instruction for the 40x.

Now that 40x is gone, rfi can be used directly.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S | 18 +++++++++---------
 arch/powerpc/kernel/head_32.S  | 18 +++++++++---------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index cae0bdc013e5..4920448f6ad9 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -203,7 +203,7 @@ transfer_to_handler_cont:
 	mtspr	SPRN_SRR1,r10
 	mtlr	r9
 	SYNC
-	RFI				/* jump to handler, enable MMU */
+	rfi				/* jump to handler, enable MMU */
 
 #ifdef CONFIG_TRACE_IRQFLAGS
 1:	/* MSR is changing, re-enable MMU so we can notify lockdep. We need to
@@ -216,7 +216,7 @@ transfer_to_handler_cont:
 	mtspr	SPRN_SRR0,r12
 	mtspr	SPRN_SRR1,r0
 	SYNC
-	RFI
+	rfi
 
 reenable_mmu:
 	/*
@@ -290,7 +290,7 @@ stack_ovf:
 	mtspr	SPRN_SRR0,r9
 	mtspr	SPRN_SRR1,r10
 	SYNC
-	RFI
+	rfi
 #endif
 
 #ifdef CONFIG_TRACE_IRQFLAGS
@@ -439,7 +439,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	mtspr	SPRN_SRR0,r7
 	mtspr	SPRN_SRR1,r8
 	SYNC
-	RFI
+	rfi
 #ifdef CONFIG_44x
 2:	li	r7,0
 	iccci	r0,r0
@@ -570,7 +570,7 @@ ret_from_kernel_syscall:
 	mtspr	SPRN_SRR0, r9
 	mtspr	SPRN_SRR1, r10
 	SYNC
-	RFI
+	rfi
 
 /*
  * The fork/clone functions need to copy the full register set into
@@ -773,7 +773,7 @@ fast_exception_return:
 	REST_GPR(12, r11)
 	lwz	r11,GPR11(r11)
 	SYNC
-	RFI
+	rfi
 
 #ifndef CONFIG_BOOKE
 /* check if the exception happened in a restartable section */
@@ -1008,7 +1008,7 @@ exc_exit_restart:
 	.globl exc_exit_restart_end
 exc_exit_restart_end:
 	SYNC
-	RFI
+	rfi
 
 #else /* !CONFIG_BOOKE */
 	/*
@@ -1313,7 +1313,7 @@ _GLOBAL(enter_rtas)
 	stw	r7, THREAD + RTAS_SP(r2)
 	mtspr	SPRN_SRR0,r8
 	mtspr	SPRN_SRR1,r9
-	RFI
+	rfi
 1:	tophys_novmstack r9, r1
 #ifdef CONFIG_VMAP_STACK
 	li	r0, MSR_KERNEL & ~MSR_IR	/* can take DTLB miss */
@@ -1328,7 +1328,7 @@ _GLOBAL(enter_rtas)
 	stw	r0, THREAD + RTAS_SP(r7)
 	mtspr	SPRN_SRR0,r8
 	mtspr	SPRN_SRR1,r9
-	RFI			/* return to caller */
+	rfi			/* return to caller */
 
 	.globl	machine_check_in_rtas
 machine_check_in_rtas:
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index daaa153950c2..13866115a18a 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -220,7 +220,7 @@ turn_on_mmu:
 	ori	r0,r0,start_here@l
 	mtspr	SPRN_SRR0,r0
 	SYNC
-	RFI				/* enables MMU */
+	rfi				/* enables MMU */
 
 /*
  * We need __secondary_hold as a place to hold the other cpus on
@@ -784,14 +784,14 @@ fast_hash_page_return:
 	lwz	r11, THR11(r10)
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	SYNC
-	RFI
+	rfi
 
 1:	/* ISI */
 	mtcr	r11
 	mfspr	r11, SPRN_SPRG_SCRATCH1
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	SYNC
-	RFI
+	rfi
 
 stack_overflow:
 	vmap_stack_overflow_exception
@@ -930,7 +930,7 @@ __secondary_start:
 	mtspr	SPRN_SRR0,r3
 	mtspr	SPRN_SRR1,r4
 	SYNC
-	RFI
+	rfi
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_KVM_BOOK3S_HANDLER
@@ -1074,7 +1074,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	mtspr	SPRN_SRR0,r4
 	mtspr	SPRN_SRR1,r3
 	SYNC
-	RFI
+	rfi
 /* Load up the kernel context */
 2:	bl	load_up_mmu
 
@@ -1099,7 +1099,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	mtspr	SPRN_SRR0,r3
 	mtspr	SPRN_SRR1,r4
 	SYNC
-	RFI
+	rfi
 
 /*
  * void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next);
@@ -1217,7 +1217,7 @@ _ENTRY(update_bats)
 	mtspr	SPRN_SRR0, r4
 	mtspr	SPRN_SRR1, r3
 	SYNC
-	RFI
+	rfi
 1:	bl	clear_bats
 	lis	r3, BATS@ha
 	addi	r3, r3, BATS@l
@@ -1237,7 +1237,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	mtspr	SPRN_SRR0, r7
 	mtspr	SPRN_SRR1, r6
 	SYNC
-	RFI
+	rfi
 
 flush_tlbs:
 	lis	r10, 0x40
@@ -1258,7 +1258,7 @@ mmu_off:
 	mtspr	SPRN_SRR0,r4
 	mtspr	SPRN_SRR1,r3
 	sync
-	RFI
+	rfi
 
 /*
  * On 601, we use 3 BATs to map up to 24M of RAM at _PAGE_OFFSET
-- 
2.25.0

