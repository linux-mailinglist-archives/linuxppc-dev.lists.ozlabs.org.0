Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE01128853
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 10:00:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47g01b67P1zDqN7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 20:00:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="wGJ/p0M/"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fzPz3FBJzDqqJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 19:32:39 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47fzPv2rcPz9txhG;
 Sat, 21 Dec 2019 09:32:35 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=wGJ/p0M/; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id b44xrpceu8m4; Sat, 21 Dec 2019 09:32:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47fzPv1qrdz9txh9;
 Sat, 21 Dec 2019 09:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576917155; bh=CGbgPE/GCECgmV7WaXbEokdK8c5p9Q9p3qw+ROQpjHo=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=wGJ/p0M/IuCtfFy9YCi5r4JX1wgoqma5Qc7hjvkpeGj5fxlzFA0NvzAEvmAE+uMZb
 nAnYThuKOK9Y4kf/paAGx80kJYvg8Ldw7Xdiw1n8ODMsEC0Zl0xbZp3+VCI+AK/ocG
 OuxxGy3s4sETipJVRHSy75TrXAR9kUBFO7E3wFL4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 477BB8B77C;
 Sat, 21 Dec 2019 09:32:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3IamUZ003aVD; Sat, 21 Dec 2019 09:32:36 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0165A8B752;
 Sat, 21 Dec 2019 09:32:35 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id BF083637B6; Sat, 21 Dec 2019 08:32:35 +0000 (UTC)
Message-Id: <d7ba1e34e80898310d6a314cbebe48baa32894ef.1576916812.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1576916812.git.christophe.leroy@c-s.fr>
References: <cover.1576916812.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 14/17] powerpc/8xx: Enable CONFIG_VMAP_STACK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 dja@axtens.net
Date: Sat, 21 Dec 2019 08:32:35 +0000 (UTC)
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

This patch enables CONFIG_VMAP_STACK. For that, a few changes are
done in head_8xx.S.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_8xx.S         | 32 ++++++++++++++++++++++++++------
 arch/powerpc/platforms/Kconfig.cputype |  1 +
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 225e242ce1c5..477933b36bde 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -127,7 +127,7 @@ instruction_counter:
 /* Machine check */
 	. = 0x200
 MachineCheck:
-	EXCEPTION_PROLOG
+	EXCEPTION_PROLOG handle_dar_dsisr=1
 	save_dar_dsisr_on_stack r4, r5, r11
 	li	r6, RPN_PATTERN
 	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
@@ -140,7 +140,7 @@ MachineCheck:
 /* Alignment exception */
 	. = 0x600
 Alignment:
-	EXCEPTION_PROLOG
+	EXCEPTION_PROLOG handle_dar_dsisr=1
 	save_dar_dsisr_on_stack r4, r5, r11
 	li	r6, RPN_PATTERN
 	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
@@ -457,20 +457,26 @@ InstructionTLBError:
  */
 	. = 0x1400
 DataTLBError:
-	EXCEPTION_PROLOG_0
+	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	mfspr	r11, SPRN_DAR
 	cmpwi	cr1, r11, RPN_PATTERN
 	beq-	cr1, FixupDAR	/* must be a buggy dcbX, icbi insn. */
 DARFixed:/* Return from dcbx instruction bug workaround */
+#ifdef CONFIG_VMAP_STACK
+	li	r11, RPN_PATTERN
+	mtspr	SPRN_DAR, r11	/* Tag DAR, to be used in DTLB Error */
+#endif
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2
+	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
 	get_and_save_dar_dsisr_on_stack r4, r5, r11
 	andis.	r10,r5,DSISR_NOHPTE@h
 	beq+	.Ldtlbie
 	tlbie	r4
 .Ldtlbie:
+#ifndef CONFIG_VMAP_STACK
 	li	r10,RPN_PATTERN
 	mtspr	SPRN_DAR,r10	/* Tag DAR, to be used in DTLB Error */
+#endif
 	/* 0x300 is DataAccess exception, needed by bad_page_fault() */
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
@@ -486,22 +492,29 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	rfi
 #endif
 
+stack_overflow:
+	vmap_stack_overflow_exception
+
 /* On the MPC8xx, these next four traps are used for development
  * support of breakpoints and such.  Someday I will get around to
  * using them.
  */
 do_databreakpoint:
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2
+	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	mfspr	r4,SPRN_BAR
 	stw	r4,_DAR(r11)
+#ifdef CONFIG_VMAP_STACK
+	lwz	r5,_DSISR(r11)
+#else
 	mfspr	r5,SPRN_DSISR
+#endif
 	EXC_XFER_STD(0x1c00, do_break)
 
 	. = 0x1c00
 DataBreakpoint:
-	EXCEPTION_PROLOG_0
+	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	mfspr	r11, SPRN_SRR0
 	cmplwi	cr1, r11, (.Ldtlbie - PAGE_OFFSET)@l
 	cmplwi	cr7, r11, (.Litlbie - PAGE_OFFSET)@l
@@ -650,7 +663,14 @@ FixupDAR:/* Entry point for dcbx workaround. */
 152:
 	mfdar	r11
 	mtctr	r11			/* restore ctr reg from DAR */
+#ifdef CONFIG_VMAP_STACK
+	mfspr	r11, SPRN_SPRG_THREAD
+	stw	r10, DAR(r11)
+	mfspr	r10, SPRN_DSISR
+	stw	r10, DSISR(r11)
+#else
 	mtdar	r10			/* save fault EA to DAR */
+#endif
 	mfspr	r10,SPRN_M_TW
 	b	DARFixed		/* Go back to normal TLB handling */
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 8d7f9c3dc771..000dd297337c 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -49,6 +49,7 @@ config PPC_8xx
 	select PPC_HAVE_KUEP
 	select PPC_HAVE_KUAP
 	select PPC_MM_SLICES if HUGETLB_PAGE
+	select HAVE_ARCH_VMAP_STACK
 
 config 40x
 	bool "AMCC 40x"
-- 
2.13.3

