Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4F314C93
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:11:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZdwW3PjszDsfM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:11:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdZr0lv9zDqqk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdZl14kCz9tx44;
 Tue,  9 Feb 2021 10:56:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pSFg-_3QKDnm; Tue,  9 Feb 2021 10:56:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdZl0DLYz9tx43;
 Tue,  9 Feb 2021 10:56:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D03248B7D4;
 Tue,  9 Feb 2021 10:56:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wxP2X_PXPeGd; Tue,  9 Feb 2021 10:56:31 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 489C58B7D6;
 Tue,  9 Feb 2021 10:56:31 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 23EC967342; Tue,  9 Feb 2021 09:56:31 +0000 (UTC)
Message-Id: <8ebf2e9287d63b94caf9440d1ea1c62801a84c67.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 07/41] powerpc/40x: Prepare normal exception handler
 for enabling MMU early
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:31 +0000 (UTC)
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

Ensure normal exception handler are able to manage stuff with
MMU enabled. For that we use CONFIG_VMAP_STACK related code
allthough there is no intention to really activate CONFIG_VMAP_STACK
on powerpc 40x for the moment.

40x uses SPRN_DEAR instead of SPRN_DAR and SPRN_ESR instead of
SPRN_DSISR. Take it into account in common macros.

40x MSR value doesn't fit on 15 bits, use LOAD_REG_IMMEDIATE() in
common macros that will be used also with 40x.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S |  2 +-
 arch/powerpc/kernel/head_32.h  | 15 ++++++++++++++-
 arch/powerpc/kernel/head_40x.S | 17 ++++++-----------
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 1e59d0bb1a6f..9312634085ba 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -162,7 +162,7 @@ transfer_to_handler:
 	li	r12,-1			/* clear all pending debug events */
 	mtspr	SPRN_DBSR,r12
 	lis	r11,global_dbcr0@ha
-	tophys(r11,r11)
+	tophys_novmstack r11,r11
 	addi	r11,r11,global_dbcr0@l
 #ifdef CONFIG_SMP
 	lwz	r9,TASK_CPU(r2)
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 5d4706c14572..ac6b391f1493 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -22,9 +22,17 @@
 #ifdef CONFIG_VMAP_STACK
 	mfspr	r10, SPRN_SPRG_THREAD
 	.if	\handle_dar_dsisr
+#ifdef CONFIG_40x
+	mfspr	r11, SPRN_DEAR
+#else
 	mfspr	r11, SPRN_DAR
+#endif
 	stw	r11, DAR(r10)
+#ifdef CONFIG_40x
+	mfspr	r11, SPRN_ESR
+#else
 	mfspr	r11, SPRN_DSISR
+#endif
 	stw	r11, DSISR(r10)
 	.endif
 	mfspr	r11, SPRN_SRR0
@@ -61,7 +69,7 @@
 
 .macro EXCEPTION_PROLOG_2 handle_dar_dsisr=0
 #ifdef CONFIG_VMAP_STACK
-	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
+	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~(MSR_IR | MSR_RI)) /* can take DTLB miss */
 	mtmsr	r11
 	isync
 	mfspr	r11, SPRN_SPRG_SCRATCH2
@@ -158,8 +166,13 @@
 
 .macro save_dar_dsisr_on_stack reg1, reg2, sp
 #ifndef CONFIG_VMAP_STACK
+#ifdef CONFIG_40x
+	mfspr	\reg1, SPRN_DEAR
+	mfspr	\reg2, SPRN_ESR
+#else
 	mfspr	\reg1, SPRN_DAR
 	mfspr	\reg2, SPRN_DSISR
+#endif
 	stw	\reg1, _DAR(\sp)
 	stw	\reg2, _DSISR(\sp)
 #endif
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 1468f38c3860..4bf0aee858eb 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -221,11 +221,8 @@ _ENTRY(saved_ksp_limit)
  * if they can't resolve the lightweight TLB fault.
  */
 	START_EXCEPTION(0x0300,	DataStorage)
-	EXCEPTION_PROLOG
-	mfspr	r5, SPRN_ESR		/* Grab the ESR, save it */
-	stw	r5, _ESR(r11)
-	mfspr	r4, SPRN_DEAR		/* Grab the DEAR, save it */
-	stw	r4, _DEAR(r11)
+	EXCEPTION_PROLOG handle_dar_dsisr=1
+	save_dar_dsisr_on_stack	r4, r5, r11
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
 /*
@@ -244,17 +241,15 @@ _ENTRY(saved_ksp_limit)
 
 /* 0x0600 - Alignment Exception */
 	START_EXCEPTION(0x0600, Alignment)
-	EXCEPTION_PROLOG
-	mfspr	r4,SPRN_DEAR		/* Grab the DEAR and save it */
-	stw	r4,_DEAR(r11)
+	EXCEPTION_PROLOG handle_dar_dsisr=1
+	save_dar_dsisr_on_stack r4, r5, r11
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x600, alignment_exception)
 
 /* 0x0700 - Program Exception */
 	START_EXCEPTION(0x0700, ProgramCheck)
-	EXCEPTION_PROLOG
-	mfspr	r4,SPRN_ESR		/* Grab the ESR and save it */
-	stw	r4,_ESR(r11)
+	EXCEPTION_PROLOG handle_dar_dsisr=1
+	save_dar_dsisr_on_stack r4, r5, r11
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x700, program_check_exception)
 
-- 
2.25.0

