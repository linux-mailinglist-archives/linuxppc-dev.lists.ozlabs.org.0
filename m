Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 961EF2A81EA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:12:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRn7n588FzDr75
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 02:12:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P7RiwrAI; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmJw2nd6zDr0V
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:35:27 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id r186so1564678pgr.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 06:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IpsJ4Khnsh2N5cKVDxK9BLK3oBfKa1nuAHBq5gNQT0M=;
 b=P7RiwrAIOqyri6GOPlCutiyKixVJYDLKGhWX1LmGIvU8kKB9jHMWaEZnT9Dnwh5obH
 KnoHjddRPNVSX7TLtL9hdG7L47oydFSgq8a1TNxTRqV+278SC6z/BLIUv1DW+QMHLhy7
 JnFzcrvXWjK1HY+qJr9N6Roiqtn4xf0s5YmuhKC5ayQsN+A51Ozp68MNHbU8wuOK0tYe
 dELcRIEjJlw9z2Q1AvNm7eSqU5A01Tin9QpkLhwQa16M7GiotQEsJYwRpZNTCqolfkW9
 8HGJZZCgi4/oDXPEvRU71TMVBc7Rn1kB0AJoeIJcPtj2+dxyzw1GMJd6vviJnkH1a1rt
 Ahyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IpsJ4Khnsh2N5cKVDxK9BLK3oBfKa1nuAHBq5gNQT0M=;
 b=uaLZ0C3IW1TMiusNVyKR+5i+tW+smr/K2YbahStk6KGLPv8MQuy4Qy+bQYCIyUA4XU
 buKlXlt0N3ivu6APJEXQssaIEOQTgBfM/riY6D6rTc9phmeQg0Occ8hEn6uD6ycYSyK5
 KlFXpGSV1R3mtFBFFk0Ta7SdBP6D3CROOghnBnnSJzQ60dhCiFJzqS9INtFRRSGJ0NNl
 dEqBajcTUEnBbqP5wZ/KOiCnphhhVoMdg6dzN2+mlhwq9Gu96dfLR3oEIeEKRLxnQZKP
 UGkGY4pklXYC1L5O6ovCfu4FboSMHGRaDT/uoe3bCgHoixFc4AQaQXc4pu4tWXddnPDM
 zlvg==
X-Gm-Message-State: AOAM533QHQhI5j13YtdvAQ4JJewsWn78sda8kiXstjyGAcrPbuBATEGl
 UpD3QteNo/4LpIxL4v0z+YP+gktHiOFYuw==
X-Google-Smtp-Source: ABdhPJwQgUxII2zH6MqB4EhNMYBve7Zl6/D9UEWuZzFM4EkaVmJnvpqSUeZYOXryD/waxnRmHjq1+Q==
X-Received: by 2002:a62:7781:0:b029:18b:5c31:5c27 with SMTP id
 s123-20020a6277810000b029018b5c315c27mr2747790pfc.70.1604586924670; 
 Thu, 05 Nov 2020 06:35:24 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id n15sm2876771pgt.75.2020.11.05.06.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:35:24 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/18] powerpc: move NMI entry/exit code into wrapper
Date: Fri,  6 Nov 2020 00:34:27 +1000
Message-Id: <20201105143431.1874789-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201105143431.1874789-1-npiggin@gmail.com>
References: <20201105143431.1874789-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves the common NMI entry and exit code into the interrupt handler
wrappers.

This changes the behaviour of soft-NMI (watchdog) and HMI interrupts, and
also MCE interrupts on 64e, by adding missing parts of the NMI entry to
them. It fixes a bug with sreset on pseries HPT guests which shouldn't
call nmi_enter().

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 24 ++++++++++++++++++
 arch/powerpc/kernel/mce.c            | 11 --------
 arch/powerpc/kernel/traps.c          | 38 +++++-----------------------
 arch/powerpc/kernel/watchdog.c       | 10 +++-----
 4 files changed, 35 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 9bd14c59dc8e..a87284707f09 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -69,14 +69,38 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
 }
 
 struct interrupt_nmi_state {
+#ifdef CONFIG_PPC64
+	u8 ftrace_enabled;
+#endif
 };
 
 static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
+#ifdef CONFIG_PPC64
+	state->ftrace_enabled = this_cpu_get_ftrace_enabled();
+	this_cpu_set_ftrace_enabled(0);
+#endif
+
+	/*
+	 * Do not use nmi_enter() for pseries hash guest taking a real-mode
+	 * NMI because not everything it touches is within the RMA limit.
+	 */
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
+			!firmware_has_feature(FW_FEATURE_LPAR) ||
+			radix_enabled() || (mfmsr() & MSR_DR))
+		nmi_enter();
 }
 
 static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
+			!firmware_has_feature(FW_FEATURE_LPAR) ||
+			radix_enabled() || (mfmsr() & MSR_DR))
+		nmi_exit();
+
+#ifdef CONFIG_PPC64
+	this_cpu_set_ftrace_enabled(state->ftrace_enabled);
+#endif
 }
 
 /**
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index b84459f45b1a..9f39deed4fca 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -592,12 +592,6 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
 DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
 {
 	long handled = 0;
-	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
-
-	this_cpu_set_ftrace_enabled(0);
-	/* Do not use nmi_enter/exit for pseries hpte guest */
-	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
-		nmi_enter();
 
 	hv_nmi_check_nonrecoverable(regs);
 
@@ -607,11 +601,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
 	if (ppc_md.machine_check_early)
 		handled = ppc_md.machine_check_early(regs);
 
-	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
-		nmi_exit();
-
-	this_cpu_set_ftrace_enabled(ftrace_enabled);
-
 	return handled;
 }
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 09780481e1b1..95f84c542523 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -443,11 +443,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 {
 	unsigned long hsrr0, hsrr1;
 	bool saved_hsrrs = false;
-	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
-
-	this_cpu_set_ftrace_enabled(0);
-
-	nmi_enter();
 
 	/*
 	 * System reset can interrupt code where HSRRs are live and MSR[RI]=1.
@@ -519,10 +514,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 		mtspr(SPRN_HSRR1, hsrr1);
 	}
 
-	nmi_exit();
-
-	this_cpu_set_ftrace_enabled(ftrace_enabled);
-
 	/* What should we do here? We could issue a shutdown or hard reset. */
 
 	return 0;
@@ -824,6 +815,12 @@ int machine_check_generic(struct pt_regs *regs)
 #endif /* everything else */
 
 
+/*
+ * BOOK3S_64 does not call this handler as a non-maskable interrupt
+ * (it uses its own early real-mode handler to handle the MCE proper
+ * and then raises irq_work to call this handler when interrupts are
+ * enabled).
+ */
 #ifdef CONFIG_PPC_BOOK3S_64
 DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception)
 #else
@@ -832,20 +829,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
 {
 	int recover = 0;
 
-	/*
-	 * BOOK3S_64 does not call this handler as a non-maskable interrupt
-	 * (it uses its own early real-mode handler to handle the MCE proper
-	 * and then raises irq_work to call this handler when interrupts are
-	 * enabled).
-	 *
-	 * This is silly. The BOOK3S_64 should just call a different function
-	 * rather than expecting semantics to magically change. Something
-	 * like 'non_nmi_machine_check_exception()', perhaps?
-	 */
-	const bool nmi = !IS_ENABLED(CONFIG_PPC_BOOK3S_64);
-
-	if (nmi) nmi_enter();
-
 	__this_cpu_inc(irq_stat.mce_exceptions);
 
 	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_NOW_UNRELIABLE);
@@ -870,24 +853,17 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
 	if (check_io_access(regs))
 		goto bail;
 
-	if (nmi) nmi_exit();
-
 	die("Machine check", regs, SIGBUS);
 
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
 		die("Unrecoverable Machine check", regs, SIGBUS);
 
-#ifdef CONFIG_PPC_BOOK3S_64
 bail:
+#ifdef CONFIG_PPC_BOOK3S_64
 	return;
 #else
 	return 0;
-
-bail:
-	if (nmi) nmi_exit();
-
-	return 0;
 #endif
 }
 
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 824b9376ac35..dc39534836a3 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -254,11 +254,12 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 	int cpu = raw_smp_processor_id();
 	u64 tb;
 
+	/* should only arrive from kernel, with irqs disabled */
+	WARN_ON_ONCE(!arch_irq_disabled_regs(regs));
+
 	if (!cpumask_test_cpu(cpu, &wd_cpus_enabled))
 		return 0;
 
-	nmi_enter();
-
 	__this_cpu_inc(irq_stat.soft_nmi_irqs);
 
 	tb = get_tb();
@@ -266,7 +267,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 		wd_smp_lock(&flags);
 		if (cpumask_test_cpu(cpu, &wd_smp_cpus_stuck)) {
 			wd_smp_unlock(&flags);
-			goto out;
+			return 0;
 		}
 		set_cpu_stuck(cpu, tb);
 
@@ -290,9 +291,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 	if (wd_panic_timeout_tb < 0x7fffffff)
 		mtspr(SPRN_DEC, wd_panic_timeout_tb);
 
-out:
-	nmi_exit();
-
 	return 0;
 }
 
-- 
2.23.0

