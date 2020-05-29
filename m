Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEC81E8A6E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 23:49:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YdWK6y2fzDqll
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 07:49:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YdNG3PKjzDqYp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 May 2020 07:43:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=nhbwxUUlPI+chouh1KJuBjV9Ingp0nmsf6VxXQj6Kuo=; b=Z6Txg7GjoZPTJf8duH+GLUyEDJ
 u4kaMLC7N+Dx6VXDwY04jOczBS4kJ6IDPzpTUGOgXwRyJbIhDSNPJxKMS9bC8ZuWTKW11vc71FhKN
 7PR+foScH0l6IiN/rLJpr+9kmF3gCZ+ATpO1Sm6lCp6tJvojESRzp24uGFoNufptCQ8kExNXvNH+E
 MhymazHJTQQmRMszDxAQp0Gl1/V9O+uK/ziughQ5jIGK9y8XGD9YHgCS72Ov6eFm7uLDOaGr3H3O9
 FQ2c/mF7Sx01tKihq56S+agZr9vEj/s1+OhD/swdE0xnQc0kvM/ii/yFH6aXtLIf2uQEtuHd/0mCA
 aarhzo0Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jemmK-0006Ht-3e; Fri, 29 May 2020 21:43:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8EDBF306A9D;
 Fri, 29 May 2020 23:42:58 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id DC7442B9B1BC7; Fri, 29 May 2020 23:42:57 +0200 (CEST)
Message-ID: <20200529214203.900682204@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 29 May 2020 23:35:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 will@kernel.org,
 tglx@linutronix.de
Subject: [PATCH v3 5/5] lockdep: Remove lockdep_hardirq{s_enabled,
 _context}() argument
References: <20200529213550.683440625@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-s390@vger.kernel.org, peterz@infradead.org, bigeasy@linutronix.de,
 x86@kernel.org, heiko.carstens@de.ibm.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, a.darwish@linutronix.de, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the macros use per-cpu data, we no longer need the argument.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/entry/common.c        |    2 +-
 include/linux/irqflags.h       |    8 ++++----
 include/linux/lockdep.h        |    2 +-
 kernel/locking/lockdep.c       |   30 +++++++++++++++---------------
 kernel/softirq.c               |    2 +-
 tools/include/linux/irqflags.h |    4 ++--
 6 files changed, 24 insertions(+), 24 deletions(-)

--- a/arch/x86/entry/common.c
+++ b/arch/x86/entry/common.c
@@ -689,7 +689,7 @@ noinstr void idtentry_exit_user(struct p
 
 noinstr bool idtentry_enter_nmi(struct pt_regs *regs)
 {
-	bool irq_state = lockdep_hardirqs_enabled(current);
+	bool irq_state = lockdep_hardirqs_enabled();
 
 	__nmi_enter();
 	lockdep_hardirqs_off(CALLER_ADDR0);
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -40,9 +40,9 @@ DECLARE_PER_CPU(int, hardirq_context);
   extern void trace_hardirqs_off_finish(void);
   extern void trace_hardirqs_on(void);
   extern void trace_hardirqs_off(void);
-# define lockdep_hardirq_context(p)	(this_cpu_read(hardirq_context))
+# define lockdep_hardirq_context()	(this_cpu_read(hardirq_context))
 # define lockdep_softirq_context(p)	((p)->softirq_context)
-# define lockdep_hardirqs_enabled(p)	(this_cpu_read(hardirqs_enabled))
+# define lockdep_hardirqs_enabled()	(this_cpu_read(hardirqs_enabled))
 # define lockdep_softirqs_enabled(p)	((p)->softirqs_enabled)
 # define lockdep_hardirq_enter()			\
 do {							\
@@ -109,9 +109,9 @@ do {						\
 # define trace_hardirqs_off_finish()		do { } while (0)
 # define trace_hardirqs_on()		do { } while (0)
 # define trace_hardirqs_off()		do { } while (0)
-# define lockdep_hardirq_context(p)	0
+# define lockdep_hardirq_context()	0
 # define lockdep_softirq_context(p)	0
-# define lockdep_hardirqs_enabled(p)	0
+# define lockdep_hardirqs_enabled()	0
 # define lockdep_softirqs_enabled(p)	0
 # define lockdep_hardirq_enter()	do { } while (0)
 # define lockdep_hardirq_threaded()	do { } while (0)
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -736,7 +736,7 @@ do {									\
 
 # define lockdep_assert_RT_in_threaded_ctx() do {			\
 		WARN_ONCE(debug_locks && !current->lockdep_recursion &&	\
-			  lockdep_hardirq_context(current) &&		\
+			  lockdep_hardirq_context() &&			\
 			  !(current->hardirq_threaded || current->irq_config),	\
 			  "Not in threaded context on PREEMPT_RT as expected\n");	\
 } while (0)
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -2062,9 +2062,9 @@ print_bad_irq_dependency(struct task_str
 	pr_warn("-----------------------------------------------------\n");
 	pr_warn("%s/%d [HC%u[%lu]:SC%u[%lu]:HE%u:SE%u] is trying to acquire:\n",
 		curr->comm, task_pid_nr(curr),
-		lockdep_hardirq_context(curr), hardirq_count() >> HARDIRQ_SHIFT,
+		lockdep_hardirq_context(), hardirq_count() >> HARDIRQ_SHIFT,
 		curr->softirq_context, softirq_count() >> SOFTIRQ_SHIFT,
-		lockdep_hardirqs_enabled(curr),
+		lockdep_hardirqs_enabled(),
 		curr->softirqs_enabled);
 	print_lock(next);
 
@@ -3331,9 +3331,9 @@ print_usage_bug(struct task_struct *curr
 
 	pr_warn("%s/%d [HC%u[%lu]:SC%u[%lu]:HE%u:SE%u] takes:\n",
 		curr->comm, task_pid_nr(curr),
-		lockdep_hardirq_context(curr), hardirq_count() >> HARDIRQ_SHIFT,
+		lockdep_hardirq_context(), hardirq_count() >> HARDIRQ_SHIFT,
 		lockdep_softirq_context(curr), softirq_count() >> SOFTIRQ_SHIFT,
-		lockdep_hardirqs_enabled(curr),
+		lockdep_hardirqs_enabled(),
 		lockdep_softirqs_enabled(curr));
 	print_lock(this);
 
@@ -3655,7 +3655,7 @@ void lockdep_hardirqs_on_prepare(unsigne
 	if (DEBUG_LOCKS_WARN_ON(current->lockdep_recursion & LOCKDEP_RECURSION_MASK))
 		return;
 
-	if (unlikely(lockdep_hardirqs_enabled(current))) {
+	if (unlikely(lockdep_hardirqs_enabled())) {
 		/*
 		 * Neither irq nor preemption are disabled here
 		 * so this is racy by nature but losing one hit
@@ -3683,7 +3683,7 @@ void lockdep_hardirqs_on_prepare(unsigne
 	 * Can't allow enabling interrupts while in an interrupt handler,
 	 * that's general bad form and such. Recursion, limited stack etc..
 	 */
-	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context(current)))
+	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context()))
 		return;
 
 	current->hardirq_chain_key = current->curr_chain_key;
@@ -3718,7 +3718,7 @@ void noinstr lockdep_hardirqs_on(unsigne
 	if (DEBUG_LOCKS_WARN_ON(curr->lockdep_recursion & LOCKDEP_RECURSION_MASK))
 		return;
 
-	if (lockdep_hardirqs_enabled(curr)) {
+	if (lockdep_hardirqs_enabled()) {
 		/*
 		 * Neither irq nor preemption are disabled here
 		 * so this is racy by nature but losing one hit
@@ -3772,7 +3772,7 @@ void noinstr lockdep_hardirqs_off(unsign
 	if (DEBUG_LOCKS_WARN_ON(!irqs_disabled()))
 		return;
 
-	if (lockdep_hardirqs_enabled(curr)) {
+	if (lockdep_hardirqs_enabled()) {
 		/*
 		 * We have done an ON -> OFF transition:
 		 */
@@ -3821,7 +3821,7 @@ void lockdep_softirqs_on(unsigned long i
 	 * usage bit for all held locks, if hardirqs are
 	 * enabled too:
 	 */
-	if (lockdep_hardirqs_enabled(curr))
+	if (lockdep_hardirqs_enabled())
 		mark_held_locks(curr, LOCK_ENABLED_SOFTIRQ);
 	lockdep_recursion_finish();
 }
@@ -3870,7 +3870,7 @@ mark_usage(struct task_struct *curr, str
 	 */
 	if (!hlock->trylock) {
 		if (hlock->read) {
-			if (lockdep_hardirq_context(curr))
+			if (lockdep_hardirq_context())
 				if (!mark_lock(curr, hlock,
 						LOCK_USED_IN_HARDIRQ_READ))
 					return 0;
@@ -3879,7 +3879,7 @@ mark_usage(struct task_struct *curr, str
 						LOCK_USED_IN_SOFTIRQ_READ))
 					return 0;
 		} else {
-			if (lockdep_hardirq_context(curr))
+			if (lockdep_hardirq_context())
 				if (!mark_lock(curr, hlock, LOCK_USED_IN_HARDIRQ))
 					return 0;
 			if (curr->softirq_context)
@@ -3917,7 +3917,7 @@ mark_usage(struct task_struct *curr, str
 
 static inline unsigned int task_irq_context(struct task_struct *task)
 {
-	return LOCK_CHAIN_HARDIRQ_CONTEXT * !!lockdep_hardirq_context(task) +
+	return LOCK_CHAIN_HARDIRQ_CONTEXT * !!lockdep_hardirq_context() +
 	       LOCK_CHAIN_SOFTIRQ_CONTEXT * !!task->softirq_context;
 }
 
@@ -4010,7 +4010,7 @@ static inline short task_wait_context(st
 	 * Set appropriate wait type for the context; for IRQs we have to take
 	 * into account force_irqthread as that is implied by PREEMPT_RT.
 	 */
-	if (lockdep_hardirq_context(curr)) {
+	if (lockdep_hardirq_context()) {
 		/*
 		 * Check if force_irqthreads will run us threaded.
 		 */
@@ -4853,11 +4853,11 @@ static void check_flags(unsigned long fl
 		return;
 
 	if (irqs_disabled_flags(flags)) {
-		if (DEBUG_LOCKS_WARN_ON(lockdep_hardirqs_enabled(current))) {
+		if (DEBUG_LOCKS_WARN_ON(lockdep_hardirqs_enabled())) {
 			printk("possible reason: unannotated irqs-off.\n");
 		}
 	} else {
-		if (DEBUG_LOCKS_WARN_ON(!lockdep_hardirqs_enabled(current))) {
+		if (DEBUG_LOCKS_WARN_ON(!lockdep_hardirqs_enabled())) {
 			printk("possible reason: unannotated irqs-on.\n");
 		}
 	}
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -230,7 +230,7 @@ static inline bool lockdep_softirq_start
 {
 	bool in_hardirq = false;
 
-	if (lockdep_hardirq_context(current)) {
+	if (lockdep_hardirq_context()) {
 		in_hardirq = true;
 		lockdep_hardirq_exit();
 	}
--- a/tools/include/linux/irqflags.h
+++ b/tools/include/linux/irqflags.h
@@ -2,9 +2,9 @@
 #ifndef _LIBLOCKDEP_LINUX_TRACE_IRQFLAGS_H_
 #define _LIBLOCKDEP_LINUX_TRACE_IRQFLAGS_H_
 
-# define lockdep_hardirq_context(p)	0
+# define lockdep_hardirq_context()	0
 # define lockdep_softirq_context(p)	0
-# define lockdep_hardirqs_enabled(p)	0
+# define lockdep_hardirqs_enabled()	0
 # define lockdep_softirqs_enabled(p)	0
 # define lockdep_hardirq_enter()	do { } while (0)
 # define lockdep_hardirq_exit()		do { } while (0)


