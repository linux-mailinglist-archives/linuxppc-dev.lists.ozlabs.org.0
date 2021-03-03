Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8537932B972
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 18:28:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrLYm18VLz3cYZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 04:28:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrLYQ6BdCz30My
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 04:27:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DrLYC63phz9tygT;
 Wed,  3 Mar 2021 18:27:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hir2rm8ii5Yn; Wed,  3 Mar 2021 18:27:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DrLYC4z7Cz9tygS;
 Wed,  3 Mar 2021 18:27:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BCED8B7E8;
 Wed,  3 Mar 2021 18:27:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RsjDGPmwO4Gn; Wed,  3 Mar 2021 18:27:41 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9BFAA8B7DB;
 Wed,  3 Mar 2021 18:27:41 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 40E9C674B7; Wed,  3 Mar 2021 17:27:41 +0000 (UTC)
Message-Id: <20dad21f9446938697573e6642db583bdb874656.1614792440.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] powerpc: Fix save_stack_trace_regs() to have running
 function as first entry
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 elver@google.com, rostedt@goodmis.org
Date: Wed,  3 Mar 2021 17:27:41 +0000 (UTC)
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

It seems like other architectures, namely x86 and arm64
at least, include the running function as top entry when saving
stack trace with save_stack_trace_regs().

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
Fixes: 35de3b1aa168 ("powerpc: Implement save_stack_trace_regs() to enable kprobe stack tracing")
Cc: stable@vger.kernel.org
Acked-by: Marco Elver <elver@google.com>
---
 arch/powerpc/kernel/stacktrace.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index b6440657ef92..a99bd3697286 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -23,6 +23,18 @@
 
 #include <asm/paca.h>
 
+static bool save_entry(struct stack_trace *trace, unsigned long ip, int savesched)
+{
+	if (savesched || !in_sched_functions(ip)) {
+		if (!trace->skip)
+			trace->entries[trace->nr_entries++] = ip;
+		else
+			trace->skip--;
+	}
+	/* Returns true when the trace is full */
+	return trace->nr_entries >= trace->max_entries;
+}
+
 /*
  * Save stack-backtrace addresses into a stack_trace buffer.
  */
@@ -39,14 +51,7 @@ static void save_context_stack(struct stack_trace *trace, unsigned long sp,
 		newsp = stack[0];
 		ip = stack[STACK_FRAME_LR_SAVE];
 
-		if (savesched || !in_sched_functions(ip)) {
-			if (!trace->skip)
-				trace->entries[trace->nr_entries++] = ip;
-			else
-				trace->skip--;
-		}
-
-		if (trace->nr_entries >= trace->max_entries)
+		if (save_entry(trace, ip, savesched))
 			return;
 
 		sp = newsp;
@@ -84,6 +89,9 @@ EXPORT_SYMBOL_GPL(save_stack_trace_tsk);
 void
 save_stack_trace_regs(struct pt_regs *regs, struct stack_trace *trace)
 {
+	if (save_entry(trace, regs->nip, 0))
+		return;
+
 	save_context_stack(trace, regs->gpr[1], current, 0);
 }
 EXPORT_SYMBOL_GPL(save_stack_trace_regs);
-- 
2.25.0

