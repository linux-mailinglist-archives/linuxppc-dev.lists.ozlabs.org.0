Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9788326BF55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 10:32:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Brtcb0dz0zDqMv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 18:31:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrtVk2swtzDqMx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 18:26:53 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 021DA1A0A95;
 Wed, 16 Sep 2020 10:26:51 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3AC1A1A00C2;
 Wed, 16 Sep 2020 10:26:47 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3A1224030D;
 Wed, 16 Sep 2020 10:26:42 +0200 (CEST)
From: Ran Wang <ran.wang_1@nxp.com>
To: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 2/5] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Date: Wed, 16 Sep 2020 16:18:28 +0800
Message-Id: <20200916081831.24747-2-ran.wang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916081831.24747-1-ran.wang_1@nxp.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
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
Cc: devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>,
 linux-kernel@vger.kernel.org, Ran Wang <ran.wang_1@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Biwen Li <biwen.li@nxp.com>

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
Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
 drivers/soc/fsl/rcpm.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index a093dbe..e6354f5 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -2,7 +2,7 @@
 //
 // rcpm.c - Freescale QorIQ RCPM driver
 //
-// Copyright 2019 NXP
+// Copyright 2019-2020 NXP
 //
 // Author: Ran Wang <ran.wang_1@nxp.com>
 
@@ -13,6 +13,9 @@
 #include <linux/slab.h>
 #include <linux/suspend.h>
 #include <linux/kernel.h>
+#include <linux/acpi.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 #define RCPM_WAKEUP_CELL_MAX_SIZE	7
 
@@ -37,6 +40,9 @@ static int rcpm_pm_prepare(struct device *dev)
 	struct device_node	*np = dev->of_node;
 	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
 	u32 setting[RCPM_WAKEUP_CELL_MAX_SIZE] = {0};
+	struct regmap *scfg_addr_regmap = NULL;
+	u32 reg_offset[2];
+	u32 reg_value = 0;
 
 	rcpm = dev_get_drvdata(dev);
 	if (!rcpm)
@@ -90,6 +96,40 @@ static int rcpm_pm_prepare(struct device *dev)
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
+				continue;
+			}
+
+			if (scfg_addr_regmap && (i == 1)) {
+				if (device_property_read_u32_array(dev,
+				    "fsl,ippdexpcr1-alt-addr",
+				    reg_offset,
+				    2)) {
+					scfg_addr_regmap = NULL;
+					continue;
+				}
+				/* Read value from register SCFG_SPARECR8 */
+				regmap_read(scfg_addr_regmap,
+					    reg_offset[1],
+					    &reg_value);
+				/* Write value to register SCFG_SPARECR8 */
+				regmap_write(scfg_addr_regmap,
+					     reg_offset[1],
+					     tmp | reg_value);
+			}
+		}
 	}
 
 	return 0;
-- 
2.7.4

