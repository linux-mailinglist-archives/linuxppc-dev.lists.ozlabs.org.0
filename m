Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0334A70312D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 17:12:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKjXF6jcNz3f7b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 01:12:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=XFjRCzBr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::600; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=XFjRCzBr;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKjWP2Vhgz3bh0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 01:11:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQ13WkHzzmSScXUemU9ACiNAZNEBaiSMrQGyCoOk+44RSWrdxFBkWFOopwZSsdxFGo86nRR3k8U/JAW5ZB80b4LD4eu55EKign+G/mmwZvJaMVOaz2KORKxTzEmeQqo4s3yAsXz0uoTWqt/kjLDuQk1nmW1PduspWv6zQsQrhxjf6MCKBieaIlcdebpG6JDMzLBYNUSFiZMAO1RkIEO7BtRo1pMYAlGuMMD6QWXPhayv/y7s/ZLCQwYyl7ZkVCsDJsb49S0xyKRGvCzhUoaa0zg9CjDLTWU7k5mGjJnSdxuvBDDZSRYlZDczDrTcUqYYs5mkMoRyMNfDRsI30FBtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmoW8CkBzWddOW6kR9p58cG3bHx/cN1yvCC5Kj7rf8g=;
 b=JXPF28SQAK00pDslHAeVCWr46FnbL4OfJYzoAiIjKZ9taYmdXhQunXB5iNnsOheGjBokjW8Mh/cXdzzNrk6xFBVKZEj4cibpTty3mhzBB5KMXTu+COkFhaBvecIw8A4VFrFYwas+b+NXHvHCRSoQJPvELanJMdtiWBG+8sjDk4nrIi4MnlRW8Q8ljEe87gl9NtBEzMMh9ltk1H921a/1A/bDouK6ztQc4UTLPFjrs8NcvfqPMBQ6Y2mmcbQSszDk3nwpBPOFC3POJxOAFMCqWvqiTN0Nq6lGNT2tEK0zwxPwRMkMIJpkUXeSQwzvgCAmfaUt+soVIcqRUrguPXje9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmoW8CkBzWddOW6kR9p58cG3bHx/cN1yvCC5Kj7rf8g=;
 b=XFjRCzBrpgFEIntB8WRog2wrsDxm0PXwsgbDepKm1z4A74YakFeMC1NQOvWto9sQlWQhBRCio1/Wr9wgZZvfepBHgcdekfZhSXo+fkVmKabKqMkwe++weJ//ZlatPL10U2NPlS/u2ENt5YS0oTs12SS/rfmqgYZQR57KoiI41VY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DU2PR04MB8872.eurprd04.prod.outlook.com (2603:10a6:10:2e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 15:11:07 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 15:11:07 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org,
	Minghuan Lian <minghuan.Lian@nxp.com>,
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
Subject: [PATCH v4 1/1] PCI: layerscape: Add the endpoint linkup notifier support
Date: Mon, 15 May 2023 11:10:49 -0400
Message-Id: <20230515151049.2797105-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0023.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::36) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DU2PR04MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: 99648f0f-8352-4188-c507-08db55569c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	sJkQQZlGhug+YNJUwOK/dEkITe8qw15XwWdn1RUHAjEWYjFbHv8oQCylAifQxLJJXfK4jzv/9qseAc3dohIx774Voo/BKPteF9PG2A6HsFIYbXWN/WrIwlOSd7SeOP2rbzrjKAUhfWPtX/xSWdh2eDgI4rMLcdVCrskTakoovRpXMuenlpIEhwTzETh3Ba7MFgWn3DI/ysbKXB8amESoKKs7EmiYIWpcwKReQizpicF1MYjWEMdZOvtEsE0cWqa6R5Et3Bnp15ev1xy8CW8WNHmZ7gwkT2ra9uZVugvLhhWvWJyJTC+yT82uFHhWUY051piaQGB3uRzdz3+dgMQ8bheGosYsdvYYD086PLJGOzMlh3klaILU2Yh+EwnTdQ2rqg9M5OfnxfwZ4vcw/nj5dGFc7h6YwkY1hIq+Sn2ozM3+cWwUoq2IpIyXDi418sCB0oJk48gWgltzxMnkrknrSOxJwrD11CgTYw4G5yKHEQk8r2YwYG5mHetsWQU5RCavkp9jOfAGvMehymFtyVinOIHqFJNjUtbAfsO7UkTdgcpgxEJRskOm8qberjvL4xysP/wgx/qANO/JSgpaELGASXO+CLIzn7GjrLHL+tIZh6dgbPt/wJ9C3/pwHvYPVjYNLvpuLOD0vuOZrD2LJ8BUwg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(66556008)(4326008)(478600001)(66476007)(66946007)(110136005)(186003)(6506007)(6512007)(38350700002)(38100700002)(83380400001)(2616005)(36756003)(8676002)(8936002)(2906002)(6666004)(6486002)(52116002)(316002)(921005)(86362001)(5660300002)(41300700001)(7416002)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?EYmgEHoriVAsjNeQPrm8f3F1Y8WyDHnOBXb8Bc4s8VFRggiYIKZmPVm2QjLw?=
 =?us-ascii?Q?Kv1U61HiW7n4+Q1wNox58SB4nYYd2aInDbJA9pbaPir9UAUtEEdazJ1foA6y?=
 =?us-ascii?Q?wbmMaWEXzTuv2ogzjIUEQbF+hZ4u1L/elPB6zX2E2yG5ljN5iG0QuTq1XamL?=
 =?us-ascii?Q?mpo+Fob1of4l2V0vW5qPHwkWX4MMCKSa4HVthrJ0JoP7xkC0v4m4wgzSsmWn?=
 =?us-ascii?Q?Fvz45imQPZh6T9Ba6+Q0uG+J2J8h0GTvp3r9k0gTnnDGGB4v2ReVC7deilYt?=
 =?us-ascii?Q?e1VeZqqRik3ElqCKGy4Srzf4X1Y3axdeZmg+N8DygewoJF+u9h8EPoHnKXQz?=
 =?us-ascii?Q?QKmB8L/OCRkT0PCJLbr7I44RYeW3xej9L35xTQXW1PLz8+TkNuhgT8RKQJRw?=
 =?us-ascii?Q?XEP9t6hUsgeFMwH+1eXVlFwyTGXI/5ntDHgPu5k3RIsGfyi9LOVxMgRLa9KI?=
 =?us-ascii?Q?auHSFuQCQOvzzBABq7SD4OVwQQD+z/bp09BZEBZgtYCC9MvVLWlHbbQxrDAV?=
 =?us-ascii?Q?sRQM3MLLuFgJrkVFs2FkuDdySwSDycDixKK8gXz+Rpvj/2FaWby5gUfdCb3d?=
 =?us-ascii?Q?vtWjiqYMK/70xXH86o1fwJmILKBYl/X5JPbSL3AYHecTjMXaTZu4lXnQdfOd?=
 =?us-ascii?Q?YBeIzW+iptPAzlm61/fkbCVhjC6eP+HaoToRtQX4OWKUAwXKebRAyJECe71J?=
 =?us-ascii?Q?CPgCDdEwiTj2YFfuFU/glGHBl2ikXjCHwG7qCBL11KMTXeAArzukrJQy6K4u?=
 =?us-ascii?Q?uVq9qlBTY9WStI264tjTAs3rvfOhJmQ8ySknWU2JRcO02RREUbbu+lMZIVFl?=
 =?us-ascii?Q?xYu7EoHf7CvzWxGIMrVNS3x91XOx+6CaPB4qdCVlgY9aMAYS4qf6Ak4erRVR?=
 =?us-ascii?Q?oXolWsc3OUv0g7leKd/JWBXsCutzc1sdGP8MR9gMxodwrS43edDXOzlN/pcZ?=
 =?us-ascii?Q?oHalw2tYUNhiQBnaxO/Kc8W4V1G0rZ8I0Yjfmr/+8A9fr+aUoB2hPKBlEij6?=
 =?us-ascii?Q?hO24ggPTW7/rqemdV9GoZWtAgq1MpTlTy53Z5+cp2TTeOS8/+THsEoVaxOsz?=
 =?us-ascii?Q?4pnbSVqGSjHvGHhRKnu/D4867d1lRFfONcHGOPbCD1j4h2yuK34AOduqVutC?=
 =?us-ascii?Q?3KfdOHEa3xW0Gq6rp0PbuOEquTIUT/gXyJgUgp6urm4C662T19QC7lKeClca?=
 =?us-ascii?Q?j8LErbZBPmGt0R1Cyc1AGW+EspmpWysUKLBMAkwrI13zdhb7I4E2+eHMr162?=
 =?us-ascii?Q?FOQCD9nOoFbrEo1C7sguUGLz5oWNRK8CLc4sFNtzZD2tB7cKjwXHQAkEo8lg?=
 =?us-ascii?Q?pwltBtwBGo0DpnL/DFdyofWBMcseHmVbMRS+TYAJm7k9Jv+FwVRtHFfDhl3l?=
 =?us-ascii?Q?qsDbXS9bqpqZ1keEqUfqRvmIZ/J8Hk2tTBApZoKhh71lhyatmhhcywFm3m7n?=
 =?us-ascii?Q?/rKF4wlH8bUWDkrOl0pXuse22mmIe6Te9ZEv0Dp+qtO77vpbn8DMXB9+znLF?=
 =?us-ascii?Q?4mp1egMmC/ny/iwtPO5XeST1HuiD1H5imXXWtgNxBB34wY2g7dxtAAhLIRTx?=
 =?us-ascii?Q?r5qSMbZPe8xjEiUuxGrHURZaBP18P0n92Sbk//qi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99648f0f-8352-4188-c507-08db55569c02
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 15:11:07.7625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pxIkmf/qD4x73w/eKg76gso1pJfcndod/59WoP2k3IAl4cXRv5EcemA1/JeJ2geCjosskn7ZN5iP751/qIA4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8872
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

Layerscape has PME interrupt, which can be used as linkup notifier.
Set CFG_READY bit of PEX_PF0_CONFIG to enable accesses from root complex
when linkup detected.

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v3 to v4
 - swap irq and big_endian
Change from v2 to v3
 - align 80 column
 - clear irq firstly
 - dev_info to dev_dbg
 - remove double space
 - update commit message

Change from v1 to v2
- pme -> PME
- irq -> IRQ
- update dev_info message according to Bjorn's suggestion

 .../pci/controller/dwc/pci-layerscape-ep.c    | 102 +++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index c640db60edc6..5398641b6b7e 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -18,6 +18,20 @@
 
 #include "pcie-designware.h"
 
+#define PEX_PF0_CONFIG			0xC0014
+#define PEX_PF0_CFG_READY		BIT(0)
+
+/* PEX PFa PCIE PME and message interrupt registers*/
+#define PEX_PF0_PME_MES_DR		0xC0020
+#define PEX_PF0_PME_MES_DR_LUD		BIT(7)
+#define PEX_PF0_PME_MES_DR_LDD		BIT(9)
+#define PEX_PF0_PME_MES_DR_HRD		BIT(10)
+
+#define PEX_PF0_PME_MES_IER		0xC0028
+#define PEX_PF0_PME_MES_IER_LUDIE	BIT(7)
+#define PEX_PF0_PME_MES_IER_LDDIE	BIT(9)
+#define PEX_PF0_PME_MES_IER_HRDIE	BIT(10)
+
 #define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
 
 struct ls_pcie_ep_drvdata {
@@ -30,8 +44,86 @@ struct ls_pcie_ep {
 	struct dw_pcie			*pci;
 	struct pci_epc_features		*ls_epc;
 	const struct ls_pcie_ep_drvdata *drvdata;
+	int				irq;
+	bool				big_endian;
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
+static void ls_lut_writel(struct ls_pcie_ep *pcie, u32 offset, u32 value)
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
+	struct ls_pcie_ep *pcie = dev_id;
+	struct dw_pcie *pci = pcie->pci;
+	u32 val, cfg;
+
+	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
+	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
+
+	if (!val)
+		return IRQ_NONE;
+
+	if (val & PEX_PF0_PME_MES_DR_LUD) {
+		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
+		cfg |= PEX_PF0_CFG_READY;
+		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
+		dw_pcie_ep_linkup(&pci->ep);
+
+		dev_dbg(pci->dev, "Link up\n");
+	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
+		dev_dbg(pci->dev, "Link down\n");
+	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
+		dev_dbg(pci->dev, "Hot reset\n");
+	}
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
+		dev_err(&pdev->dev, "Can't get 'pme' IRQ\n");
+		return pcie->irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, pcie->irq, ls_pcie_ep_event_handler,
+			       IRQF_SHARED, pdev->name, pcie);
+	if (ret) {
+		dev_err(&pdev->dev, "Can't register PCIe IRQ\n");
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
@@ -125,6 +217,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	struct ls_pcie_ep *pcie;
 	struct pci_epc_features *ls_epc;
 	struct resource *dbi_base;
+	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -144,6 +237,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	pci->ops = pcie->drvdata->dw_pcie_ops;
 
 	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4);
+	ls_epc->linkup_notifier = true;
 
 	pcie->pci = pci;
 	pcie->ls_epc = ls_epc;
@@ -155,9 +249,15 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	pci->ep.ops = &ls_pcie_ep_ops;
 
+	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
+
 	platform_set_drvdata(pdev, pcie);
 
-	return dw_pcie_ep_init(&pci->ep);
+	ret = dw_pcie_ep_init(&pci->ep);
+	if (ret)
+		return ret;
+
+	return ls_pcie_ep_interrupt_init(pcie, pdev);
 }
 
 static struct platform_driver ls_pcie_ep_driver = {
-- 
2.34.1

