Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 095AF12985C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 16:42:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hNrx29pGzDqGn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 02:42:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="TpqudzOM"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hNVP2RZnzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:26:21 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hNVF12djz9vJyy;
 Mon, 23 Dec 2019 16:26:13 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TpqudzOM; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zIN-liUu8jfd; Mon, 23 Dec 2019 16:26:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hNVD6zPtz9vJyw;
 Mon, 23 Dec 2019 16:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577114773; bh=CGg5lFjG79+f3AndFF6HVcEwxv4O9U6o4GFVGWYCcUM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=TpqudzOMTrzBq6NdKEoT6ie4xE8cDofbv/TXPN8mm3jpmcvS9HGZ9rmIJDf8H2qn4
 AlcfawkPHFYVGYFzJ0lHOyy94MW4kWjGWoHlrl2TsuNML9KyNvCGtrA0bg+DrYFqkE
 reBWPEeuMk/xDhJf2lp/RErt9oRP4/+nb9DD/jzE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2120E8B7D1;
 Mon, 23 Dec 2019 16:26:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vWNFPbebVhiN; Mon, 23 Dec 2019 16:26:18 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EFBDF8B7A1;
 Mon, 23 Dec 2019 16:26:17 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 05519637D8; Mon, 23 Dec 2019 15:26:17 +0000 (UTC)
Message-Id: <af0bff368b4f65b5c96695385b9f4c0dd162ea7a.1577114567.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577114567.git.christophe.leroy@c-s.fr>
References: <cover.1577114567.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH 7/8] powerpc/32: use IRQ stack immediately on IRQ exception
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Dec 2019 15:26:17 +0000 (UTC)
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

Exception entries run of kernel thread stack, then do_IRQ()
switches to the IRQ stack.

Instead of doing a first step of the thread stack, increasing the
risk of stack overflow and spending time switch stacks two times when
coming from userspace, set the stack to IRQ stack immediately in the
EXCEPTION entry.

In the same way as ARM64, consider that when the stack pointer is not
within the kernel thread stack, it means it is already on IRQ stack.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_32.S  |  2 +-
 arch/powerpc/kernel/head_32.h  | 32 +++++++++++++++++++++++++++++---
 arch/powerpc/kernel/head_40x.S |  2 +-
 arch/powerpc/kernel/head_8xx.S |  2 +-
 4 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 4a24f8f026c7..0c36fba5b861 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -332,7 +332,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	EXC_XFER_LITE(0x400, handle_page_fault)
 
 /* External interrupt */
-	EXCEPTION(0x500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
+	EXCEPTION_IRQ(0x500, HardwareInterrupt, __do_irq, EXC_XFER_LITE)
 
 /* Alignment exception */
 	. = 0x600
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 8abc7783dbe5..f9e77e51723e 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -11,21 +11,41 @@
  * task's thread_struct.
  */
 
-.macro EXCEPTION_PROLOG
+.macro EXCEPTION_PROLOG is_irq=0
 	mtspr	SPRN_SPRG_SCRATCH0,r10
 	mtspr	SPRN_SPRG_SCRATCH1,r11
 	mfcr	r10
-	EXCEPTION_PROLOG_1
+	EXCEPTION_PROLOG_1 is_irq=\is_irq
 	EXCEPTION_PROLOG_2
 .endm
 
-.macro EXCEPTION_PROLOG_1
+.macro EXCEPTION_PROLOG_1 is_irq=0
 	mfspr	r11,SPRN_SRR1		/* check whether user or kernel */
 	andi.	r11,r11,MSR_PR
+	.if \is_irq
+	bne	2f
+	mfspr	r11, SPRN_SPRG_THREAD
+	lwz	r11, TASK_STACK - THREAD(r11)
+	xor	r11, r11, r1
+	cmplwi	cr7, r11, THREAD_SIZE - 1
+	tophys(r11, r1)			/* use tophys(r1) if not thread stack */
+	bgt	cr7, 1f
+2:
+#ifdef CONFIG_SMP
+	mfspr	r11, SPRN_SPRG_THREAD
+	lwz	r11, TASK_CPU - THREAD(r11)
+	slwi	r11, r11, 3
+	addis	r11, r11, (hardirq_ctx - PAGE_OFFSET)@ha
+#else
+	lis	r11, (hardirq_ctx - PAGE_OFFSET)@ha
+#endif
+	lwz	r11, (hardirq_ctx - PAGE_OFFSET)@l(r11)
+	.else
 	tophys(r11,r1)			/* use tophys(r1) if kernel */
 	beq	1f
 	mfspr	r11,SPRN_SPRG_THREAD
 	lwz	r11,TASK_STACK-THREAD(r11)
+	.endif
 	addi	r11,r11,THREAD_SIZE
 	tophys(r11,r11)
 1:	subi	r11,r11,INT_FRAME_SIZE	/* alloc exc. frame */
@@ -171,6 +191,12 @@
 	addi	r3,r1,STACK_FRAME_OVERHEAD;	\
 	xfer(n, hdlr)
 
+#define EXCEPTION_IRQ(n, label, hdlr, xfer)	\
+	START_EXCEPTION(n, label)		\
+	EXCEPTION_PROLOG is_irq=1;		\
+	addi	r3,r1,STACK_FRAME_OVERHEAD;	\
+	xfer(n, hdlr)
+
 #define EXC_XFER_TEMPLATE(hdlr, trap, msr, tfer, ret)		\
 	li	r10,trap;					\
 	stw	r10,_TRAP(r11);					\
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 4511fc1549f7..dd236f596c0b 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -315,7 +315,7 @@ _ENTRY(crit_srr1)
 	EXC_XFER_LITE(0x400, handle_page_fault)
 
 /* 0x0500 - External Interrupt Exception */
-	EXCEPTION(0x0500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
+	EXCEPTION_IRQ(0x0500, HardwareInterrupt, __do_irq, EXC_XFER_LITE)
 
 /* 0x0600 - Alignment Exception */
 	START_EXCEPTION(0x0600, Alignment)
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 19f583e18402..5a6cdbc89e26 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -150,7 +150,7 @@ DataAccess:
 InstructionAccess:
 
 /* External interrupt */
-	EXCEPTION(0x500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
+	EXCEPTION_IRQ(0x500, HardwareInterrupt, __do_irq, EXC_XFER_LITE)
 
 /* Alignment exception */
 	. = 0x600
-- 
2.13.3

