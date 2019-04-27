Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55677B308
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 09:13:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rhwy4Y8ZzDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 17:13:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rhsF5lLVzDqXK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 17:10:39 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7B7EC1A0099;
 Sat, 27 Apr 2019 09:10:36 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6D9111A000B;
 Sat, 27 Apr 2019 09:10:36 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net
 (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id E1EA5205ED;
 Sat, 27 Apr 2019 09:10:35 +0200 (CEST)
From: laurentiu.tudor@nxp.com
To: netdev@vger.kernel.org, madalin.bucur@nxp.com, roy.pledge@nxp.com,
 camelia.groza@nxp.com, leoyang.li@nxp.com
Subject: [PATCH v2 2/9] soc/fsl/qbman_portals: add APIs to retrieve the
 probing status
Date: Sat, 27 Apr 2019 10:10:24 +0300
Message-Id: <20190427071031.6563-3-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190427071031.6563-1-laurentiu.tudor@nxp.com>
References: <20190427071031.6563-1-laurentiu.tudor@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Add a couple of new APIs to check the probing status of the required
cpu bound qman and bman portals:
 'int bman_portals_probed()' and 'int qman_portals_probed()'.
They return the following values.
 *  1 if qman/bman portals were all probed correctly
 *  0 if qman/bman portals were not yet probed
 * -1 if probing of qman/bman portals failed
Portals are considered successful probed if no error occurred during
the probing of any of the portals and if enough portals were probed
to have one available for each cpu.
The error handling paths were slightly rearranged in order to fit this
new functionality without being too intrusive.
Drivers that use qman/bman portal driver services are required to use
these APIs before calling any functions exported by these drivers or
otherwise they will crash the kernel.
First user will be the dpaa1 ethernet driver, coming in a subsequent
patch.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 drivers/soc/fsl/qbman/bman_portal.c | 20 ++++++++++++++++----
 drivers/soc/fsl/qbman/qman_portal.c | 21 +++++++++++++++++----
 include/soc/fsl/bman.h              |  8 ++++++++
 include/soc/fsl/qman.h              |  9 +++++++++
 4 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/fsl/qbman/bman_portal.c b/drivers/soc/fsl/qbman/bman_portal.c
index 2c95cf59f3e7..cf4f10d6f590 100644
--- a/drivers/soc/fsl/qbman/bman_portal.c
+++ b/drivers/soc/fsl/qbman/bman_portal.c
@@ -32,6 +32,7 @@
 
 static struct bman_portal *affine_bportals[NR_CPUS];
 static struct cpumask portal_cpus;
+static int __bman_portals_probed;
 /* protect bman global registers and global data shared among portals */
 static DEFINE_SPINLOCK(bman_lock);
 
@@ -87,6 +88,12 @@ static int bman_online_cpu(unsigned int cpu)
 	return 0;
 }
 
+int bman_portals_probed(void)
+{
+	return __bman_portals_probed;
+}
+EXPORT_SYMBOL_GPL(bman_portals_probed);
+
 static int bman_portal_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -104,8 +111,10 @@ static int bman_portal_probe(struct platform_device *pdev)
 	}
 
 	pcfg = devm_kmalloc(dev, sizeof(*pcfg), GFP_KERNEL);
-	if (!pcfg)
+	if (!pcfg) {
+		__bman_portals_probed = -1;
 		return -ENOMEM;
+	}
 
 	pcfg->dev = dev;
 
@@ -113,14 +122,14 @@ static int bman_portal_probe(struct platform_device *pdev)
 					     DPAA_PORTAL_CE);
 	if (!addr_phys[0]) {
 		dev_err(dev, "Can't get %pOF property 'reg::CE'\n", node);
-		return -ENXIO;
+		goto err_ioremap1;
 	}
 
 	addr_phys[1] = platform_get_resource(pdev, IORESOURCE_MEM,
 					     DPAA_PORTAL_CI);
 	if (!addr_phys[1]) {
 		dev_err(dev, "Can't get %pOF property 'reg::CI'\n", node);
-		return -ENXIO;
+		goto err_ioremap1;
 	}
 
 	pcfg->cpu = -1;
@@ -128,7 +137,7 @@ static int bman_portal_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0) {
 		dev_err(dev, "Can't get %pOF IRQ'\n", node);
-		return -ENXIO;
+		goto err_ioremap1;
 	}
 	pcfg->irq = irq;
 
@@ -150,6 +159,7 @@ static int bman_portal_probe(struct platform_device *pdev)
 	spin_lock(&bman_lock);
 	cpu = cpumask_next_zero(-1, &portal_cpus);
 	if (cpu >= nr_cpu_ids) {
+		__bman_portals_probed = 1;
 		/* unassigned portal, skip init */
 		spin_unlock(&bman_lock);
 		return 0;
@@ -175,6 +185,8 @@ static int bman_portal_probe(struct platform_device *pdev)
 err_ioremap2:
 	memunmap(pcfg->addr_virt_ce);
 err_ioremap1:
+	 __bman_portals_probed = -1;
+
 	return -ENXIO;
 }
 
diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
index 661c9b234d32..e2186b681d87 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -38,6 +38,7 @@ EXPORT_SYMBOL(qman_dma_portal);
 #define CONFIG_FSL_DPA_PIRQ_FAST  1
 
 static struct cpumask portal_cpus;
+static int __qman_portals_probed;
 /* protect qman global registers and global data shared among portals */
 static DEFINE_SPINLOCK(qman_lock);
 
@@ -220,6 +221,12 @@ static int qman_online_cpu(unsigned int cpu)
 	return 0;
 }
 
+int qman_portals_probed(void)
+{
+	return __qman_portals_probed;
+}
+EXPORT_SYMBOL_GPL(qman_portals_probed);
+
 static int qman_portal_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -238,8 +245,10 @@ static int qman_portal_probe(struct platform_device *pdev)
 	}
 
 	pcfg = devm_kmalloc(dev, sizeof(*pcfg), GFP_KERNEL);
-	if (!pcfg)
+	if (!pcfg) {
+		__qman_portals_probed = -1;
 		return -ENOMEM;
+	}
 
 	pcfg->dev = dev;
 
@@ -247,19 +256,20 @@ static int qman_portal_probe(struct platform_device *pdev)
 					     DPAA_PORTAL_CE);
 	if (!addr_phys[0]) {
 		dev_err(dev, "Can't get %pOF property 'reg::CE'\n", node);
-		return -ENXIO;
+		goto err_ioremap1;
 	}
 
 	addr_phys[1] = platform_get_resource(pdev, IORESOURCE_MEM,
 					     DPAA_PORTAL_CI);
 	if (!addr_phys[1]) {
 		dev_err(dev, "Can't get %pOF property 'reg::CI'\n", node);
-		return -ENXIO;
+		goto err_ioremap1;
 	}
 
 	err = of_property_read_u32(node, "cell-index", &val);
 	if (err) {
 		dev_err(dev, "Can't get %pOF property 'cell-index'\n", node);
+		__qman_portals_probed = -1;
 		return err;
 	}
 	pcfg->channel = val;
@@ -267,7 +277,7 @@ static int qman_portal_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0) {
 		dev_err(dev, "Can't get %pOF IRQ\n", node);
-		return -ENXIO;
+		goto err_ioremap1;
 	}
 	pcfg->irq = irq;
 
@@ -291,6 +301,7 @@ static int qman_portal_probe(struct platform_device *pdev)
 	spin_lock(&qman_lock);
 	cpu = cpumask_next_zero(-1, &portal_cpus);
 	if (cpu >= nr_cpu_ids) {
+		__qman_portals_probed = 1;
 		/* unassigned portal, skip init */
 		spin_unlock(&qman_lock);
 		return 0;
@@ -321,6 +332,8 @@ static int qman_portal_probe(struct platform_device *pdev)
 err_ioremap2:
 	memunmap(pcfg->addr_virt_ce);
 err_ioremap1:
+	__qman_portals_probed = -1;
+
 	return -ENXIO;
 }
 
diff --git a/include/soc/fsl/bman.h b/include/soc/fsl/bman.h
index 5b99cb2ea5ef..173e4049d963 100644
--- a/include/soc/fsl/bman.h
+++ b/include/soc/fsl/bman.h
@@ -133,5 +133,13 @@ int bman_acquire(struct bman_pool *pool, struct bm_buffer *bufs, u8 num);
  * failed to probe or 0 if the bman driver did not probed yet.
  */
 int bman_is_probed(void);
+/**
+ * bman_portals_probed - Check if all cpu bound bman portals are probed
+ *
+ * Returns 1 if all the required cpu bound bman portals successfully probed,
+ * -1 if probe errors appeared or 0 if the bman portals did not yet finished
+ * probing.
+ */
+int bman_portals_probed(void);
 
 #endif	/* __FSL_BMAN_H */
diff --git a/include/soc/fsl/qman.h b/include/soc/fsl/qman.h
index 5cc7af06c1ba..aa31c05a103a 100644
--- a/include/soc/fsl/qman.h
+++ b/include/soc/fsl/qman.h
@@ -1194,6 +1194,15 @@ int qman_release_cgrid(u32 id);
  */
 int qman_is_probed(void);
 
+/**
+ * qman_portals_probed - Check if all cpu bound qman portals are probed
+ *
+ * Returns 1 if all the required cpu bound qman portals successfully probed,
+ * -1 if probe errors appeared or 0 if the qman portals did not yet finished
+ * probing.
+ */
+int qman_portals_probed(void);
+
 /**
  * qman_dqrr_get_ithresh - Get coalesce interrupt threshold
  * @portal: portal to get the value for
-- 
2.17.1

