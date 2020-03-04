Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 523EB17872F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 01:49:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XFdZ11vlzDqW5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 11:49:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=afzal.mohd.ma@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qxWoJ3qi; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XFbf4C1wzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 11:47:56 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id p7so205982pli.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 16:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FSpmSt4o41NJS1G8psQcEgs7afs+Iy6AdJ2Os7mzKNs=;
 b=qxWoJ3qi1PX737B47a21RzUIKpJ744UTkaWbP4gQZxoacL8PR2VEFlZqHx6f0swIAV
 wgaJ54HDbR7GuyC324375KLhsP5u9jo5TpU9JCWYK1bCY0WQZ0BgU7nynQiYk4UMRuWR
 VVkhXibzijdwpIuWmYkOcq89RIVCRp6Dh61Q79YFwtS4VUeB5vnnpVve7HuM2FyDJp9e
 m6pWtouxVutUpY3YkKiwc6ZIHlmozM4Bf79SGCNW79msxGH4jxHuFhe1lG5E/FN9JsY3
 ci9mOr3R8tMQ/vxoQ3qL1yHJyslTqIVQQalvYPkas0wD9Ivz5xjDsvD/LBcNnSIrrrrX
 chtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FSpmSt4o41NJS1G8psQcEgs7afs+Iy6AdJ2Os7mzKNs=;
 b=pjeGHmvgXKrnU/ON15BtM5gF02yqnIuTxCZCnV7iQYZTWaHq52nS7BmCXoC0QAs+g0
 KPzORsFhcFo+hWk5uJbwXP604+/zoFd1vhNghAmaZCpyZ09DcqFGc04w0RU9gYvGnnuF
 Y27ap2fHAEIZJVj9fYzbhwrecWcC3GU3GYTYGi2NvgxsAvl1zBfvpdtcvBTTO7Hj3pBZ
 Ej4+oLDXEOzEdgSLvddxTsMa43/ytYfidWIv1iGQmESPtF2nWqMuXz9jkWzrE8KjdX+0
 0KaNKwoGwu78Lqiljf3l3/B3Ml1/zhx4F5TKlYFZpC5mU73gntGD3wezuzM0n23G6VAH
 YqdA==
X-Gm-Message-State: ANhLgQ37I43Qf6SGsvMQ4EAidDp7PFhPwR2azJEyXgpze3SNy/uI5eaA
 npNPFvQuXsWMT3VWqIVFSjvtE8UD
X-Google-Smtp-Source: ADFU+vtZMGSOMoQrnKgA1ePmEqc7Q15cHe+zNhsGQkHyACV10Y4v0P7VvpaWXIsu2YrWGqzQOSyGnw==
X-Received: by 2002:a17:902:bf08:: with SMTP id
 bi8mr531595plb.305.1583282872439; 
 Tue, 03 Mar 2020 16:47:52 -0800 (PST)
Received: from localhost.localdomain ([106.51.232.35])
 by smtp.gmail.com with ESMTPSA id w2sm17756292pfb.138.2020.03.03.16.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 16:47:51 -0800 (PST)
From: afzal mohammed <afzal.mohd.ma@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] powerpc: Replace setup_irq() by request_irq()
Date: Wed,  4 Mar 2020 06:17:45 +0530
Message-Id: <20200304004746.4557-1-afzal.mohd.ma@gmail.com>
X-Mailer: git-send-email 2.18.0
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
Cc: Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 afzal mohammed <afzal.mohd.ma@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

request_irq() is preferred over setup_irq(). Invocations of setup_irq()
occur after memory allocators are ready.

Per tglx[1], setup_irq() existed in olden days when allocators were not
ready by the time early interrupts were initialized.

Hence replace setup_irq() by request_irq().

[1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos

Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
---
Hi powerpc maintainers,

if okay w/ this change, please consider taking it thr' your tree, else please
let me know.

Regards
afzal

Link to v2 & v1,
[v2] https://lkml.kernel.org/r/cover.1582471508.git.afzal.mohd.ma@gmail.com
[v1] https://lkml.kernel.org/r/cover.1581478323.git.afzal.mohd.ma@gmail.com

v3:
 * Split out from tree wide series, as Thomas suggested to get it thr'
	respective maintainers
 * Modify pr_err displayed in case of error
 * Re-arrange code & choose pr_err args as required to improve readability
 * Remove irrelevant parts from commit message & improve
 
v2:
 * Replace pr_err("request_irq() on %s failed" by
           pr_err("%s: request_irq() failed"
 * Commit message massage

 arch/powerpc/platforms/85xx/mpc85xx_cds.c | 10 +++-----
 arch/powerpc/platforms/8xx/cpm1.c         |  9 ++-----
 arch/powerpc/platforms/8xx/m8xx_setup.c   |  9 ++-----
 arch/powerpc/platforms/chrp/setup.c       | 14 ++++-------
 arch/powerpc/platforms/powermac/pic.c     | 29 +++++++++--------------
 arch/powerpc/platforms/powermac/smp.c     | 12 ++++------
 6 files changed, 28 insertions(+), 55 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index 6b1436abe9b1..1c5598877d70 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -218,12 +218,6 @@ static irqreturn_t mpc85xx_8259_cascade_action(int irq, void *dev_id)
 {
 	return IRQ_HANDLED;
 }
-
-static struct irqaction mpc85xxcds_8259_irqaction = {
-	.handler = mpc85xx_8259_cascade_action,
-	.flags = IRQF_SHARED | IRQF_NO_THREAD,
-	.name = "8259 cascade",
-};
 #endif /* PPC_I8259 */
 #endif /* CONFIG_PCI */
 
@@ -271,7 +265,9 @@ static int mpc85xx_cds_8259_attach(void)
 	 *  disabled when the last user of the shared IRQ line frees their
 	 *  interrupt.
 	 */
-	if ((ret = setup_irq(cascade_irq, &mpc85xxcds_8259_irqaction))) {
+	ret = request_irq(cascade_irq, mpc85xx_8259_cascade_action,
+			  IRQF_SHARED | IRQF_NO_THREAD, "8259 cascade", NULL);
+	if (ret) {
 		printk(KERN_ERR "Failed to setup cascade interrupt\n");
 		return ret;
 	}
diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index a43ee7d1ff85..4db4ca2e1222 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -120,12 +120,6 @@ static irqreturn_t cpm_error_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction cpm_error_irqaction = {
-	.handler = cpm_error_interrupt,
-	.flags = IRQF_NO_THREAD,
-	.name = "error",
-};
-
 static const struct irq_domain_ops cpm_pic_host_ops = {
 	.map = cpm_pic_host_map,
 };
@@ -187,7 +181,8 @@ unsigned int __init cpm_pic_init(void)
 	if (!eirq)
 		goto end;
 
-	if (setup_irq(eirq, &cpm_error_irqaction))
+	if (request_irq(eirq, cpm_error_interrupt, IRQF_NO_THREAD, "error",
+			NULL))
 		printk(KERN_ERR "Could not allocate CPM error IRQ!");
 
 	setbits32(&cpic_reg->cpic_cicr, CICR_IEN);
diff --git a/arch/powerpc/platforms/8xx/m8xx_setup.c b/arch/powerpc/platforms/8xx/m8xx_setup.c
index f1c805c8adbc..df4d57d07f9a 100644
--- a/arch/powerpc/platforms/8xx/m8xx_setup.c
+++ b/arch/powerpc/platforms/8xx/m8xx_setup.c
@@ -39,12 +39,6 @@ static irqreturn_t timebase_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction tbint_irqaction = {
-	.handler = timebase_interrupt,
-	.flags = IRQF_NO_THREAD,
-	.name = "tbint",
-};
-
 /* per-board overridable init_internal_rtc() function. */
 void __init __attribute__ ((weak))
 init_internal_rtc(void)
@@ -157,7 +151,8 @@ void __init mpc8xx_calibrate_decr(void)
 					(TBSCR_TBF | TBSCR_TBE));
 	immr_unmap(sys_tmr2);
 
-	if (setup_irq(virq, &tbint_irqaction))
+	if (request_irq(virq, timebase_interrupt, IRQF_NO_THREAD, "tbint",
+			NULL))
 		panic("Could not allocate timer IRQ!");
 }
 
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index fcf6f2342ef4..8328cd5817b0 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -451,13 +451,6 @@ static void __init chrp_find_openpic(void)
 	of_node_put(np);
 }
 
-#if defined(CONFIG_VT) && defined(CONFIG_INPUT_ADBHID) && defined(CONFIG_XMON)
-static struct irqaction xmon_irqaction = {
-	.handler = xmon_irq,
-	.name = "XMON break",
-};
-#endif
-
 static void __init chrp_find_8259(void)
 {
 	struct device_node *np, *pic = NULL;
@@ -541,8 +534,11 @@ static void __init chrp_init_IRQ(void)
 		if (of_node_is_type(kbd->parent, "adb"))
 			break;
 	of_node_put(kbd);
-	if (kbd)
-		setup_irq(HYDRA_INT_ADB_NMI, &xmon_irqaction);
+	if (kbd) {
+		if (request_irq(HYDRA_INT_ADB_NMI, xmon_irq, 0, "XMON break",
+				NULL))
+			pr_err("Failed to register XMON break interrupt\n");
+	}
 #endif
 }
 
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 2e969073473d..4921bccf0376 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -250,20 +250,6 @@ static unsigned int pmac_pic_get_irq(void)
 	return irq_linear_revmap(pmac_pic_host, irq);
 }
 
-#ifdef CONFIG_XMON
-static struct irqaction xmon_action = {
-	.handler	= xmon_irq,
-	.flags		= IRQF_NO_THREAD,
-	.name		= "NMI - XMON"
-};
-#endif
-
-static struct irqaction gatwick_cascade_action = {
-	.handler	= gatwick_action,
-	.flags		= IRQF_NO_THREAD,
-	.name		= "cascade",
-};
-
 static int pmac_pic_host_match(struct irq_domain *h, struct device_node *node,
 			       enum irq_domain_bus_token bus_token)
 {
@@ -384,12 +370,17 @@ static void __init pmac_pic_probe_oldstyle(void)
 		out_le32(&pmac_irq_hw[i]->enable, 0);
 
 	/* Hookup cascade irq */
-	if (slave && pmac_irq_cascade)
-		setup_irq(pmac_irq_cascade, &gatwick_cascade_action);
+	if (slave && pmac_irq_cascade) {
+		if (request_irq(pmac_irq_cascade, gatwick_action,
+				IRQF_NO_THREAD, "cascade", NULL))
+			pr_err("Failed to register cascade interrupt\n");
+	}
 
 	printk(KERN_INFO "irq: System has %d possible interrupts\n", max_irqs);
 #ifdef CONFIG_XMON
-	setup_irq(irq_create_mapping(NULL, 20), &xmon_action);
+	i = irq_create_mapping(NULL, 20);
+	if (request_irq(i, xmon_irq, IRQF_NO_THREAD, "NMI - XMON", NULL))
+		pr_err("Failed to register NMI-XMON interrupt\n");
 #endif
 }
 
@@ -441,7 +432,9 @@ static void __init pmac_pic_setup_mpic_nmi(struct mpic *mpic)
 		nmi_irq = irq_of_parse_and_map(pswitch, 0);
 		if (nmi_irq) {
 			mpic_irq_set_priority(nmi_irq, 9);
-			setup_irq(nmi_irq, &xmon_action);
+			if (request_irq(nmi_irq, xmon_irq, IRQF_NO_THREAD,
+					"NMI - XMON", NULL))
+				pr_err("Failed to register NMI-XMON interrupt\n");
 		}
 		of_node_put(pswitch);
 	}
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index f95fbdee6efe..c55bf474ed4e 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -399,21 +399,19 @@ static int __init smp_psurge_kick_cpu(int nr)
 	return 0;
 }
 
-static struct irqaction psurge_irqaction = {
-	.handler = psurge_ipi_intr,
-	.flags = IRQF_PERCPU | IRQF_NO_THREAD,
-	.name = "primary IPI",
-};
-
 static void __init smp_psurge_setup_cpu(int cpu_nr)
 {
+	unsigned long flags = IRQF_PERCPU | IRQF_NO_THREAD;
+	int irq;
+
 	if (cpu_nr != 0 || !psurge_start)
 		return;
 
 	/* reset the entry point so if we get another intr we won't
 	 * try to startup again */
 	out_be32(psurge_start, 0x100);
-	if (setup_irq(irq_create_mapping(NULL, 30), &psurge_irqaction))
+	irq = irq_create_mapping(NULL, 30);
+	if (request_irq(irq, psurge_ipi_intr, flags, "primary IPI", NULL))
 		printk(KERN_ERR "Couldn't get primary IPI interrupt");
 }
 
-- 
2.25.1

