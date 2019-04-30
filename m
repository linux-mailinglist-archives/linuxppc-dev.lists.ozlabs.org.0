Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E68F1F95F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 14:59:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44thSQ326tzDqSj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 22:59:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QjHo7GC0"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44th0k5w0rzDqNQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 22:39:02 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44th0Z3krWz9vD38;
 Tue, 30 Apr 2019 14:38:54 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QjHo7GC0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8R6cxy9lUxcR; Tue, 30 Apr 2019 14:38:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44th0Z2jSnz9vD30;
 Tue, 30 Apr 2019 14:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556627934; bh=XvXA4BMh4E6TIZg6dxaZb2e6bZuem4Kr4mb92NmoWwk=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=QjHo7GC09riyX1k3X58u6arozIlXejsrrIiXDw+eC1rkjrrjtvytadbAr9IAmKGkl
 jvv6GEaO7kFFX2Si8VkNkNNMxuNb/7kcY5AUmMipPyqZ6UOqkYMpDKxIPmJDoPcQue
 42MEDUkd6qv0Mv7QjZpAYthFoVhZXVmyc6BzT5OA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BAF068B8DF;
 Tue, 30 Apr 2019 14:38:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 68_IWAWmCRjB; Tue, 30 Apr 2019 14:38:55 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D7138B8C2;
 Tue, 30 Apr 2019 14:38:55 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 50DC6666F8; Tue, 30 Apr 2019 12:38:55 +0000 (UTC)
Message-Id: <7a379bb42fc4433878d4451b05a5581985ed3afc.1556627571.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1556627571.git.christophe.leroy@c-s.fr>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 06/16] powerpc/40x: Split and rename NORMAL_EXCEPTION_PROLOG
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 30 Apr 2019 12:38:55 +0000 (UTC)
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

This patch splits NORMAL_EXCEPTION_PROLOG in the same way as in
head_8xx.S and head_32.S and renames it EXCEPTION_PROLOG() as well
to match head_32.h

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_40x.S | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index cb95a5c17cea..1547750567b6 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -103,10 +103,14 @@ _ENTRY(saved_ksp_limit)
  * turned off (i.e. using physical addresses). We assume SPRG_THREAD has
  * the physical address of the current task thread_struct.
  */
-#define NORMAL_EXCEPTION_PROLOG						     \
+#define EXCEPTION_PROLOG						     \
 	mtspr	SPRN_SPRG_SCRATCH0,r10;	/* save two registers to work with */\
 	mtspr	SPRN_SPRG_SCRATCH1,r11;					     \
 	mfcr	r10;			/* save CR in r10 for now	   */\
+	EXCEPTION_PROLOG_1;						     \
+	EXCEPTION_PROLOG_2
+
+#define EXCEPTION_PROLOG_1						     \
 	mfspr	r11,SPRN_SRR1;		/* check whether user or kernel    */\
 	andi.	r11,r11,MSR_PR;						     \
 	tophys(r11,r1);							     \
@@ -115,7 +119,9 @@ _ENTRY(saved_ksp_limit)
 	lwz	r11,TASK_STACK-THREAD(r11); /* this thread's kernel stack */\
 	addi	r11,r11,THREAD_SIZE;					     \
 	tophys(r11,r11);						     \
-1:	subi	r11,r11,INT_FRAME_SIZE;	/* Allocate an exception frame     */\
+1:	subi	r11,r11,INT_FRAME_SIZE	/* Allocate an exception frame     */
+
+#define EXCEPTION_PROLOG_2						     \
 	stw	r10,_CCR(r11);          /* save various registers	   */\
 	stw	r12,GPR12(r11);						     \
 	stw	r9,GPR9(r11);						     \
@@ -205,7 +211,7 @@ label:
 
 #define EXCEPTION(n, label, hdlr, xfer)				\
 	START_EXCEPTION(n, label);				\
-	NORMAL_EXCEPTION_PROLOG;				\
+	EXCEPTION_PROLOG;				\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
 	xfer(n, hdlr)
 
@@ -396,7 +402,7 @@ label:
  * This is caused by a fetch from non-execute or guarded pages.
  */
 	START_EXCEPTION(0x0400, InstructionAccess)
-	NORMAL_EXCEPTION_PROLOG
+	EXCEPTION_PROLOG
 	mr	r4,r12			/* Pass SRR0 as arg2 */
 	li	r5,0			/* Pass zero as arg3 */
 	EXC_XFER_LITE(0x400, handle_page_fault)
@@ -406,7 +412,7 @@ label:
 
 /* 0x0600 - Alignment Exception */
 	START_EXCEPTION(0x0600, Alignment)
-	NORMAL_EXCEPTION_PROLOG
+	EXCEPTION_PROLOG
 	mfspr	r4,SPRN_DEAR		/* Grab the DEAR and save it */
 	stw	r4,_DEAR(r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -414,7 +420,7 @@ label:
 
 /* 0x0700 - Program Exception */
 	START_EXCEPTION(0x0700, ProgramCheck)
-	NORMAL_EXCEPTION_PROLOG
+	EXCEPTION_PROLOG
 	mfspr	r4,SPRN_ESR		/* Grab the ESR and save it */
 	stw	r4,_ESR(r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -427,7 +433,7 @@ label:
 
 /* 0x0C00 - System Call Exception */
 	START_EXCEPTION(0x0C00,	SystemCall)
-	NORMAL_EXCEPTION_PROLOG
+	EXCEPTION_PROLOG
 	EXC_XFER_EE_LITE(0xc00, DoSyscall)
 
 	EXCEPTION(0x0D00, Trap_0D, unknown_exception, EXC_XFER_EE)
@@ -733,7 +739,7 @@ label:
 
 	/* Programmable Interval Timer (PIT) Exception. (from 0x1000) */
 Decrementer:
-	NORMAL_EXCEPTION_PROLOG
+	EXCEPTION_PROLOG
 	lis	r0,TSR_PIS@h
 	mtspr	SPRN_TSR,r0		/* Clear the PIT exception */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -741,7 +747,7 @@ Decrementer:
 
 	/* Fixed Interval Timer (FIT) Exception. (from 0x1010) */
 FITException:
-	NORMAL_EXCEPTION_PROLOG
+	EXCEPTION_PROLOG
 	addi	r3,r1,STACK_FRAME_OVERHEAD;
 	EXC_XFER_EE(0x1010, unknown_exception)
 
@@ -759,7 +765,7 @@ WDTException:
  * if they can't resolve the lightweight TLB fault.
  */
 DataAccess:
-	NORMAL_EXCEPTION_PROLOG
+	EXCEPTION_PROLOG
 	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
 	stw	r5,_ESR(r11)
 	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
-- 
2.13.3

