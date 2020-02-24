Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC23169B83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 01:53:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Qk832SwlzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 11:53:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=afzal.mohd.ma@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lnbkvK48; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qk5x5BXhzDqNy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 11:51:33 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id s1so4444087pfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Feb 2020 16:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dR7HmsfW/e4ORYYJfGJEpowa+n5wLkb3n2L+pXm42kE=;
 b=lnbkvK48+NhUTJXX6PBghLX1c0WBiXJA6/JEuFI1o9SDsy51iCyqPA4pXZcjFK0F0t
 HvoujNz+ipV2cReSp3IPKNiQGi/B63lgEJBWiIGwF5xFHd3YP4omH87EDtEBomTCNFS7
 NGJouRFDl0cgwzSwKC35VgHtFuDgENPuTaTAk9wtenFj962qOhSxsnIFJbn1neCvm6JZ
 8k1k22nQbTv5K7nSaEKRlHnHj7zbJ5x+kXRo9NRWDwleCznjlozI8pUOEUUzm7LpaCPR
 v2de0ozY6b78yRsXdtdEI06pHSiO4Ik3211pIpgZgBrM9CPE2qOAuriqA0PeQv+lS9UW
 yWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dR7HmsfW/e4ORYYJfGJEpowa+n5wLkb3n2L+pXm42kE=;
 b=eeYWGrKTlgEnc0Ge7eoEiDcKcvp3rYlyWFGKd7FHhJawZMxLN+/pX3c3+28KYiOM6W
 1Z5sIFuFlSGGt+lZ6K/pYpkdZaCsR08zHiDebwMyIkxKw8lt6y2rVVxi4+t3Q6go+h4L
 Mcg2A158fK/i/92d70fGvpBRM437nR5oZ5dqvsb48VCz9OyLKesIE7j97E/+KuaHcdBa
 7UJw/gTa1dxXSSftYCd+xPgGmMtQHfnOo4sZois/OudOqvPj7iFR1M91EqpoH34aJdmA
 NE6+M+OmA6lBrBTlqrrOGFddLa3nytxfEqTw/Qq1wi3UBgrYepxs9ESu2c9u51TUJGL8
 Xm4w==
X-Gm-Message-State: APjAAAV790kCT7jp+PJA8M0ucgnyIDw0+4+DfbwqisVzRzQBssxvS8KO
 IDfC+yqSmpJgIuRxTq8rH/2UDeAl2rY=
X-Google-Smtp-Source: APXvYqyTawcP4uedvvFYC9O38pAz3nVykeaV5Olb98iEDffywkAeKt/7Tdzpod2cUxpjshdiX8D9Lw==
X-Received: by 2002:a63:6383:: with SMTP id
 x125mr47280511pgb.409.1582505490024; 
 Sun, 23 Feb 2020 16:51:30 -0800 (PST)
Received: from localhost ([106.51.232.35])
 by smtp.gmail.com with ESMTPSA id r72sm9816807pjb.18.2020.02.23.16.51.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 23 Feb 2020 16:51:29 -0800 (PST)
Date: Mon, 24 Feb 2020 06:21:28 +0530
From: afzal mohammed <afzal.mohd.ma@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/18] powerpc: Replace setup_irq() by request_irq()
Message-ID: <2258497a01bb136305fb698282f5620020881fe7.1582471508.git.afzal.mohd.ma@gmail.com>
References: <cover.1582471508.git.afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1582471508.git.afzal.mohd.ma@gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
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

request_irq() is preferred over setup_irq(). The early boot setup_irq()
invocations happen either via 'init_IRQ()' or 'time_init()', while
memory allocators are ready by 'mm_init()'.

Per tglx[1], setup_irq() existed in olden days when allocators were not
ready by the time early interrupts were initialized.

Hence replace setup_irq() by request_irq().

Seldom remove_irq() usage has been observed coupled with setup_irq(),
wherever that has been found, it too has been replaced by free_irq().

[1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos

Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
Tested-by: Christophe Leroy <christophe.leroy@c-s.fr> # for 8xx parts
---

v2:
 * Replace pr_err("request_irq() on %s failed" by
           pr_err("%s: request_irq() failed"
 * Commit message massage

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
index fcf6f2342ef4..3f4e324f1d67 100644
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
+			pr_err("%s: request_irq() failed\n", "XMON break");
+	}
 #endif
 }
 
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 2e969073473d..a08b0ddc2764 100644
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
+			pr_err("%s: request_irq() failed\n", "cascade");
+	}
 
 	printk(KERN_INFO "irq: System has %d possible interrupts\n", max_irqs);
 #ifdef CONFIG_XMON
-	setup_irq(irq_create_mapping(NULL, 20), &xmon_action);
+	if (request_irq(irq_create_mapping(NULL, 20), xmon_irq, IRQF_NO_THREAD,
+			"NMI - XMON", NULL))
+		pr_err("%s: request_irq() failed\n", "NMI - XMON");
 #endif
 }
 
@@ -441,7 +432,11 @@ static void __init pmac_pic_setup_mpic_nmi(struct mpic *mpic)
 		nmi_irq = irq_of_parse_and_map(pswitch, 0);
 		if (nmi_irq) {
 			mpic_irq_set_priority(nmi_irq, 9);
-			setup_irq(nmi_irq, &xmon_action);
+			if (request_irq(nmi_irq, xmon_irq, IRQF_NO_THREAD,
+					"NMI - XMON", NULL)) {
+				pr_err("%s: request_irq() failed\n",
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
2.25.1

