Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 008BD10FDD2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 13:40:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S1lq6kxMzDqSR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 23:40:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=biwen.li@nxp.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S1WL6fqtzDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 23:29:10 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 882F51A1340;
 Tue,  3 Dec 2019 13:29:06 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C7F6A1A0383;
 Tue,  3 Dec 2019 13:29:01 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 77C614028F;
 Tue,  3 Dec 2019 20:28:55 +0800 (SGT)
From: Biwen Li <biwen.li@nxp.com>
To: leoyang.li@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com, ran.wang_1@nxp.com
Subject: [v5 1/3] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Date: Tue,  3 Dec 2019 20:28:16 +0800
Message-Id: <20191203122818.21941-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.17.1
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Biwen Li <biwen.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Description:
	- Reading configuration register RCPM_IPPDEXPCR1
	  always return zero

Workaround:
	- Save register RCPM_IPPDEXPCR1's value to
	  register SCFG_SPARECR8.(uboot's psci also
	  need reading value from the register SCFG_SPARECR8
	  to set register RCPM_IPPDEXPCR1)

Impact:
	- FlexTimer module will cannot wakeup system in
	  deep sleep on SoC LS1021A

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v5:
	- update the patch, because of rcpm driver has updated.

Change in v4:
	- rename property name
	  fsl,ippdexpcr-alt-addr -> fsl,ippdexpcr1-alt-addr

Change in v3:
	- update commit message
	- rename property name
	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr

Change in v2:
  	- fix stype problems

 drivers/soc/fsl/rcpm.c | 47 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index a093dbe6d2cb..775c618f0456 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -6,13 +6,16 @@
 //
 // Author: Ran Wang <ran.wang_1@nxp.com>
 
+#include <linux/acpi.h>
 #include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
-#include <linux/kernel.h>
 
 #define RCPM_WAKEUP_CELL_MAX_SIZE	7
 
@@ -37,6 +40,9 @@ static int rcpm_pm_prepare(struct device *dev)
 	struct device_node	*np = dev->of_node;
 	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
 	u32 setting[RCPM_WAKEUP_CELL_MAX_SIZE] = {0};
+	struct regmap *scfg_addr_regmap = NULL;
+	u32 reg_offset[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
+	u32 reg_value = 0;
 
 	rcpm = dev_get_drvdata(dev);
 	if (!rcpm)
@@ -90,6 +96,43 @@ static int rcpm_pm_prepare(struct device *dev)
 			tmp |= ioread32be(address);
 			iowrite32be(tmp, address);
 		}
+		/*
+		 * Workaround of errata A-008646 on SoC LS1021A:
+		 * There is a bug of register ippdexpcr1.
+		 * Reading configuration register RCPM_IPPDEXPCR1
+		 * always return zero. So save ippdexpcr1's value
+		 * to register SCFG_SPARECR8.And the value of
+		 * ippdexpcr1 will be read from SCFG_SPARECR8.
+		 */
+		if (device_property_present(dev, "fsl,ippdexpcr1-alt-addr")) {
+			if (dev_of_node(dev)) {
+				scfg_addr_regmap = syscon_regmap_lookup_by_phandle(np,
+										   "fsl,ippdexpcr1-alt-addr");
+			} else if (is_acpi_node(dev->fwnode)) {
+				dev_err(dev, "not support acpi for rcpm\n");
+				continue;
+			}
+
+			if (scfg_addr_regmap && (i == 1)) {
+				if (device_property_read_u32_array(dev,
+				    "fsl,ippdexpcr1-alt-addr",
+				    reg_offset,
+				    1 + sizeof(u64)/sizeof(u32))) {
+					scfg_addr_regmap = NULL;
+					continue;
+				}
+				/* Read value from register SCFG_SPARECR8 */
+				regmap_read(scfg_addr_regmap,
+					    (u32)(((u64)(reg_offset[1] << (sizeof(u32) * 8) |
+					    reg_offset[2])) & 0xffffffff),
+					    &reg_value);
+				/* Write value to register SCFG_SPARECR8 */
+				regmap_write(scfg_addr_regmap,
+					     (u32)(((u64)(reg_offset[1] << (sizeof(u32) * 8) |
+					     reg_offset[2])) & 0xffffffff),
+					     tmp | reg_value);
+			}
+		}
 	}
 
 	return 0;
-- 
2.17.1

