Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4E43F910
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 10:40:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgbV61P84z30Qv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 19:40:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mY+4UW+L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mY+4UW+L; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgbSm5CK2z2xF5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 19:39:19 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id y1so6357323plk.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UxoZPzEYBnlvS++2WX8Dau/qYGtNwT5hhtxkroQh/LQ=;
 b=mY+4UW+L2N1x8E66fSar/NeNC2wtvHwP0kJiouHC6wiU5PLtJSz8+G/9PG7b3cYbXp
 2+mk2dJPr4WrTo/r1KFSSkYTpEApM+hNB9p2jQNdPUF+0TCen4AxKN8Ohvl4naKic61s
 npnFdc13iCkJPc4bcOpiAWkqgZK0ViBmdZhvtcokqn0JZGFxO8KbRyycIgGWWbcD7BRT
 T5lkzKROvuy1g4hAxLh7PAZ30l+vJ5r2ztDPmpDsQGtoDMnoaOGddp8yF7GtSecNiQpa
 D/1BeQ3RmB8tI57qW9WobegXy481SjhVVr9TY2z2pdo4FilwBemAhfO/5FbhtM2scl3T
 Mt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UxoZPzEYBnlvS++2WX8Dau/qYGtNwT5hhtxkroQh/LQ=;
 b=oIl/1zuEVPziV7quRG4iw5c0K38p4N/9dY/Z/8kz6GqmGkwcVj3DJcGKYnXV8blC/w
 RUhTdM3gERCNZW0wiKWLOj22CdY5dULXF7+7JldoAyTEZGhOPTvuOfsk7PaEE9nSTzja
 2MrbnNbsmdoSlWhMobkwIULESfTjJBFY/4sxENS+T1cfP+LrpY04L+6G6byKXuf9qRdZ
 z5Dcu+6wq7ONdwWrXOR8cdaIbmCqnRWO7iiXGWarusYvkj2vYycwDC+djfOIVde5wBRb
 YdvbAHfcMri7Iev23hJhHXKBMpikepz8cKvxuGeyO8iJGE4cOzM6RdUf/HqtibHLR93O
 fJFA==
X-Gm-Message-State: AOAM5317V0EioSyGF0aAcqvzqjbBpHU/1j/N4CXffIljV1a1yl5OGuVr
 wLOppkiZzy/76CAxRyRNUaBEWyFKDas=
X-Google-Smtp-Source: ABdhPJwcj2mecSRJfJByoWSmU+1WUUuZiCsQpcSwYYDVtRPKhvDqwTEmZzOzfH3houei3Eklzex2ZA==
X-Received: by 2002:a17:902:930c:b0:13e:42b4:9149 with SMTP id
 bc12-20020a170902930c00b0013e42b49149mr8711219plb.86.1635496756969; 
 Fri, 29 Oct 2021 01:39:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id g8sm6211765pfv.123.2021.10.29.01.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:39:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/watchdog: Avoid holding wd_smp_lock over printk
 and smp_send_nmi_ipi
Date: Fri, 29 Oct 2021 18:39:08 +1000
Message-Id: <20211029083908.87931-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211029083908.87931-1-npiggin@gmail.com>
References: <20211029083908.87931-1-npiggin@gmail.com>
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
CPU x takes a watchdog timer interrupt and spins on __wd_smp_lock
CPU y detects a deadlock, tries to print something and spins on console_owner
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
 arch/powerpc/kernel/watchdog.c | 76 ++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 4bb7c8e371a2..69a475aa0f44 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -85,10 +85,32 @@ static DEFINE_PER_CPU(u64, wd_timer_tb);
 
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
@@ -131,10 +153,10 @@ static void wd_lockup_ipi(struct pt_regs *regs)
 	/* Do not panic from here because that can recurse into NMI IPI layer */
 }
 
-static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
+static void set_cpu_stuck(int cpu, u64 tb)
 {
-	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
-	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
+	cpumask_set_cpu(cpu, &wd_smp_cpus_stuck);
+	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
 	if (cpumask_empty(&wd_smp_cpus_pending)) {
 		wd_smp_last_reset_tb = tb;
 		cpumask_andnot(&wd_smp_cpus_pending,
@@ -142,10 +164,6 @@ static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
 				&wd_smp_cpus_stuck);
 	}
 }
-static void set_cpu_stuck(int cpu, u64 tb)
-{
-	set_cpumask_stuck(cpumask_of(cpu), tb);
-}
 
 static void watchdog_smp_panic(int cpu, u64 tb)
 {
@@ -160,6 +178,9 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 		goto out;
 	if (cpumask_weight(&wd_smp_cpus_pending) == 0)
 		goto out;
+	if (!wd_try_report())
+		goto out;
+	wd_smp_unlock(&flags);
 
 	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
 		 cpu, cpumask_pr_args(&wd_smp_cpus_pending));
@@ -172,24 +193,32 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 		 * Try to trigger the stuck CPUs, unless we are going to
 		 * get a backtrace on all of them anyway.
 		 */
-		for_each_cpu(c, &wd_smp_cpus_pending) {
+		for_each_online_cpu(c) {
 			if (c == cpu)
 				continue;
+			if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending))
+				continue;
+			wd_smp_lock(&flags);
+			if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
+				wd_smp_unlock(&flags);
+				continue;
+			}
+			/* Take the stuck CPU out of the watch group */
+			set_cpu_stuck(cpu, tb);
+			wd_smp_unlock(&flags);
+
 			smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
 		}
 	}
 
-	/* Take the stuck CPUs out of the watch group */
-	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
-
-	wd_smp_unlock(&flags);
-
 	if (sysctl_hardlockup_all_cpu_backtrace)
 		trigger_allbutself_cpu_backtrace();
 
 	if (hardlockup_panic)
 		nmi_panic(NULL, "Hard LOCKUP");
 
+	wd_end_reporting();
+
 	return;
 
 out:
@@ -203,8 +232,6 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 			struct pt_regs *regs = get_irq_regs();
 			unsigned long flags;
 
-			wd_smp_lock(&flags);
-
 			pr_emerg("CPU %d became unstuck TB:%lld\n",
 				 cpu, tb);
 			print_irqtrace_events(current);
@@ -213,6 +240,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 			else
 				dump_stack();
 
+			wd_smp_lock(&flags);
 			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
 			wd_smp_unlock(&flags);
 		} else {
@@ -291,8 +319,17 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
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
@@ -302,14 +339,19 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
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

