Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C4A44BA76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 03:53:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpqDL6sVCz2ywW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 13:53:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bVvEHR1U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bVvEHR1U; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpq9b66hqz2yPh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 13:51:15 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id m26so1306390pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 18:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yu9L+78ua4GDf6lkrwHm+EKhzToXSTtrsl6iwYrynFw=;
 b=bVvEHR1UgQLaTUOdmKo/xTs4BBpSxSgbvtMjXWXLDpSxgmfTIqwpn4JuP0GqtPz+2w
 2nRgnhlMVsvlMepHygJ+ZOX4chMH+Jgmbm85Dthxd5ZsRGHQOGhznJIgDg0NsFCuox/A
 tkPpx2xvvl8rmn6iUUJ+FWC5lI289TAmCERomHfHlpQe9+HeOqOc8fkKiFe1O9KwVsh3
 3RGn75+xeb5t/6yyh9m8Lhc/hBPfzc3E1rjyG68kVBs7qQLztLyqM8YqCmNN9SXu58It
 Ktvb7rKdx4EfqHl4BIRrAawHLc70H6tW6wPcSlMGCt50MHQ/NbYnaubT9Gx3HhULP21o
 nR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yu9L+78ua4GDf6lkrwHm+EKhzToXSTtrsl6iwYrynFw=;
 b=y/wrQx09eNrO/yuV90a25jqEz0rZ8j5mNCzEHH22VWL7CltLfD8LmBA8H+HSgyN3m1
 GEJCBmfVzDzB1CReVdcrH68AcZw9B5epnjhTDVl11yk0ElXKDch0Wfvspbb7TAnhuyDC
 4pbAFEfNJz+Cj/PlZtBUL4YqKiR1cYtMgQcGQ4jr/zMQIjvUGX3fOfhlJaCCqPYDYeB7
 MCgfxTsAkHzrcN8H2kHoTLhnu/RGdt2sinIUnopXrDigNU1DAZcLk+B9R/xidvjwqP6N
 u9X3crip1I2AJ62FoDumnDaPWttHZSJ+GNxLaVI5OOwTyydkYEuUtD2+px8DCp7ftqis
 y4fg==
X-Gm-Message-State: AOAM533v0mLdry9gcnt0c1NJIvUCFOZNQUuu2l7TgKMHN0pMERO9DjWY
 X/W9W6BUNb1h98OGtCDQRNBiYDHkoioY3w==
X-Google-Smtp-Source: ABdhPJzeA5SSLdAaS+YSlbSHLUYnAnXe85/qtLVUQm/jytyHFDRNHMIwme6Ye2iPcj5U9fMgwxBA1A==
X-Received: by 2002:a62:7a54:0:b0:494:6e78:994b with SMTP id
 v81-20020a627a54000000b004946e78994bmr46176260pfc.5.1636512673304; 
 Tue, 09 Nov 2021 18:51:13 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.146.48.179])
 by smtp.gmail.com with ESMTPSA id b4sm21604406pfl.60.2021.11.09.18.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 18:51:13 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/4] powerpc/watchdog: Avoid holding wd_smp_lock over
 printk and smp_send_nmi_ipi
Date: Wed, 10 Nov 2021 12:50:55 +1000
Message-Id: <20211110025056.2084347-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211110025056.2084347-1-npiggin@gmail.com>
References: <20211110025056.2084347-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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
 arch/powerpc/kernel/watchdog.c | 93 +++++++++++++++++++++++++++-------
 1 file changed, 74 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 668ea1c13bef..1b11c4b1c79e 100644
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
@@ -151,6 +177,7 @@ static bool set_cpu_stuck(int cpu, u64 tb)
 
 static void watchdog_smp_panic(int cpu, u64 tb)
 {
+	static cpumask_t wd_smp_cpus_ipi; // protected by reporting
 	unsigned long flags;
 	int c;
 
@@ -160,11 +187,26 @@ static void watchdog_smp_panic(int cpu, u64 tb)
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
 		 cpu, tb, wd_smp_last_reset_tb,
 		 tb_to_ns(tb - wd_smp_last_reset_tb) / 1000000);
@@ -174,26 +216,20 @@ static void watchdog_smp_panic(int cpu, u64 tb)
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
 
 	if (hardlockup_panic)
 		nmi_panic(NULL, "Hard LOCKUP");
 
+	wd_end_reporting();
+
 	return;
 
 out:
@@ -207,8 +243,6 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 			struct pt_regs *regs = get_irq_regs();
 			unsigned long flags;
 
-			wd_smp_lock(&flags);
-
 			pr_emerg("CPU %d became unstuck TB:%lld\n",
 				 cpu, tb);
 			print_irqtrace_events(current);
@@ -217,6 +251,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 			else
 				dump_stack();
 
+			wd_smp_lock(&flags);
 			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
 			wd_smp_unlock(&flags);
 		} else {
@@ -312,13 +347,28 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 
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
@@ -328,14 +378,19 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
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

