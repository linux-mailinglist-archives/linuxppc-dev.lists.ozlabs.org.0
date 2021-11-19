Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCE1456E47
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 12:35:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwZMv6B9Kz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 22:35:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VLDY6lYW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VLDY6lYW; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwZJR4C3Lz3bWX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 22:32:07 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id v19so7909350plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 03:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=szKvYnxJqWq8uRHA9z21YAvL81GGQGx0+gaVFJ7anCA=;
 b=VLDY6lYW7USmNXlbMfMCHNIz8XC/wMU0hLo8ahPl7QBf5Wo4ev+q92lYif5YQXwKjY
 OnLr/Ltx924hmHFDF4e1cGAPvWKGdjXCz/UKOA1d0cYp3Zq9sAQeUiAo6ZEMwHk44I4u
 4vdZi93EenNytb5xDNeLPuKXSO/OJdGpBmWMMqNRnduS1NW1DNkx8HfJEYFyfRrFKGoQ
 jeeME5O66VMoukSsV3jY8ZisSVjtavu7WYqFIWq8FW+y/Iebssy7gwHMcPf8Z6Kp0KE4
 7gYlCDnvLH3rgX7aQs2BLO6NiK3qsKbKD0m05exeeZowYCHKPZCeLHbbOP3A8+KUSyS7
 /qRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=szKvYnxJqWq8uRHA9z21YAvL81GGQGx0+gaVFJ7anCA=;
 b=EojHb/RN9Je10r1Lo6kCrRyLInBJDFEsb2RckIXdkq9qgrYoJIayOiy6t+8j7b78L0
 keIUE5opfJbmUdtEiN3vB1VNnCImV/xM9Kj2wNWTy6o5+f/fu7dj+nH/PpxOkmtJzvM+
 zZJmGcexx6LYlI+lo4zjUIBhFCCpcwTA9hzzrawy8ScgOBwlVrkxDvcO6Rb1iD4m48TI
 qvsjpnm5l79PLw4Hj8mEp+7w5KiTxZMH0H2hBsUSSjPzCtey8pb/Dc3bwXgCafx/8R7D
 qrgf7SCtmwCuUlbbGaebiLwoFXkPTaBzS0PO2jqM4IoZYfl+tsc7YB3ArxXk1FivZaUP
 0yDg==
X-Gm-Message-State: AOAM533J5Tis1EIBfDyd93MEaO2IjxnZ0edHC0kA95ZwQWjGt4VDIFSd
 1t01KY/cph150cMxN3QPuK0db2QgQ3Q=
X-Google-Smtp-Source: ABdhPJzqFcKFsrxIjTw46yIA+gNDYpBNr32h7kBr744wKcdFAU1Wd5gfK42b5ppcYFf/gYvFE651mg==
X-Received: by 2002:a17:90b:1bc4:: with SMTP id
 oa4mr3811121pjb.179.1637321525097; 
 Fri, 19 Nov 2021 03:32:05 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-240-2-228.tpgi.com.au. [60.240.2.228])
 by smtp.gmail.com with ESMTPSA id
 g17sm2632626pfv.136.2021.11.19.03.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:32:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 4/5] powerpc/watchdog: read TB close to where it is used
Date: Fri, 19 Nov 2021 21:31:45 +1000
Message-Id: <20211119113146.752759-5-npiggin@gmail.com>
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
 arch/powerpc/kernel/watchdog.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index cfd45049ec7f..23745af38d62 100644
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
@@ -175,15 +175,16 @@ static bool set_cpu_stuck(int cpu, u64 tb)
 	return false;
 }
 
-static void watchdog_smp_panic(int cpu, u64 tb)
+static void watchdog_smp_panic(int cpu)
 {
 	static cpumask_t wd_smp_cpus_ipi; // protected by reporting
 	unsigned long flags;
-	u64 last_reset;
+	u64 tb, last_reset;
 	int c;
 
 	wd_smp_lock(&flags);
 	/* Double check some things under lock */
+	tb = get_tb();
 	last_reset = wd_smp_last_reset_tb;
 	if ((s64)(tb - last_reset) < (s64)wd_smp_panic_timeout_tb)
 		goto out;
@@ -198,7 +199,7 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 			continue; // should not happen
 
 		__cpumask_set_cpu(c, &wd_smp_cpus_ipi);
-		if (set_cpu_stuck(c, tb))
+		if (set_cpu_stuck(c))
 			break;
 	}
 	if (cpumask_empty(&wd_smp_cpus_ipi)) {
@@ -243,7 +244,7 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 	wd_smp_unlock(&flags);
 }
 
-static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
+static void wd_smp_clear_cpu_pending(int cpu)
 {
 	if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
 		if (unlikely(cpumask_test_cpu(cpu, &wd_smp_cpus_stuck))) {
@@ -251,7 +252,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 			unsigned long flags;
 
 			pr_emerg("CPU %d became unstuck TB:%lld\n",
-				 cpu, tb);
+				 cpu, get_tb());
 			print_irqtrace_events(current);
 			if (regs)
 				show_regs(regs);
@@ -317,7 +318,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 		 */
 		wd_smp_lock(&flags);
 		if (cpumask_empty(&wd_smp_cpus_pending)) {
-			wd_smp_last_reset_tb = tb;
+			wd_smp_last_reset_tb = get_tb();
 			cpumask_andnot(&wd_smp_cpus_pending,
 					&wd_cpus_enabled,
 					&wd_smp_cpus_stuck);
@@ -332,10 +333,10 @@ static void watchdog_timer_interrupt(int cpu)
 
 	per_cpu(wd_timer_tb, cpu) = tb;
 
-	wd_smp_clear_cpu_pending(cpu, tb);
+	wd_smp_clear_cpu_pending(cpu);
 
 	if ((s64)(tb - wd_smp_last_reset_tb) >= (s64)wd_smp_panic_timeout_tb)
-		watchdog_smp_panic(cpu, tb);
+		watchdog_smp_panic(cpu);
 }
 
 DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
@@ -372,7 +373,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 			return 0;
 		}
 
-		set_cpu_stuck(cpu, tb);
+		set_cpu_stuck(cpu);
 
 		wd_smp_unlock(&flags);
 
@@ -433,7 +434,7 @@ void arch_touch_nmi_watchdog(void)
 	tb = get_tb();
 	if (tb - per_cpu(wd_timer_tb, cpu) >= ticks) {
 		per_cpu(wd_timer_tb, cpu) = tb;
-		wd_smp_clear_cpu_pending(cpu, tb);
+		wd_smp_clear_cpu_pending(cpu);
 	}
 }
 EXPORT_SYMBOL(arch_touch_nmi_watchdog);
@@ -491,7 +492,7 @@ static void stop_watchdog(void *arg)
 	cpumask_clear_cpu(cpu, &wd_cpus_enabled);
 	wd_smp_unlock(&flags);
 
-	wd_smp_clear_cpu_pending(cpu, get_tb());
+	wd_smp_clear_cpu_pending(cpu);
 }
 
 static int stop_watchdog_on_cpu(unsigned int cpu)
-- 
2.23.0

