Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE32109E34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 13:45:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MkBk3Vs4zDqGh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 23:45:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Ide2badU"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mk0W1M0SzDqBt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 23:36:10 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Mk0P5qbnz9v0G8;
 Tue, 26 Nov 2019 13:36:05 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Ide2badU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id S0Bw1YLcVBUA; Tue, 26 Nov 2019 13:36:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Mk0P4m2Hz9v0G3;
 Tue, 26 Nov 2019 13:36:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574771765; bh=m0F79agJKT/mM0rLeojP8dFogvIrepteOvcwkNoU+9Q=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Ide2badUbK0bOkEdQLJH+yIuMTQUm8kXZVyp5/ba8kcoB68IbOTLCYWGTmU0Yo6ZZ
 FG8/U39bICCaLiksNKQi6hml294+VkV5SrZ7DHONB7kN60Ho7QGXqVkEndtSfYIY9z
 Ke9KJNXVfvk1wp0NrqPzIaiWxbn7kRTGhjuF14Dk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E8A8F8B7FF;
 Tue, 26 Nov 2019 13:36:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Kb5albdmGleF; Tue, 26 Nov 2019 13:36:06 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A6BF58B771;
 Tue, 26 Nov 2019 13:36:06 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 798C86B76A; Tue, 26 Nov 2019 12:36:06 +0000 (UTC)
Message-Id: <76713a18406a76a5bf20be56c88b5a6d3994b2b5.1574771540.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1574771539.git.christophe.leroy@c-s.fr>
References: <cover.1574771539.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 03/16] powerpc/32: save DEAR/DAR before calling
 handle_page_fault
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 26 Nov 2019 12:36:06 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

handle_page_fault() is the only function that save DAR/DEAR itself.

Save DAR/DEAR before calling handle_page_fault() to prepare for
VMAP stack which will require to save even before.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S       | 1 -
 arch/powerpc/kernel/head_32.S        | 2 ++
 arch/powerpc/kernel/head_40x.S       | 2 ++
 arch/powerpc/kernel/head_8xx.S       | 2 ++
 arch/powerpc/kernel/head_booke.h     | 2 ++
 arch/powerpc/kernel/head_fsl_booke.S | 1 +
 6 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 6273b4862482..317ad9df8ba8 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -621,7 +621,6 @@ ppc_swapcontext:
  */
 	.globl	handle_page_fault
 handle_page_fault:
-	stw	r4,_DAR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_BOOK3S_32
 	andis.  r0,r5,DSISR_DABRMATCH@h
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 9e868567b716..bebb49d877f2 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -310,6 +310,7 @@ BEGIN_MMU_FTR_SECTION
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 1:	lwz	r5,_DSISR(r11)		/* get DSISR value */
 	mfspr	r4,SPRN_DAR
+	stw	r4, _DAR(r11)
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
 
@@ -327,6 +328,7 @@ BEGIN_MMU_FTR_SECTION
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 1:	mr	r4,r12
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
+	stw	r4, _DAR(r11)
 	EXC_XFER_LITE(0x400, handle_page_fault)
 
 /* External interrupt */
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 585ea1976550..9bb663977e84 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -313,6 +313,7 @@ _ENTRY(saved_ksp_limit)
 	START_EXCEPTION(0x0400, InstructionAccess)
 	EXCEPTION_PROLOG
 	mr	r4,r12			/* Pass SRR0 as arg2 */
+	stw	r4, _DEAR(r11)
 	li	r5,0			/* Pass zero as arg3 */
 	EXC_XFER_LITE(0x400, handle_page_fault)
 
@@ -676,6 +677,7 @@ DataAccess:
 	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
 	stw	r5,_ESR(r11)
 	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
+	stw	r4, _DEAR(r11)
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
 /* Other PowerPC processors, namely those derived from the 6xx-series
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index dac7c0a34eea..fb284d95c76a 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -486,6 +486,7 @@ InstructionTLBError:
 	tlbie	r4
 	/* 0x400 is InstructionAccess exception, needed by bad_page_fault() */
 .Litlbie:
+	stw	r4, _DAR(r11)
 	EXC_XFER_LITE(0x400, handle_page_fault)
 
 /* This is the data TLB error on the MPC8xx.  This could be due to
@@ -504,6 +505,7 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	mfspr	r5,SPRN_DSISR
 	stw	r5,_DSISR(r11)
 	mfspr	r4,SPRN_DAR
+	stw	r4, _DAR(r11)
 	andis.	r10,r5,DSISR_NOHPTE@h
 	beq+	.Ldtlbie
 	tlbie	r4
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 2ae635df9026..37fc84ed90e3 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -467,6 +467,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
 	stw	r5,_ESR(r11);						      \
 	mfspr	r4,SPRN_DEAR;		/* Grab the DEAR */		      \
+	stw	r4, _DEAR(r11);						      \
 	EXC_XFER_LITE(0x0300, handle_page_fault)
 
 #define INSTRUCTION_STORAGE_EXCEPTION					      \
@@ -475,6 +476,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
 	stw	r5,_ESR(r11);						      \
 	mr      r4,r12;                 /* Pass SRR0 as arg2 */		      \
+	stw	r4, _DEAR(r11);						      \
 	li      r5,0;                   /* Pass zero as arg3 */		      \
 	EXC_XFER_LITE(0x0400, handle_page_fault)
 
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 838d9d4650c7..89fa02395a43 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -378,6 +378,7 @@ interrupt_base:
 	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
 	andis.	r10,r5,(ESR_ILK|ESR_DLK)@h
 	bne	1f
+	stw	r4, _DEAR(r11)
 	EXC_XFER_LITE(0x0300, handle_page_fault)
 1:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-- 
2.13.3

