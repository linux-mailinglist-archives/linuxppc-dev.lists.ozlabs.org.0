Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE0446236
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:33:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlxg62ckdz3cVt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:33:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.48.137; helo=9.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 9.mo548.mail-out.ovh.net (9.mo548.mail-out.ovh.net
 [46.105.48.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlxdw3Wkzz2yyf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:32:20 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C3D802107C;
 Fri,  5 Nov 2021 10:26:39 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00386169a73-6da9-4df1-bfd6-ae3de5b1ef00,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 01/11] powerpc/xive: Replace pr_devel() by pr_debug() to ease
 debug
Date: Fri, 5 Nov 2021 11:26:26 +0100
Message-ID: <20211105102636.1016378-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6c04bf67-6dbc-4a42-a9c2-b72b6d4dcce5
X-Ovh-Tracer-Id: 495114488037870557
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These routines are not on hot code paths and pr_debug() is easier to
activate. Also add a '0x' prefix to hex printed values (HW IRQ number).

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 29 +++++++++++------------
 arch/powerpc/sysdev/xive/spapr.c  | 38 +++++++++++++++----------------
 2 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index c5d75c02ad8b..7280ff3fef2d 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -451,6 +451,8 @@ static void xive_do_source_set_mask(struct xive_irq_data *xd,
 {
 	u64 val;
 
+	pr_debug("%s: HW 0x%x %smask\n", __func__, xd->hw_irq, mask ? "" : "un");
+
 	/*
 	 * If the interrupt had P set, it may be in a queue.
 	 *
@@ -612,8 +614,8 @@ static unsigned int xive_irq_startup(struct irq_data *d)
 
 	xd->saved_p = false;
 	xd->stale_p = false;
-	pr_devel("xive_irq_startup: irq %d [0x%x] data @%p\n",
-		 d->irq, hw_irq, d);
+
+	pr_debug("%s: irq %d [0x%x] data @%p\n", __func__, d->irq, hw_irq, d);
 
 	/* Pick a target */
 	target = xive_pick_irq_target(d, irq_data_get_affinity_mask(d));
@@ -654,8 +656,7 @@ static void xive_irq_shutdown(struct irq_data *d)
 	struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
 	unsigned int hw_irq = (unsigned int)irqd_to_hwirq(d);
 
-	pr_devel("xive_irq_shutdown: irq %d [0x%x] data @%p\n",
-		 d->irq, hw_irq, d);
+	pr_debug("%s: irq %d [0x%x] data @%p\n", __func__, d->irq, hw_irq, d);
 
 	if (WARN_ON(xd->target == XIVE_INVALID_TARGET))
 		return;
@@ -679,7 +680,7 @@ static void xive_irq_unmask(struct irq_data *d)
 {
 	struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
 
-	pr_devel("xive_irq_unmask: irq %d data @%p\n", d->irq, xd);
+	pr_debug("%s: irq %d data @%p\n", __func__, d->irq, xd);
 
 	xive_do_source_set_mask(xd, false);
 }
@@ -688,7 +689,7 @@ static void xive_irq_mask(struct irq_data *d)
 {
 	struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
 
-	pr_devel("xive_irq_mask: irq %d data @%p\n", d->irq, xd);
+	pr_debug("%s: irq %d data @%p\n", __func__, d->irq, xd);
 
 	xive_do_source_set_mask(xd, true);
 }
@@ -702,7 +703,7 @@ static int xive_irq_set_affinity(struct irq_data *d,
 	u32 target, old_target;
 	int rc = 0;
 
-	pr_debug("%s: irq %d/%x\n", __func__, d->irq, hw_irq);
+	pr_debug("%s: irq %d/0x%x\n", __func__, d->irq, hw_irq);
 
 	/* Is this valid ? */
 	if (cpumask_any_and(cpumask, cpu_online_mask) >= nr_cpu_ids)
@@ -975,7 +976,7 @@ EXPORT_SYMBOL_GPL(is_xive_irq);
 
 void xive_cleanup_irq_data(struct xive_irq_data *xd)
 {
-	pr_debug("%s for HW %x\n", __func__, xd->hw_irq);
+	pr_debug("%s for HW 0x%x\n", __func__, xd->hw_irq);
 
 	if (xd->eoi_mmio) {
 		iounmap(xd->eoi_mmio);
@@ -1211,8 +1212,8 @@ static int xive_setup_cpu_ipi(unsigned int cpu)
 		pr_err("Failed to map IPI CPU %d\n", cpu);
 		return -EIO;
 	}
-	pr_devel("CPU %d HW IPI %x, virq %d, trig_mmio=%p\n", cpu,
-	    xc->hw_ipi, xive_ipi_irq, xc->ipi_data.trig_mmio);
+	pr_debug("CPU %d HW IPI 0x%x, virq %d, trig_mmio=%p\n", cpu,
+		 xc->hw_ipi, xive_ipi_irq, xc->ipi_data.trig_mmio);
 
 	/* Unmask it */
 	xive_do_source_set_mask(&xc->ipi_data, false);
@@ -1390,7 +1391,7 @@ static int xive_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	if (rc)
 		return rc;
 
-	pr_debug("%s %d/%lx #%d\n", __func__, virq, hwirq, nr_irqs);
+	pr_debug("%s %d/0x%lx #%d\n", __func__, virq, hwirq, nr_irqs);
 
 	for (i = 0; i < nr_irqs; i++) {
 		/* TODO: call xive_irq_domain_map() */
@@ -1505,7 +1506,7 @@ static void xive_setup_cpu(void)
 #ifdef CONFIG_SMP
 void xive_smp_setup_cpu(void)
 {
-	pr_devel("SMP setup CPU %d\n", smp_processor_id());
+	pr_debug("SMP setup CPU %d\n", smp_processor_id());
 
 	/* This will have already been done on the boot CPU */
 	if (smp_processor_id() != boot_cpuid)
@@ -1651,10 +1652,10 @@ bool __init xive_core_init(struct device_node *np, const struct xive_ops *ops,
 	ppc_md.get_irq = xive_get_irq;
 	__xive_enabled = true;
 
-	pr_devel("Initializing host..\n");
+	pr_debug("Initializing host..\n");
 	xive_init_host(np);
 
-	pr_devel("Initializing boot CPU..\n");
+	pr_debug("Initializing boot CPU..\n");
 
 	/* Allocate per-CPU data and queues */
 	xive_prepare_cpu(smp_processor_id());
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index f143b6f111ac..77943dc70860 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -173,7 +173,7 @@ static long plpar_int_get_source_info(unsigned long flags,
 	} while (plpar_busy_delay(rc));
 
 	if (rc) {
-		pr_err("H_INT_GET_SOURCE_INFO lisn=%ld failed %ld\n", lisn, rc);
+		pr_err("H_INT_GET_SOURCE_INFO lisn=0x%lx failed %ld\n", lisn, rc);
 		return rc;
 	}
 
@@ -182,8 +182,8 @@ static long plpar_int_get_source_info(unsigned long flags,
 	*trig_page = retbuf[2];
 	*esb_shift = retbuf[3];
 
-	pr_devel("H_INT_GET_SOURCE_INFO flags=%lx eoi=%lx trig=%lx shift=%lx\n",
-		retbuf[0], retbuf[1], retbuf[2], retbuf[3]);
+	pr_debug("H_INT_GET_SOURCE_INFO lisn=0x%lx flags=0x%lx eoi=0x%lx trig=0x%lx shift=0x%lx\n",
+		 lisn, retbuf[0], retbuf[1], retbuf[2], retbuf[3]);
 
 	return 0;
 }
@@ -200,8 +200,8 @@ static long plpar_int_set_source_config(unsigned long flags,
 	long rc;
 
 
-	pr_devel("H_INT_SET_SOURCE_CONFIG flags=%lx lisn=%lx target=%lx prio=%lx sw_irq=%lx\n",
-		flags, lisn, target, prio, sw_irq);
+	pr_debug("H_INT_SET_SOURCE_CONFIG flags=0x%lx lisn=0x%lx target=%ld prio=%ld sw_irq=%ld\n",
+		 flags, lisn, target, prio, sw_irq);
 
 
 	do {
@@ -210,7 +210,7 @@ static long plpar_int_set_source_config(unsigned long flags,
 	} while (plpar_busy_delay(rc));
 
 	if (rc) {
-		pr_err("H_INT_SET_SOURCE_CONFIG lisn=%ld target=%lx prio=%lx failed %ld\n",
+		pr_err("H_INT_SET_SOURCE_CONFIG lisn=0x%lx target=%ld prio=%ld failed %ld\n",
 		       lisn, target, prio, rc);
 		return rc;
 	}
@@ -227,7 +227,7 @@ static long plpar_int_get_source_config(unsigned long flags,
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
 	long rc;
 
-	pr_devel("H_INT_GET_SOURCE_CONFIG flags=%lx lisn=%lx\n", flags, lisn);
+	pr_debug("H_INT_GET_SOURCE_CONFIG flags=0x%lx lisn=0x%lx\n", flags, lisn);
 
 	do {
 		rc = plpar_hcall(H_INT_GET_SOURCE_CONFIG, retbuf, flags, lisn,
@@ -235,7 +235,7 @@ static long plpar_int_get_source_config(unsigned long flags,
 	} while (plpar_busy_delay(rc));
 
 	if (rc) {
-		pr_err("H_INT_GET_SOURCE_CONFIG lisn=%ld failed %ld\n",
+		pr_err("H_INT_GET_SOURCE_CONFIG lisn=0x%lx failed %ld\n",
 		       lisn, rc);
 		return rc;
 	}
@@ -244,8 +244,8 @@ static long plpar_int_get_source_config(unsigned long flags,
 	*prio   = retbuf[1];
 	*sw_irq = retbuf[2];
 
-	pr_devel("H_INT_GET_SOURCE_CONFIG target=%lx prio=%lx sw_irq=%lx\n",
-		retbuf[0], retbuf[1], retbuf[2]);
+	pr_debug("H_INT_GET_SOURCE_CONFIG target=%ld prio=%ld sw_irq=%ld\n",
+		 retbuf[0], retbuf[1], retbuf[2]);
 
 	return 0;
 }
@@ -273,8 +273,8 @@ static long plpar_int_get_queue_info(unsigned long flags,
 	*esn_page = retbuf[0];
 	*esn_size = retbuf[1];
 
-	pr_devel("H_INT_GET_QUEUE_INFO page=%lx size=%lx\n",
-		retbuf[0], retbuf[1]);
+	pr_debug("H_INT_GET_QUEUE_INFO cpu=%ld prio=%ld page=0x%lx size=0x%lx\n",
+		 target, priority, retbuf[0], retbuf[1]);
 
 	return 0;
 }
@@ -289,8 +289,8 @@ static long plpar_int_set_queue_config(unsigned long flags,
 {
 	long rc;
 
-	pr_devel("H_INT_SET_QUEUE_CONFIG flags=%lx target=%lx priority=%lx qpage=%lx qsize=%lx\n",
-		flags,  target, priority, qpage, qsize);
+	pr_debug("H_INT_SET_QUEUE_CONFIG flags=0x%lx target=%ld priority=0x%lx qpage=0x%lx qsize=0x%lx\n",
+		 flags,  target, priority, qpage, qsize);
 
 	do {
 		rc = plpar_hcall_norets(H_INT_SET_QUEUE_CONFIG, flags, target,
@@ -298,7 +298,7 @@ static long plpar_int_set_queue_config(unsigned long flags,
 	} while (plpar_busy_delay(rc));
 
 	if (rc) {
-		pr_err("H_INT_SET_QUEUE_CONFIG cpu=%ld prio=%ld qpage=%lx returned %ld\n",
+		pr_err("H_INT_SET_QUEUE_CONFIG cpu=%ld prio=%ld qpage=0x%lx returned %ld\n",
 		       target, priority, qpage, rc);
 		return  rc;
 	}
@@ -315,7 +315,7 @@ static long plpar_int_sync(unsigned long flags, unsigned long lisn)
 	} while (plpar_busy_delay(rc));
 
 	if (rc) {
-		pr_err("H_INT_SYNC lisn=%ld returned %ld\n", lisn, rc);
+		pr_err("H_INT_SYNC lisn=0x%lx returned %ld\n", lisn, rc);
 		return  rc;
 	}
 
@@ -333,8 +333,8 @@ static long plpar_int_esb(unsigned long flags,
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
 	long rc;
 
-	pr_devel("H_INT_ESB flags=%lx lisn=%lx offset=%lx in=%lx\n",
-		flags,  lisn, offset, in_data);
+	pr_debug("H_INT_ESB flags=0x%lx lisn=0x%lx offset=0x%lx in=0x%lx\n",
+		 flags,  lisn, offset, in_data);
 
 	do {
 		rc = plpar_hcall(H_INT_ESB, retbuf, flags, lisn, offset,
@@ -342,7 +342,7 @@ static long plpar_int_esb(unsigned long flags,
 	} while (plpar_busy_delay(rc));
 
 	if (rc) {
-		pr_err("H_INT_ESB lisn=%ld offset=%ld returned %ld\n",
+		pr_err("H_INT_ESB lisn=0x%lx offset=0x%lx returned %ld\n",
 		       lisn, offset, rc);
 		return  rc;
 	}
-- 
2.31.1

