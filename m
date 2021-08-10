Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2713E7D3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 18:13:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkdL56cZkz3cHh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 02:13:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkdKc39r6z308Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 02:13:21 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GkdKV0Mccz9sVp;
 Tue, 10 Aug 2021 18:13:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3Ry5FICJkrA; Tue, 10 Aug 2021 18:13:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GkdKT5Gjjz9sVm;
 Tue, 10 Aug 2021 18:13:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 693F48B7B9;
 Tue, 10 Aug 2021 18:13:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Flhc86IN3rmi; Tue, 10 Aug 2021 18:13:17 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 231028B7C1;
 Tue, 10 Aug 2021 18:13:17 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CD49166271; Tue, 10 Aug 2021 16:13:16 +0000 (UTC)
Message-Id: <c17d234f4927d39a1d7100864a8e1145323d33a0.1628611927.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/interrupt: Fix OOPS by not calling do_IRQ() from
 timer_interrupt()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, userm57@yahoo.com, fthain@linux-m68k.org
Date: Tue, 10 Aug 2021 16:13:16 +0000 (UTC)
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

An interrupt handler shall not be called from another interrupt
handler otherwise this leads to problems like the following:

	Kernel attempted to write user page (afd4fa84) - exploit attempt? (uid: 1000)
	------------[ cut here ]------------
	Bug: Write fault blocked by KUAP!
	WARNING: CPU: 0 PID: 1617 at arch/powerpc/mm/fault.c:230 do_page_fault+0x484/0x720
	Modules linked in:
	CPU: 0 PID: 1617 Comm: sshd Tainted: G        W         5.13.0-pmac-00010-g8393422eb77 #7
	NIP:  c001b77c LR: c001b77c CTR: 00000000
	REGS: cb9e5bc0 TRAP: 0700   Tainted: G        W          (5.13.0-pmac-00010-g8393422eb77)
	MSR:  00021032 <ME,IR,DR,RI>  CR: 24942424  XER: 00000000

	GPR00: c001b77c cb9e5c80 c1582c00 00000021 3ffffbff 085b0000 00000027 c8eb644c
	GPR08: 00000023 00000000 00000000 00000000 24942424 0063f8c8 00000000 000186a0
	GPR16: afd52dd4 afd52dd0 afd52dcc afd52dc8 0065a990 c07640c4 cb9e5e98 cb9e5e90
	GPR24: 00000040 afd4fa96 00000040 02000000 c1fda6c0 afd4fa84 00000300 cb9e5cc0
	NIP [c001b77c] do_page_fault+0x484/0x720
	LR [c001b77c] do_page_fault+0x484/0x720
	Call Trace:
	[cb9e5c80] [c001b77c] do_page_fault+0x484/0x720 (unreliable)
	[cb9e5cb0] [c000424c] DataAccess_virt+0xd4/0xe4
	--- interrupt: 300 at __copy_tofrom_user+0x110/0x20c
	NIP:  c001f9b4 LR: c03250a0 CTR: 00000004
	REGS: cb9e5cc0 TRAP: 0300   Tainted: G        W          (5.13.0-pmac-00010-g8393422eb77)
	MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 48028468  XER: 20000000
	DAR: afd4fa84 DSISR: 0a000000
	GPR00: 20726f6f cb9e5d80 c1582c00 00000004 cb9e5e3a 00000016 afd4fa80 00000000
	GPR08: 3835202d 72777872 2d78722d 00000004 28028464 0063f8c8 00000000 000186a0
	GPR16: afd52dd4 afd52dd0 afd52dcc afd52dc8 0065a990 c07640c4 cb9e5e98 cb9e5e90
	GPR24: 00000040 afd4fa96 00000040 cb9e5e0c 00000daa a0000000 cb9e5e98 afd4fa56
	NIP [c001f9b4] __copy_tofrom_user+0x110/0x20c
	LR [c03250a0] _copy_to_iter+0x144/0x990
	--- interrupt: 300
	[cb9e5d80] [c03e89c0] n_tty_read+0xa4/0x598 (unreliable)
	[cb9e5df0] [c03e2a0c] tty_read+0xdc/0x2b4
	[cb9e5e80] [c0156bf8] vfs_read+0x274/0x340
	[cb9e5f00] [c01571ac] ksys_read+0x70/0x118
	[cb9e5f30] [c0016048] ret_from_syscall+0x0/0x28
	--- interrupt: c00 at 0xa7855c88
	NIP:  a7855c88 LR: a7855c5c CTR: 00000000
	REGS: cb9e5f40 TRAP: 0c00   Tainted: G        W          (5.13.0-pmac-00010-g8393422eb77)
	MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 2402446c  XER: 00000000

	GPR00: 00000003 afd4ec70 a72137d0 0000000b afd4ecac 00004000 0065a990 00000800
	GPR08: 00000000 a7947930 00000000 00000004 c15831b0 0063f8c8 00000000 000186a0
	GPR16: afd52dd4 afd52dd0 afd52dcc afd52dc8 0065a990 0065a9e0 00000001 0065fac0
	GPR24: 00000000 00000089 00664050 00000000 00668e30 a720c8dc a7943ff4 0065f9b0
	NIP [a7855c88] 0xa7855c88
	LR [a7855c5c] 0xa7855c5c
	--- interrupt: c00
	Instruction dump:
	3884aa88 38630178 48076861 807f0080 48042e45 2f830000 419e0148 3c80c079
	3c60c076 38841be4 386301c0 4801f705 <0fe00000> 3860000b 4bfffe30 3c80c06b
	---[ end trace fd69b91a8046c2e5 ]---

Here the problem is that by re-enterring an exception handler,
kuap_save_and_lock() is called a second time with this time KUAP
access locked, leading to regs->kuap being overwritten hence
KUAP not being unlocked at exception exit as expected.

Do not call do_IRQ() from timer_interrupt() directly. Instead,
redefine do_IRQ() as a standard function named __do_IRQ(), and
call it from both do_IRQ() and time_interrupt() handlers.

Reported-by: Stan Johnson <userm57@yahoo.com>
Fixes: 3a96570ffceb ("powerpc: convert interrupt handlers to use wrappers")
Cc: stable@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Finn Thain <fthain@linux-m68k.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/interrupt.h | 3 +++
 arch/powerpc/include/asm/irq.h       | 2 +-
 arch/powerpc/kernel/irq.c            | 7 ++++++-
 arch/powerpc/kernel/time.c           | 2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index fc4702bdd119..1e984a35a39f 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -590,6 +590,9 @@ DECLARE_INTERRUPT_HANDLER_NMI(hmi_exception_realmode);
 
 DECLARE_INTERRUPT_HANDLER_ASYNC(TAUException);
 
+/* irq.c */
+DECLARE_INTERRUPT_HANDLER_ASYNC(do_IRQ);
+
 void __noreturn unrecoverable_exception(struct pt_regs *regs);
 
 void replay_system_reset(void);
diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 4982f3711fc3..2b3278534bc1 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -52,7 +52,7 @@ extern void *mcheckirq_ctx[NR_CPUS];
 extern void *hardirq_ctx[NR_CPUS];
 extern void *softirq_ctx[NR_CPUS];
 
-extern void do_IRQ(struct pt_regs *regs);
+void __do_IRQ(struct pt_regs *regs);
 extern void __init init_IRQ(void);
 extern void __do_irq(struct pt_regs *regs);
 
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 91e63eac4e8f..551b653228c4 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -750,7 +750,7 @@ void __do_irq(struct pt_regs *regs)
 	trace_irq_exit(regs);
 }
 
-DEFINE_INTERRUPT_HANDLER_ASYNC(do_IRQ)
+void __do_IRQ(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
 	void *cursp, *irqsp, *sirqsp;
@@ -774,6 +774,11 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(do_IRQ)
 	set_irq_regs(old_regs);
 }
 
+DEFINE_INTERRUPT_HANDLER_ASYNC(do_IRQ)
+{
+	__do_IRQ(regs);
+}
+
 static void *__init alloc_vm_stack(void)
 {
 	return __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, THREADINFO_GFP,
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index e45ce427bffb..c487ba5a6e11 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -586,7 +586,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 
 #if defined(CONFIG_PPC32) && defined(CONFIG_PPC_PMAC)
 	if (atomic_read(&ppc_n_lost_interrupts) != 0)
-		do_IRQ(regs);
+		__do_IRQ(regs);
 #endif
 
 	old_regs = set_irq_regs(regs);
-- 
2.25.0

