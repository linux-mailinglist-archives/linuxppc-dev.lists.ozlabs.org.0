Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AE9667F90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 20:46:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtFR11ky4z3fCQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 06:46:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=kS7KmJoS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.76; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=kS7KmJoS;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2076.outbound.protection.outlook.com [40.107.6.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtFQ10X89z3c8C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 06:45:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGSwHeIQgrwVZkR9qCmcEaTAqQJYp3nu2F47k28l8TJ4iCYHFneB1qvzCUYxA4BWFeRhwUXDbhji+KibgfAIx92/8sTAew8Ef+zlajWTaYyPmqBuV2h84GW09KcmYrx1k4BuVsHcdN47pOdqbzyfunc4+n88xtsV1ZIthMfByiSKHUuq4+IkLAgHVm+ANJbncOqNQtY9T5bNc7Dnv5Feq0etMB5ROCse4DgoUHhWvrk1t4U17jJsSSqz8ljHS5vDkOyBA1Nq83LorILADkbphQtSbYFu28LOgNjhTFzkvwZT2TRCK6FCFJsofZgy+tceHbv0HVPSNrdwnZpiNDP52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZs+qLQ89f9ta00E6LEKYIRUiigae6BTpvlyNy98H9M=;
 b=L2i2pOKFkvxvjKXsnyegFgkycIhXZ4YxY1qSLtVKbza4gh1D0mJXuqovIzSJx6d6FPjvT5orVMLaCA7n/E9mEcM6lXDkCb2Z7nAm2QC8UACw8bSvrZvpc0Fvp9GxL28EeOsbddnB0hjFnrQrbrO11p0ZMQasbj1IX3lie5Ho7tJGAoDT6wyQE+oJCWSpzZ60EY6g9ryu71+4iTBwe1TM2OLe1wwDV92n8TyEgAEMaaW310gbO5N/xVIddFOVrBnqBaslfu+hDwGSwBQmJ9p10f0PsRfE3w00dY66qFTgC5hTv3iMLl879ZTsMLfgA2cdDHqUmZG/N/wCkAGy+rfxyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZs+qLQ89f9ta00E6LEKYIRUiigae6BTpvlyNy98H9M=;
 b=kS7KmJoScX653sHXktpbYJWcoprAa2avtsdk74uqIuFIBXUD2GcobXGXDorqzOFKxqc7Hs6XL5RmhhLr6WjJ3ds0xs+F6OdffUZeGs/S662UQyAkF1HPm65d/OJdg40gbQdYYVfft7nXzKPN5KDDnSI4cBAwXW7Gnlv9zgVVa3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by AM9PR04MB8178.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 19:44:52 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 19:44:52 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] PCI: layerscape: Add the workaround for A-010305
Date: Thu, 12 Jan 2023 14:44:33 -0500
Message-Id: <20230112194433.1514149-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0194.namprd05.prod.outlook.com
 (2603:10b6:a03:330::19) To HE1PR0401MB2331.eurprd04.prod.outlook.com
 (2603:10a6:3:24::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2331:EE_|AM9PR04MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c4e41c-a885-42d4-f97d-08daf4d578ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hP2gGYIfxD3x0626rWxJM0lKiup7lL6mS340dFtRw78REjJRaQ/v6Gx5sYYzw5eM3P8yOlPuXUv5LxIs5cs1gcD5o/+F/+wJE6aMfhnThFcd0o5dOQeu2u3YJ0Li2xMxgzAy3PxfGDVxZO2Yi3u7Mhh1HLAzh0IEed3ZD3ng39C1KNUnCfpJxkOH8/ssQUGn4NLJZjR9pEMo21vpLBgG78p2N7PXrcWtY7G4EUhXEsc1ekL9sewca8BAcmLdJ++MDUNtNIg6F/lYZaLK8lv4KD5oN0WpBZplJSzEBqBCUfOhmh9is6K0AtQN8D10blS5eNLipq3UuxNbVC31bafIzoFZt7DFdxI+zECbzt4cH7GveWDoHBZT3JdbSL+iKTmlCvkbneoHoL+uI73C/OC66eliABSfmmSV7rajT5Pk8yyxwR7cBhIMzFHnXEWL+2Ot3Y7RzHLwPA8aqyD7QMA3ZIKI05rplNuYo7/8n4T68cb3oWMD0Uiqv49Nt89Ip5lWr/zMLRi5AHfIN/jDAIpvNYL8d1BhkQJdzHIkWna25cObaAx18gl26n550xeGd9/leWPuzXhgbhBU9C92EiXAgd9EuQPVjMH0rFOeZusYG6v9VhaqDP+S8BYVDifgco14rX5V5Nagv4oViTc3C8mBL9AMOkKibHhfj8HWAI1LuhcLjrYWmQY6t1Z/JaDNKd01gAHvAnnqavfUq4kwVMLeT00DojaAL7TSFX4K20vIkSo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(478600001)(6486002)(921005)(41300700001)(6512007)(38100700002)(38350700002)(1076003)(86362001)(316002)(110136005)(2616005)(26005)(66556008)(66946007)(186003)(66476007)(52116002)(4326008)(36756003)(5660300002)(6506007)(2906002)(6666004)(8676002)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?NhSm8xDiITMU+K3EmKP4ytu0Q0w3DLh/fQ/cdaviN9WzfzOw46XmA4rFfM2c?=
 =?us-ascii?Q?tum1X19egOz3Mv9Gk3QGrYpPSDVvO/a5O7p7bmgOWcx97BfnjcDlFkZvGh18?=
 =?us-ascii?Q?fstv+yn99ckKjb9sCUpV1UazlrSjGucAJc0CesCfc3BSnRSTDVL7frxZzRUS?=
 =?us-ascii?Q?4IpBvkr0tO4xLeTYHRHQz9EQoDsPuyKt9PTe/NRnULWjzlMWG4pJAGgzY7rW?=
 =?us-ascii?Q?eHHY2p2H7HX833EVHvXkCGFEjeMYdc2nYuqTkZkZOAD53y7rvOoohQS2uBtW?=
 =?us-ascii?Q?j9FOTz5FgqJvNgou0aoTb11Po1dnIMlzz+F42UoMFIIrwMKo7uTI4bn2DlfE?=
 =?us-ascii?Q?alIugKkzw5Lj8atuBM9EulM91zw9THLiqNDxf+gyNMeqbeZFXO9thNBBQgle?=
 =?us-ascii?Q?DjpE13dNlyBvLM3H5w6pFtvuZSY1djYkpu+8saKHVv43s6xgyR932v0rpTsH?=
 =?us-ascii?Q?5O4TqWSopuDiT5Y3SxAobMCAbsD6GgRiF3/oTS1k8ouP+YCqXNcdHfBcGutl?=
 =?us-ascii?Q?mnDS4C9GPL9VF3CDVUW5axG6MO4KeddT3GGLW/1m7pfoU91ZH0R9HMxc4uqP?=
 =?us-ascii?Q?rOhiVz8PnVpG6yjjtnarMj/ZgJVYx6YsJFi/ZkgYLg9DyPTrcBTfQTDO5GT9?=
 =?us-ascii?Q?Ns3MZnJa/vawi0gmiaWTyfXIXHcnqMguvfznNpLpcceXEN1liMHrjrXrBeM5?=
 =?us-ascii?Q?xJ59LHTn1JpobxqlQ6/fxXxk5k1mX/MTIk64k/Vm/STkT6RSCz2OctOjVAWA?=
 =?us-ascii?Q?enDYDKB0tP1+m4kRnqnYnMQLAWMQWCyEoZKCtYZBO5SwYLQqD6FXf61Y1VKD?=
 =?us-ascii?Q?DXDxnYXyJabVI7eeo0Pq/ouvswEDvkYD5BfrgnDNVyr6yeP3a/iryyUjD0PF?=
 =?us-ascii?Q?lq08LrPSMJ+YHeNB2Lq5lxlGpfE3NIAqDCunavxpJsSUu4I4RxCVKSb0d3Ru?=
 =?us-ascii?Q?XO4Yo0L60qdnaclp/issm4AavN8mrCI+D+NnEnb1b78nmiHgiQUR8ZcNmxjh?=
 =?us-ascii?Q?vmbs9sPggZ1h0L2MtiUe1Nx4Is2dL8xmMBA5SeWWbtMoBmk66PcWS7swnLHB?=
 =?us-ascii?Q?5EpmXjKL+wI+gTQ1gvqZl/Wk4YOtpM05cOw7nxlLdiuBHKOGhATPgTTuCFNb?=
 =?us-ascii?Q?rex2DuRILktz7cjTkGRyjJ0J7OJOZoCfC6W273LonhdAE76hjwsnWXTF0aEb?=
 =?us-ascii?Q?gfYFTlhflGA3cAokUb/AkBO/Wao//Kz85HMh5azPi3+2j075+S8uPA5a+p5H?=
 =?us-ascii?Q?J6Dy45rNpsjNqQaRSre03bobUuKB1z+6dq4pHdn4jKoFI+20T3J4oD0uHIjK?=
 =?us-ascii?Q?W2ECuDDhcKbwaGoohkJrK+Yr9sxKb4pZYbTWLV6FlgGSbDjPg8hhf5p+blEn?=
 =?us-ascii?Q?MqKfJRAaAnvZRn9P4fy/tjik6wmlL5QOD2iLVgtiFbcW32RBzQWMdXqazvom?=
 =?us-ascii?Q?iPhD7HNvzh1YYxxZvmr5ZwnLo2RVVjl7EQxr+2RN3krr9QKKJ9hYg1OUZ/dl?=
 =?us-ascii?Q?TV5o9ynN78AosZRWxoQBQfey8XS7j3gUyKGxQuT+0u2cZ0QFJovcDbvcgQ13?=
 =?us-ascii?Q?9dI5VtZ4VfmnTqmN7mq3/EDmbcGXUneR+nV6yD4u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c4e41c-a885-42d4-f97d-08daf4d578ee
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 19:44:52.2989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsXuPaBV094uHJ8NY8hL/EMfuJxaBhZEY62H2S5wAfdxJ2KGpG7mXa9ZoZkZNoqM1x3CUru67iiKMAqHLe4ssA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8178
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
Cc: imx@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiaowei Bao <xiaowei.bao@nxp.com>

When a link down or hot reset event occurs, the PCI Express EP
controller's Link Capabilities Register should retain the values of
the Maximum Link Width and Supported Link Speed configured by RCW.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../pci/controller/dwc/pci-layerscape-ep.c    | 112 +++++++++++++++++-
 1 file changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index ed5cfc9408d9..1b884854c18e 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -18,6 +18,22 @@
 
 #include "pcie-designware.h"
 
+#define PCIE_LINK_CAP			0x7C	/* PCIe Link Capabilities*/
+#define MAX_LINK_SP_MASK		0x0F
+#define MAX_LINK_W_MASK			0x3F
+#define MAX_LINK_W_SHIFT		4
+
+/* PEX PFa PCIE pme and message interrupt registers*/
+#define PEX_PF0_PME_MES_DR             0xC0020
+#define PEX_PF0_PME_MES_DR_LUD         (1 << 7)
+#define PEX_PF0_PME_MES_DR_LDD         (1 << 9)
+#define PEX_PF0_PME_MES_DR_HRD         (1 << 10)
+
+#define PEX_PF0_PME_MES_IER            0xC0028
+#define PEX_PF0_PME_MES_IER_LUDIE      (1 << 7)
+#define PEX_PF0_PME_MES_IER_LDDIE      (1 << 9)
+#define PEX_PF0_PME_MES_IER_HRDIE      (1 << 10)
+
 #define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
 
 struct ls_pcie_ep_drvdata {
@@ -30,8 +46,90 @@ struct ls_pcie_ep {
 	struct dw_pcie			*pci;
 	struct pci_epc_features		*ls_epc;
 	const struct ls_pcie_ep_drvdata *drvdata;
+	u8				max_speed;
+	u8				max_width;
+	bool				big_endian;
+	int				irq;
 };
 
+static u32 ls_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
+{
+	struct dw_pcie *pci = pcie->pci;
+
+	if (pcie->big_endian)
+		return ioread32be(pci->dbi_base + offset);
+	else
+		return ioread32(pci->dbi_base + offset);
+}
+
+static void ls_lut_writel(struct ls_pcie_ep *pcie, u32 offset,
+			  u32 value)
+{
+	struct dw_pcie *pci = pcie->pci;
+
+	if (pcie->big_endian)
+		iowrite32be(value, pci->dbi_base + offset);
+	else
+		iowrite32(value, pci->dbi_base + offset);
+}
+
+static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
+{
+	struct ls_pcie_ep *pcie = (struct ls_pcie_ep *)dev_id;
+	struct dw_pcie *pci = pcie->pci;
+	u32 val;
+
+	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
+	if (!val)
+		return IRQ_NONE;
+
+	if (val & PEX_PF0_PME_MES_DR_LUD)
+		dev_info(pci->dev, "Detect the link up state !\n");
+	else if (val & PEX_PF0_PME_MES_DR_LDD)
+		dev_info(pci->dev, "Detect the link down state !\n");
+	else if (val & PEX_PF0_PME_MES_DR_HRD)
+		dev_info(pci->dev, "Detect the hot reset state !\n");
+
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCIE_LINK_CAP,
+			   (pcie->max_width << MAX_LINK_W_SHIFT) |
+			   pcie->max_speed);
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
+
+	return IRQ_HANDLED;
+}
+
+static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
+				     struct platform_device *pdev)
+{
+	u32 val;
+	int ret;
+
+	pcie->irq = platform_get_irq_byname(pdev, "pme");
+	if (pcie->irq < 0) {
+		dev_err(&pdev->dev, "Can't get 'pme' irq.\n");
+		return pcie->irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, pcie->irq,
+			       ls_pcie_ep_event_handler, IRQF_SHARED,
+			       pdev->name, pcie);
+	if (ret) {
+		dev_err(&pdev->dev, "Can't register PCIe IRQ.\n");
+		return ret;
+	}
+
+	/* Enable interrupts */
+	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_IER);
+	val |=  PEX_PF0_PME_MES_IER_LDDIE | PEX_PF0_PME_MES_IER_HRDIE |
+		PEX_PF0_PME_MES_IER_LUDIE;
+	ls_lut_writel(pcie, PEX_PF0_PME_MES_IER, val);
+
+	return 0;
+}
+
 static const struct pci_epc_features*
 ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
@@ -125,6 +223,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	struct ls_pcie_ep *pcie;
 	struct pci_epc_features *ls_epc;
 	struct resource *dbi_base;
+	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -155,9 +254,20 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	pci->ep.ops = &ls_pcie_ep_ops;
 
+	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
+
+	pcie->max_speed = dw_pcie_readw_dbi(pci, PCIE_LINK_CAP) &
+			  MAX_LINK_SP_MASK;
+	pcie->max_width = (dw_pcie_readw_dbi(pci, PCIE_LINK_CAP) >>
+			  MAX_LINK_W_SHIFT) & MAX_LINK_W_MASK;
+
 	platform_set_drvdata(pdev, pcie);
 
-	return dw_pcie_ep_init(&pci->ep);
+	ret = dw_pcie_ep_init(&pci->ep);
+	if (ret)
+		return  ret;
+
+	return  ls_pcie_ep_interrupt_init(pcie, pdev);
 }
 
 static struct platform_driver ls_pcie_ep_driver = {
-- 
2.34.1

