Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB06AE71B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 11:37:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SKgN6bV1zDrQR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 19:37:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="idHyv23X"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SKDg6BmmzDqxt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 19:17:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46SKDV11y6z9txW8;
 Tue, 10 Sep 2019 11:17:14 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=idHyv23X; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8aeNip4PjRe5; Tue, 10 Sep 2019 11:17:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46SKDT6sgbz9txW2;
 Tue, 10 Sep 2019 11:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568107034; bh=8ftmeyPqqlcOQZKXXYr2+SgDzTYbbqznzk6320BOCv8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=idHyv23XV6f0UvTXYGLdedeji+3J0TmcwN9NaKLNFPC+eecfaieHRusltrGx1QCyR
 Q8h/W1qnkLG0oGVTXcENS4RwPGRkbwMH7zB/aMtm0wqn3ZBOMwAv587Gf2Fb8vKFiG
 3ArjbCl1mr0yJP24mpGFE+KNs727Dwf6AX4N8E68=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8BF278B87A;
 Tue, 10 Sep 2019 11:17:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 93QokzmLfQal; Tue, 10 Sep 2019 11:17:13 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F2048B88B;
 Tue, 10 Sep 2019 11:16:24 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 21A026B739; Tue, 10 Sep 2019 09:16:24 +0000 (UTC)
Message-Id: <2fee4de4e85fd7fa1afd07d83b2963320795305f.1568106758.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1568106758.git.christophe.leroy@c-s.fr>
References: <cover.1568106758.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 05/15] powerpc/32: add a macro to get and/or save DAR and
 DSISR on stack.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, dja@axtens.net
Date: Tue, 10 Sep 2019 09:16:24 +0000 (UTC)
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

Refactor reading and saving of DAR and DSISR in exception vectors.

This will ease the implementation of VMAP stack.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_32.S  |  5 +----
 arch/powerpc/kernel/head_32.h  | 11 +++++++++++
 arch/powerpc/kernel/head_8xx.S | 23 +++++++----------------
 3 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index bebb49d877f2..449625b4ff03 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -339,10 +339,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	DO_KVM  0x600
 Alignment:
 	EXCEPTION_PROLOG
-	mfspr	r4,SPRN_DAR
-	stw	r4,_DAR(r11)
-	mfspr	r5,SPRN_DSISR
-	stw	r5,_DSISR(r11)
+	save_dar_dsisr_on_stack r4, r5, r11
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x600, alignment_exception)
 
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 436ffd862d2a..f19a1ab91fb5 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -144,6 +144,17 @@
 	RFI				/* jump to handler, enable MMU */
 .endm
 
+.macro save_dar_dsisr_on_stack reg1, reg2, sp
+	mfspr	\reg1, SPRN_DAR
+	mfspr	\reg2, SPRN_DSISR
+	stw	\reg1, _DAR(\sp)
+	stw	\reg2, _DSISR(\sp)
+.endm
+
+.macro get_and_save_dar_dsisr_on_stack reg1, reg2, sp
+	save_dar_dsisr_on_stack \reg1, \reg2, \sp
+.endm
+
 /*
  * Note: code which follows this uses cr0.eq (set if from kernel),
  * r11, r12 (SRR0), and r9 (SRR1).
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 175c3cfc8014..25e19af49705 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -128,12 +128,9 @@ instruction_counter:
 	. = 0x200
 MachineCheck:
 	EXCEPTION_PROLOG
-	mfspr r4,SPRN_DAR
-	stw r4,_DAR(r11)
-	li r5,RPN_PATTERN
-	mtspr SPRN_DAR,r5	/* Tag DAR, to be used in DTLB Error */
-	mfspr r5,SPRN_DSISR
-	stw r5,_DSISR(r11)
+	save_dar_dsisr_on_stack r4, r5, r11
+	li	r6, RPN_PATTERN
+	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
 	addi r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x200, machine_check_exception)
 
@@ -156,12 +153,9 @@ InstructionAccess:
 	. = 0x600
 Alignment:
 	EXCEPTION_PROLOG
-	mfspr	r4,SPRN_DAR
-	stw	r4,_DAR(r11)
-	li	r5,RPN_PATTERN
-	mtspr	SPRN_DAR,r5	/* Tag DAR, to be used in DTLB Error */
-	mfspr	r5,SPRN_DSISR
-	stw	r5,_DSISR(r11)
+	save_dar_dsisr_on_stack r4, r5, r11
+	li	r6, RPN_PATTERN
+	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x600, alignment_exception)
 
@@ -502,10 +496,7 @@ DataTLBError:
 DARFixed:/* Return from dcbx instruction bug workaround */
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2
-	mfspr	r5,SPRN_DSISR
-	stw	r5,_DSISR(r11)
-	mfspr	r4,SPRN_DAR
-	stw	r4, _DAR(r11)
+	get_and_save_dar_dsisr_on_stack r4, r5, r11
 	andis.	r10,r5,DSISR_NOHPTE@h
 	beq+	.Ldtlbie
 	tlbie	r4
-- 
2.13.3

