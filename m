Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4717033CEFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 08:58:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F05Hp28Lyz3bmm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:57:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F05H62HnLz301P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 18:57:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F05Gz4mnGz9v028;
 Tue, 16 Mar 2021 08:57:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qUwhpo_oFFwc; Tue, 16 Mar 2021 08:57:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F05Gz3zd4z9v023;
 Tue, 16 Mar 2021 08:57:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5715F8B789;
 Tue, 16 Mar 2021 08:57:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZQunHu6nIbbi; Tue, 16 Mar 2021 08:57:16 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 109D58B782;
 Tue, 16 Mar 2021 08:57:16 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DF9A1675C0; Tue, 16 Mar 2021 07:57:15 +0000 (UTC)
Message-Id: <73b36bbb101299760b95ecd2cd3a46554bea8bf9.1615881400.git.christophe.leroy@csgroup.eu>
In-Reply-To: <955248c6423cb068c5965923121ba31d4dd2fdde.1615881400.git.christophe.leroy@csgroup.eu>
References: <955248c6423cb068c5965923121ba31d4dd2fdde.1615881400.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/4] powerpc: Convert stacktrace to generic ARCH_STACKWALK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 16 Mar 2021 07:57:15 +0000 (UTC)
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

This patch converts powerpc stacktrace to the generic ARCH_STACKWALK
implemented by commit 214d8ca6ee85 ("stacktrace: Provide common
infrastructure")

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig             |  1 +
 arch/powerpc/kernel/stacktrace.c | 91 ++++++--------------------------
 2 files changed, 17 insertions(+), 75 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index bb7ca6fee885..60827904a816 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -145,6 +145,7 @@ config PPC
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
+	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC32 || PPC_BOOK3S_64
 	select ARCH_USE_BUILTIN_BSWAP
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 5b93650bc16c..80f92f5b5393 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -23,12 +23,18 @@
 
 #include <asm/paca.h>
 
-/*
- * Save stack-backtrace addresses into a stack_trace buffer.
- */
-static void save_context_stack(struct stack_trace *trace, unsigned long sp,
-			struct task_struct *task, int savesched)
+void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
+		     struct task_struct *task, struct pt_regs *regs)
 {
+	unsigned long sp;
+
+	if (regs)
+		sp = regs->gpr[1];
+	else if (task == current)
+		sp = current_stack_frame();
+	else
+		sp = task->thread.ksp;
+
 	for (;;) {
 		unsigned long *stack = (unsigned long *) sp;
 		unsigned long newsp, ip;
@@ -39,63 +45,21 @@ static void save_context_stack(struct stack_trace *trace, unsigned long sp,
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
+		if (!consume_entry(cookie, ip))
 			return;
 
 		sp = newsp;
 	}
 }
 
-void save_stack_trace(struct stack_trace *trace)
-{
-	unsigned long sp;
-
-	sp = current_stack_frame();
-
-	save_context_stack(trace, sp, current, 1);
-}
-EXPORT_SYMBOL_GPL(save_stack_trace);
-
-void save_stack_trace_tsk(struct task_struct *tsk, struct stack_trace *trace)
-{
-	unsigned long sp;
-
-	if (!try_get_task_stack(tsk))
-		return;
-
-	if (tsk == current)
-		sp = current_stack_frame();
-	else
-		sp = tsk->thread.ksp;
-
-	save_context_stack(trace, sp, tsk, 0);
-
-	put_task_stack(tsk);
-}
-EXPORT_SYMBOL_GPL(save_stack_trace_tsk);
-
-void
-save_stack_trace_regs(struct pt_regs *regs, struct stack_trace *trace)
-{
-	save_context_stack(trace, regs->gpr[1], current, 0);
-}
-EXPORT_SYMBOL_GPL(save_stack_trace_regs);
-
 /*
  * This function returns an error if it detects any unreliable features of the
  * stack.  Otherwise it guarantees that the stack trace is reliable.
  *
  * If the task is not 'current', the caller *must* ensure the task is inactive.
  */
-static int __save_stack_trace_tsk_reliable(struct task_struct *task,
-					   struct stack_trace *trace)
+int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
+			     void *cookie, struct task_struct *task)
 {
 	unsigned long sp;
 	unsigned long newsp;
@@ -191,35 +155,12 @@ static int __save_stack_trace_tsk_reliable(struct task_struct *task,
 			return -EINVAL;
 #endif
 
-		if (trace->nr_entries >= trace->max_entries)
-			return -E2BIG;
-		if (!trace->skip)
-			trace->entries[trace->nr_entries++] = ip;
-		else
-			trace->skip--;
+		if (!consume_entry(cookie, ip))
+			return -EINVAL;
 	}
 	return 0;
 }
 
-int save_stack_trace_tsk_reliable(struct task_struct *tsk,
-				  struct stack_trace *trace)
-{
-	int ret;
-
-	/*
-	 * If the task doesn't have a stack (e.g., a zombie), the stack is
-	 * "reliably" empty.
-	 */
-	if (!try_get_task_stack(tsk))
-		return 0;
-
-	ret = __save_stack_trace_tsk_reliable(tsk, trace);
-
-	put_task_stack(tsk);
-
-	return ret;
-}
-
 #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_NMI_IPI)
 static void handle_backtrace_ipi(struct pt_regs *regs)
 {
-- 
2.25.0

