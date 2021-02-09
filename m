Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C53C314D40
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:42:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZfc00crbzDrYy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:42:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdb64ljkzDqlr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdb2201Lz9txgP;
 Tue,  9 Feb 2021 10:56:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id P6rmlajZvxSw; Tue,  9 Feb 2021 10:56:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdb218KWz9txg8;
 Tue,  9 Feb 2021 10:56:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 21E148B7D7;
 Tue,  9 Feb 2021 10:56:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gGELpSpNWLiT; Tue,  9 Feb 2021 10:56:47 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D2D428B7D4;
 Tue,  9 Feb 2021 10:56:46 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A922667342; Tue,  9 Feb 2021 09:56:46 +0000 (UTC)
Message-Id: <ff30688ace612ae815f8def3b1db7cdce2f269ec.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 22/41] powerpc/32: Perform normal function call in
 exception entry
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:46 +0000 (UTC)
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

Now that the MMU is re-enabled before calling the transfer function,
we don't need anymore that hack with the address of the handler and
the return function sitting just after the 'bl' to the transfer
fonction, that that function is retrieving via a read
relative to 'lr'.

Do a regular call to the transfer function, then to the handler,
then branch to the return function.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S   | 14 ++++----------
 arch/powerpc/kernel/head_32.h    |  4 ++--
 arch/powerpc/kernel/head_booke.h |  6 +++---
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index dce0f03a0e88..e448ee3f5f15 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -104,7 +104,7 @@ transfer_to_handler:
 #ifdef CONFIG_PPC_BOOK3S_32
 	kuep_lock r11, r12
 #endif
-	b	3f
+	blr
 
 2:	/* if from kernel, check interrupted DOZE/NAP mode and
          * check for stack overflow
@@ -119,13 +119,7 @@ transfer_to_handler:
 #endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_E500 */
 	.globl transfer_to_handler_cont
 transfer_to_handler_cont:
-3:
-	mflr	r9
-	lwz	r11,0(r9)		/* virtual address of handler */
-	lwz	r9,4(r9)		/* where to go when done */
-	mtctr	r11
-	mtlr	r9
-	bctr				/* jump to handler */
+	blr
 
 #if defined (CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 4:	rlwinm	r12,r12,0,~_TLF_NAPPING
@@ -404,8 +398,8 @@ fee_restarts:
 	stw	r10,_TRAP(r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	transfer_to_handler_full
-	.long	unrecoverable_exception
-	.long	ret_from_except
+	bl	unrecoverable_exception
+	b	ret_from_except
 #endif
 
 	.globl	ret_from_except_full
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 160ebd573c37..e09585b88ba7 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -190,8 +190,8 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	li	r10,trap;					\
 	stw	r10,_TRAP(r11);					\
 	bl	tfer;						\
-	.long	hdlr;						\
-	.long	ret
+	bl	hdlr;						\
+	b	ret
 
 #define EXC_XFER_STD(n, hdlr)		\
 	EXC_XFER_TEMPLATE(hdlr, n, MSR_KERNEL, transfer_to_handler_full,	\
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index a57a312c7f86..4286f04648f8 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -322,9 +322,9 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 #define EXC_XFER_TEMPLATE(hdlr, trap, msr, tfer, ret)	\
 	li	r10,trap;					\
 	stw	r10,_TRAP(r11);					\
-	bl	tfer;		 				\
-	.long	hdlr;						\
-	.long	ret
+	bl	tfer;						\
+	bl	hdlr;						\
+	b	ret;						\
 
 #define EXC_XFER_STD(n, hdlr)		\
 	EXC_XFER_TEMPLATE(hdlr, n, MSR_KERNEL, transfer_to_handler_full, \
-- 
2.25.0

