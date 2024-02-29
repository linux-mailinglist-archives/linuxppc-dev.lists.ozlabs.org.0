Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB44A86D3A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 20:47:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ifinzG2/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tm1vs3zXpz3vdf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 06:47:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ifinzG2/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::600; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tm1v51Tgpz3cZN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 06:46:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5JKIo9shbzjK6jnyUiOE0WmiDgn9JF9ii3IsGgxNBTwTxAO/fexldn5cYz/OO2uLrHOHZ+9v6yYbPqNGdAZREAZP3qfGSqENeTer8YLZopn3NKwgnuUsYutJE0LQ9Py4NfkoGPLorKDNtiQtv4vSTnl5cssG08lPlJ76jTysSZxehOCYG0gUT6hP3Zh+MARsYpS7Wqzjd7XdKG8+LYticm2kXWEhj6h7OSKPkMP79JbFwRCiW245T3PzBJ3pqyesd8vxMZx2+bRJu/5X/lTzk+17SSCOgMaKSQtHZeF2Mq06JKmmDt3ARh1uymWgzdFNxdVkUB56Ef+/rfeLj0+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94Wsnbn3IwR5EvAEYoBxd7PI9/IApQorut/MNb1tbYk=;
 b=L+9u3ju0stqZFVzrXocyrrlwn8PGhVgimoLFzfL0l/+rF21Zx+y9JNNLt0PaKFbXQXHn7TTN+ATR3O0Ay28WEVWQCqXanjdr3P7yBfmDuwliL0w5oYijQ5RMSkUzAz4EkkUULcEWXrLL9d5fhv/ZGyf1oBVBYua0Y0dTQT9sWBJvX7mRf3XTVAvrhLlpaDtH3jp95gfFKXA+Y6Nu1k97hRd8Wk9qzN5+HoYmdCZ+yByhQK9mgX/O0kAWfQCC+sSZfhnD+aeUSP5y7+EeXh5NG8AEftkd73HrLncpf7zCWEPo/38amFaRLFXbTxzGQ6tcom3CxxCe24f97ly2xwMFWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94Wsnbn3IwR5EvAEYoBxd7PI9/IApQorut/MNb1tbYk=;
 b=ifinzG2/m32pO75G4PPh0ybV4EzaKc7NjXQ8TK531Qqf5T0Hpp+0K9/ef3VbeT7erA2WSUnv6gfaU/nMkn6TefLV2UgSlzxTS8zdv7pdMF4z/icABTVogCw2EaNB1wAyZzi2lZmMchEQspHopa4dhOYEP/3NQy5LPBrXKGGc8bY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7985.eurprd04.prod.outlook.com (2603:10a6:20b:234::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Thu, 29 Feb
 2024 19:46:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 19:46:14 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] PCI: layerscape(ep): Implement common 'dbi' reg-names for dbi_base
Date: Thu, 29 Feb 2024 14:45:58 -0500
Message-Id: <20240229194559.709182-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 218ce07a-419d-47ca-b9f3-08dc395f1673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zR2fueHXiEdTV8ylaQ+fOYbm8ydSQ3UgLYONCzoz4MbvgAMaF3e3u5fXMFMdxn9jG2WnaBgDts/kI2J/btdq5enj7RMQCrTJATSqtpGQG5NzwSQUEPlXNX6yHMXPDh5cDc6A9F17eshDpsn9lfYy6feoOF1lnswcj1L365x4wNDAxWXldVvoDKh2xDx8zPS+8EOeWrdPlCpD9qtI2nkwGqq2bxlyfWme3a9+LZqBOhBUrp4gb5Tb1/kfZBLre023gVYnSeDCtAKepA4z+ITHIoujWA5AJK+Dock0LVqARtNWsWtglNsWzdPjuII8Xg8kdVcLlA4wBB2b3s6bbtYegt9HXlysCbTaXSTe3EXSAko4KrKTXvvAZ5rO1CuVVpuNGyA4p1SqbdR6JCQBebiM9ikecqU5IGp5W/XpbKQZ2Tya5Q5WB5pbyx5iP/DZ487aXEc/qZXtM2F4ua2RJ6IIn4EFpTfQfMBSHotCSgGhVzXQ9YyU8lmzADpQvqPk30yhEdkjZpTrQdoMrFUjz3kDpWIMQbDrqvOv6CbTsXeMXoUQ/FESz2VLH8ePnH0hyzlQTPLfxneNkZLCD1dR6b97w6s7NblVXknGf2mmYN68ZtE+XXzjgDiDimSeD6z7vZHUdkN2xPgksBINEhn7Qc87EMBD/sSfKkyF2NbJh7aQyeDnyrnFVD/xl5b9/A3EYYD2jEKtBdlUg2RYcwOIQgPJtUfedDsp+MfHMyFFT1+AlsU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?whxdZmaV9b23zNuavIpkYjOVNKZa4tpW1jaqnsj88pgxjYtP2VfEElSFn8Ho?=
 =?us-ascii?Q?afuBMlnXx7lazb/yxCQT1NhGXlliyH0UuqxGEnlBPi+ivNokWNTpbdzuZ+pb?=
 =?us-ascii?Q?g+wqxg7yTgxIASyrrVi24wrbGiwBVgqC0kPOer9FhmOX/Kp0U6P/ttITCElO?=
 =?us-ascii?Q?FeRnrO/zX1W67CPCTwXp9MW7JdvGMHlk62WW1C2nFbcD/+z5FeA8qTZPNxLH?=
 =?us-ascii?Q?e6k+QfQhJ6Zd8ZVcGYUJkyb4Hd8REbY4m/vH/NFNrS7NzNxlg/x3vU0Sw+Dx?=
 =?us-ascii?Q?05H46LqwMXTEogSAJcKZ0+Zy2l/LLxT7sWKPHYWfnNn0CeJpJf1muEca44N+?=
 =?us-ascii?Q?0+Ly3UKQYJ6txkwF+k4aQnytLF+vkd7BFPAlmssiXwHlyf2+nREnmfKWiljm?=
 =?us-ascii?Q?d1Hyd22w6uuGnuosv9aMmm7gFrXwQrDXwy+PFJ+wOFwyl7u0v0btiBEmcFZF?=
 =?us-ascii?Q?C5R2PujGdO3RoSGEy/951CYOs4YR74JWu2nbhSbxq6trSr7chcN+FMb3XOyy?=
 =?us-ascii?Q?TStfwk5txAfX2xm611nHapVaYDj4j4kAsh1XL8JYbDWyvMg+8BqOeEiSqQsv?=
 =?us-ascii?Q?bcof5FYL2wu+DD4MnpHXQtA/1uz0Zo4/4n2FTFxMn80DOIg9e86cTDYetK7a?=
 =?us-ascii?Q?clcOXwBBG1+OMsfEemcnMyn5pmOdY6ZbpSu0L+uqQsDTn45ok7dbOyRtQFRC?=
 =?us-ascii?Q?n9Tbl934xCO8jg/fIN6ywGmDPNtUPDWQf+2PI9puC1thIZ4eoEYS5uu95KgY?=
 =?us-ascii?Q?gm1WpWCL12lJFFu7XN/AEMDFBqbyaEHisTTMMbu7k7GuCHS+znw1k6fOuc4+?=
 =?us-ascii?Q?QS6OhgGbJwUsf5cLhh4zNGUr7Tm1CfFjP53mE2W+7FEb3McxCNRJ0l9x4c3G?=
 =?us-ascii?Q?Kd6rhgQQgA/RzCAZ/OwRh8MzJJCi7kKzGMOyCCutFckHLvAR/uoi0OrhoqCE?=
 =?us-ascii?Q?OysCeX9/+uwKpxEyIN831UcAODxfl/hCMdMiChNTuN/HJ45nBWfVBdz8A15a?=
 =?us-ascii?Q?tEnAoppT/3+gM02ZhuroDE0fL7lwKB42KtSwjlP7ErohBdCgi6OA/0fMIGa2?=
 =?us-ascii?Q?c1usaBdwmdVAFTTO91DHiVpAvxbkgeZblYjnNcFbD7II8T3A4T0D0gxUlrFt?=
 =?us-ascii?Q?F78SMKVkPJw4zjGa/d9iUis+dt34kAWP/A9wjbBkHgbBXbioTMB0AHPcxtfr?=
 =?us-ascii?Q?qmcosB4wexBvB7SvPC2raaxd83ArDH4SeTSPcTIykbgjc6w4hl2KUv3TBGOY?=
 =?us-ascii?Q?8B4bFlonsL2ybJAL5BK7awE4vwl1/8gns4HBH9HnzhxgRFT5FaRHPK2MsM7W?=
 =?us-ascii?Q?BU8X33VrVlVHwKwpuqHyy9JiJePOsHVKkNcNu/elCVul3qe6YHxKCavmCMSy?=
 =?us-ascii?Q?5NRck68F8AiMJXtNlZbsrXlWGtjyUUD2DQhdooyOgi4hhj5rLxJ+W1D2nPfa?=
 =?us-ascii?Q?uozitMxD8zpSN2oarLeUb1FifjMSkPu3Yt3rw33z7z1geKcRAyA2Ua4wcSZ+?=
 =?us-ascii?Q?XfvtqduC8sRxNZq+N1Bmn0xPHz/qWMmF2tVN++ghSnwdImj6FW6slMcT2hIB?=
 =?us-ascii?Q?subgBEruWHpQAuQtoBsAWtUIRtwMD7z4nZFKL+rA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218ce07a-419d-47ca-b9f3-08dc395f1673
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 19:46:14.2570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/6NUmowVVpfrLT7Dx+uU7Bt/4hYCyu4nzlJ3zLxPPapma4HPKMmBZ3A9X8Mh5wIWATVYVLBdUanXgkE6ADUeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7985
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Apply 'dbi' as the primary name for dbi_base register space in line with
Designware common binding. Attempt resource acquisition using 'dbi' first
via platform_get_resource_byname(). If encountering older device tree
files, gracefully fallback to 'regs', issuing a warning message.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c | 7 ++++++-
 drivers/pci/controller/dwc/pci-layerscape.c    | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 1f6ee1460ec2a..92d4750611d07 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -259,7 +259,12 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	pcie->pci = pci;
 	pcie->ls_epc = ls_epc;
 
-	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
+	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
+	if (!dbi_base) {
+		dev_warn(dev, "Please update your dtb, reg-names 'regs' should be 'dbi'");
+		dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
+	}
+
 	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
 	if (IS_ERR(pci->dbi_base))
 		return PTR_ERR(pci->dbi_base);
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index ee6f525681337..1985086f6a1f3 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -345,7 +345,12 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pcie->pci = pci;
 	pci->pp.ops = pcie->drvdata->ops;
 
-	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
+	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
+	if (!dbi_base) {
+		dev_err(dev, "Please update your dtb, reg-names 'regs' should be 'dbi'");
+		dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
+	}
+
 	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
 	if (IS_ERR(pci->dbi_base))
 		return PTR_ERR(pci->dbi_base);
-- 
2.34.1

