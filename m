Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE63827BFC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 10:39:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0t9T1C6NzDqWQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 18:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0szw63Y6zDqSk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 18:31:23 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6404C201185;
 Tue, 29 Sep 2020 10:31:20 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AC477201181;
 Tue, 29 Sep 2020 10:31:16 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 21327402FA;
 Tue, 29 Sep 2020 10:31:12 +0200 (CEST)
From: Ran Wang <ran.wang_1@nxp.com>
To: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v3 2/5] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Date: Tue, 29 Sep 2020 16:22:31 +0800
Message-Id: <20200929082234.36619-2-ran.wang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929082234.36619-1-ran.wang_1@nxp.com>
References: <20200929082234.36619-1-ran.wang_1@nxp.com>
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

Hardware issue:
- Reading register RCPM_IPPDEXPCR1 always return zero, this causes
  system firmware could not get correct information and wrongly do
  clock gating for all wakeup source IP during system suspend. Then
  those IPs will never get chance to wake system.

Workaround:
- Copy register RCPM_IPPDEXPCR1's setting to register SCFG_SPARECR8
  to allow system firmware's psci method read it and do things accordingly.

Signed-off-by: Biwen Li <biwen.li@nxp.com>
Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
Change in v3:
 - Add  copy_ippdexpcr1_setting(), simplize workaournd's implementation
   according to binding update.
 - Minor update on commit message.

Change in v2:
 - Update commit message to be more clear.
 - Replace device_property_read_u32_array() with syscon_regmap_lookup_by_phandle_args()
   to make code simpler.

 drivers/soc/fsl/rcpm.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index a093dbe..4ac2a77 100644
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
 
@@ -22,6 +22,28 @@ struct rcpm {
 	bool		little_endian;
 };
 
+#define  SCFG_SPARECR8	0x051c
+
+static void copy_ippdexpcr1_setting(u32 val)
+{
+	struct device_node *np;
+	void __iomem *regs;
+	u32 reg_val;
+
+	np = of_find_compatible_node(NULL, NULL, "fsl,ls1021a-scfg");
+	if (!np)
+		return;
+
+	regs = of_iomap(np, 0);
+	if (!regs)
+		return;
+
+	reg_val = ioread32be(regs + SCFG_SPARECR8);
+	iowrite32be(val | reg_val, regs + SCFG_SPARECR8);
+
+	iounmap(regs);
+}
+
 /**
  * rcpm_pm_prepare - performs device-level tasks associated with power
  * management, such as programming related to the wakeup source control.
@@ -90,6 +112,17 @@ static int rcpm_pm_prepare(struct device *dev)
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
+		if (dev_of_node(dev) && (i == 1))
+			if (device_property_read_bool(dev, "fsl,ippdexpcr1-alt-reg"))
+				copy_ippdexpcr1_setting(tmp);
 	}
 
 	return 0;
-- 
2.7.4

