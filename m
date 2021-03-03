Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A78D232B883
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 15:10:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrG995BWFz3d2n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 01:10:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrG8p17qnz3cJ0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 01:09:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DrG8f5Lgjz9txvS;
 Wed,  3 Mar 2021 15:09:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BmtD3ZeiCm8X; Wed,  3 Mar 2021 15:09:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DrG8d71gjz9txvR;
 Wed,  3 Mar 2021 15:09:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E17E78B7DC;
 Wed,  3 Mar 2021 15:09:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MMqpxlpSce9Q; Wed,  3 Mar 2021 15:09:37 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 792218B7DB;
 Wed,  3 Mar 2021 15:09:37 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3B0D5674B6; Wed,  3 Mar 2021 14:09:37 +0000 (UTC)
Message-Id: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 elver@google.com
Date: Wed,  3 Mar 2021 14:09:37 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It seems like all other sane architectures, namely x86 and arm64
at least, include the running function as top entry when saving
stack trace.

Functionnalities like KFENCE expect it.

Do the same on powerpc, it allows KFENCE to properly identify the faulting
function as depicted below. Before the patch KFENCE was identifying
finish_task_switch.isra as the faulting function.

[   14.937370] ==================================================================
[   14.948692] BUG: KFENCE: invalid read in test_invalid_access+0x54/0x108
[   14.948692]
[   14.956814] Invalid read at 0xdf98800a:
[   14.960664]  test_invalid_access+0x54/0x108
[   14.964876]  finish_task_switch.isra.0+0x54/0x23c
[   14.969606]  kunit_try_run_case+0x5c/0xd0
[   14.973658]  kunit_generic_run_threadfn_adapter+0x24/0x30
[   14.979079]  kthread+0x15c/0x174
[   14.982342]  ret_from_kernel_thread+0x14/0x1c
[   14.986731]
[   14.988236] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B             5.12.0-rc1-01537-g95f6e2088d7e-dirty #4682
[   14.999795] NIP:  c016ec2c LR: c02f517c CTR: c016ebd8
[   15.004851] REGS: e2449d90 TRAP: 0301   Tainted: G    B              (5.12.0-rc1-01537-g95f6e2088d7e-dirty)
[   15.015274] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22000004  XER: 00000000
[   15.022043] DAR: df98800a DSISR: 20000000
[   15.022043] GPR00: c02f517c e2449e50 c1142080 e100dd24 c084b13c 00000008 c084b32b c016ebd8
[   15.022043] GPR08: c0850000 df988000 c0d10000 e2449eb0 22000288
[   15.040581] NIP [c016ec2c] test_invalid_access+0x54/0x108
[   15.046010] LR [c02f517c] kunit_try_run_case+0x5c/0xd0
[   15.051181] Call Trace:
[   15.053637] [e2449e50] [c005a68c] finish_task_switch.isra.0+0x54/0x23c (unreliable)
[   15.061338] [e2449eb0] [c02f517c] kunit_try_run_case+0x5c/0xd0
[   15.067215] [e2449ed0] [c02f648c] kunit_generic_run_threadfn_adapter+0x24/0x30
[   15.074472] [e2449ef0] [c004e7b0] kthread+0x15c/0x174
[   15.079571] [e2449f30] [c001317c] ret_from_kernel_thread+0x14/0x1c
[   15.085798] Instruction dump:
[   15.088784] 8129d608 38e7ebd8 81020280 911f004c 39000000 995f0024 907f0028 90ff001c
[   15.096613] 3949000a 915f0020 3d40c0d1 3d00c085 <8929000a> 3908adb0 812a4b98 3d40c02f
[   15.104612] ==================================================================

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/stacktrace.c | 42 +++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index b6440657ef92..67c2b8488035 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -22,16 +22,32 @@
 #include <asm/kprobes.h>
 
 #include <asm/paca.h>
+#include <asm/switch_to.h>
 
 /*
  * Save stack-backtrace addresses into a stack_trace buffer.
  */
+static void save_entry(struct stack_trace *trace, unsigned long ip, int savesched)
+{
+	if (savesched || !in_sched_functions(ip)) {
+		if (!trace->skip)
+			trace->entries[trace->nr_entries++] = ip;
+		else
+			trace->skip--;
+	}
+}
+
 static void save_context_stack(struct stack_trace *trace, unsigned long sp,
-			struct task_struct *tsk, int savesched)
+			       unsigned long ip, struct task_struct *tsk, int savesched)
 {
+	save_entry(trace, ip, savesched);
+
+	if (trace->nr_entries >= trace->max_entries)
+		return;
+
 	for (;;) {
 		unsigned long *stack = (unsigned long *) sp;
-		unsigned long newsp, ip;
+		unsigned long newsp;
 
 		if (!validate_sp(sp, tsk, STACK_FRAME_OVERHEAD))
 			return;
@@ -39,12 +55,7 @@ static void save_context_stack(struct stack_trace *trace, unsigned long sp,
 		newsp = stack[0];
 		ip = stack[STACK_FRAME_LR_SAVE];
 
-		if (savesched || !in_sched_functions(ip)) {
-			if (!trace->skip)
-				trace->entries[trace->nr_entries++] = ip;
-			else
-				trace->skip--;
-		}
+		save_entry(trace, ip, savesched);
 
 		if (trace->nr_entries >= trace->max_entries)
 			return;
@@ -59,23 +70,26 @@ void save_stack_trace(struct stack_trace *trace)
 
 	sp = current_stack_frame();
 
-	save_context_stack(trace, sp, current, 1);
+	save_context_stack(trace, sp, (unsigned long)save_stack_trace, current, 1);
 }
 EXPORT_SYMBOL_GPL(save_stack_trace);
 
 void save_stack_trace_tsk(struct task_struct *tsk, struct stack_trace *trace)
 {
-	unsigned long sp;
+	unsigned long sp, ip;
 
 	if (!try_get_task_stack(tsk))
 		return;
 
-	if (tsk == current)
+	if (tsk == current) {
+		ip = (unsigned long)save_stack_trace_tsk;
 		sp = current_stack_frame();
-	else
+	} else {
+		ip = (unsigned long)_switch;
 		sp = tsk->thread.ksp;
+	}
 
-	save_context_stack(trace, sp, tsk, 0);
+	save_context_stack(trace, sp, ip, tsk, 0);
 
 	put_task_stack(tsk);
 }
@@ -84,7 +98,7 @@ EXPORT_SYMBOL_GPL(save_stack_trace_tsk);
 void
 save_stack_trace_regs(struct pt_regs *regs, struct stack_trace *trace)
 {
-	save_context_stack(trace, regs->gpr[1], current, 0);
+	save_context_stack(trace, regs->gpr[1], regs->nip, current, 0);
 }
 EXPORT_SYMBOL_GPL(save_stack_trace_regs);
 
-- 
2.25.0

