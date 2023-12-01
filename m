Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09736800FF4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 17:21:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=N+tEZkRw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Shdbc3cBwz3vdT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 03:21:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=N+tEZkRw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::615; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShdWy1NLCz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 03:18:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEArlzHfMUKE78Bbi27PYyy5mRoZwqqd+z4CQD+7cUlpbP+aEEOsAWv8OpyxxgPjw77F0ThMQsfGXIKLcwZYoSLXGfpHC1Tk2Q0hPDd7BBQnTdCEANg7iQf7FooCDrH5D//aDGS9fLxfOAOVflzEzwYblXQ5DgxcU4Nerto9JKPhRYXkQWGBfsTVKOTStE+qGXNRf1mSl5B1l+5714RPYq8CWTvZwuQnH58zzqDnGterB2ABHJZpO/3pTYoHLktipXhMRbGWiEb1e+tGfrKuOVpBx3Y9/TUniAugSQrpZSpClm1Ux5u0A5Xp7n98G1NKQRB2trLMLBgmr9XGYZemGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZuNV9kksOAXnbFMKPV4mm0W3R5AfohdIrVKa2Mmx+w=;
 b=ZcgirzCrjS1BJFgfZ6Y40xSnWrCGHjem/wkL4uGcFONyGT/UIPIvOI000KatnV4cWz+L0vhnQElCW+VdR3J0i3nZnYvc5WmNWzUvY/w8uDz3SM6o6lz/3eMITY/zybvsUIzssHbsoIDZYouTJpIbfQZOB/o1u4i4G97YqtsiZSwX98pBrHxxevmfMlORFLLQNDtUCgY0aSenUeDAFP3h/choM23EAXfwGVG3hgkXsX+GWe+1J+YZYd+IiFfw71dWtDkcKz/oHS5hMZX5S4atlBzpEXLl87yW/r74mzpKuyJV09H1CyOGYOC5sTiZstYUARne+f0y8UvlxKGUwWACUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZuNV9kksOAXnbFMKPV4mm0W3R5AfohdIrVKa2Mmx+w=;
 b=N+tEZkRwLfjgf3+ZJoDbpydAurBU7SPx2ur/8D5YSAFthZJ4seJdOHNClfWv6eqfJn9l85Ei1mMxI1QzwNN03RAdq71kkoJLx2KQK/aUkcWIMA6wQafp8/P09fu2v2pF1EHSwxgomqZ9mPw85fwkVhtLgXlMePd46YNE4UNFmcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DU2PR04MB8695.eurprd04.prod.outlook.com (2603:10a6:10:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Fri, 1 Dec
 2023 16:17:42 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7046.015; Fri, 1 Dec 2023
 16:17:42 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v5 3/4] PCI: layerscape(ep): Rename pf_* as pf_lut_*
Date: Fri,  1 Dec 2023 11:17:11 -0500
Message-Id: <20231201161712.1645987-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201161712.1645987-1-Frank.Li@nxp.com>
References: <20231201161712.1645987-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:a03:167::47) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DU2PR04MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 4632ae41-e9b8-4158-42a6-08dbf2890b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Ks2liMbC60QCsh6U2mXt5efq1ya/kbpbAT+kwbUB4hMW3RwDBUnUQTAA5DCkC/ut9QjPjagUVd9sbz8xZwNKedk38VC4JbVmLIm0/LURj/WVxpoQkbuzUDB0BFOSan7YCphzm7mLCcBl2GI0zD418uxJmRYxTjXevW3p0+rTk5b1GuVokc5im2xvuiKc2wdgo6Q8bALa7OaukBWgfwqXSsF4wzDf5gElMauA62iwMu8Qt4d5mBp7BfzlkVC0onJbffvbHX4qlzzfSy6X6gpYOPPRTKkbCEz1oV3/L+FiFvQ/OKQwVAxZ3FDDCDu2RN9x02e/3hXghx6ky4HPEonnoMjAbbM5ODklLwo7u7ZofA40UFLPKSH/SYT+pyeVOQBgCDnm/PdDEKcqXaLH3nlXL+N7XoEwEBzGLPJNuaN8RczyY42d6A1prGTeQKaRvmXRnAIBC0+hMq/OiXzUGR3B8A43fCyyVs0bsb2jRdjMkJvN2pENu1JalWDZhu45uKWsswzmSsaJQuhnRL4CMSA3X8ZPMUACd3GR9IyTjtnp8r+AMyRvqpkjGn5rmGplv+yqlEchBxkGfC+MdALgIFxFs9BeuiqOW93m6fHWx0AmFId+kC8SU6Jk393QR43ufiRu
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(38350700005)(6512007)(41300700001)(83380400001)(2616005)(316002)(6486002)(6916009)(52116002)(66556008)(66946007)(6666004)(6506007)(66476007)(478600001)(36756003)(5660300002)(2906002)(7416002)(26005)(4326008)(8676002)(8936002)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?+F+QMf4RXYgr63OXxr6tTj+ICUrmVGQBAo8ZyyCU+1MJh1HxMuOzKtoBK/Mu?=
 =?us-ascii?Q?JErtiyijwHwQOVXV6CBQY/LD+FJE84rxTskRmAxd3sRK6bMWc92TTf8vnro8?=
 =?us-ascii?Q?jzYBag3Mr6DEOEezioz9RQgm6VLumT99BMmAAUVZ7hkAZhPwmyIN/mqhim92?=
 =?us-ascii?Q?DroIlB13pefbiwcm+t/dJ2+dFQdSF08DfHy0YUi5RByhlhNSj0YCRqWDtb2A?=
 =?us-ascii?Q?Lyx14/SeRRlFnV1a6GFFC8UCa/q06QxT+3I43dAzrQqkoO0I73n20wGPU7DV?=
 =?us-ascii?Q?Es2fMgr/An5Swh2X4QpkCCUPjFabvlEJGe8G0HCabVSOVBCNEcqylu1zMG2T?=
 =?us-ascii?Q?9FpFw1BpPdkyqeX4tpetwu3RJtLWMQzPSrvmLevIBepoIATpiHiaNCfcnR9O?=
 =?us-ascii?Q?ya5xSyZeZrgyWh73If+rqjOZzeBuipdyzeQ+4W8cJVh6BRJfRsP7Q2NvC0Ed?=
 =?us-ascii?Q?91Aym888V943B6wXVj8G+BT3xdvvTvWVqbA5dntA+SZ+Kj0FLJUlgKcpFM5N?=
 =?us-ascii?Q?CtkuOXKVCAqh8kTlrjRM4ZWTpWctpJQ6T7FgNfjtdFiBwdE0Q2TAcxiQ8Yed?=
 =?us-ascii?Q?Wr+EsOk8BXaE4tq5CRrHWcfMlhL9sJIKDIqSVsn6V8565RshCyGJcEZHecpV?=
 =?us-ascii?Q?UULavjAxv4X7lOyF2imtPzY8Pgdm4D5Nyr1hoRr7s+Qgc/PvwPUSH2eFS7RM?=
 =?us-ascii?Q?SbJcM8aPBa13laWefFsL1cYKF7hPd/q1xMV6e/aoK+50/Xzqmvh7kFpA/8z/?=
 =?us-ascii?Q?KtgiOcpCESVmrRNlYf/MyyMU4bMBtnCEehHzmjAWf84ObC6TOiutzj70ZQ63?=
 =?us-ascii?Q?PlqlRff+IYcmoTXvTcXgEeS3CuaQ0L9SjvK4HmghgmvBgL553kyvG8DaXT6P?=
 =?us-ascii?Q?d5Pz0vpYcX9307XIXFj3643+VSVdiIdh7+McLrIyq4WMIbFnM9Jvloml8Kze?=
 =?us-ascii?Q?W9+HHEnTvzCFLa7EiJMgRiUnPpcN9bqrrnJrRXhWu8LYtdmMS184bZJWVPSv?=
 =?us-ascii?Q?JA7jfNh8MGGVdiuAgxRuQClVcOWH+dMdLxP8eTwJAPooquENe+NIxp6eSjz0?=
 =?us-ascii?Q?EhrAkafIRwRC/m7BSoOcJAlJp8SdLdkJh/Lq2U7GEDrtRAPFsCwXx8liqHEL?=
 =?us-ascii?Q?eFFlFpLlLKMy/dNU1X3jC/9jOtHyMphDQrrEWX0pT+9wi12dkEWn80vWXFT5?=
 =?us-ascii?Q?aIJmuaJ1JjlfE/CAhRvlgilX/FvLmxSEQTUYMzHDV6KvDROWig2yn/ABJhd2?=
 =?us-ascii?Q?aGTjhiYfr+QxfEF5dRQTf/mECRLYSrVGEnwglQKk4FUk5hEOLrVKeelN3mcp?=
 =?us-ascii?Q?or10B0CXq3c6OzhRYpIpZ+CxDYAwz1rG+RjH++3lHdLIdnaGb7VQT67N4p6t?=
 =?us-ascii?Q?MIlspesS/dNljDDngTMxnEC0mPF3o/HAL5wxqXyrcpTOiPfa3MgH7G4YaISs?=
 =?us-ascii?Q?FyYdQ1GwVwGBlrjKJV5oBeOcN2yz/F0F68t2m6j5jdOdwLaYG/UYguPHyD9p?=
 =?us-ascii?Q?9yVkYZ4qjtI8X2pG5pfCXb81TXPvraB9Xfso1AeO/Jle5QEWso0UkImT3CZ0?=
 =?us-ascii?Q?dX+GUr1v/cXOzNbPwryia5K4e76VqyQqrdtf+R8z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4632ae41-e9b8-4158-42a6-08dbf2890b59
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 16:17:42.0043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBjY+WYS5G8LC8HraXhuwGa0yuUUJel2vx0QYfRtMF7igLGoILSt0esViwZ1rl0Y6jKEld1IT6jvKElbAAGrfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8695
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'pf' and 'lut' is just difference name in difference chips, but basic it is
a MMIO base address plus an offset.

Rename it to avoid duplicate pf_* and lut_* in driver.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    pf_lut is better than pf_* or lut* because some chip use 'pf', some chip
    use 'lut'.
    
    Change from v4 to v5
    - rename layerscape-ep code also
    change from v1 to v4
    - new patch at v3

 .../pci/controller/dwc/pci-layerscape-ep.c    | 16 ++++-----
 drivers/pci/controller/dwc/pci-layerscape.c   | 36 +++++++++----------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 3d3c50ef4b6ff..2ca339f938a86 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -49,7 +49,7 @@ struct ls_pcie_ep {
 	bool				big_endian;
 };
 
-static u32 ls_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
+static u32 ls_pcie_pf_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
 {
 	struct dw_pcie *pci = pcie->pci;
 
@@ -59,7 +59,7 @@ static u32 ls_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
 		return ioread32(pci->dbi_base + offset);
 }
 
-static void ls_lut_writel(struct ls_pcie_ep *pcie, u32 offset, u32 value)
+static void ls_pcie_pf_lut_writel(struct ls_pcie_ep *pcie, u32 offset, u32 value)
 {
 	struct dw_pcie *pci = pcie->pci;
 
@@ -76,8 +76,8 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 	u32 val, cfg;
 	u8 offset;
 
-	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
-	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
+	val = ls_pcie_pf_lut_readl(pcie, PEX_PF0_PME_MES_DR);
+	ls_pcie_pf_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
 
 	if (!val)
 		return IRQ_NONE;
@@ -96,9 +96,9 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->lnkcap);
 		dw_pcie_dbi_ro_wr_dis(pci);
 
-		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
+		cfg = ls_pcie_pf_lut_readl(pcie, PEX_PF0_CONFIG);
 		cfg |= PEX_PF0_CFG_READY;
-		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
+		ls_pcie_pf_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
 		dw_pcie_ep_linkup(&pci->ep);
 
 		dev_dbg(pci->dev, "Link up\n");
@@ -130,10 +130,10 @@ static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
 	}
 
 	/* Enable interrupts */
-	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_IER);
+	val = ls_pcie_pf_lut_readl(pcie, PEX_PF0_PME_MES_IER);
 	val |=  PEX_PF0_PME_MES_IER_LDDIE | PEX_PF0_PME_MES_IER_HRDIE |
 		PEX_PF0_PME_MES_IER_LUDIE;
-	ls_lut_writel(pcie, PEX_PF0_PME_MES_IER, val);
+	ls_pcie_pf_lut_writel(pcie, PEX_PF0_PME_MES_IER, val);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 8bdaae9be7d56..a9151e98fde6f 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -44,7 +44,7 @@
 #define PCIE_IATU_NUM		6
 
 struct ls_pcie_drvdata {
-	const u32 pf_off;
+	const u32 pf_lut_off;
 	const struct dw_pcie_host_ops *ops;
 	int (*exit_from_l2)(struct dw_pcie_rp *pp);
 	bool scfg_support;
@@ -54,13 +54,13 @@ struct ls_pcie_drvdata {
 struct ls_pcie {
 	struct dw_pcie *pci;
 	const struct ls_pcie_drvdata *drvdata;
-	void __iomem *pf_base;
+	void __iomem *pf_lut_base;
 	struct regmap *scfg;
 	int index;
 	bool big_endian;
 };
 
-#define ls_pcie_pf_readl_addr(addr)	ls_pcie_pf_readl(pcie, addr)
+#define ls_pcie_pf_lut_readl_addr(addr)	ls_pcie_pf_lut_readl(pcie, addr)
 #define to_ls_pcie(x)	dev_get_drvdata((x)->dev)
 
 static bool ls_pcie_is_bridge(struct ls_pcie *pcie)
@@ -101,20 +101,20 @@ static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
 	iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
 }
 
-static u32 ls_pcie_pf_readl(struct ls_pcie *pcie, u32 off)
+static u32 ls_pcie_pf_lut_readl(struct ls_pcie *pcie, u32 off)
 {
 	if (pcie->big_endian)
-		return ioread32be(pcie->pf_base + off);
+		return ioread32be(pcie->pf_lut_base + off);
 
-	return ioread32(pcie->pf_base + off);
+	return ioread32(pcie->pf_lut_base + off);
 }
 
-static void ls_pcie_pf_writel(struct ls_pcie *pcie, u32 off, u32 val)
+static void ls_pcie_pf_lut_writel(struct ls_pcie *pcie, u32 off, u32 val)
 {
 	if (pcie->big_endian)
-		iowrite32be(val, pcie->pf_base + off);
+		iowrite32be(val, pcie->pf_lut_base + off);
 	else
-		iowrite32(val, pcie->pf_base + off);
+		iowrite32(val, pcie->pf_lut_base + off);
 }
 
 static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
@@ -124,11 +124,11 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
 	u32 val;
 	int ret;
 
-	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_PF_MCR);
 	val |= PF_MCR_PTOMR;
-	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_PF_MCR, val);
 
-	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
+	ret = readx_poll_timeout(ls_pcie_pf_lut_readl_addr, LS_PCIE_PF_MCR,
 				 val, !(val & PF_MCR_PTOMR),
 				 PCIE_PME_TO_L2_TIMEOUT_US/10,
 				 PCIE_PME_TO_L2_TIMEOUT_US);
@@ -147,15 +147,15 @@ static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
 	 * Set PF_MCR_EXL2S bit in LS_PCIE_PF_MCR register for the link
 	 * to exit L2 state.
 	 */
-	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_PF_MCR);
 	val |= PF_MCR_EXL2S;
-	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_PF_MCR, val);
 
 	/*
 	 * L2 exit timeout of 10ms is not defined in the specifications,
 	 * it was chosen based on empirical observations.
 	 */
-	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
+	ret = readx_poll_timeout(ls_pcie_pf_lut_readl_addr, LS_PCIE_PF_MCR,
 				 val, !(val & PF_MCR_EXL2S),
 				 1000,
 				 10000);
@@ -242,9 +242,9 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 };
 
 static const struct ls_pcie_drvdata layerscape_drvdata = {
-	.pf_off = 0xc0000,
+	.pf_lut_off = 0xc0000,
 	.pm_support = true,
-	.ops = &ls_pcie_host_ops;
+	.ops = &ls_pcie_host_ops,
 	.exit_from_l2 = ls_pcie_exit_from_l2,
 };
 
@@ -293,7 +293,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
 
 	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
 
-	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
+	pcie->pf_lut_base = pci->dbi_base + pcie->drvdata->pf_lut_off;
 
 	if (pcie->drvdata->scfg_support) {
 		pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
-- 
2.34.1

