Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C86D26F3243
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 16:49:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q95hd5MWhz3c91
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 00:49:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BeouNjui;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe02::601; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BeouNjui;
	dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on0601.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q95gm1f1Xz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 00:48:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B76etKSjYOWtG/sIw84K/hciQSePhDP6NCHm38rZ0e1FkDzS37gVBbSZ3Oi9ha+MjX8+EwOT4QPPDR4GpMLudL972UnAmPyHVfWn8u2XGoKOYBWS4WZ1Z4ROBkF1Lrq1Ax3WkR86AcQjWgUiFQB6DcMQuojh0GeE4qB7JqEG5VFmSh1eF+aEzM7zF5BuBj9HGCLaf5Wn3XQ0JKKSBIQDYY7nHRx1R4UpfHPsezP1wDIFK9ruYiPMFaLhmXi3MrIeL+TUqF2hByGU1hhuUx64aG6UUxnrbtoKDH8aqpCwzGaq6oMV5fHdhFGl9kckHICEtpN5Kf8aQ9nDxtB8zb+bbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJCb6CBnDRZR0a3V9sER/CfxeQhN8R4aSNYlHWPQsX8=;
 b=g7riQRvR+/LmIrtmhMtanrEf/gYJb1COh4E668ZDSZwzZnUQ/YASVogSr35Xs5JzbAqd1eEjejqeEjpyBHNwDC/HxDykuRcTNgXWKV574cI16OkQ7+q0AwvLOcGnuugInB8xbnJLX1r996OdUVKl94M6ouY1aluxpgymzH49GtRewp8iL7i+hOiJlYuae4fWite8ommWPf2z5+xtZHTLpvq3qscpDJftbCGdkO9Phjy7ugiokHm9a/MOvVVOXyzv3MNkhNDh7CYrpExRjSpNHsRs2bTvjHt3dP3PetE0Jpk5OS0qhgT3iy9T4WIaoBmBx0WtbF0hofQhTOLdzTHZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJCb6CBnDRZR0a3V9sER/CfxeQhN8R4aSNYlHWPQsX8=;
 b=BeouNjuiEYsHttwHzEGdVryxDM1mhTCBntgV1cIetQubpRG58A3p+/e7JtG6DxbeghKeBwrM7u7aWORXFQbTbfnThNl/KrI0HHCIS2f2puPcKrO+Bl2FZRQw79o4MBYR//kloluvxYbl4XutW6XUSMF9MrE34W9Yv+JNuf5+nn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB8333.eurprd04.prod.outlook.com (2603:10a6:102:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 14:48:26 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::bcdd:75c9:176c:39ed]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::bcdd:75c9:176c:39ed%4]) with mapi id 15.20.6340.027; Mon, 1 May 2023
 14:48:26 +0000
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
Subject: [PATCH v2 1/1] PCI: layerscape: Add the endpoint linkup notifier support
Date: Mon,  1 May 2023 10:48:06 -0400
Message-Id: <20230501144807.1616244-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0161.namprd05.prod.outlook.com
 (2603:10b6:a03:339::16) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: de1849de-54ae-4fed-efc4-08db4a531ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	WxiU1Mf241nPoKMS+84xcFIWF3k6ToLMPcK1Kh/NF2yfuDkgWYaR6kTH89uIFgZJnCBShqVDhCcRv+YOCQv9Rpk7UPtf1ZrD3CIbMo7jnsVIdGjVDNXq7fftGRqs9yBQIn2PbFw8LxMHhxIOWu3sUU2sZXAVvOCgVOFTAN4jFQ6KPDv9LkMjsdyFXJxoNj+oE2KTcpPzcvBZ556HAUSerJZJ7eLddg5QWVuGfISW0F0ykQeVGPV/fVLzpbkDJYlmynWvOf2XZ9+XaJL5dTDPEcvuckji7BmPGU47yjuTqKBzmkSMvJVnB+lgZF0o/N4knnOoPIao5lnPetCIAKTFGJe5C/pRnbAdRU7PrdMuZAcYcErhbA1kTqM551fPeVvBd0utUxUf02bB1lXGufIyayVzNEhxpF9Zp4oZRGyPlUqu1rBnXV+cC8oY/373FJdkfo8WiXu3a1LGZKKGWGDFxfwRHO9buH2AfF88SfAgLPVO8gGKwxhapSrXJDSuFiEwIU7b85pCAkFKc/u2UkxpYO/3qsG/GXmovbObAMxBXz5VONUU0VrvcOlJwhapL98Sx5/DIW4riwrsctPwlrkKdN5gMk+GGZEYmbrTpYQrYTZgYIkW0qJYCA6SWtsUD2SByeqeYPI+QG3+5SYSR6dunQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199021)(2616005)(316002)(4326008)(6512007)(6506007)(186003)(41300700001)(83380400001)(1076003)(66946007)(478600001)(26005)(110136005)(52116002)(6486002)(66556008)(6666004)(66476007)(38350700002)(38100700002)(2906002)(921005)(36756003)(86362001)(8936002)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?H1g0Hhws+rBiIQUQRzwhztRSIKZx0+sDxsgpv1G2IVY/oIbXGCZqC8uQ1tCn?=
 =?us-ascii?Q?1TyImmq30GV/ikeAZlnVoIAx9NJXcSWx/bau4xaXt9eE/BeZAj/OFBqjbj69?=
 =?us-ascii?Q?tpP6YDOevxUXG1JkkYYavRpmOEVgPkTEiUnFNzBlP8UHWthUTEqvg4LWnqSf?=
 =?us-ascii?Q?qWi1h/8KEPwkh0fAtlyuyeA6UseGRVL+Aq2FbZXQnY5xrG+cECn+1BgfFgbr?=
 =?us-ascii?Q?tM3mBGISd5nfUIeQRawK8MXdQFGueh8r2lczYKmHRZgZGQyBYlsqJnwgtOfV?=
 =?us-ascii?Q?ixPCwjnUQPB6oGrtRN8syjPFmoF9MA5Bv/LErOPs/mFfxm5CxYaOJkozESxi?=
 =?us-ascii?Q?OoEZW11kkN5U8/ZyLIsgQ/SUmb/+6BCuSNRWwC0Sz1iIS47APRa0NXF21Xo8?=
 =?us-ascii?Q?B4kGLFUIO7Z8QymxQLBCxiCy/hfvyN5pLZOnYrKxtt6ha8Dkch7bXoxH2OP7?=
 =?us-ascii?Q?CqBc/QK7KjVIyYheTNWiyRUrufTrw8ObDfN1zc4mZDuiBb32tOJIQx008uvO?=
 =?us-ascii?Q?x3bvzGmJ/Bj7sW/5HL5MKeS9NcimWJWPAhqoIlCEzVlcRhvO/f1E70gyTWDp?=
 =?us-ascii?Q?6jpIOf2T0OQ69GkXdIQVI2JPjIXvmpVEknfp0B8dMwJsvkCl/2Kd8QES/7Sx?=
 =?us-ascii?Q?PEuPizGgOYxCHqi15q/EUzxaLG94BsPfVoyA4VAfpiMiFDSEbOS8GjYRZOWB?=
 =?us-ascii?Q?7X/HLv53zE7rzklKhij0kCO5mtDUy6mA7XPeq08192zUQq++v1ykyU0tkmQQ?=
 =?us-ascii?Q?5LQV9appX/lSggqIqaH+Jzgd4ZAH4KrypiplYeb/BHUsNGV1v3FMsbMa7KSj?=
 =?us-ascii?Q?gP1WthJwMi5D3iQcLZtj1A6WAjKmVZhiGE8wLHx9Fr+p1ca9IqnncJLiAr2E?=
 =?us-ascii?Q?L5Pt6MxI2YjN30sSWbLk/UvskBvrJXI2k0USvnuti8fEZMTepXop6K8MDftw?=
 =?us-ascii?Q?mlg8SmE1Z56T4vGK1WXta2cMv8sY2aV25shh4nwqsQ/JJua9xgFSOgop+rAV?=
 =?us-ascii?Q?9zz+RVWYge2dRMk5EpGgjMGdSQv7pVUEcwYn3Ghmi25yXDzyLHUIV0UvaciG?=
 =?us-ascii?Q?2N9ASzhRhG9GpbQIAFbUO7LuPUbZLpGo3rv3Hqc9kNzLToPqAJ98xcsg7xgw?=
 =?us-ascii?Q?TN5hCKIoBdkxacIHKu+cbFCpvXkQwtnaIdlhUOghbKZII7+ph+/Rng1FUwNz?=
 =?us-ascii?Q?8XXQpyb9ui/lkyFN3pyU2jhOKAyO4qQA/fHj5+NPcRfBPvkSAvxLVR4DpmHi?=
 =?us-ascii?Q?vbmjREeSDEHHjTnvyeS1KcCYjGDXW7T7bHoTgnTu1SpIzE3Ss5hBJljqPJ3t?=
 =?us-ascii?Q?Sr+/sKfTeaMHeZ/3k38MRBCvNq+9Mq1q/BAEc/s1UkiTHNXGgy48X3/FV9ZI?=
 =?us-ascii?Q?HskYOCdEnIbhefFuDgEkWxSb37BBCGBWtCjXxJ/mQ60XWQ1EpQ/tYuM4MqHK?=
 =?us-ascii?Q?eF3/ebXbnZhPfUacwTojiYoLqwYrbcLr0DDYA7InCldwZZO3nO7eC6jcaL84?=
 =?us-ascii?Q?s9tUHUNhhXtOtA7dAg2jRiFzFqOmbkkfMpEXMaFsNGOiw1si6uvXbUK9K9pX?=
 =?us-ascii?Q?9aWlY32Lj8EX7Vw8++05EKU5rf8AfyN6aqAvE+VP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1849de-54ae-4fed-efc4-08db4a531ea8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:48:26.1675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CG8nSTC6y0RU/ihFfRdibYgr+eRbiVfodw4Zvv1mXi4RWIbsOD6gD84NklV+KMgSMlJCQxUf+fqTfeO9mIdF3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8333
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
Set CFG_READY bit when linkup detected.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- pme -> PME
- irq -> IRQ
- update dev_info message according to Bjorn's suggestion
- remove '.' at error message
	
 .../pci/controller/dwc/pci-layerscape-ep.c    | 104 +++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index c640db60edc6..e974fbe3b6d8 100644
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
@@ -30,8 +44,88 @@ struct ls_pcie_ep {
 	struct dw_pcie			*pci;
 	struct pci_epc_features		*ls_epc;
 	const struct ls_pcie_ep_drvdata *drvdata;
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
+	u32 val, cfg;
+
+	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
+	if (!val)
+		return IRQ_NONE;
+
+	if (val & PEX_PF0_PME_MES_DR_LUD) {
+		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
+		cfg |= PEX_PF0_CFG_READY;
+		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
+		dw_pcie_ep_linkup(&pci->ep);
+
+		dev_info(pci->dev, "Link up\n");
+	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
+		dev_info(pci->dev, "Link down\n");
+	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
+		dev_info(pci->dev, "Hot reset\n");
+	}
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
+		dev_err(&pdev->dev, "Can't get 'pme' IRQ\n");
+		return pcie->irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, pcie->irq,
+			       ls_pcie_ep_event_handler, IRQF_SHARED,
+			       pdev->name, pcie);
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
@@ -125,6 +219,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	struct ls_pcie_ep *pcie;
 	struct pci_epc_features *ls_epc;
 	struct resource *dbi_base;
+	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -144,6 +239,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	pci->ops = pcie->drvdata->dw_pcie_ops;
 
 	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4);
+	ls_epc->linkup_notifier = true;
 
 	pcie->pci = pci;
 	pcie->ls_epc = ls_epc;
@@ -155,9 +251,15 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	pci->ep.ops = &ls_pcie_ep_ops;
 
+	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
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

