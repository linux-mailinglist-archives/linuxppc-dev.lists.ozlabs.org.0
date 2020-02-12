Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A515A5CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 11:11:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hb5n6bb2zDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 21:11:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=afzal.mohd.ma@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=k+t7T0iZ; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HXH26ngjzDqKH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 19:04:30 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id 6so804528pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 00:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JuzNIL6khawO9eOTapWnvCssiAilhd7nX8cVMEqEmfM=;
 b=k+t7T0iZdFQsg+xRx9Z+ytYxsaGvhlSt2ER6mqJDOYZGR0S57l53AhTTRPNdbY6Oi9
 Dn1SzgrUkVVO2aSikJiMIDsoBAaaLL+Lw3u94Ze64dAcxTUsh1HSuNo/zzzHDdBGACkX
 1EA/W/KHK4xytBw03qsTMzj+8Rngl6nOXrmq+c015rGkHVC1BUMxHrX0crsEYFQR3Pec
 5xYlXacbpjVp5pnjh0o27NxwIB74AMvb6Cxw7givaJCb5PdbnS/o0IBAoW/WnwaNzfvU
 sxskDmfJQJrNu7XgKQqFr3Fb2D033fYPdh08dBXwj1dPsHBo970nuhjtqeUqgfgcehPb
 rLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JuzNIL6khawO9eOTapWnvCssiAilhd7nX8cVMEqEmfM=;
 b=NPmtq2GAg4Lit8yo1z30ucYGaEJf96vzg46xyiPbrryVp4Q/AIGr6X5VwTWI7ou/7o
 H3qbKnnfe/uMwChU94jszOjb99Ch/8nhrL55On/7G9+OoKDl33TFKtSVef+KLRcwo8IB
 MOAlNCQ5bak0ezDlcoiYl4Vt7V1p9YbgyWJ61QHRwMV7vOJJqaLQwaPwmCWjsWvuIKQg
 KN4XWqsZsvX8eAkblFOJlJNEnMwYud9kaUyYJ1LFUls7aqpP5/FJ272ORlomiE+h5lWe
 AVhOfvQf8FQIlMy3vkPciJ+75r58Sy2t2Jclvz8N+ErBSMI2/pGjDY2WLqLcQktEcmJI
 gCjQ==
X-Gm-Message-State: APjAAAV1l47z2wg8klNcSHcQ8pvGe+GttSm13Cd0FtyzBWiVNpEfDDHu
 os7CUwEk+akandQ9nJNqt5CR5iW77TI=
X-Google-Smtp-Source: APXvYqwBF4gyPhLqYLMpcTQuFtI2KE1iIazbOKz1zGQaye78e6cmuoJJi7Qmf5u/qa2u7I8cGn1XjQ==
X-Received: by 2002:aa7:8ec1:: with SMTP id b1mr7278362pfr.95.1581494667488;
 Wed, 12 Feb 2020 00:04:27 -0800 (PST)
Received: from localhost ([106.51.21.91])
 by smtp.gmail.com with ESMTPSA id y127sm7229142pfg.22.2020.02.12.00.04.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Feb 2020 00:04:27 -0800 (PST)
Date: Wed, 12 Feb 2020 13:34:25 +0530
From: afzal mohammed <afzal.mohd.ma@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/18] powerpc: Replace setup_irq() by request_irq()
Message-ID: <303393f75ede6d36241d41f501d9ad2a23897c3f.1581478324.git.afzal.mohd.ma@gmail.com>
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-Mailman-Approved-At: Wed, 12 Feb 2020 21:07:15 +1100
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
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

request_irq() is preferred over setup_irq(). Existing callers of
setup_irq() reached mostly via 'init_IRQ()' & 'time_init()', while
memory allocators are ready by 'mm_init()'.

Per tglx[1], setup_irq() existed in olden days when allocators were not
ready by the time early interrupts were initialized.

Hence replace setup_irq() by request_irq().

Seldom remove_irq() usage has been observed coupled with setup_irq(),
wherever that has been found, it too has been replaced by free_irq().

[1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos

Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
---

Since cc'ing cover letter to all maintainers/reviewers would be too
many, refer for cover letter,
 https://lkml.kernel.org/r/cover.1581478323.git.afzal.mohd.ma@gmail.com

 arch/powerpc/platforms/85xx/mpc85xx_cds.c | 10 +++-----
 arch/powerpc/platforms/8xx/cpm1.c         |  9 ++-----
 arch/powerpc/platforms/8xx/m8xx_setup.c   |  9 ++-----
 arch/powerpc/platforms/chrp/setup.c       | 14 ++++------
 arch/powerpc/platforms/powermac/pic.c     | 31 ++++++++++-------------
 arch/powerpc/platforms/powermac/smp.c     |  9 ++-----
 6 files changed, 27 insertions(+), 55 deletions(-)

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
index fcf6f2342ef4..95ac1f510b1e 100644
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
+			pr_err("request_irq() on %s failed\n", "XMON break");
+	}
 #endif
 }
 
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 2e969073473d..939ae39d81db 100644
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
+			pr_err("request_irq() on %s failed\n", "cascade");
+	}
 
 	printk(KERN_INFO "irq: System has %d possible interrupts\n", max_irqs);
 #ifdef CONFIG_XMON
-	setup_irq(irq_create_mapping(NULL, 20), &xmon_action);
+	if (request_irq(irq_create_mapping(NULL, 20), xmon_irq, IRQF_NO_THREAD,
+			"NMI - XMON", NULL))
+		pr_err("request_irq() on %s failed\n", "NMI - XMON");
 #endif
 }
 
@@ -441,7 +432,11 @@ static void __init pmac_pic_setup_mpic_nmi(struct mpic *mpic)
 		nmi_irq = irq_of_parse_and_map(pswitch, 0);
 		if (nmi_irq) {
 			mpic_irq_set_priority(nmi_irq, 9);
-			setup_irq(nmi_irq, &xmon_action);
+			if (request_irq(nmi_irq, xmon_irq, IRQF_NO_THREAD,
+					"NMI - XMON", NULL)) {
+				pr_err("request_irq() on %s failed\n",
+				       "NMI - XMON");
+			}
 		}
 		of_node_put(pswitch);
 	}
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index f95fbdee6efe..0121b31a9e7b 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -399,12 +399,6 @@ static int __init smp_psurge_kick_cpu(int nr)
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
 	if (cpu_nr != 0 || !psurge_start)
@@ -413,7 +407,8 @@ static void __init smp_psurge_setup_cpu(int cpu_nr)
 	/* reset the entry point so if we get another intr we won't
 	 * try to startup again */
 	out_be32(psurge_start, 0x100);
-	if (setup_irq(irq_create_mapping(NULL, 30), &psurge_irqaction))
+	if (request_irq(irq_create_mapping(NULL, 30), psurge_ipi_intr,
+			IRQF_PERCPU | IRQF_NO_THREAD, "primary IPI", NULL))
 		printk(KERN_ERR "Couldn't get primary IPI interrupt");
 }
 
-- 
2.24.1

