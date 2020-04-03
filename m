Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9280119E207
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 03:02:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vJSP1zqRzDsGt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 12:02:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=ykaukab@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vCYg36rTzDqch
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 08:21:52 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9EDBDAD41;
 Fri,  3 Apr 2020 21:21:47 +0000 (UTC)
From: Mian Yousaf Kaukab <ykaukab@suse.de>
To: linux-pm@vger.kernel.org, andy.tang@nxp.com, shawnguo@kernel.org,
 leoyang.li@nxp.com
Subject: [PATCH 1/2] cpufreq: qoriq: convert to a platform driver
Date: Fri,  3 Apr 2020 23:21:13 +0200
Message-Id: <20200403212114.15565-1-ykaukab@suse.de>
X-Mailer: git-send-email 2.16.4
X-Mailman-Approved-At: Sat, 04 Apr 2020 11:59:21 +1100
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
Cc: Mian Yousaf Kaukab <ykaukab@suse.de>, viresh.kumar@linaro.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The driver has to be manually loaded if it is built as a module. It
is neither exporting MODULE_DEVICE_TABLE nor MODULE_ALIAS. Moreover,
no platform-device is created (and thus no uevent is sent) for the
clockgen nodes it depends on.

Convert the module to a platform driver with its own alias. Moreover,
drop whitelisted SOCs. Platform device will be created only for the
compatible platforms.

Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
---
 drivers/cpufreq/qoriq-cpufreq.c | 76 ++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 47 deletions(-)

diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
index 8e436dc75c8b..6b6b20da2bcf 100644
--- a/drivers/cpufreq/qoriq-cpufreq.c
+++ b/drivers/cpufreq/qoriq-cpufreq.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
+#include <linux/platform_device.h>
 
 /**
  * struct cpu_data
@@ -29,12 +30,6 @@ struct cpu_data {
 	struct cpufreq_frequency_table *table;
 };
 
-/*
- * Don't use cpufreq on this SoC -- used when the SoC would have otherwise
- * matched a more generic compatible.
- */
-#define SOC_BLACKLIST		1
-
 /**
  * struct soc_data - SoC specific data
  * @flags: SOC_xxx
@@ -264,64 +259,51 @@ static struct cpufreq_driver qoriq_cpufreq_driver = {
 	.attr		= cpufreq_generic_attr,
 };
 
-static const struct soc_data blacklist = {
-	.flags = SOC_BLACKLIST,
-};
-
-static const struct of_device_id node_matches[] __initconst = {
+static const struct of_device_id qoriq_cpufreq_blacklist[] = {
 	/* e6500 cannot use cpufreq due to erratum A-008083 */
-	{ .compatible = "fsl,b4420-clockgen", &blacklist },
-	{ .compatible = "fsl,b4860-clockgen", &blacklist },
-	{ .compatible = "fsl,t2080-clockgen", &blacklist },
-	{ .compatible = "fsl,t4240-clockgen", &blacklist },
-
-	{ .compatible = "fsl,ls1012a-clockgen", },
-	{ .compatible = "fsl,ls1021a-clockgen", },
-	{ .compatible = "fsl,ls1028a-clockgen", },
-	{ .compatible = "fsl,ls1043a-clockgen", },
-	{ .compatible = "fsl,ls1046a-clockgen", },
-	{ .compatible = "fsl,ls1088a-clockgen", },
-	{ .compatible = "fsl,ls2080a-clockgen", },
-	{ .compatible = "fsl,lx2160a-clockgen", },
-	{ .compatible = "fsl,p4080-clockgen", },
-	{ .compatible = "fsl,qoriq-clockgen-1.0", },
-	{ .compatible = "fsl,qoriq-clockgen-2.0", },
+	{ .compatible = "fsl,b4420-clockgen", },
+	{ .compatible = "fsl,b4860-clockgen", },
+	{ .compatible = "fsl,t2080-clockgen", },
+	{ .compatible = "fsl,t4240-clockgen", },
 	{}
 };
 
-static int __init qoriq_cpufreq_init(void)
+static int qoriq_cpufreq_probe(struct platform_device *pdev)
 {
 	int ret;
-	struct device_node  *np;
-	const struct of_device_id *match;
-	const struct soc_data *data;
-
-	np = of_find_matching_node(NULL, node_matches);
-	if (!np)
-		return -ENODEV;
-
-	match = of_match_node(node_matches, np);
-	data = match->data;
-
-	of_node_put(np);
+	struct device_node *np;
 
-	if (data && data->flags & SOC_BLACKLIST)
+	np = of_find_matching_node(NULL, qoriq_cpufreq_blacklist);
+	if (np) {
+		dev_info(&pdev->dev, "Disabling due to erratum A-008083");
 		return -ENODEV;
+	}
 
 	ret = cpufreq_register_driver(&qoriq_cpufreq_driver);
-	if (!ret)
-		pr_info("Freescale QorIQ CPU frequency scaling driver\n");
+	if (ret)
+		return ret;
 
-	return ret;
+	dev_info(&pdev->dev, "Freescale QorIQ CPU frequency scaling driver\n");
+	return 0;
 }
-module_init(qoriq_cpufreq_init);
 
-static void __exit qoriq_cpufreq_exit(void)
+static int qoriq_cpufreq_remove(struct platform_device *pdev)
 {
 	cpufreq_unregister_driver(&qoriq_cpufreq_driver);
+
+	return 0;
 }
-module_exit(qoriq_cpufreq_exit);
 
+static struct platform_driver qoriq_cpufreq_platform_driver = {
+	.driver = {
+		.name = "qoriq-cpufreq",
+	},
+	.probe = qoriq_cpufreq_probe,
+	.remove = qoriq_cpufreq_remove,
+};
+module_platform_driver(qoriq_cpufreq_platform_driver);
+
+MODULE_ALIAS("platform:qoriq-cpufreq");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Tang Yuantian <Yuantian.Tang@freescale.com>");
 MODULE_DESCRIPTION("cpufreq driver for Freescale QorIQ series SoCs");
-- 
2.16.4

