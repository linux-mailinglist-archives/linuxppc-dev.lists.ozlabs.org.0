Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF41317CB4B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 03:43:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z80T3JfLzDrgb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 13:42:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z7jC2vq8zDrBG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 13:29:18 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 12FC81A1988;
 Sat,  7 Mar 2020 03:29:15 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 057CB1A1982;
 Sat,  7 Mar 2020 03:28:15 +0100 (CET)
Received: from titan.ap.freescale.net (titan.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id BF47F4029B;
 Sat,  7 Mar 2020 10:28:02 +0800 (SGT)
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Zhiqiang.Hou@nxp.com, Minghuan.Lian@nxp.com, mingkai.hu@nxp.com,
 bhelgaas@google.com, robh+dt@kernel.org, shawnguo@kernel.org,
 leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com,
 roy.zang@nxp.com, amurray@thegoodpenguin.co.uk, jingoohan1@gmail.com,
 gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 02/11] PCI: designware-ep: Add the doorbell mode of MSI-X
 in EP mode
Date: Sat,  7 Mar 2020 10:14:21 +0800
Message-Id: <20200307021430.36826-3-xiaowei.bao@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20200307021430.36826-1-xiaowei.bao@nxp.com>
References: <20200307021430.36826-1-xiaowei.bao@nxp.com>
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
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the doorbell mode of MSI-X in DWC EP driver.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Reviewed-by: Andrew Murray <andrew.murray@arm.com>
---
v2:
 - Remove the macro of no used.
v3:
 - No change.
v4:
 - Modify the commit message.
v5:
 - No change.

 drivers/pci/controller/dwc/pcie-designware-ep.c | 14 ++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h    | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 58d8556..44ece33 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -449,6 +449,20 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
+				       u16 interrupt_num)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	u32 msg_data;
+
+	msg_data = (func_no << PCIE_MSIX_DOORBELL_PF_SHIFT) |
+		   (interrupt_num - 1);
+
+	dw_pcie_writel_dbi(pci, PCIE_MSIX_DOORBELL, msg_data);
+
+	return 0;
+}
+
 int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 			      u16 interrupt_num)
 {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 00d2d31..cb32afa 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -97,6 +97,9 @@
 #define PCIE_MISC_CONTROL_1_OFF		0x8BC
 #define PCIE_DBI_RO_WR_EN		BIT(0)
 
+#define PCIE_MSIX_DOORBELL		0x948
+#define PCIE_MSIX_DOORBELL_PF_SHIFT	24
+
 #define PCIE_PL_CHK_REG_CONTROL_STATUS			0xB20
 #define PCIE_PL_CHK_REG_CHK_REG_START			BIT(0)
 #define PCIE_PL_CHK_REG_CHK_REG_CONTINUOUS		BIT(1)
@@ -431,6 +434,8 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
 int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u16 interrupt_num);
+int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
+				       u16 interrupt_num);
 void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar);
 #else
 static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
@@ -463,6 +468,13 @@ static inline int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+static inline int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep,
+						     u8 func_no,
+						     u16 interrupt_num)
+{
+	return 0;
+}
+
 static inline void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
 {
 }
-- 
2.9.5

