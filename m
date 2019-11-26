Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 779DC109E79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 14:05:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Mkf43k4rzDqRB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 00:05:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="JbPcOabM"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mk0b4HtczDqBt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 23:36:15 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Mk0W0XSgz9v0G4;
 Tue, 26 Nov 2019 13:36:11 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=JbPcOabM; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id btX6GVqbcvDE; Tue, 26 Nov 2019 13:36:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Mk0V6Rqpz9v0G3;
 Tue, 26 Nov 2019 13:36:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574771770; bh=oVOYrjzNc7gpj0jHMDQl4bbKo9wjPs2rl2pHJ1hlGtk=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=JbPcOabMWMu7cIm3fUs3cWbbGdELcTmssx/2oYlUSQCud2gtKsQd6utzzjSULdlAq
 WGt91Jbg4ZgYYF7RdeDZHMDv6/y817x3gTPVkFgdPgMrEkOA8LYPavp2Z4vPngyOLl
 tU2qfVninuo+/oRbfhg9kkkJqQQHs4hpHLJELxSA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 351C18B771;
 Tue, 26 Nov 2019 13:36:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id miazjcbvj0e8; Tue, 26 Nov 2019 13:36:12 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD2118B7FC;
 Tue, 26 Nov 2019 13:36:11 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9E0026B76A; Tue, 26 Nov 2019 12:36:11 +0000 (UTC)
Message-Id: <18c3b9586bba1e0690f19ed91405d7e9c79c77b2.1574771540.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1574771539.git.christophe.leroy@c-s.fr>
References: <cover.1574771539.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 08/16] powerpc/32: Add early stack overflow detection with
 VMAP stack.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 26 Nov 2019 12:36:11 +0000 (UTC)
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

To avoid recursive faults, stack overflow detection has to be
performed before writing in the stack in exception prologs.

Do it by checking the alignment. If the stack pointer alignment is
wrong, it means it is pointing to the following or preceding page.

Without VMAP stack, a stack overflow is catastrophic. With VMAP
stack, a stack overflow isn't destructive, so don't panic. Kill
the task with SIGSEGV instead.

A dedicated overflow stack is set up for each CPU.

lkdtm: Performing direct entry EXHAUST_STACK
lkdtm: Calling function with 512 frame size to depth 32 ...
lkdtm: loop 32/32 ...
lkdtm: loop 31/32 ...
lkdtm: loop 30/32 ...
lkdtm: loop 29/32 ...
lkdtm: loop 28/32 ...
lkdtm: loop 27/32 ...
lkdtm: loop 26/32 ...
lkdtm: loop 25/32 ...
lkdtm: loop 24/32 ...
lkdtm: loop 23/32 ...
lkdtm: loop 22/32 ...
lkdtm: loop 21/32 ...
lkdtm: loop 20/32 ...
Kernel stack overflow in process test[359], r1=c900c008
Oops: Kernel stack overflow, sig: 6 [#1]
BE PAGE_SIZE=4K MMU=Hash PowerMac
Modules linked in:
CPU: 0 PID: 359 Comm: test Not tainted 5.3.0-rc7+ #2225
NIP:  c0622060 LR: c0626710 CTR: 00000000
REGS: c0895f48 TRAP: 0000   Not tainted  (5.3.0-rc7+)
MSR:  00001032 <ME,IR,DR,RI>  CR: 28004224  XER: 00000000
GPR00: c0626ca4 c900c008 c783c000 c07335cc c900c010 c07335cc c900c0f0 c07335cc
GPR08: c900c0f0 00000001 00000000 00000000 28008222 00000000 00000000 00000000
GPR16: 00000000 00000000 10010128 10010000 b799c245 10010158 c07335cc 00000025
GPR24: c0690000 c08b91d4 c068f688 00000020 c900c0f0 c068f668 c08b95b4 c08b91d4
NIP [c0622060] format_decode+0x0/0x4d4
LR [c0626710] vsnprintf+0x80/0x5fc
Call Trace:
[c900c068] [c0626ca4] vscnprintf+0x18/0x48
[c900c078] [c007b944] vprintk_store+0x40/0x214
[c900c0b8] [c007bf50] vprintk_emit+0x90/0x1dc
[c900c0e8] [c007c5cc] printk+0x50/0x60
[c900c128] [c03da5b0] recursive_loop+0x44/0x6c
[c900c338] [c03da5c4] recursive_loop+0x58/0x6c
[c900c548] [c03da5c4] recursive_loop+0x58/0x6c
[c900c758] [c03da5c4] recursive_loop+0x58/0x6c
[c900c968] [c03da5c4] recursive_loop+0x58/0x6c
[c900cb78] [c03da5c4] recursive_loop+0x58/0x6c
[c900cd88] [c03da5c4] recursive_loop+0x58/0x6c
[c900cf98] [c03da5c4] recursive_loop+0x58/0x6c
[c900d1a8] [c03da5c4] recursive_loop+0x58/0x6c
[c900d3b8] [c03da5c4] recursive_loop+0x58/0x6c
[c900d5c8] [c03da5c4] recursive_loop+0x58/0x6c
[c900d7d8] [c03da5c4] recursive_loop+0x58/0x6c
[c900d9e8] [c03da5c4] recursive_loop+0x58/0x6c
[c900dbf8] [c03da5c4] recursive_loop+0x58/0x6c
[c900de08] [c03da67c] lkdtm_EXHAUST_STACK+0x30/0x4c
[c900de18] [c03da3e8] direct_entry+0xc8/0x140
[c900de48] [c029fb40] full_proxy_write+0x64/0xcc
[c900de68] [c01500f8] __vfs_write+0x30/0x1d0
[c900dee8] [c0152cb8] vfs_write+0xb8/0x1d4
[c900df08] [c0152f7c] ksys_write+0x58/0xe8
[c900df38] [c0014208] ret_from_syscall+0x0/0x34
--- interrupt: c01 at 0xf806664
    LR = 0x1000c868
Instruction dump:
4bffff91 80010014 7c832378 7c0803a6 38210010 4e800020 3d20c08a 3ca0c089
8089a0cc 38a58f0c 38600001 4ba2d494 <9421ffe0> 7c0802a6 bfc10018 7c9f2378

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/irq.h |  1 +
 arch/powerpc/kernel/entry_32.S | 25 +++++++++++++++++++++++++
 arch/powerpc/kernel/head_32.h  |  4 ++++
 arch/powerpc/kernel/irq.c      |  1 +
 arch/powerpc/kernel/setup_32.c |  1 +
 arch/powerpc/kernel/traps.c    | 15 ++++++++++++---
 6 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 814dfab7e392..ec74ced2437d 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -55,6 +55,7 @@ extern void *mcheckirq_ctx[NR_CPUS];
  */
 extern void *hardirq_ctx[NR_CPUS];
 extern void *softirq_ctx[NR_CPUS];
+extern void *stackovf_ctx[NR_CPUS];
 
 void call_do_softirq(void *sp);
 void call_do_irq(struct pt_regs *regs, void *sp);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 2a26fe19f0b1..00fcf954e742 100644
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
@@ -298,6 +300,28 @@ reenable_mmu:
  * On kernel stack overflow, load up an initial stack pointer
  * and call StackOverflow(regs), which should not return.
  */
+#ifdef CONFIG_VMAP_STACK
+_GLOBAL(stack_ovf)
+	li	r11, 0
+#ifdef CONFIG_SMP
+	mfspr	r11, SPRN_SPRG_THREAD
+	tovirt(r11, r11)
+	lwz	r11, TASK_CPU - THREAD(r11)
+	slwi	r11, r11, 3
+#endif
+	addis	r11, r11, stackovf_ctx@ha
+	addi	r11, r11, stackovf_ctx@l
+	lwz	r11, 0(r11)
+	cmpwi	cr1, r11, 0
+	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
+	bne	cr1, 1f
+	lis	r11, init_thread_union + THREAD_SIZE - INT_FRAME_SIZE@ha
+	addi	r11, r11, init_thread_union + THREAD_SIZE - INT_FRAME_SIZE@l
+1:	EXCEPTION_PROLOG_2
+	SAVE_NVGPRS(r11)
+	addi	r3, r1, STACK_FRAME_OVERHEAD
+	EXC_XFER_STD(0, StackOverflow)
+#else
 stack_ovf:
 	/* sometimes we use a statically-allocated stack, which is OK. */
 	lis	r12,_end@h
@@ -319,6 +343,7 @@ stack_ovf:
 	mtspr	SPRN_SRR1,r10
 	SYNC
 	RFI
+#endif
 
 #ifdef CONFIG_TRACE_IRQFLAGS
 trace_syscall_entry_irq_off:
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 59e775930be8..283d4298d555 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -58,6 +58,10 @@
 	tophys(r11,r11)
 #endif
 1:
+#ifdef CONFIG_VMAP_STACK
+	mtcrf	0x7f, r11
+	bt	32 - THREAD_ALIGN_SHIFT, stack_ovf_trampoline
+#endif
 .endm
 
 .macro EXCEPTION_PROLOG_2 ext
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 5645bc9cbc09..48aadc033e4a 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -678,6 +678,7 @@ void *mcheckirq_ctx[NR_CPUS] __read_mostly;
 
 void *softirq_ctx[NR_CPUS] __read_mostly;
 void *hardirq_ctx[NR_CPUS] __read_mostly;
+void *stackovf_ctx[NR_CPUS] __read_mostly;
 
 void do_softirq_own_stack(void)
 {
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index f014c4f7a337..43e3643a35f5 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -158,6 +158,7 @@ void __init irqstack_early_init(void)
 	for_each_possible_cpu(i) {
 		softirq_ctx[i] = alloc_stack();
 		hardirq_ctx[i] = alloc_stack();
+		stackovf_ctx[i] = alloc_stack();
 	}
 }
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 014ff0701f24..7da41609eed8 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1630,11 +1630,20 @@ void alignment_exception(struct pt_regs *regs)
 
 void StackOverflow(struct pt_regs *regs)
 {
+	enum ctx_state prev_state = exception_enter();
+
 	pr_crit("Kernel stack overflow in process %s[%d], r1=%lx\n",
 		current->comm, task_pid_nr(current), regs->gpr[1]);
-	debugger(regs);
-	show_regs(regs);
-	panic("kernel stack overflow");
+
+	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
+		die("Kernel stack overflow", regs, SIGSEGV);
+	} else {
+		debugger(regs);
+		show_regs(regs);
+		panic("kernel stack overflow");
+	}
+
+	exception_exit(prev_state);
 }
 
 void kernel_fp_unavailable_exception(struct pt_regs *regs)
-- 
2.13.3

