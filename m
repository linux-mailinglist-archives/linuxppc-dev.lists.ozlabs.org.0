Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C02E034ECA9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 17:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8tp65byHz3cC3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 02:36:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uozHoRq3;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E34v0H4s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=uozHoRq3; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=E34v0H4s; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8tn84bS8z3bpS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 02:35:23 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1617118515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMvgYug9VvPIIDDZuE3Zi6gK30KlLqykLwhVpHCcyEc=;
 b=uozHoRq3GFnM3blhlsFu4kdHO9cc/x/8ijbThxp8tR60rAcvxuyWGV/ANksrnN5SseNe+i
 eHG5Gp9au/OfrO1iKaMx4btGocs4y1pT9QvRs3fphT2a8dlCY4xdJUjrFAdtxPBWtbIEri
 +Yk7S9mbdyX/KGB1L4vALlIDV9cCQ5iMNuEImilSoFXesELGIasNYd6SOqoB69Gff3jyzk
 hXyW2iszvwS9BbhbNppo7ZHCcponY7qa6uBnNX9fY6SfJMW4QzZL1KVDm2y1aVYbOKY6fx
 iRM+Ut4sCBI/nPAJFFOtZXGX7ugdGl2aUN3NlhJMFa8Nm/o6ve7UMKlP8CiCGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1617118515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMvgYug9VvPIIDDZuE3Zi6gK30KlLqykLwhVpHCcyEc=;
 b=E34v0H4sOqx5pwdJYC00sKah4oux0De3EGkQVClNjKv6XZHg1UTsrDxuDdmLBUG46lAGan
 jQAvBYjMHMAMYjDA==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v2 2/5] printk: remove safe buffers
Date: Tue, 30 Mar 2021 17:35:09 +0200
Message-Id: <20210330153512.1182-3-john.ogness@linutronix.de>
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
 Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@samba.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Rafael Aquini <aquini@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alistair Popple <alistair@popple.id.au>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With @logbuf_lock removed, the high level printk functions for
storing messages are lockless. Messages can be stored from any
context, so there is no need for the NMI and safe buffers anymore.
Remove the NMI and safe buffers.

Although the safe buffers are removed, the NMI and safe context
tracking is still in place. In these contexts, store the message
immediately but still use irq_work to defer the console printing.

Since printk recursion tracking is in place, safe context tracking
for most of printk is not needed. Remove it. Only safe context
tracking relating to the console lock is left in place. This is
because the console lock is needed for the actual printing.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 Note: The follow-up patch removes the NMI tracking.

 arch/powerpc/kernel/traps.c    |   1 -
 arch/powerpc/kernel/watchdog.c |   5 -
 include/linux/printk.h         |  10 -
 kernel/kexec_core.c            |   1 -
 kernel/panic.c                 |   3 -
 kernel/printk/internal.h       |  17 --
 kernel/printk/printk.c         | 137 +++++---------
 kernel/printk/printk_safe.c    | 333 +--------------------------------
 lib/nmi_backtrace.c            |   6 -
 9 files changed, 56 insertions(+), 457 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3ec7b443fe6b..7d2b339afcb0 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -170,7 +170,6 @@ extern void panic_flush_kmsg_start(void)
 
 extern void panic_flush_kmsg_end(void)
 {
-	printk_safe_flush_on_panic();
 	kmsg_dump(KMSG_DUMP_PANIC);
 	bust_spinlocks(0);
 	debug_locks_off();
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index af3c15a1d41e..8ae46c5945d0 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -181,11 +181,6 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 
 	wd_smp_unlock(&flags);
 
-	printk_safe_flush();
-	/*
-	 * printk_safe_flush() seems to require another print
-	 * before anything actually goes out to console.
-	 */
 	if (sysctl_hardlockup_all_cpu_backtrace)
 		trigger_allbutself_cpu_backtrace();
 
diff --git a/include/linux/printk.h b/include/linux/printk.h
index fe7eb2351610..2476796c1150 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -207,8 +207,6 @@ __printf(1, 2) void dump_stack_set_arch_desc(const char *fmt, ...);
 void dump_stack_print_info(const char *log_lvl);
 void show_regs_print_info(const char *log_lvl);
 extern asmlinkage void dump_stack(void) __cold;
-extern void printk_safe_flush(void);
-extern void printk_safe_flush_on_panic(void);
 #else
 static inline __printf(1, 0)
 int vprintk(const char *s, va_list args)
@@ -272,14 +270,6 @@ static inline void show_regs_print_info(const char *log_lvl)
 static inline void dump_stack(void)
 {
 }
-
-static inline void printk_safe_flush(void)
-{
-}
-
-static inline void printk_safe_flush_on_panic(void)
-{
-}
 #endif
 
 extern int kptr_restrict;
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index a0b6780740c8..480d5f77ef4f 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -977,7 +977,6 @@ void crash_kexec(struct pt_regs *regs)
 	old_cpu = atomic_cmpxchg(&panic_cpu, PANIC_CPU_INVALID, this_cpu);
 	if (old_cpu == PANIC_CPU_INVALID) {
 		/* This is the 1st CPU which comes here, so go ahead. */
-		printk_safe_flush_on_panic();
 		__crash_kexec(regs);
 
 		/*
diff --git a/kernel/panic.c b/kernel/panic.c
index 332736a72a58..1f0df42f8d0c 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -247,7 +247,6 @@ void panic(const char *fmt, ...)
 	 * Bypass the panic_cpu check and call __crash_kexec directly.
 	 */
 	if (!_crash_kexec_post_notifiers) {
-		printk_safe_flush_on_panic();
 		__crash_kexec(NULL);
 
 		/*
@@ -271,8 +270,6 @@ void panic(const char *fmt, ...)
 	 */
 	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
 
-	/* Call flush even twice. It tries harder with a single online CPU */
-	printk_safe_flush_on_panic();
 	kmsg_dump(KMSG_DUMP_PANIC);
 
 	/*
diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index 51615c909b2f..6cc35c5de890 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -22,7 +22,6 @@ __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args);
 void __printk_safe_enter(void);
 void __printk_safe_exit(void);
 
-void printk_safe_init(void);
 bool printk_percpu_data_ready(void);
 
 #define printk_safe_enter_irqsave(flags)	\
@@ -37,18 +36,6 @@ bool printk_percpu_data_ready(void);
 		local_irq_restore(flags);	\
 	} while (0)
 
-#define printk_safe_enter_irq()		\
-	do {					\
-		local_irq_disable();		\
-		__printk_safe_enter();		\
-	} while (0)
-
-#define printk_safe_exit_irq()			\
-	do {					\
-		__printk_safe_exit();		\
-		local_irq_enable();		\
-	} while (0)
-
 void defer_console_output(void);
 
 #else
@@ -61,9 +48,5 @@ void defer_console_output(void);
 #define printk_safe_enter_irqsave(flags) local_irq_save(flags)
 #define printk_safe_exit_irqrestore(flags) local_irq_restore(flags)
 
-#define printk_safe_enter_irq() local_irq_disable()
-#define printk_safe_exit_irq() local_irq_enable()
-
-static inline void printk_safe_init(void) { }
 static inline bool printk_percpu_data_ready(void) { return false; }
 #endif /* CONFIG_PRINTK */
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index e971c0a9ec9e..f090d6a1b39e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -732,27 +732,22 @@ static ssize_t devkmsg_read(struct file *file, char __user *buf,
 	if (ret)
 		return ret;
 
-	printk_safe_enter_irq();
 	if (!prb_read_valid(prb, atomic64_read(&user->seq), r)) {
 		if (file->f_flags & O_NONBLOCK) {
 			ret = -EAGAIN;
-			printk_safe_exit_irq();
 			goto out;
 		}
 
-		printk_safe_exit_irq();
 		ret = wait_event_interruptible(log_wait,
 				prb_read_valid(prb, atomic64_read(&user->seq), r));
 		if (ret)
 			goto out;
-		printk_safe_enter_irq();
 	}
 
 	if (r->info->seq != atomic64_read(&user->seq)) {
 		/* our last seen message is gone, return error and reset */
 		atomic64_set(&user->seq, r->info->seq);
 		ret = -EPIPE;
-		printk_safe_exit_irq();
 		goto out;
 	}
 
@@ -762,7 +757,6 @@ static ssize_t devkmsg_read(struct file *file, char __user *buf,
 				  &r->info->dev_info);
 
 	atomic64_set(&user->seq, r->info->seq + 1);
-	printk_safe_exit_irq();
 
 	if (len > count) {
 		ret = -EINVAL;
@@ -797,7 +791,6 @@ static loff_t devkmsg_llseek(struct file *file, loff_t offset, int whence)
 	if (offset)
 		return -ESPIPE;
 
-	printk_safe_enter_irq();
 	switch (whence) {
 	case SEEK_SET:
 		/* the first record */
@@ -818,7 +811,6 @@ static loff_t devkmsg_llseek(struct file *file, loff_t offset, int whence)
 	default:
 		ret = -EINVAL;
 	}
-	printk_safe_exit_irq();
 	return ret;
 }
 
@@ -833,7 +825,6 @@ static __poll_t devkmsg_poll(struct file *file, poll_table *wait)
 
 	poll_wait(file, &log_wait, wait);
 
-	printk_safe_enter_irq();
 	if (prb_read_valid_info(prb, atomic64_read(&user->seq), &info, NULL)) {
 		/* return error when data has vanished underneath us */
 		if (info.seq != atomic64_read(&user->seq))
@@ -841,7 +832,6 @@ static __poll_t devkmsg_poll(struct file *file, poll_table *wait)
 		else
 			ret = EPOLLIN|EPOLLRDNORM;
 	}
-	printk_safe_exit_irq();
 
 	return ret;
 }
@@ -874,9 +864,7 @@ static int devkmsg_open(struct inode *inode, struct file *file)
 	prb_rec_init_rd(&user->record, &user->info,
 			&user->text_buf[0], sizeof(user->text_buf));
 
-	printk_safe_enter_irq();
 	atomic64_set(&user->seq, prb_first_valid_seq(prb));
-	printk_safe_exit_irq();
 
 	file->private_data = user;
 	return 0;
@@ -1042,9 +1030,6 @@ static inline void log_buf_add_cpu(void) {}
 
 static void __init set_percpu_data_ready(void)
 {
-	printk_safe_init();
-	/* Make sure we set this flag only after printk_safe() init is done */
-	barrier();
 	__printk_percpu_data_ready = true;
 }
 
@@ -1082,6 +1067,7 @@ void __init setup_log_buf(int early)
 	struct prb_desc *new_descs;
 	struct printk_info info;
 	struct printk_record r;
+	unsigned int text_size;
 	size_t new_descs_size;
 	size_t new_infos_size;
 	unsigned long flags;
@@ -1142,24 +1128,37 @@ void __init setup_log_buf(int early)
 		 new_descs, ilog2(new_descs_count),
 		 new_infos);
 
-	printk_safe_enter_irqsave(flags);
+	local_irq_save(flags);
 
 	log_buf_len = new_log_buf_len;
 	log_buf = new_log_buf;
 	new_log_buf_len = 0;
 
 	free = __LOG_BUF_LEN;
-	prb_for_each_record(0, &printk_rb_static, seq, &r)
-		free -= add_to_rb(&printk_rb_dynamic, &r);
+	prb_for_each_record(0, &printk_rb_static, seq, &r) {
+		text_size = add_to_rb(&printk_rb_dynamic, &r);
+		if (text_size > free)
+			free = 0;
+		else
+			free -= text_size;
+	}
 
-	/*
-	 * This is early enough that everything is still running on the
-	 * boot CPU and interrupts are disabled. So no new messages will
-	 * appear during the transition to the dynamic buffer.
-	 */
 	prb = &printk_rb_dynamic;
 
-	printk_safe_exit_irqrestore(flags);
+	local_irq_restore(flags);
+
+	/*
+	 * Copy any remaining messages that might have appeared from
+	 * NMI context after copying but before switching to the
+	 * dynamic buffer.
+	 */
+	prb_for_each_record(seq, &printk_rb_static, seq, &r) {
+		text_size = add_to_rb(&printk_rb_dynamic, &r);
+		if (text_size > free)
+			free = 0;
+		else
+			free -= text_size;
+	}
 
 	if (seq != prb_next_seq(&printk_rb_static)) {
 		pr_err("dropped %llu messages\n",
@@ -1498,11 +1497,9 @@ static int syslog_print(char __user *buf, int size)
 		size_t n;
 		size_t skip;
 
-		printk_safe_enter_irq();
-		raw_spin_lock(&syslog_lock);
+		raw_spin_lock_irq(&syslog_lock);
 		if (!prb_read_valid(prb, syslog_seq, &r)) {
-			raw_spin_unlock(&syslog_lock);
-			printk_safe_exit_irq();
+			raw_spin_unlock_irq(&syslog_lock);
 			break;
 		}
 		if (r.info->seq != syslog_seq) {
@@ -1531,8 +1528,7 @@ static int syslog_print(char __user *buf, int size)
 			syslog_partial += n;
 		} else
 			n = 0;
-		raw_spin_unlock(&syslog_lock);
-		printk_safe_exit_irq();
+		raw_spin_unlock_irq(&syslog_lock);
 
 		if (!n)
 			break;
@@ -1566,7 +1562,6 @@ static int syslog_print_all(char __user *buf, int size, bool clear)
 		return -ENOMEM;
 
 	time = printk_time;
-	printk_safe_enter_irq();
 	/*
 	 * Find first record that fits, including all following records,
 	 * into the user-provided buffer for this dump.
@@ -1587,23 +1582,20 @@ static int syslog_print_all(char __user *buf, int size, bool clear)
 			break;
 		}
 
-		printk_safe_exit_irq();
 		if (copy_to_user(buf + len, text, textlen))
 			len = -EFAULT;
 		else
 			len += textlen;
-		printk_safe_enter_irq();
 
 		if (len < 0)
 			break;
 	}
 
 	if (clear) {
-		raw_spin_lock(&syslog_lock);
+		raw_spin_lock_irq(&syslog_lock);
 		latched_seq_write(&clear_seq, seq);
-		raw_spin_unlock(&syslog_lock);
+		raw_spin_unlock_irq(&syslog_lock);
 	}
-	printk_safe_exit_irq();
 
 	kfree(text);
 	return len;
@@ -1611,11 +1603,9 @@ static int syslog_print_all(char __user *buf, int size, bool clear)
 
 static void syslog_clear(void)
 {
-	printk_safe_enter_irq();
-	raw_spin_lock(&syslog_lock);
+	raw_spin_lock_irq(&syslog_lock);
 	latched_seq_write(&clear_seq, prb_next_seq(prb));
-	raw_spin_unlock(&syslog_lock);
-	printk_safe_exit_irq();
+	raw_spin_unlock_irq(&syslog_lock);
 }
 
 /* Return a consistent copy of @syslog_seq. */
@@ -1703,12 +1693,10 @@ int do_syslog(int type, char __user *buf, int len, int source)
 		break;
 	/* Number of chars in the log buffer */
 	case SYSLOG_ACTION_SIZE_UNREAD:
-		printk_safe_enter_irq();
-		raw_spin_lock(&syslog_lock);
+		raw_spin_lock_irq(&syslog_lock);
 		if (!prb_read_valid_info(prb, syslog_seq, &info, NULL)) {
 			/* No unread messages. */
-			raw_spin_unlock(&syslog_lock);
-			printk_safe_exit_irq();
+			raw_spin_unlock_irq(&syslog_lock);
 			return 0;
 		}
 		if (info.seq != syslog_seq) {
@@ -1736,8 +1724,7 @@ int do_syslog(int type, char __user *buf, int len, int source)
 			}
 			error -= syslog_partial;
 		}
-		raw_spin_unlock(&syslog_lock);
-		printk_safe_exit_irq();
+		raw_spin_unlock_irq(&syslog_lock);
 		break;
 	/* Size of the log buffer */
 	case SYSLOG_ACTION_SIZE_BUFFER:
@@ -1772,16 +1759,21 @@ static struct task_struct *console_owner;
 static bool console_waiter;
 
 /**
- * console_lock_spinning_enable - mark beginning of code where another
+ * console_lock_spinning_enable_irqsave - mark beginning of code where another
  *	thread might safely busy wait
  *
  * This basically converts console_lock into a spinlock. This marks
  * the section where the console_lock owner can not sleep, because
  * there may be a waiter spinning (like a spinlock). Also it must be
  * ready to hand over the lock at the end of the section.
+ *
+ * This disables interrupts because the hand over to a waiter must not be
+ * interrupted until the hand over is completed (@console_waiter is cleared).
  */
-static void console_lock_spinning_enable(void)
+static void console_lock_spinning_enable_irqsave(unsigned long *flags)
 {
+	local_irq_save(*flags);
+
 	raw_spin_lock(&console_owner_lock);
 	console_owner = current;
 	raw_spin_unlock(&console_owner_lock);
@@ -1791,8 +1783,8 @@ static void console_lock_spinning_enable(void)
 }
 
 /**
- * console_lock_spinning_disable_and_check - mark end of code where another
- *	thread was able to busy wait and check if there is a waiter
+ * console_lock_spinning_disable_and_check_irqrestore - mark end of code where
+ *	another thread was able to busy wait and check if there is a waiter
  *
  * This is called at the end of the section where spinning is allowed.
  * It has two functions. First, it is a signal that it is no longer
@@ -1805,7 +1797,7 @@ static void console_lock_spinning_enable(void)
  *
  * Return: 1 if the lock rights were passed, 0 otherwise.
  */
-static int console_lock_spinning_disable_and_check(void)
+static int console_lock_spinning_disable_and_check_irqrestore(unsigned long flags)
 {
 	int waiter;
 
@@ -1816,6 +1808,7 @@ static int console_lock_spinning_disable_and_check(void)
 
 	if (!waiter) {
 		spin_release(&console_owner_dep_map, _THIS_IP_);
+		local_irq_restore(flags);
 		return 0;
 	}
 
@@ -1829,6 +1822,7 @@ static int console_lock_spinning_disable_and_check(void)
 	 * the up(). After this, the waiter is the console_lock owner.
 	 */
 	mutex_release(&console_lock_dep_map, _THIS_IP_);
+	local_irq_restore(flags);
 	return 1;
 }
 
@@ -1852,7 +1846,7 @@ static int console_trylock_spinning(void)
 	if (console_trylock())
 		return 1;
 
-	printk_safe_enter_irqsave(flags);
+	local_irq_save(flags);
 
 	raw_spin_lock(&console_owner_lock);
 	owner = READ_ONCE(console_owner);
@@ -1873,7 +1867,7 @@ static int console_trylock_spinning(void)
 	 * that active printer isn't us (recursive printk?).
 	 */
 	if (!spin) {
-		printk_safe_exit_irqrestore(flags);
+		local_irq_restore(flags);
 		return 0;
 	}
 
@@ -1884,7 +1878,7 @@ static int console_trylock_spinning(void)
 		cpu_relax();
 	spin_release(&console_owner_dep_map, _THIS_IP_);
 
-	printk_safe_exit_irqrestore(flags);
+	local_irq_restore(flags);
 	/*
 	 * The owner passed the console lock to us.
 	 * Since we did not spin on console lock, annotate
@@ -2216,7 +2210,6 @@ asmlinkage int vprintk_emit(int facility, int level,
 {
 	int printed_len;
 	bool in_sched = false;
-	unsigned long flags;
 
 	/* Suppress unimportant messages after panic happens */
 	if (unlikely(suppress_printk))
@@ -2230,9 +2223,7 @@ asmlinkage int vprintk_emit(int facility, int level,
 	boot_delay_msec(level);
 	printk_delay();
 
-	printk_safe_enter_irqsave(flags);
 	printed_len = vprintk_store(facility, level, dev_info, fmt, args);
-	printk_safe_exit_irqrestore(flags);
 
 	/* If called from the scheduler, we can not call up(). */
 	if (!in_sched) {
@@ -2663,7 +2654,6 @@ void console_unlock(void)
 		size_t ext_len = 0;
 		size_t len;
 
-		printk_safe_enter_irqsave(flags);
 skip:
 		if (!prb_read_valid(prb, console_seq, &r))
 			break;
@@ -2714,18 +2704,14 @@ void console_unlock(void)
 		 * finish. This task can not be preempted if there is a
 		 * waiter waiting to take over.
 		 */
-		console_lock_spinning_enable();
+		console_lock_spinning_enable_irqsave(&flags);
 
 		stop_critical_timings();	/* don't trace print latency */
 		call_console_drivers(ext_text, ext_len, text, len);
 		start_critical_timings();
 
-		if (console_lock_spinning_disable_and_check()) {
-			printk_safe_exit_irqrestore(flags);
+		if (console_lock_spinning_disable_and_check_irqrestore(flags))
 			return;
-		}
-
-		printk_safe_exit_irqrestore(flags);
 
 		if (do_cond_resched)
 			cond_resched();
@@ -2742,8 +2728,6 @@ void console_unlock(void)
 	 * flush, no worries.
 	 */
 	retry = prb_read_valid(prb, console_seq, NULL);
-	printk_safe_exit_irqrestore(flags);
-
 	if (retry && console_trylock())
 		goto again;
 }
@@ -2805,13 +2789,8 @@ void console_flush_on_panic(enum con_flush_mode mode)
 	console_trylock();
 	console_may_schedule = 0;
 
-	if (mode == CONSOLE_REPLAY_ALL) {
-		unsigned long flags;
-
-		printk_safe_enter_irqsave(flags);
+	if (mode == CONSOLE_REPLAY_ALL)
 		console_seq = prb_first_valid_seq(prb);
-		printk_safe_exit_irqrestore(flags);
-	}
 	console_unlock();
 }
 
@@ -3463,14 +3442,12 @@ bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
 	struct printk_info info;
 	unsigned int line_count;
 	struct printk_record r;
-	unsigned long flags;
 	size_t l = 0;
 	bool ret = false;
 
 	if (iter->cur_seq < min_seq)
 		iter->cur_seq = min_seq;
 
-	printk_safe_enter_irqsave(flags);
 	prb_rec_init_rd(&r, &info, line, size);
 
 	/* Read text or count text lines? */
@@ -3491,7 +3468,6 @@ bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
 	iter->cur_seq = r.info->seq + 1;
 	ret = true;
 out:
-	printk_safe_exit_irqrestore(flags);
 	if (len)
 		*len = l;
 	return ret;
@@ -3523,7 +3499,6 @@ bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
 	u64 min_seq = latched_seq_read_nolock(&clear_seq);
 	struct printk_info info;
 	struct printk_record r;
-	unsigned long flags;
 	u64 seq;
 	u64 next_seq;
 	size_t len = 0;
@@ -3536,7 +3511,6 @@ bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
 	if (iter->cur_seq < min_seq)
 		iter->cur_seq = min_seq;
 
-	printk_safe_enter_irqsave(flags);
 	if (prb_read_valid_info(prb, iter->cur_seq, &info, NULL)) {
 		if (info.seq != iter->cur_seq) {
 			/* messages are gone, move to first available one */
@@ -3545,10 +3519,8 @@ bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
 	}
 
 	/* last entry */
-	if (iter->cur_seq >= iter->next_seq) {
-		printk_safe_exit_irqrestore(flags);
+	if (iter->cur_seq >= iter->next_seq)
 		goto out;
-	}
 
 	/*
 	 * Find first record that fits, including all following records,
@@ -3580,7 +3552,6 @@ bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
 
 	iter->next_seq = next_seq;
 	ret = true;
-	printk_safe_exit_irqrestore(flags);
 out:
 	if (len_out)
 		*len_out = len;
@@ -3598,12 +3569,8 @@ EXPORT_SYMBOL_GPL(kmsg_dump_get_buffer);
  */
 void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
 {
-	unsigned long flags;
-
-	printk_safe_enter_irqsave(flags);
 	iter->cur_seq = latched_seq_read_nolock(&clear_seq);
 	iter->next_seq = prb_next_seq(prb);
-	printk_safe_exit_irqrestore(flags);
 }
 EXPORT_SYMBOL_GPL(kmsg_dump_rewind);
 
diff --git a/kernel/printk/printk_safe.c b/kernel/printk/printk_safe.c
index 7a1414622051..4b5df5c27334 100644
--- a/kernel/printk/printk_safe.c
+++ b/kernel/printk/printk_safe.c
@@ -15,286 +15,9 @@
 
 #include "internal.h"
 
-/*
- * In NMI and safe mode, printk() avoids taking locks. Instead,
- * it uses an alternative implementation that temporary stores
- * the strings into a per-CPU buffer. The content of the buffer
- * is later flushed into the main ring buffer via IRQ work.
- *
- * The alternative implementation is chosen transparently
- * by examining current printk() context mask stored in @printk_context
- * per-CPU variable.
- *
- * The implementation allows to flush the strings also from another CPU.
- * There are situations when we want to make sure that all buffers
- * were handled or when IRQs are blocked.
- */
-
-#define SAFE_LOG_BUF_LEN ((1 << CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT) -	\
-				sizeof(atomic_t) -			\
-				sizeof(atomic_t) -			\
-				sizeof(struct irq_work))
-
-struct printk_safe_seq_buf {
-	atomic_t		len;	/* length of written data */
-	atomic_t		message_lost;
-	struct irq_work		work;	/* IRQ work that flushes the buffer */
-	unsigned char		buffer[SAFE_LOG_BUF_LEN];
-};
-
-static DEFINE_PER_CPU(struct printk_safe_seq_buf, safe_print_seq);
 static DEFINE_PER_CPU(int, printk_context);
 
-static DEFINE_RAW_SPINLOCK(safe_read_lock);
-
-#ifdef CONFIG_PRINTK_NMI
-static DEFINE_PER_CPU(struct printk_safe_seq_buf, nmi_print_seq);
-#endif
-
-/* Get flushed in a more safe context. */
-static void queue_flush_work(struct printk_safe_seq_buf *s)
-{
-	if (printk_percpu_data_ready())
-		irq_work_queue(&s->work);
-}
-
-/*
- * Add a message to per-CPU context-dependent buffer. NMI and printk-safe
- * have dedicated buffers, because otherwise printk-safe preempted by
- * NMI-printk would have overwritten the NMI messages.
- *
- * The messages are flushed from irq work (or from panic()), possibly,
- * from other CPU, concurrently with printk_safe_log_store(). Should this
- * happen, printk_safe_log_store() will notice the buffer->len mismatch
- * and repeat the write.
- */
-static __printf(2, 0) int printk_safe_log_store(struct printk_safe_seq_buf *s,
-						const char *fmt, va_list args)
-{
-	int add;
-	size_t len;
-	va_list ap;
-
-again:
-	len = atomic_read(&s->len);
-
-	/* The trailing '\0' is not counted into len. */
-	if (len >= sizeof(s->buffer) - 1) {
-		atomic_inc(&s->message_lost);
-		queue_flush_work(s);
-		return 0;
-	}
-
-	/*
-	 * Make sure that all old data have been read before the buffer
-	 * was reset. This is not needed when we just append data.
-	 */
-	if (!len)
-		smp_rmb();
-
-	va_copy(ap, args);
-	add = vscnprintf(s->buffer + len, sizeof(s->buffer) - len, fmt, ap);
-	va_end(ap);
-	if (!add)
-		return 0;
-
-	/*
-	 * Do it once again if the buffer has been flushed in the meantime.
-	 * Note that atomic_cmpxchg() is an implicit memory barrier that
-	 * makes sure that the data were written before updating s->len.
-	 */
-	if (atomic_cmpxchg(&s->len, len, len + add) != len)
-		goto again;
-
-	queue_flush_work(s);
-	return add;
-}
-
-static inline void printk_safe_flush_line(const char *text, int len)
-{
-	/*
-	 * Avoid any console drivers calls from here, because we may be
-	 * in NMI or printk_safe context (when in panic). The messages
-	 * must go only into the ring buffer at this stage.  Consoles will
-	 * get explicitly called later when a crashdump is not generated.
-	 */
-	printk_deferred("%.*s", len, text);
-}
-
-/* printk part of the temporary buffer line by line */
-static int printk_safe_flush_buffer(const char *start, size_t len)
-{
-	const char *c, *end;
-	bool header;
-
-	c = start;
-	end = start + len;
-	header = true;
-
-	/* Print line by line. */
-	while (c < end) {
-		if (*c == '\n') {
-			printk_safe_flush_line(start, c - start + 1);
-			start = ++c;
-			header = true;
-			continue;
-		}
-
-		/* Handle continuous lines or missing new line. */
-		if ((c + 1 < end) && printk_get_level(c)) {
-			if (header) {
-				c = printk_skip_level(c);
-				continue;
-			}
-
-			printk_safe_flush_line(start, c - start);
-			start = c++;
-			header = true;
-			continue;
-		}
-
-		header = false;
-		c++;
-	}
-
-	/* Check if there was a partial line. Ignore pure header. */
-	if (start < end && !header) {
-		static const char newline[] = KERN_CONT "\n";
-
-		printk_safe_flush_line(start, end - start);
-		printk_safe_flush_line(newline, strlen(newline));
-	}
-
-	return len;
-}
-
-static void report_message_lost(struct printk_safe_seq_buf *s)
-{
-	int lost = atomic_xchg(&s->message_lost, 0);
-
-	if (lost)
-		printk_deferred("Lost %d message(s)!\n", lost);
-}
-
-/*
- * Flush data from the associated per-CPU buffer. The function
- * can be called either via IRQ work or independently.
- */
-static void __printk_safe_flush(struct irq_work *work)
-{
-	struct printk_safe_seq_buf *s =
-		container_of(work, struct printk_safe_seq_buf, work);
-	unsigned long flags;
-	size_t len;
-	int i;
-
-	/*
-	 * The lock has two functions. First, one reader has to flush all
-	 * available message to make the lockless synchronization with
-	 * writers easier. Second, we do not want to mix messages from
-	 * different CPUs. This is especially important when printing
-	 * a backtrace.
-	 */
-	raw_spin_lock_irqsave(&safe_read_lock, flags);
-
-	i = 0;
-more:
-	len = atomic_read(&s->len);
-
-	/*
-	 * This is just a paranoid check that nobody has manipulated
-	 * the buffer an unexpected way. If we printed something then
-	 * @len must only increase. Also it should never overflow the
-	 * buffer size.
-	 */
-	if ((i && i >= len) || len > sizeof(s->buffer)) {
-		const char *msg = "printk_safe_flush: internal error\n";
-
-		printk_safe_flush_line(msg, strlen(msg));
-		len = 0;
-	}
-
-	if (!len)
-		goto out; /* Someone else has already flushed the buffer. */
-
-	/* Make sure that data has been written up to the @len */
-	smp_rmb();
-	i += printk_safe_flush_buffer(s->buffer + i, len - i);
-
-	/*
-	 * Check that nothing has got added in the meantime and truncate
-	 * the buffer. Note that atomic_cmpxchg() is an implicit memory
-	 * barrier that makes sure that the data were copied before
-	 * updating s->len.
-	 */
-	if (atomic_cmpxchg(&s->len, len, 0) != len)
-		goto more;
-
-out:
-	report_message_lost(s);
-	raw_spin_unlock_irqrestore(&safe_read_lock, flags);
-}
-
-/**
- * printk_safe_flush - flush all per-cpu nmi buffers.
- *
- * The buffers are flushed automatically via IRQ work. This function
- * is useful only when someone wants to be sure that all buffers have
- * been flushed at some point.
- */
-void printk_safe_flush(void)
-{
-	int cpu;
-
-	for_each_possible_cpu(cpu) {
-#ifdef CONFIG_PRINTK_NMI
-		__printk_safe_flush(&per_cpu(nmi_print_seq, cpu).work);
-#endif
-		__printk_safe_flush(&per_cpu(safe_print_seq, cpu).work);
-	}
-}
-
-/**
- * printk_safe_flush_on_panic - flush all per-cpu nmi buffers when the system
- *	goes down.
- *
- * Similar to printk_safe_flush() but it can be called even in NMI context when
- * the system goes down. It does the best effort to get NMI messages into
- * the main ring buffer.
- *
- * Note that it could try harder when there is only one CPU online.
- */
-void printk_safe_flush_on_panic(void)
-{
-	/*
-	 * Make sure that we could access the safe buffers.
-	 * Do not risk a double release when more CPUs are up.
-	 */
-	if (raw_spin_is_locked(&safe_read_lock)) {
-		if (num_online_cpus() > 1)
-			return;
-
-		debug_locks_off();
-		raw_spin_lock_init(&safe_read_lock);
-	}
-
-	printk_safe_flush();
-}
-
 #ifdef CONFIG_PRINTK_NMI
-/*
- * Safe printk() for NMI context. It uses a per-CPU buffer to
- * store the message. NMIs are not nested, so there is always only
- * one writer running. But the buffer might get flushed from another
- * CPU, so we need to be careful.
- */
-static __printf(1, 0) int vprintk_nmi(const char *fmt, va_list args)
-{
-	struct printk_safe_seq_buf *s = this_cpu_ptr(&nmi_print_seq);
-
-	return printk_safe_log_store(s, fmt, args);
-}
-
 void noinstr printk_nmi_enter(void)
 {
 	this_cpu_add(printk_context, PRINTK_NMI_CONTEXT_OFFSET);
@@ -309,9 +32,6 @@ void noinstr printk_nmi_exit(void)
  * Marks a code that might produce many messages in NMI context
  * and the risk of losing them is more critical than eventual
  * reordering.
- *
- * It has effect only when called in NMI context. Then printk()
- * will store the messages into the main logbuf directly.
  */
 void printk_nmi_direct_enter(void)
 {
@@ -324,27 +44,8 @@ void printk_nmi_direct_exit(void)
 	this_cpu_and(printk_context, ~PRINTK_NMI_DIRECT_CONTEXT_MASK);
 }
 
-#else
-
-static __printf(1, 0) int vprintk_nmi(const char *fmt, va_list args)
-{
-	return 0;
-}
-
 #endif /* CONFIG_PRINTK_NMI */
 
-/*
- * Lock-less printk(), to avoid deadlocks should the printk() recurse
- * into itself. It uses a per-CPU buffer to store the message, just like
- * NMI.
- */
-static __printf(1, 0) int vprintk_safe(const char *fmt, va_list args)
-{
-	struct printk_safe_seq_buf *s = this_cpu_ptr(&safe_print_seq);
-
-	return printk_safe_log_store(s, fmt, args);
-}
-
 /* Can be preempted by NMI. */
 void __printk_safe_enter(void)
 {
@@ -369,7 +70,10 @@ asmlinkage int vprintk(const char *fmt, va_list args)
 	 * Use the main logbuf even in NMI. But avoid calling console
 	 * drivers that might have their own locks.
 	 */
-	if ((this_cpu_read(printk_context) & PRINTK_NMI_DIRECT_CONTEXT_MASK)) {
+	if (this_cpu_read(printk_context) &
+	    (PRINTK_NMI_DIRECT_CONTEXT_MASK |
+	     PRINTK_NMI_CONTEXT_MASK |
+	     PRINTK_SAFE_CONTEXT_MASK)) {
 		unsigned long flags;
 		int len;
 
@@ -380,35 +84,6 @@ asmlinkage int vprintk(const char *fmt, va_list args)
 		return len;
 	}
 
-	/* Use extra buffer in NMI. */
-	if (this_cpu_read(printk_context) & PRINTK_NMI_CONTEXT_MASK)
-		return vprintk_nmi(fmt, args);
-
-	/* Use extra buffer to prevent a recursion deadlock in safe mode. */
-	if (this_cpu_read(printk_context) & PRINTK_SAFE_CONTEXT_MASK)
-		return vprintk_safe(fmt, args);
-
 	/* No obstacles. */
 	return vprintk_default(fmt, args);
 }
-
-void __init printk_safe_init(void)
-{
-	int cpu;
-
-	for_each_possible_cpu(cpu) {
-		struct printk_safe_seq_buf *s;
-
-		s = &per_cpu(safe_print_seq, cpu);
-		init_irq_work(&s->work, __printk_safe_flush);
-
-#ifdef CONFIG_PRINTK_NMI
-		s = &per_cpu(nmi_print_seq, cpu);
-		init_irq_work(&s->work, __printk_safe_flush);
-#endif
-	}
-
-	/* Flush pending messages that did not have scheduled IRQ works. */
-	printk_safe_flush();
-}
-EXPORT_SYMBOL(vprintk);
diff --git a/lib/nmi_backtrace.c b/lib/nmi_backtrace.c
index 8abe1870dba4..b09a490f5f70 100644
--- a/lib/nmi_backtrace.c
+++ b/lib/nmi_backtrace.c
@@ -75,12 +75,6 @@ void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
 		touch_softlockup_watchdog();
 	}
 
-	/*
-	 * Force flush any remote buffers that might be stuck in IRQ context
-	 * and therefore could not run their irq_work.
-	 */
-	printk_safe_flush();
-
 	clear_bit_unlock(0, &backtrace_flag);
 	put_cpu();
 }
-- 
2.20.1

