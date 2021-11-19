Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E0456E44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 12:34:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwZM44FZBz3c5F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 22:34:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZZAR8gZB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZZAR8gZB; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwZJP08fqz301g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 22:32:04 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id b11so7885276pld.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 03:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=840qpGoOaQomLKQnTFv1++UtXLylpSHRhF54Gmo/a/E=;
 b=ZZAR8gZBxjpw1512A9JXX2SZCxzVITcK7tRXeCwkta/3dMyOhqveMSCZQB9PE1DWb6
 xCYcYmrTH82SUdV5N/eFbY0eKLzYnWwWifp/Q0pr/2F+vIIYLYehNnjN+QM8n+OoOfXh
 04vBd4VIx3pR1AyAMh2mrm6l1PRtyvKqXqAYKPgFFlUpe2ZT4MowXORAA0vulBNU8Lnr
 u65530UnyV7G5Z8YFLkj4xIJXitTmIY3j3SZkwqFgXakJ5JOBHlfTj8apTK+t+2yPWen
 fS+Usi8ksuL+xpaxx4851agM2Df1SAzCBFQvipQI9xUHgnFFUqHzB1RKb623vHEkwDiG
 /7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=840qpGoOaQomLKQnTFv1++UtXLylpSHRhF54Gmo/a/E=;
 b=A6t2c5SV1sd/iulF6qD0HtBkPPMjZcxHVJ0vn6ZbVmMIG+xkFh1gsFfGxLnlRzQWKy
 OxH7PzdzUUXWhwayQAiNV4s1YjxjgEjNbyLgmcp3SuoOUNLob0fHcMOOauNQ9N/4O7hx
 a7a4a0dQki17mbenMancrZQPyQno02t6/Uvt8VZknKkausDtQEc3DYqJW8TAp8qFd1br
 XUVM7aQPFxtc4h+mlqmFFecGMETbrn/h/VE4gN36KLnATCK5NEHv45bDSH8mplrEx+8k
 coSYbECORfeY+kKLKVzQH65CLWL62vc7/b6TB3lR0m0qChY2jrv6LOBpigyU50st28hw
 ODKg==
X-Gm-Message-State: AOAM531YJXYHdL05aGNzxGf8msdxqhnqAkAxQswUV7EFzJ7Dzm9f8z7O
 C/hQrWYfAe1OoTsoIPtYWATAxSDQ9e8=
X-Google-Smtp-Source: ABdhPJwXjzy4cpfFekxiGns2qm/W1s6yKUkjMuq64UFAs5lmUOcAzS0mISp8OHATeVCmd7k/UNW+OA==
X-Received: by 2002:a17:90b:4c8c:: with SMTP id
 my12mr3724859pjb.157.1637321522392; 
 Fri, 19 Nov 2021 03:32:02 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-240-2-228.tpgi.com.au. [60.240.2.228])
 by smtp.gmail.com with ESMTPSA id
 g17sm2632626pfv.136.2021.11.19.03.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:32:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 3/5] powerpc/watchdog: Avoid holding wd_smp_lock over
 printk and smp_send_nmi_ipi
Date: Fri, 19 Nov 2021 21:31:44 +1000
Message-Id: <20211119113146.752759-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211119113146.752759-1-npiggin@gmail.com>
References: <20211119113146.752759-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a deadlock with the console_owner lock and the wd_smp_lock:

CPU x takes the console_owner lock
CPU y takes a watchdog timer interrupt and takes __wd_smp_lock
CPU x takes a soft-NMI interrupt, detects deadlock, spins on __wd_smp_lock
CPU y detects deadlock, tries to print something and spins on console_owner
-> deadlock

Change the watchdog locking scheme so wd_smp_lock protects the watchdog
internal data, but "reporting" (printing, issuing NMI IPIs, taking any
action outside of watchdog) uses a non-waiting exclusion. If a CPU detects
a problem but can not take the reporting lock, it just returns because
something else is already reporting. It will try again at some point.

Typically hard lockup watchdog report usefulness is not impacted due to
failure to spewing a large enough amount of data in as short a time as
possible, but by messages getting garbled.

Laurent debugged this and found the deadlock, and this patch is based on
his general approach to avoid expensive operations while holding the lock.
With the addition of the reporting exclusion.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
[np: rework to add reporting exclusion update changelog]
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 100 +++++++++++++++++++++++++--------
 1 file changed, 78 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 588f54350d19..cfd45049ec7f 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -85,10 +85,36 @@ static DEFINE_PER_CPU(u64, wd_timer_tb);
 
 /* SMP checker bits */
 static unsigned long __wd_smp_lock;
+static unsigned long __wd_reporting;
 static cpumask_t wd_smp_cpus_pending;
 static cpumask_t wd_smp_cpus_stuck;
 static u64 wd_smp_last_reset_tb;
 
+/*
+ * Try to take the exclusive watchdog action / NMI IPI / printing lock.
+ * wd_smp_lock must be held. If this fails, we should return and wait
+ * for the watchdog to kick in again (or another CPU to trigger it).
+ *
+ * Importantly, if hardlockup_panic is set, wd_try_report failure should
+ * not delay the panic, because whichever other CPU is reporting will
+ * call panic.
+ */
+static bool wd_try_report(void)
+{
+	if (__wd_reporting)
+		return false;
+	__wd_reporting = 1;
+	return true;
+}
+
+/* End printing after successful wd_try_report. wd_smp_lock not required. */
+static void wd_end_reporting(void)
+{
+	smp_mb(); /* End printing "critical section" */
+	WARN_ON_ONCE(__wd_reporting == 0);
+	WRITE_ONCE(__wd_reporting, 0);
+}
+
 static inline void wd_smp_lock(unsigned long *flags)
 {
 	/*
@@ -151,45 +177,54 @@ static bool set_cpu_stuck(int cpu, u64 tb)
 
 static void watchdog_smp_panic(int cpu, u64 tb)
 {
+	static cpumask_t wd_smp_cpus_ipi; // protected by reporting
 	unsigned long flags;
+	u64 last_reset;
 	int c;
 
 	wd_smp_lock(&flags);
 	/* Double check some things under lock */
-	if ((s64)(tb - wd_smp_last_reset_tb) < (s64)wd_smp_panic_timeout_tb)
+	last_reset = wd_smp_last_reset_tb;
+	if ((s64)(tb - last_reset) < (s64)wd_smp_panic_timeout_tb)
 		goto out;
 	if (cpumask_test_cpu(cpu, &wd_smp_cpus_pending))
 		goto out;
-	if (cpumask_weight(&wd_smp_cpus_pending) == 0)
+	if (!wd_try_report())
 		goto out;
+	for_each_online_cpu(c) {
+		if (!cpumask_test_cpu(c, &wd_smp_cpus_pending))
+			continue;
+		if (c == cpu)
+			continue; // should not happen
+
+		__cpumask_set_cpu(c, &wd_smp_cpus_ipi);
+		if (set_cpu_stuck(c, tb))
+			break;
+	}
+	if (cpumask_empty(&wd_smp_cpus_ipi)) {
+		wd_end_reporting();
+		goto out;
+	}
+	wd_smp_unlock(&flags);
 
 	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
-		 cpu, cpumask_pr_args(&wd_smp_cpus_pending));
+		 cpu, cpumask_pr_args(&wd_smp_cpus_ipi));
 	pr_emerg("CPU %d TB:%lld, last SMP heartbeat TB:%lld (%lldms ago)\n",
-		 cpu, tb, wd_smp_last_reset_tb,
-		 tb_to_ns(tb - wd_smp_last_reset_tb) / 1000000);
+		 cpu, tb, last_reset, tb_to_ns(tb - last_reset) / 1000000);
 
 	if (!sysctl_hardlockup_all_cpu_backtrace) {
 		/*
 		 * Try to trigger the stuck CPUs, unless we are going to
 		 * get a backtrace on all of them anyway.
 		 */
-		for_each_cpu(c, &wd_smp_cpus_pending) {
-			bool empty;
-			if (c == cpu)
-				continue;
-			/* Take the stuck CPUs out of the watch group */
-			empty = set_cpu_stuck(c, tb);
+		for_each_cpu(c, &wd_smp_cpus_ipi) {
 			smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
-			if (empty)
-				break;
+			__cpumask_clear_cpu(c, &wd_smp_cpus_ipi);
 		}
-	}
-
-	wd_smp_unlock(&flags);
-
-	if (sysctl_hardlockup_all_cpu_backtrace)
+	} else {
 		trigger_allbutself_cpu_backtrace();
+		cpumask_clear(&wd_smp_cpus_ipi);
+	}
 
 	/*
 	 * Force flush any remote buffers that might be stuck in IRQ context
@@ -200,6 +235,8 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 	if (hardlockup_panic)
 		nmi_panic(NULL, "Hard LOCKUP");
 
+	wd_end_reporting();
+
 	return;
 
 out:
@@ -213,8 +250,6 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 			struct pt_regs *regs = get_irq_regs();
 			unsigned long flags;
 
-			wd_smp_lock(&flags);
-
 			pr_emerg("CPU %d became unstuck TB:%lld\n",
 				 cpu, tb);
 			print_irqtrace_events(current);
@@ -223,6 +258,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 			else
 				dump_stack();
 
+			wd_smp_lock(&flags);
 			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
 			wd_smp_unlock(&flags);
 		} else {
@@ -318,13 +354,28 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 
 	tb = get_tb();
 	if (tb - per_cpu(wd_timer_tb, cpu) >= wd_panic_timeout_tb) {
+		/*
+		 * Taking wd_smp_lock here means it is a soft-NMI lock, which
+		 * means we can't take any regular or irqsafe spin locks while
+		 * holding this lock. This is why timers can't printk while
+		 * holding the lock.
+		 */
 		wd_smp_lock(&flags);
 		if (cpumask_test_cpu(cpu, &wd_smp_cpus_stuck)) {
 			wd_smp_unlock(&flags);
 			return 0;
 		}
+		if (!wd_try_report()) {
+			wd_smp_unlock(&flags);
+			/* Couldn't report, try again in 100ms */
+			mtspr(SPRN_DEC, 100 * tb_ticks_per_usec * 1000);
+			return 0;
+		}
+
 		set_cpu_stuck(cpu, tb);
 
+		wd_smp_unlock(&flags);
+
 		pr_emerg("CPU %d self-detected hard LOCKUP @ %pS\n",
 			 cpu, (void *)regs->nip);
 		pr_emerg("CPU %d TB:%lld, last heartbeat TB:%lld (%lldms ago)\n",
@@ -334,14 +385,19 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 		print_irqtrace_events(current);
 		show_regs(regs);
 
-		wd_smp_unlock(&flags);
-
 		if (sysctl_hardlockup_all_cpu_backtrace)
 			trigger_allbutself_cpu_backtrace();
 
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
+
+		wd_end_reporting();
 	}
+	/*
+	 * We are okay to change DEC in soft_nmi_interrupt because the masked
+	 * handler has marked a DEC as pending, so the timer interrupt will be
+	 * replayed as soon as local irqs are enabled again.
+	 */
 	if (wd_panic_timeout_tb < 0x7fffffff)
 		mtspr(SPRN_DEC, wd_panic_timeout_tb);
 
-- 
2.23.0

