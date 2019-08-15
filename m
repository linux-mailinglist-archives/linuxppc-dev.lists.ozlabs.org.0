Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A538E778
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:54:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468Ky14mgFzDqXR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 18:54:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Kpb1tHPzDr10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 18:47:50 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E0D4320028A;
 Thu, 15 Aug 2019 10:47:46 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 36078200035;
 Thu, 15 Aug 2019 10:47:38 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 60F3C40313;
 Thu, 15 Aug 2019 16:47:27 +0800 (SGT)
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, bhelgaas@google.com,
 robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
 leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com,
 mingkai.hu@nxp.com, roy.zang@nxp.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/10] PCI: designware-ep: Move the function of getting MSI
 capability forward
Date: Thu, 15 Aug 2019 16:37:09 +0800
Message-Id: <20190815083716.4715-3-xiaowei.bao@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190815083716.4715-1-xiaowei.bao@nxp.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
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

Move the function of getting MSI capability to the front of init
function, because the init function of the EP platform driver will use
the return value by the function of getting MSI capability.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index e3a7cdf..0c27c7b 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -631,6 +631,10 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	if (ret < 0)
 		epc->pf_offset = 0;
 
+	ep->msi_cap = dw_pcie_ep_find_capability(pci, PCI_CAP_ID_MSI);
+
+	ep->msix_cap = dw_pcie_ep_find_capability(pci, PCI_CAP_ID_MSIX);
+
 	if (ep->ops->ep_init)
 		ep->ops->ep_init(ep);
 
@@ -647,9 +651,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 		dev_err(dev, "Failed to reserve memory for MSI/MSI-X\n");
 		return -ENOMEM;
 	}
-	ep->msi_cap = dw_pcie_ep_find_capability(pci, PCI_CAP_ID_MSI);
-
-	ep->msix_cap = dw_pcie_ep_find_capability(pci, PCI_CAP_ID_MSIX);
 
 	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
 	if (offset) {
-- 
2.9.5

