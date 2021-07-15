Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6916F3CAC2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 21:35:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQl2D4Z0Mz3bX8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 05:35:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=l0Cruanf;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6rgV+E+L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=l0Cruanf; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=6rgV+E+L; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQl1G3rXRz2yP1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 05:34:10 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1626377643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkFMmaJ3o//Lzgh5yHddl0yI0TEK6B33ffsKKtQmoQI=;
 b=l0CruanfisUOKro0CTcpYaZeXcMhjjldFWwlmsEM6SRh17m3TlFSDZ97AJhVpb9Or7nJNn
 zphKGMNCf0l/fLLFK6g7iuq+je98l3lV2LjPDwF4qJ1HHhtSGSLLV/V2Ct8Ipe+Tqzx73I
 MeqxWyI+2A49UBnCHEpodfML4eK0ZTfB10g47fwykNITN4BIzEVEOOm5l8p3vUqP71e0fI
 tYnaTzOa3wuipmPKpnS1WQxsdjANeHRwrschRyuwOUGhvgEYIQ9M0njv6lI3mVxyNkkbT3
 IoRcQq7U5GUpF9hnFVPm9/l2lythVEu2QZYNawagPpW0eAwHAx+eHfnvaVUXwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1626377643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkFMmaJ3o//Lzgh5yHddl0yI0TEK6B33ffsKKtQmoQI=;
 b=6rgV+E+LHX+rbAN3SrpoCieLEkFcEAfYXRhHboxHr4RdvzGCzAgXUVs32r+zWjv9jNIrZa
 KN0TAzN5VxW2S3BA==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v4 4/6] printk: remove NMI tracking
Date: Thu, 15 Jul 2021 21:39:57 +0206
Message-Id: <20210715193359.25946-5-john.ogness@linutronix.de>
In-Reply-To: <20210715193359.25946-1-john.ogness@linutronix.de>
References: <20210715193359.25946-1-john.ogness@linutronix.de>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 Paul Mackerras <paulus@samba.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Valentin Schneider <valentin.schneider@arm.com>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vipin Sharma <vipinsh@google.com>, Frederic Weisbecker <frederic@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Terrell <terrelln@fb.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Xiongwei Song <sxwjean@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All NMI contexts are handled the same as the safe context: store the
message and defer printing. There is no need to have special NMI
context tracking for this. Using in_nmi() is enough.

There are several parts of the kernel that are manually calling into
the printk NMI context tracking in order to cause general printk
deferred printing:

    arch/arm/kernel/smp.c
    arch/powerpc/kexec/crash.c
    kernel/trace/trace.c

For these users, provide a new function pair
printk_deferred_enter/exit that explicitly achieves the same
objective.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 arch/arm/kernel/smp.c       |  4 ++--
 arch/powerpc/kexec/crash.c  |  2 +-
 include/linux/hardirq.h     |  2 --
 include/linux/printk.h      | 31 +++++++++++++++++++------------
 init/Kconfig                |  5 -----
 kernel/printk/internal.h    |  8 --------
 kernel/printk/printk_safe.c | 37 +------------------------------------
 kernel/trace/trace.c        |  4 ++--
 8 files changed, 25 insertions(+), 68 deletions(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index c7bb168b0d97..842427ff2b3c 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -667,9 +667,9 @@ static void do_handle_IPI(int ipinr)
 		break;
 
 	case IPI_CPU_BACKTRACE:
-		printk_nmi_enter();
+		printk_deferred_enter();
 		nmi_cpu_backtrace(get_irq_regs());
-		printk_nmi_exit();
+		printk_deferred_exit();
 		break;
 
 	default:
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index 0196d0c211ac..1070378c8e35 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -313,7 +313,7 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	int (*old_handler)(struct pt_regs *regs);
 
 	/* Avoid hardlocking with irresponsive CPU holding logbuf_lock */
-	printk_nmi_enter();
+	printk_deferred_enter();
 
 	/*
 	 * This function is only called after the system
diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index 69bc86ea382c..76878b357ffa 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -116,7 +116,6 @@ extern void rcu_nmi_exit(void);
 	do {							\
 		lockdep_off();					\
 		arch_nmi_enter();				\
-		printk_nmi_enter();				\
 		BUG_ON(in_nmi() == NMI_MASK);			\
 		__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);	\
 	} while (0)
@@ -135,7 +134,6 @@ extern void rcu_nmi_exit(void);
 	do {							\
 		BUG_ON(!in_nmi());				\
 		__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);	\
-		printk_nmi_exit();				\
 		arch_nmi_exit();				\
 		lockdep_on();					\
 	} while (0)
diff --git a/include/linux/printk.h b/include/linux/printk.h
index 664612f75dac..03f7ccedaf18 100644
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
@@ -180,6 +168,16 @@ int printk(const char *fmt, ...);
  */
 __printf(1, 2) __cold int printk_deferred(const char *fmt, ...);
 
+extern void __printk_safe_enter(void);
+extern void __printk_safe_exit(void);
+/*
+ * The printk_deferred_enter/exit macros are available only as a hack for
+ * some code paths that need to defer all printk console printing. Interrupts
+ * must be disabled for the deferred duration.
+ */
+#define printk_deferred_enter __printk_safe_enter
+#define printk_deferred_exit __printk_safe_exit
+
 /*
  * Please don't use printk_ratelimit(), because it shares ratelimiting state
  * with all other unrelated printk_ratelimit() callsites.  Instead use
@@ -223,6 +221,15 @@ int printk_deferred(const char *s, ...)
 {
 	return 0;
 }
+
+static inline void printk_deferred_enter(void)
+{
+}
+
+static inline void printk_deferred_exit(void)
+{
+}
+
 static inline int printk_ratelimit(void)
 {
 	return 0;
diff --git a/init/Kconfig b/init/Kconfig
index a61c92066c2e..9c0510693543 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1506,11 +1506,6 @@ config PRINTK
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
index 6cc35c5de890..b6d310c72fc9 100644
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
@@ -19,8 +13,6 @@ int vprintk_store(int facility, int level,
 
 __printf(1, 0) int vprintk_default(const char *fmt, va_list args);
 __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args);
-void __printk_safe_enter(void);
-void __printk_safe_exit(void);
 
 bool printk_percpu_data_ready(void);
 
diff --git a/kernel/printk/printk_safe.c b/kernel/printk/printk_safe.c
index 29c580dac93d..ef0f9a2044da 100644
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
 		int len;
 
 		len = vprintk_store(0, LOGLEVEL_DEFAULT, NULL, fmt, args);
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index d23a09d3eb37..b30ad20d251f 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9647,7 +9647,7 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
 	tracing_off();
 
 	local_irq_save(flags);
-	printk_nmi_direct_enter();
+	printk_deferred_enter();
 
 	/* Simulate the iterator */
 	trace_init_global_iter(&iter);
@@ -9729,7 +9729,7 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
 		atomic_dec(&per_cpu_ptr(iter.array_buffer->data, cpu)->disabled);
 	}
 	atomic_dec(&dump_running);
-	printk_nmi_direct_exit();
+	printk_deferred_exit();
 	local_irq_restore(flags);
 }
 EXPORT_SYMBOL_GPL(ftrace_dump);
-- 
2.20.1

