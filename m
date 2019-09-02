Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9AFA4E4F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 06:23:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MH5f3xTdzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 14:23:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MGQs2dqxzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 13:53:41 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 77C291A005A;
 Mon,  2 Sep 2019 05:53:37 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8561C1A0006;
 Mon,  2 Sep 2019 05:53:30 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id BF43A402CB;
 Mon,  2 Sep 2019 11:53:21 +0800 (SGT)
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
 leoyang.li@nxp.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com,
 roy.zang@nxp.com, lorenzo.pieralisi@arm.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 3/3] PCI: layerscape: Add LS1028a support
Date: Mon,  2 Sep 2019 11:43:19 +0800
Message-Id: <20190902034319.14026-3-xiaowei.bao@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190902034319.14026-1-xiaowei.bao@nxp.com>
References: <20190902034319.14026-1-xiaowei.bao@nxp.com>
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
Cc: bhelgaas@google.com, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Xiaowei Bao <xiaowei.bao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for the LS1028a PCIe controller.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
v2:
 - No change.
v3:
 - Reuse the ls2088 driver data structurt.
v4:
 - No change.
v5:
 - No change.
v6:
 - No change.

 drivers/pci/controller/dwc/pci-layerscape.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 3a5fa26..f24f79a 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -263,6 +263,7 @@ static const struct ls_pcie_drvdata ls2088_drvdata = {
 static const struct of_device_id ls_pcie_of_match[] = {
 	{ .compatible = "fsl,ls1012a-pcie", .data = &ls1046_drvdata },
 	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021_drvdata },
+	{ .compatible = "fsl,ls1028a-pcie", .data = &ls2088_drvdata },
 	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043_drvdata },
 	{ .compatible = "fsl,ls1046a-pcie", .data = &ls1046_drvdata },
 	{ .compatible = "fsl,ls2080a-pcie", .data = &ls2080_drvdata },
-- 
2.9.5

