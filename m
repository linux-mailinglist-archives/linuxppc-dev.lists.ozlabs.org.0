Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A44DEF93E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 14:50:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44thFl1XfmzDqP2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 22:50:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="HrvHF61H"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44th0d0W2ZzDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 22:38:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44th0X3cCYz9vD36;
 Tue, 30 Apr 2019 14:38:52 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=HrvHF61H; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qcKjiFmINjSp; Tue, 30 Apr 2019 14:38:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44th0X2ZS3z9vD30;
 Tue, 30 Apr 2019 14:38:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556627932; bh=FpWIdVhXPqB6vibTfnZhtBnlLfysFeUxuV/R0Sq2tt8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=HrvHF61Hd31XM7m4BiH5qt5XLcUXBam4p2I0mi2ThYNlMfnVi1tnWABJ/mAecJAYZ
 090tQz9HmHMFDuRzAWYSik8SdgxidVR0/YTRNWtioZW8IOJ0pLRAJZld2tbnqQW8FN
 B/zHXM1lv7YEgEwLSUxrHP+B7hPHTwAr/8tVuSQQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 97D4B8B8DF;
 Tue, 30 Apr 2019 14:38:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id y54Sach3IEss; Tue, 30 Apr 2019 14:38:53 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 69E878B8C2;
 Tue, 30 Apr 2019 14:38:53 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 43425666F8; Tue, 30 Apr 2019 12:38:53 +0000 (UTC)
Message-Id: <f922ea7e0fc4c827d9255b285cf93d2a10cb9448.1556627571.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1556627571.git.christophe.leroy@c-s.fr>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 04/16] powerpc/40x: Don't use SPRN_SPRG_SCRATCH2 in
 EXCEPTION_PROLOG
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 30 Apr 2019 12:38:53 +0000 (UTC)
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

Unlike said in the comment, r1 is not reused by the critical
exception handler, as it uses a dedicated critirq_ctx stack.
Decrementing r1 early is then unneeded.

Should the above be valid, the code is crap buggy anyway as
r1 gets some intermediate values that would jeopardise the
whole process (for instance after mfspr   r1,SPRN_SPRG_THREAD)

Using SPRN_SPRG_SCRATCH2 to save r1 is then not needed, r11 can be
used instead. This avoids one mtspr and one mfspr and makes the
prolog closer to what's done on 6xx and 8xx.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_40x.S | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index a9c934f2319b..f49b0278e995 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -102,23 +102,20 @@ _ENTRY(saved_ksp_limit)
  * Exception vector entry code. This code runs with address translation
  * turned off (i.e. using physical addresses). We assume SPRG_THREAD has
  * the physical address of the current task thread_struct.
- * Note that we have to have decremented r1 before we write to any fields
- * of the exception frame, since a critical interrupt could occur at any
- * time, and it will write to the area immediately below the current r1.
  */
 #define NORMAL_EXCEPTION_PROLOG						     \
 	mtspr	SPRN_SPRG_SCRATCH0,r10;	/* save two registers to work with */\
 	mtspr	SPRN_SPRG_SCRATCH1,r11;					     \
-	mtspr	SPRN_SPRG_SCRATCH2,r1;					     \
 	mfcr	r10;			/* save CR in r10 for now	   */\
 	mfspr	r11,SPRN_SRR1;		/* check whether user or kernel    */\
 	andi.	r11,r11,MSR_PR;						     \
-	beq	1f;							     \
-	mfspr	r1,SPRN_SPRG_THREAD;	/* if from user, start at top of   */\
-	lwz	r1,TASK_STACK-THREAD(r1); /* this thread's kernel stack   */\
-	addi	r1,r1,THREAD_SIZE;					     \
-1:	subi	r1,r1,INT_FRAME_SIZE;	/* Allocate an exception frame     */\
 	tophys(r11,r1);							     \
+	beq	1f;							     \
+	mfspr	r11,SPRN_SPRG_THREAD;	/* if from user, start at top of   */\
+	lwz	r11,TASK_STACK-THREAD(r11); /* this thread's kernel stack */\
+	addi	r11,r11,THREAD_SIZE;					     \
+	tophys(r11,r11);						     \
+1:	subi	r11,r11,INT_FRAME_SIZE;	/* Allocate an exception frame     */\
 	stw	r10,_CCR(r11);          /* save various registers	   */\
 	stw	r12,GPR12(r11);						     \
 	stw	r9,GPR9(r11);						     \
@@ -128,11 +125,11 @@ _ENTRY(saved_ksp_limit)
 	stw	r12,GPR11(r11);						     \
 	mflr	r10;							     \
 	stw	r10,_LINK(r11);						     \
-	mfspr	r10,SPRN_SPRG_SCRATCH2;					     \
 	mfspr	r12,SPRN_SRR0;						     \
-	stw	r10,GPR1(r11);						     \
+	stw	r1,GPR1(r11);						     \
 	mfspr	r9,SPRN_SRR1;						     \
-	stw	r10,0(r11);						     \
+	stw	r1,0(r11);						     \
+	tovirt(r1,r11);			/* set new kernel sp */	\
 	rlwinm	r9,r9,0,14,12;		/* clear MSR_WE (necessary?)	   */\
 	stw	r0,GPR0(r11);						     \
 	SAVE_4GPRS(3, r11);						     \
-- 
2.13.3

