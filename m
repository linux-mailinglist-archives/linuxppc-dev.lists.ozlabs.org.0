Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B1A4419
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 12:41:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LCZR24JLzDqvr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 20:41:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Jula1pVi"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LC3y6wvczDrBd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 20:18:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46LC3t3VFTz9v4gN;
 Sat, 31 Aug 2019 12:18:34 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Jula1pVi; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XYqfEdVKSBFi; Sat, 31 Aug 2019 12:18:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46LC3t268mz9v4gL;
 Sat, 31 Aug 2019 12:18:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567246714; bh=fAcIsZ49K0CCNcjqO38ykHxXhQftTj5Wfx65MxzBAvM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Jula1pViXhQJ/U5C2PDGCxv18AJ5kzqkN8O+sm38RCgH4W4n9zE5wCyLnYEcwVrEf
 a+IIGvmUmORnCkXKzVWFscwqGmm0xgZxCW3Acu4eO9v/uJwx66rJElFfhfV0M3ayBn
 d4/REPfXP6TBy9xQh14WngFeXPbEZg9DapMeBQVo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9BDE08B789;
 Sat, 31 Aug 2019 12:18:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id C3-vzpYJ2iDe; Sat, 31 Aug 2019 12:18:35 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D3568B7B9;
 Sat, 31 Aug 2019 12:18:35 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 212826985C; Sat, 31 Aug 2019 10:18:35 +0000 (UTC)
Message-Id: <1ca103e45c4ea60b1c69489f82eead10d56ccc24.1567245405.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1567245404.git.christophe.leroy@c-s.fr>
References: <cover.1567245404.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 10/10] powerpc/32: Add stack overflow detection with
 VMAP stack.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, dja@axtens.net
Date: Sat, 31 Aug 2019 10:18:35 +0000 (UTC)
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

To avoid recursive faults, stack overflow detection has to be
performed before writing in the stack in exception prologs.

Do it by checking the alignment. If the stack pointer alignment is
wrong, it means it is pointing to the following or preceding page.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S | 12 ++++++++++++
 arch/powerpc/kernel/head_32.h  |  5 ++++-
 arch/powerpc/kernel/head_8xx.S |  3 +++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index ef296572a513..68e03feb4bd1 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -184,9 +184,11 @@ transfer_to_handler:
          */
 	kuap_save_and_lock r11, r12, r9, r2, r0
 	addi	r2, r12, -THREAD
+#ifndef CONFIG_VMAP_STACK
 	lwz	r9,KSP_LIMIT(r12)
 	cmplw	r1,r9			/* if r1 <= ksp_limit */
 	ble-	stack_ovf		/* then the kernel stack overflowed */
+#endif
 5:
 #if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 	lwz	r12,TI_LOCAL_FLAGS(r2)
@@ -298,6 +300,15 @@ reenable_mmu:
  * On kernel stack overflow, load up an initial stack pointer
  * and call StackOverflow(regs), which should not return.
  */
+#ifdef CONFIG_VMAP_STACK
+_GLOBAL(stack_ovf)
+	lis	r11, init_thread_union + THREAD_SIZE - INT_FRAME_SIZE@ha
+	addi	r11, r11, init_thread_union + THREAD_SIZE - INT_FRAME_SIZE@l
+	EXCEPTION_PROLOG_2
+	SAVE_NVGPRS(r11)
+	addi	r3, r1, STACK_FRAME_OVERHEAD
+	EXC_XFER_STD(0, StackOverflow)
+#else
 stack_ovf:
 	/* sometimes we use a statically-allocated stack, which is OK. */
 	lis	r12,_end@h
@@ -319,6 +330,7 @@ stack_ovf:
 	mtspr	SPRN_SRR1,r10
 	SYNC
 	RFI
+#endif
 
 #ifdef CONFIG_TRACE_IRQFLAGS
 trace_syscall_entry_irq_off:
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 4980babde59e..d442625d9649 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -51,7 +51,10 @@
 #endif
 	lwz	r11,TASK_STACK-THREAD(r11)
 	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
-#ifndef CONFIG_VMAP_STACK
+#ifdef CONFIG_VMAP_STACK
+	mtcrf	0xfe, r11
+	bt	32 - THREAD_ALIGN_SHIFT, stack_ovf_trampoline
+#else
 	tophys(r11,r11)
 #endif
 1:
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index dfd68b72688e..b9c9cfd72b19 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -572,6 +572,9 @@ InstructionBreakpoint:
 	EXCEPTION(0x1e00, Trap_1e, unknown_exception, EXC_XFER_STD)
 	EXCEPTION(0x1f00, Trap_1f, unknown_exception, EXC_XFER_STD)
 
+stack_ovf_trampoline:
+	b	stack_ovf
+
 	. = 0x2000
 
 /* This is the procedure to calculate the data EA for buggy dcbx,dcbi instructions
-- 
2.13.3

