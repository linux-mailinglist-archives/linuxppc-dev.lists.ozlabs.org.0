Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2434ECA1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 17:35:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8tnb4dM4z3c61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 02:35:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3MZdTxc0;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=mJrR1Dwa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=3MZdTxc0; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=mJrR1Dwa; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8tn84Hbwz3bpR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 02:35:23 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1617118516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwQDSIFoC6niL2q+iQikUcrCHMhBQ+TPKnmxalLmhps=;
 b=3MZdTxc07gPLoLG1Y05bTp4za31m59TfFkDh03a4fN2YeHv6KYFwCoPPs035TtzGOR2IVM
 6ZHxhCxmSBgHFUPEWbVgOmREvQ4Fb5KYKwgId2vrUEvU+i0Is7KO7bSr9kgVff6fu/fLka
 z+9hQu7WZKQFZSw+UtbRYEo0whw5QBI9rjJznLcJiYdHl8HyGoUMz1OU59He8JCflnh2/R
 WF76aAQ7lsotxltgUhAD5Z/SIR4TQ/abukl8s5JpOWfN+MA5KscM/XERr3okF+iQ9Xg3U7
 cgsitmN17S8YmOwptvbOSnSyujmtO4vDgnAczznO4M3W260HLsekSu/YFqvO0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1617118516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwQDSIFoC6niL2q+iQikUcrCHMhBQ+TPKnmxalLmhps=;
 b=mJrR1Dwat/8IblWUcdzjdoqaqEWo3jNv5KZO79ZDrEMeJ/RbsBBGQ+jDQzL1WiliL8QtHC
 4b15j6gy2C83BXCg==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v2 3/5] printk: remove NMI tracking
Date: Tue, 30 Mar 2021 17:35:10 +0200
Message-Id: <20210330153512.1182-4-john.ogness@linutronix.de>
In-Reply-To: <20210330153512.1182-1-john.ogness@linutronix.de>
References: <20210330153512.1182-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Leonardo Bras <leobras.c@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Steven Rostedt <rostedt@goodmis.org>,
 Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All NMI contexts are handled the same as the safe context: store the
message and defer printing. There is no need to have special NMI
context tracking for this. Using in_nmi() is enough.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 arch/arm/kernel/smp.c       |  2 --
 arch/powerpc/kexec/crash.c  |  3 ---
 include/linux/hardirq.h     |  2 --
 include/linux/printk.h      | 12 ------------
 init/Kconfig                |  5 -----
 kernel/printk/internal.h    |  6 ------
 kernel/printk/printk_safe.c | 37 +------------------------------------
 kernel/trace/trace.c        |  2 --
 8 files changed, 1 insertion(+), 68 deletions(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 5c48eb4fd0e5..77a720c1f402 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -671,9 +671,7 @@ static void do_handle_IPI(int ipinr)
 		break;
 
 	case IPI_CPU_BACKTRACE:
-		printk_nmi_enter();
 		nmi_cpu_backtrace(get_irq_regs());
-		printk_nmi_exit();
 		break;
 
 	default:
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index c9a889880214..d488311efab1 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -311,9 +311,6 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	unsigned int i;
 	int (*old_handler)(struct pt_regs *regs);
 
-	/* Avoid hardlocking with irresponsive CPU holding logbuf_lock */
-	printk_nmi_enter();
-
 	/*
 	 * This function is only called after the system
 	 * has panicked or is otherwise in a critical state.
diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index 7c9d6a2d7e90..0926e9ca4d85 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -115,7 +115,6 @@ extern void rcu_nmi_exit(void);
 	do {							\
 		lockdep_off();					\
 		arch_nmi_enter();				\
-		printk_nmi_enter();				\
 		BUG_ON(in_nmi() == NMI_MASK);			\
 		__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);	\
 	} while (0)
@@ -134,7 +133,6 @@ extern void rcu_nmi_exit(void);
 	do {							\
 		BUG_ON(!in_nmi());				\
 		__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);	\
-		printk_nmi_exit();				\
 		arch_nmi_exit();				\
 		lockdep_on();					\
 	} while (0)
diff --git a/include/linux/printk.h b/include/linux/printk.h
index 2476796c1150..77f66625706e 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -149,18 +149,6 @@ static inline __printf(1, 2) __cold
 void early_printk(const char *s, ...) { }
 #endif
 
-#ifdef CONFIG_PRINTK_NMI
-extern void printk_nmi_enter(void);
-extern void printk_nmi_exit(void);
-extern void printk_nmi_direct_enter(void);
-extern void printk_nmi_direct_exit(void);
-#else
-static inline void printk_nmi_enter(void) { }
-static inline void printk_nmi_exit(void) { }
-static inline void printk_nmi_direct_enter(void) { }
-static inline void printk_nmi_direct_exit(void) { }
-#endif /* PRINTK_NMI */
-
 struct dev_printk_info;
 
 #ifdef CONFIG_PRINTK
diff --git a/init/Kconfig b/init/Kconfig
index 096e1af5c586..ea58c0d30a97 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1482,11 +1482,6 @@ config PRINTK
 	  very difficult to diagnose system problems, saying N here is
 	  strongly discouraged.
 
-config PRINTK_NMI
-	def_bool y
-	depends on PRINTK
-	depends on HAVE_NMI
-
 config BUG
 	bool "BUG() support" if EXPERT
 	default y
diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index 6cc35c5de890..ff890ae3ee6a 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -6,12 +6,6 @@
 
 #ifdef CONFIG_PRINTK
 
-#define PRINTK_SAFE_CONTEXT_MASK	0x007ffffff
-#define PRINTK_NMI_DIRECT_CONTEXT_MASK	0x008000000
-#define PRINTK_NMI_CONTEXT_MASK		0xff0000000
-
-#define PRINTK_NMI_CONTEXT_OFFSET	0x010000000
-
 __printf(4, 0)
 int vprintk_store(int facility, int level,
 		  const struct dev_printk_info *dev_info,
diff --git a/kernel/printk/printk_safe.c b/kernel/printk/printk_safe.c
index 4b5df5c27334..4da1ab3332d6 100644
--- a/kernel/printk/printk_safe.c
+++ b/kernel/printk/printk_safe.c
@@ -4,12 +4,9 @@
  */
 
 #include <linux/preempt.h>
-#include <linux/spinlock.h>
-#include <linux/debug_locks.h>
 #include <linux/kdb.h>
 #include <linux/smp.h>
 #include <linux/cpumask.h>
-#include <linux/irq_work.h>
 #include <linux/printk.h>
 #include <linux/kprobes.h>
 
@@ -17,35 +14,6 @@
 
 static DEFINE_PER_CPU(int, printk_context);
 
-#ifdef CONFIG_PRINTK_NMI
-void noinstr printk_nmi_enter(void)
-{
-	this_cpu_add(printk_context, PRINTK_NMI_CONTEXT_OFFSET);
-}
-
-void noinstr printk_nmi_exit(void)
-{
-	this_cpu_sub(printk_context, PRINTK_NMI_CONTEXT_OFFSET);
-}
-
-/*
- * Marks a code that might produce many messages in NMI context
- * and the risk of losing them is more critical than eventual
- * reordering.
- */
-void printk_nmi_direct_enter(void)
-{
-	if (this_cpu_read(printk_context) & PRINTK_NMI_CONTEXT_MASK)
-		this_cpu_or(printk_context, PRINTK_NMI_DIRECT_CONTEXT_MASK);
-}
-
-void printk_nmi_direct_exit(void)
-{
-	this_cpu_and(printk_context, ~PRINTK_NMI_DIRECT_CONTEXT_MASK);
-}
-
-#endif /* CONFIG_PRINTK_NMI */
-
 /* Can be preempted by NMI. */
 void __printk_safe_enter(void)
 {
@@ -70,10 +38,7 @@ asmlinkage int vprintk(const char *fmt, va_list args)
 	 * Use the main logbuf even in NMI. But avoid calling console
 	 * drivers that might have their own locks.
 	 */
-	if (this_cpu_read(printk_context) &
-	    (PRINTK_NMI_DIRECT_CONTEXT_MASK |
-	     PRINTK_NMI_CONTEXT_MASK |
-	     PRINTK_SAFE_CONTEXT_MASK)) {
+	if (this_cpu_read(printk_context) || in_nmi()) {
 		unsigned long flags;
 		int len;
 
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index b5815a022ecc..83a3663d1dc0 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9344,7 +9344,6 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
 	tracing_off();
 
 	local_irq_save(flags);
-	printk_nmi_direct_enter();
 
 	/* Simulate the iterator */
 	trace_init_global_iter(&iter);
@@ -9424,7 +9423,6 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
 		atomic_dec(&per_cpu_ptr(iter.array_buffer->data, cpu)->disabled);
 	}
 	atomic_dec(&dump_running);
-	printk_nmi_direct_exit();
 	local_irq_restore(flags);
 }
 EXPORT_SYMBOL_GPL(ftrace_dump);
-- 
2.20.1

