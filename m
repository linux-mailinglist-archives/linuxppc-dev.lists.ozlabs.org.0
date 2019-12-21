Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5927D128839
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 09:35:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fzT81lMZzDqtZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 19:35:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="NatS6Dex"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fzPn5LNfzDqr6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 19:32:29 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47fzPj3fnSz9vBmM;
 Sat, 21 Dec 2019 09:32:25 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=NatS6Dex; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Dggffs4KFPUH; Sat, 21 Dec 2019 09:32:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47fzPj1k6Vz9v1Ks;
 Sat, 21 Dec 2019 09:32:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576917145; bh=OUysxTrW56fqmPw2U8c/5GTPg4n/j/VebyDLfYGLObA=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=NatS6DexWIVvbXqymishHyFstuxTJN7C4ggYJWbHKGYw7HAlIk+oEG4n+FQvLzkdm
 H1Zg/kCWZPRL4v1HP/t4YRIgqeC7/4aW9K1+H05nnCGjlME1mT4JtJJJEtczOQBO7G
 73bKHWy/bb17BKYakHIoX1c3bLVmvVhz4RqOCSZs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 10F1B8B77C;
 Sat, 21 Dec 2019 09:32:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YxUsOIDQhelH; Sat, 21 Dec 2019 09:32:25 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B066D8B752;
 Sat, 21 Dec 2019 09:32:25 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 76093637B6; Sat, 21 Dec 2019 08:32:25 +0000 (UTC)
Message-Id: <5c8b5bba692b92654dbd363a229a1ba91db725bb.1576916812.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1576916812.git.christophe.leroy@c-s.fr>
References: <cover.1576916812.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 04/17] powerpc/32: move MSR_PR test into EXCEPTION_PROLOG_0
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 dja@axtens.net
Date: Sat, 21 Dec 2019 08:32:25 +0000 (UTC)
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

In order to simplify  VMAP stack implementation, move
MSR_PR test into EXCEPTION_PROLOG_0.

This requires to not modify cr0 between EXCEPTION_PROLOG_0
and EXCEPTION_PROLOG_1.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_32.h  |  4 ++--
 arch/powerpc/kernel/head_8xx.S | 39 ++++++++++++++++++++-------------------
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 8e345f8d4b0e..436ffd862d2a 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -19,12 +19,12 @@
 .macro EXCEPTION_PROLOG_0
 	mtspr	SPRN_SPRG_SCRATCH0,r10
 	mtspr	SPRN_SPRG_SCRATCH1,r11
+	mfspr	r11, SPRN_SRR1		/* check whether user or kernel */
 	mfcr	r10
+	andi.	r11, r11, MSR_PR
 .endm
 
 .macro EXCEPTION_PROLOG_1
-	mfspr	r11,SPRN_SRR1		/* check whether user or kernel */
-	andi.	r11,r11,MSR_PR
 	tophys(r11,r1)			/* use tophys(r1) if kernel */
 	beq	1f
 	mfspr	r11,SPRN_SPRG_THREAD
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index fb284d95c76a..175c3cfc8014 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -497,8 +497,8 @@ InstructionTLBError:
 DataTLBError:
 	EXCEPTION_PROLOG_0
 	mfspr	r11, SPRN_DAR
-	cmpwi	cr0, r11, RPN_PATTERN
-	beq-	FixupDAR	/* must be a buggy dcbX, icbi insn. */
+	cmpwi	cr1, r11, RPN_PATTERN
+	beq-	cr1, FixupDAR	/* must be a buggy dcbX, icbi insn. */
 DARFixed:/* Return from dcbx instruction bug workaround */
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2
@@ -531,9 +531,9 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 DataBreakpoint:
 	EXCEPTION_PROLOG_0
 	mfspr	r11, SPRN_SRR0
-	cmplwi	cr0, r11, (.Ldtlbie - PAGE_OFFSET)@l
+	cmplwi	cr1, r11, (.Ldtlbie - PAGE_OFFSET)@l
 	cmplwi	cr7, r11, (.Litlbie - PAGE_OFFSET)@l
-	beq-	cr0, 11f
+	beq-	cr1, 11f
 	beq-	cr7, 11f
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2
@@ -578,9 +578,9 @@ FixupDAR:/* Entry point for dcbx workaround. */
 	mfspr	r10, SPRN_SRR0
 	mtspr	SPRN_MD_EPN, r10
 	rlwinm	r11, r10, 16, 0xfff8
-	cmpli	cr0, r11, PAGE_OFFSET@h
+	cmpli	cr1, r11, PAGE_OFFSET@h
 	mfspr	r11, SPRN_M_TWB	/* Get level 1 table */
-	blt+	3f
+	blt+	cr1, 3f
 	rlwinm	r11, r10, 16, 0xfff8
 
 0:	cmpli	cr7, r11, (PAGE_OFFSET + 0x1800000)@h
@@ -595,7 +595,7 @@ FixupDAR:/* Entry point for dcbx workaround. */
 3:
 	lwz	r11, (swapper_pg_dir-PAGE_OFFSET)@l(r11)	/* Get the level 1 entry */
 	mtspr	SPRN_MD_TWC, r11
-	mtcr	r11
+	mtcrf	0x01, r11
 	mfspr	r11, SPRN_MD_TWC
 	lwz	r11, 0(r11)	/* Get the pte */
 	bt	28,200f		/* bit 28 = Large page (8M) */
@@ -608,16 +608,16 @@ FixupDAR:/* Entry point for dcbx workaround. */
  * no need to include them here */
 	xoris	r10, r11, 0x7c00	/* check if major OP code is 31 */
 	rlwinm	r10, r10, 0, 21, 5
-	cmpwi	cr0, r10, 2028	/* Is dcbz? */
-	beq+	142f
-	cmpwi	cr0, r10, 940	/* Is dcbi? */
-	beq+	142f
-	cmpwi	cr0, r10, 108	/* Is dcbst? */
-	beq+	144f		/* Fix up store bit! */
-	cmpwi	cr0, r10, 172	/* Is dcbf? */
-	beq+	142f
-	cmpwi	cr0, r10, 1964	/* Is icbi? */
-	beq+	142f
+	cmpwi	cr1, r10, 2028	/* Is dcbz? */
+	beq+	cr1, 142f
+	cmpwi	cr1, r10, 940	/* Is dcbi? */
+	beq+	cr1, 142f
+	cmpwi	cr1, r10, 108	/* Is dcbst? */
+	beq+	cr1, 144f		/* Fix up store bit! */
+	cmpwi	cr1, r10, 172	/* Is dcbf? */
+	beq+	cr1, 142f
+	cmpwi	cr1, r10, 1964	/* Is icbi? */
+	beq+	cr1, 142f
 141:	mfspr	r10,SPRN_M_TW
 	b	DARFixed	/* Nope, go back to normal TLB processing */
 
@@ -676,8 +676,9 @@ FixupDAR:/* Entry point for dcbx workaround. */
 	add	r10, r10, r30	;b	151f
 	add	r10, r10, r31
 151:
-	rlwinm. r11,r11,19,24,28	/* offset into jump table for reg RA */
-	beq	152f			/* if reg RA is zero, don't add it */
+	rlwinm	r11,r11,19,24,28	/* offset into jump table for reg RA */
+	cmpwi	cr1, r11, 0
+	beq	cr1, 152f		/* if reg RA is zero, don't add it */
 	addi	r11, r11, 150b@l	/* add start of table */
 	mtctr	r11			/* load ctr with jump address */
 	rlwinm	r11,r11,0,16,10		/* make sure we don't execute this more than once */
-- 
2.13.3

