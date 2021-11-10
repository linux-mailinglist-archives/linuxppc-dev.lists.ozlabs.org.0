Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F31244BA79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 03:54:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpqFD2hxvz3cT5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 13:54:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LbJXXKOE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LbJXXKOE; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpq9f6yPcz304x
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 13:51:18 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id n23so865600pgh.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 18:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnC24hia8JmSAtuMSHdjD6iJhyrzN7b5skH7AmQCahg=;
 b=LbJXXKOEooGwMwBXGrqagyC4dqTyRAC8UFtLnBEQ2rVfIn+mZNbZi3D5PJJZR3wrDX
 mg/fXko9iCLh6Hzq2KfzuAmgAGArAL/rrWo43ppoTqskTy95/e6X0CByT+H1b1SV05WG
 oCF5PqOrROrl5PqQVURDg7zBjKcaTJZAgn4hEyegYn76IWkgzOeOvGaVHvjvLWJJVmes
 kVeXOoy/GXd7gHPku++eO07qd2fVhe3eTziWBTwUAnrrgYcQAz+wcx+BiQ5kp0NYUojp
 jBSbHxMDajAlahyUJIIWez8AzOGhHx9XAMxtB7sT8tBzZ0n++OKBX+xAT1FdIlrSwznA
 yang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rnC24hia8JmSAtuMSHdjD6iJhyrzN7b5skH7AmQCahg=;
 b=RaxX/JzhpJKlU/ueZzQ1aqN5c6soi+dDtPnbLQpUf0SLnoDpN74FGOzVtyrlMxqXWe
 /9kZPHqpdJYTS4U4BLuBV7L/nYIpO3VGPVYPcDU8ikXJJFs85hrqx8oW3vRRs5L4Hov7
 milC6WaHe2seY5gHOObTxuKMFDJeajSYZrYvKe2jPy0+1La9/fCUNAQc9EIqBaWUEGGd
 nuLfOGxb4g/bWHP/6kcM8fnYbX/PtzD0yHJmHHHsGBNHfUzk/IZ5aSjlCXulfbBPFPUQ
 iJ2l+xtXjecOjFs8dCOVMQi8jCx80h9xKelpJJohDrsazlUvgE2IW2d5OMJTzomG1AzZ
 bA4w==
X-Gm-Message-State: AOAM532OwBWcveJxMcRcUO4TcxagWLus6auMz8XDKcB0/61jyo4EhxnL
 ZC+q8Sbqrvic+neM4BLYyuf2d+HS9/Nk+Q==
X-Google-Smtp-Source: ABdhPJzlqL7IvWPd8HufTlm6wCaMR50ij1cDsP39MzqIp9rg+n9TWNCbETNyhNhEKPNKt1/1DqEFVg==
X-Received: by 2002:a05:6a00:1a01:b0:44d:af99:19c9 with SMTP id
 g1-20020a056a001a0100b0044daf9919c9mr13030855pfv.36.1636512676635; 
 Tue, 09 Nov 2021 18:51:16 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.146.48.179])
 by smtp.gmail.com with ESMTPSA id b4sm21604406pfl.60.2021.11.09.18.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 18:51:16 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/4] powerpc/watchdog: read TB close to where it is used
Date: Wed, 10 Nov 2021 12:50:56 +1000
Message-Id: <20211110025056.2084347-5-npiggin@gmail.com>
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

When taking watchdog actions, printing messages, comparing and
re-setting wd_smp_last_reset_tb, etc., read TB close to the point of use
and under wd_smp_lock or printing lock (if applicable).

This should keep timebase mostly monotonic with kernel log messages, and
could prevent (in theory) a laggy CPU updating wd_smp_last_reset_tb to
something a long way in the past, and causing other CPUs to appear to be
stuck.

These additional TB reads are all slowpath (lockup has been detected),
so performance does not matter.

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 1b11c4b1c79e..936f889995d3 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -157,7 +157,7 @@ static void wd_lockup_ipi(struct pt_regs *regs)
 	/* Do not panic from here because that can recurse into NMI IPI layer */
 }
 
-static bool set_cpu_stuck(int cpu, u64 tb)
+static bool set_cpu_stuck(int cpu)
 {
 	cpumask_set_cpu(cpu, &wd_smp_cpus_stuck);
 	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
@@ -166,7 +166,7 @@ static bool set_cpu_stuck(int cpu, u64 tb)
 	 */
 	smp_mb();
 	if (cpumask_empty(&wd_smp_cpus_pending)) {
-		wd_smp_last_reset_tb = tb;
+		wd_smp_last_reset_tb = get_tb();
 		cpumask_andnot(&wd_smp_cpus_pending,
 				&wd_cpus_enabled,
 				&wd_smp_cpus_stuck);
@@ -175,14 +175,16 @@ static bool set_cpu_stuck(int cpu, u64 tb)
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
@@ -196,7 +198,7 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 			continue; // should not happen
 
 		__cpumask_set_cpu(c, &wd_smp_cpus_ipi);
-		if (set_cpu_stuck(c, tb))
+		if (set_cpu_stuck(c))
 			break;
 	}
 	if (cpumask_empty(&wd_smp_cpus_ipi)) {
@@ -236,7 +238,7 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 	wd_smp_unlock(&flags);
 }
 
-static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
+static void wd_smp_clear_cpu_pending(int cpu)
 {
 	if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
 		if (unlikely(cpumask_test_cpu(cpu, &wd_smp_cpus_stuck))) {
@@ -244,7 +246,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 			unsigned long flags;
 
 			pr_emerg("CPU %d became unstuck TB:%lld\n",
-				 cpu, tb);
+				 cpu, get_tb());
 			print_irqtrace_events(current);
 			if (regs)
 				show_regs(regs);
@@ -310,7 +312,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 		 */
 		wd_smp_lock(&flags);
 		if (cpumask_empty(&wd_smp_cpus_pending)) {
-			wd_smp_last_reset_tb = tb;
+			wd_smp_last_reset_tb = get_tb();
 			cpumask_andnot(&wd_smp_cpus_pending,
 					&wd_cpus_enabled,
 					&wd_smp_cpus_stuck);
@@ -325,10 +327,10 @@ static void watchdog_timer_interrupt(int cpu)
 
 	per_cpu(wd_timer_tb, cpu) = tb;
 
-	wd_smp_clear_cpu_pending(cpu, tb);
+	wd_smp_clear_cpu_pending(cpu);
 
 	if ((s64)(tb - wd_smp_last_reset_tb) >= (s64)wd_smp_panic_timeout_tb)
-		watchdog_smp_panic(cpu, tb);
+		watchdog_smp_panic(cpu);
 }
 
 DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
@@ -365,7 +367,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 			return 0;
 		}
 
-		set_cpu_stuck(cpu, tb);
+		set_cpu_stuck(cpu);
 
 		wd_smp_unlock(&flags);
 
@@ -426,7 +428,7 @@ void arch_touch_nmi_watchdog(void)
 	tb = get_tb();
 	if (tb - per_cpu(wd_timer_tb, cpu) >= ticks) {
 		per_cpu(wd_timer_tb, cpu) = tb;
-		wd_smp_clear_cpu_pending(cpu, tb);
+		wd_smp_clear_cpu_pending(cpu);
 	}
 }
 EXPORT_SYMBOL(arch_touch_nmi_watchdog);
@@ -484,7 +486,7 @@ static void stop_watchdog(void *arg)
 	cpumask_clear_cpu(cpu, &wd_cpus_enabled);
 	wd_smp_unlock(&flags);
 
-	wd_smp_clear_cpu_pending(cpu, get_tb());
+	wd_smp_clear_cpu_pending(cpu);
 }
 
 static int stop_watchdog_on_cpu(unsigned int cpu)
-- 
2.23.0

