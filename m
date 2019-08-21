Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FEE98537
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 22:09:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DJfq0NjzzDr0x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 06:09:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="eo/B3MIt"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DJS83r9PzDr02
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 06:00:39 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46DJS25Yjwz9v1Gb;
 Wed, 21 Aug 2019 22:00:34 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=eo/B3MIt; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 76s7vcZh653n; Wed, 21 Aug 2019 22:00:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46DJS24JH9z9v1GN;
 Wed, 21 Aug 2019 22:00:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566417634; bh=3M3YmsDvlV5JCEpJdghYprXJU4GVcpWoIFlpJzIkUkU=;
 h=From:Subject:To:Cc:Date:From;
 b=eo/B3MIt2wOFtc9XL2HNKG19sOM/FqriUKdydFaw33tHafvkN+16MUe9SZkHETLNT
 wPIhYvL4YWK6SWTyhsch9ZjdSOZaVaLYoaiUtzpD3sDQ2aWJwdWFI5i2BoDApvJ32/
 Cf6BXT+cWGXqdoHHiYIvmsBnebEjAvW/2W+Shohw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B53378B7FA;
 Wed, 21 Aug 2019 22:00:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EsbtXOHFdeoq; Wed, 21 Aug 2019 22:00:34 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B6E48B7F9;
 Wed, 21 Aug 2019 22:00:34 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 51D906B70A; Wed, 21 Aug 2019 20:00:34 +0000 (UTC)
Message-Id: <b095e12c82fcba1ac4c09fc3b85d969f36614746.1566417610.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/8xx: drop unused self-modifying code alternative to
 FixupDAR.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 21 Aug 2019 20:00:34 +0000 (UTC)
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

The code which fixups the DAR on TLB errors for dbcX instructions
has a self-modifying code alternative that has never been used.

Drop it.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_8xx.S | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index b8ca5b43e587..19f583e18402 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -575,8 +575,6 @@ InstructionBreakpoint:
  * by decoding the registers used by the dcbx instruction and adding them.
  * DAR is set to the calculated address.
  */
- /* define if you don't want to use self modifying code */
-#define NO_SELF_MODIFYING_CODE
 FixupDAR:/* Entry point for dcbx workaround. */
 	mtspr	SPRN_M_TW, r10
 	/* fetch instruction from memory. */
@@ -640,27 +638,6 @@ FixupDAR:/* Entry point for dcbx workaround. */
 	rlwinm	r10, r10,0,7,5	/* Clear store bit for buggy dcbst insn */
 	mtspr	SPRN_DSISR, r10
 142:	/* continue, it was a dcbx, dcbi instruction. */
-#ifndef NO_SELF_MODIFYING_CODE
-	andis.	r10,r11,0x1f	/* test if reg RA is r0 */
-	li	r10,modified_instr@l
-	dcbtst	r0,r10		/* touch for store */
-	rlwinm	r11,r11,0,0,20	/* Zero lower 10 bits */
-	oris	r11,r11,640	/* Transform instr. to a "add r10,RA,RB" */
-	ori	r11,r11,532
-	stw	r11,0(r10)	/* store add/and instruction */
-	dcbf	0,r10		/* flush new instr. to memory. */
-	icbi	0,r10		/* invalidate instr. cache line */
-	mfspr	r11, SPRN_SPRG_SCRATCH1	/* restore r11 */
-	mfspr	r10, SPRN_SPRG_SCRATCH0	/* restore r10 */
-	isync			/* Wait until new instr is loaded from memory */
-modified_instr:
-	.space	4		/* this is where the add instr. is stored */
-	bne+	143f
-	subf	r10,r0,r10	/* r10=r10-r0, only if reg RA is r0 */
-143:	mtdar	r10		/* store faulting EA in DAR */
-	mfspr	r10,SPRN_M_TW
-	b	DARFixed	/* Go back to normal TLB handling */
-#else
 	mfctr	r10
 	mtdar	r10			/* save ctr reg in DAR */
 	rlwinm	r10, r11, 24, 24, 28	/* offset into jump table for reg RB */
@@ -724,7 +701,6 @@ modified_instr:
 	add	r10, r10, r11	/* add it */
 	mfctr	r11		/* restore r11 */
 	b	151b
-#endif
 
 /*
  * This is where the main kernel code starts.
-- 
2.13.3

