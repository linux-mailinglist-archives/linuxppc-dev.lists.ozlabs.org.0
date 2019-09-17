Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B7FB46A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 06:54:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XW3g2RHwzF1vy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 14:54:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=biwen.li@nxp.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XW164QmmzF42w
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 14:51:52 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 59854200667;
 Tue, 17 Sep 2019 06:51:47 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B242720064A;
 Tue, 17 Sep 2019 06:51:42 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C036C402A6;
 Tue, 17 Sep 2019 12:51:36 +0800 (SGT)
From: Biwen Li <biwen.li@nxp.com>
To: leoyang.li@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com
Subject: [v2,
 1/3] soc: fsl: fix that flextimer cannot wakeup system in deep sleep
 on LS1021A
Date: Tue, 17 Sep 2019 12:41:17 +0800
Message-Id: <20190917044119.21895-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
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

Why:
    - Cannot write register RCPM_IPPDEXPCR1 on LS1021A,
      Register RCPM_IPPDEXPCR1's default value is zero.
      So the register value that reading from register
      RCPM_IPPDEXPCR1 is always zero.

How:
    - Save register RCPM_IPPDEXPCR1's value to
      register SCFG_SPARECR8.(uboot's psci also
      need reading value from the register SCFG_SPARECR8
      to set register RCPM_IPPDEXPCR1)

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- fix stype problems

 drivers/soc/fsl/rcpm.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index 82c0ad5e663e..0b710c24999c 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -13,6 +13,8 @@
 #include <linux/slab.h>
 #include <linux/suspend.h>
 #include <linux/kernel.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 
 #define RCPM_WAKEUP_CELL_MAX_SIZE	7
 
@@ -63,6 +65,31 @@ static int rcpm_pm_prepare(struct device *dev)
 					tmp |= value[i + 1];
 					iowrite32be(tmp, rcpm->ippdexpcr_base + i * 4);
 				}
+				#ifdef CONFIG_SOC_LS1021A
+				/* Workaround: There is a bug of register ippdexpcr1,
+				 * cannot write it but can read it.Tt's default value is zero,
+				 * then read it will always returns zero.
+				 * So save ippdexpcr1's value to register SCFG_SPARECR8.
+				 * And the value of ippdexpcr1 will be read from SCFG_SPARECR8.
+				 */
+				{
+					struct regmap *rcpm_scfg_regmap = NULL;
+					u32 reg_offset[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
+					u32 reg_value = 0;
+
+					rcpm_scfg_regmap = syscon_regmap_lookup_by_phandle(np, "fsl,rcpm-scfg");
+					if (rcpm_scfg_regmap) {
+						if (of_property_read_u32_array(dev->of_node,
+						    "fsl,rcpm-scfg", reg_offset, rcpm->wakeup_cells + 1)) {
+							rcpm_scfg_regmap = NULL;
+							continue;
+						}
+						regmap_read(rcpm_scfg_regmap, reg_offset[i + 1], &reg_value);
+						/* Write value to register SCFG_SPARECR8 */
+						regmap_write(rcpm_scfg_regmap, reg_offset[i + 1], tmp | reg_value);
+					}
+				}
+				#endif //CONFIG_SOC_LS1021A
 			}
 		}
 	} while (ws = wakeup_source_get_next(ws));
-- 
2.17.1

