Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D84B4456F9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 17:14:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlTH31NfBz3cXM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 03:14:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BXlzAauP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BXlzAauP; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlTCV43WZz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 03:11:18 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id p18so7944645plf.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Z1rmn9MlTnS7s8/wUeGnq0xQzld2jtIQLfIQCgpHgA=;
 b=BXlzAauP4mLFnSbf0xcRPEZqKDgvI3Suoivd3cFXomeXqxyGZ4YDlqF4C+dDe/iein
 nN81D9uzXxdGMAWCS3jpdFZaKaNkLtny6eEkEgnc6CqwODY6CFq3mxwz87GhEXFXaCMi
 D4J3JLPBEi1d5dXS/zYqQsS/v2H5vM9qWot65NpoKb6uvaBxagLmWkNzfbIoXlqpw0aw
 MbNzGzoXIVORHaYRXLv68uqelMKgS2MFOO1mwK2Z2b8pox2cE0oe85roMax1ap9Pe9L4
 ZOLKF8bF2fYSNHZgNscIFHWuEx/SEX0UzWV+Feakl/78Y4YzaA0zQL9nQaBgB2CkWFC7
 LMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Z1rmn9MlTnS7s8/wUeGnq0xQzld2jtIQLfIQCgpHgA=;
 b=c+i4SfSkEEXiRfixT24b3LpZXqEKtE4+7VNLAme1JtvY4D5odTBraeJqEJRXvBvYt1
 TyDaVIq/RO7D+VtnF7ar0Y9CUX3ruyfd6cWTeIFNBP4lrMmYi2uliUIPJv2GTGADsdfi
 G5vXyGN1MMnJZAK/BZIoWn/egFlgddJ+akcCi0vbmVwF3b/uuAMsNUdWsp0LSrPAgbep
 aEfYp1IJqxLqTHKegbIstD45QBx7ScLlTZPchPPr/DANzLYmme2MO/cl2O6cT3PB15FU
 hKc22q8tDQG7GPX1wye78lZK6qe9xGepr+DuDbxPU8IrQNYqiQDi+Omv+gLQtA3JEaPb
 P8pw==
X-Gm-Message-State: AOAM532eKPa0Q9zDzWGDklx9NDFLMtuhmIN9XZyvYSFlSh0RtAr8W9xD
 gsVhCkNGNxvGth5+t4Skg3xeVkpfVms=
X-Google-Smtp-Source: ABdhPJzOikm+a/UFRO1yslFZ6G9ZwviyRTpRv4PEhddcV5kwwW0mXN5RRuY655WRT3lMfaAFIe+PCQ==
X-Received: by 2002:a17:90b:fd5:: with SMTP id
 gd21mr21853201pjb.37.1636042272128; 
 Thu, 04 Nov 2021 09:11:12 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 h3sm5897890pfi.207.2021.11.04.09.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:11:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/5] powerpc/watchdog: Read TB close to where it is used
Date: Fri,  5 Nov 2021 02:10:56 +1000
Message-Id: <20211104161057.1255659-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211104161057.1255659-1-npiggin@gmail.com>
References: <20211104161057.1255659-1-npiggin@gmail.com>
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

When taking watchdog actions, printing messages, comparing and
re-setting wd_smp_last_reset_tb, etc., read TB close to the point of use
and under wd_smp_lock or printing lock (if applicable).

This should keep timebase mostly monotonic with kernel log messages, and
could prevent (in theory) a laggy CPU updating wd_smp_last_reset_tb to
something a long way in the past, and causing other CPUs to appear to be
stuck.

These additional TB reads are all slowpath (lockup has been detected),
so performance does not matter.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 0265d27340f1..2444cd10b61a 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -94,6 +94,10 @@ static u64 wd_smp_last_reset_tb;
  * Try to take the exclusive watchdog action / NMI IPI / printing lock.
  * wd_smp_lock must be held. If this fails, we should return and wait
  * for the watchdog to kick in again (or another CPU to trigger it).
+ *
+ * Importantly, if hardlockup_panic is set, wd_try_report failure should
+ * not delay the panic, because whichever other CPU is reporting will
+ * call panic.
  */
 static bool wd_try_report(void)
 {
@@ -153,7 +157,7 @@ static void wd_lockup_ipi(struct pt_regs *regs)
 	/* Do not panic from here because that can recurse into NMI IPI layer */
 }
 
-static bool set_cpu_stuck(int cpu, u64 tb)
+static bool set_cpu_stuck(int cpu)
 {
 	cpumask_set_cpu(cpu, &wd_smp_cpus_stuck);
 	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
@@ -162,7 +166,7 @@ static bool set_cpu_stuck(int cpu, u64 tb)
 	 */
 	smp_mb();
 	if (cpumask_empty(&wd_smp_cpus_pending)) {
-		wd_smp_last_reset_tb = tb;
+		wd_smp_last_reset_tb = get_tb();
 		cpumask_andnot(&wd_smp_cpus_pending,
 				&wd_cpus_enabled,
 				&wd_smp_cpus_stuck);
@@ -171,14 +175,16 @@ static bool set_cpu_stuck(int cpu, u64 tb)
 	return false;
 }
 
-static void watchdog_smp_panic(int cpu, u64 tb)
+static void watchdog_smp_panic(int cpu)
 {
 	static cpumask_t wd_smp_cpus_ipi; // protected by reporting
 	unsigned long flags;
+	u64 tb;
 	int c;
 
 	wd_smp_lock(&flags);
 	/* Double check some things under lock */
+	tb = get_tb();
 	if ((s64)(tb - wd_smp_last_reset_tb) < (s64)wd_smp_panic_timeout_tb)
 		goto out;
 	if (cpumask_test_cpu(cpu, &wd_smp_cpus_pending))
@@ -192,7 +198,7 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 			continue; // should not happen
 
 		__cpumask_set_cpu(c, &wd_smp_cpus_ipi);
-		if (set_cpu_stuck(c, tb))
+		if (set_cpu_stuck(c))
 			break;
 	}
 	if (cpumask_empty(&wd_smp_cpus_ipi)) {
@@ -232,7 +238,7 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 	wd_smp_unlock(&flags);
 }
 
-static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
+static void wd_smp_clear_cpu_pending(int cpu)
 {
 	if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
 		if (unlikely(cpumask_test_cpu(cpu, &wd_smp_cpus_stuck))) {
@@ -240,7 +246,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 			unsigned long flags;
 
 			pr_emerg("CPU %d became unstuck TB:%lld\n",
-				 cpu, tb);
+				 cpu, get_tb());
 			print_irqtrace_events(current);
 			if (regs)
 				show_regs(regs);
@@ -301,7 +307,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 		 */
 		wd_smp_lock(&flags);
 		if (cpumask_empty(&wd_smp_cpus_pending)) {
-			wd_smp_last_reset_tb = tb;
+			wd_smp_last_reset_tb = get_tb();
 			cpumask_andnot(&wd_smp_cpus_pending,
 					&wd_cpus_enabled,
 					&wd_smp_cpus_stuck);
@@ -316,10 +322,10 @@ static void watchdog_timer_interrupt(int cpu)
 
 	per_cpu(wd_timer_tb, cpu) = tb;
 
-	wd_smp_clear_cpu_pending(cpu, tb);
+	wd_smp_clear_cpu_pending(cpu);
 
 	if ((s64)(tb - wd_smp_last_reset_tb) >= (s64)wd_smp_panic_timeout_tb)
-		watchdog_smp_panic(cpu, tb);
+		watchdog_smp_panic(cpu);
 }
 
 DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
@@ -356,7 +362,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 			return 0;
 		}
 
-		set_cpu_stuck(cpu, tb);
+		set_cpu_stuck(cpu);
 
 		wd_smp_unlock(&flags);
 
@@ -417,7 +423,7 @@ void arch_touch_nmi_watchdog(void)
 	tb = get_tb();
 	if (tb - per_cpu(wd_timer_tb, cpu) >= ticks) {
 		per_cpu(wd_timer_tb, cpu) = tb;
-		wd_smp_clear_cpu_pending(cpu, tb);
+		wd_smp_clear_cpu_pending(cpu);
 	}
 }
 EXPORT_SYMBOL(arch_touch_nmi_watchdog);
@@ -475,7 +481,7 @@ static void stop_watchdog(void *arg)
 	cpumask_clear_cpu(cpu, &wd_cpus_enabled);
 	wd_smp_unlock(&flags);
 
-	wd_smp_clear_cpu_pending(cpu, get_tb());
+	wd_smp_clear_cpu_pending(cpu);
 }
 
 static int stop_watchdog_on_cpu(unsigned int cpu)
-- 
2.23.0

