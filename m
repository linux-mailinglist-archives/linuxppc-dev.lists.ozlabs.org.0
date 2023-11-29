Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4419C7FE246
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 22:48:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VpORKfxg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgXxb5Jk1z3vjY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 08:48:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VpORKfxg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::60a; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgXt2046Yz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 08:44:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEbMcQV02rj0uH/ZMAx3jOiai3YEFJxmBOFZD2DTw3lZL3jc3Fd94tkdMeCFDcNqf1tuyEewApXOKjoF1XuVEfzy5MIJUcp6C344a/yqAR+G/jT0M8VJfvNiLgb+vBaNhThJzGr6XPXzLfRzCk8/VQxs9xnczwcdfXbIICqqM6fiCFy/1fWu3FRZh169QQJhEztdhaf1jLebicmPcyaGJTDgdhPIRwA0scErEoAJR1vTTpVO4/5q70zgiQwraaSSEnODdjqG1p6dkq9u2pz7GA+lqPZWzc9gOUgAVyO1xrJ6B3L3dqyCBcIEeOvb8SWvJ2Wcxv0VTgoA2IZ5mfGogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AE14muc++KDpujY+IPKp/s67OcCuA6D343pU1JuQgE=;
 b=QUEXsCqWokPG8rwNviB52mvQFMbSwai7J2kUhuAB3IjwNtmXBbaEhzCYqTk2wiYsrPG7BePQlkR23AnSr1rvzMU63ertOjrX98oeuVFiZC4XmMxs7gXzrF6s2pTn1Z0QWSvb1PeSneWkLcNWB72bfqwAdS58rLi3q0CEsfn5zGbHQWNQgZ9DI9p6b761G6Pp8kBHVx3jZhRic3f7jBWeJe4S9l+iK9CMgVRGDuzbBuhq8IESgGIZUT5konrQ4plXUvk9xhRb3z3gQ18A9lPMOaheXTAgNN+F5y+xZBaI7fJZAJL8gtQ+xNOx0Rj1zZSyRBgd5BJbaxfyQa+ILxoq8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AE14muc++KDpujY+IPKp/s67OcCuA6D343pU1JuQgE=;
 b=VpORKfxgSg2LwQPDdMApJ65HEd3uqINjSpeZjEcWAVxz1hU2cDRlQs2R1l2l1jNKXCxUwl2SytJrbXeGiA5vnJKEVEQTqUaXa8BDU5MNVsS6cPpFjKMZR+pVts8Fluk5lOF021Dp1D2y5eE94jRaXOFM8cdwaVTmJ2RaETHcN80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.11; Wed, 29 Nov
 2023 21:44:41 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:44:41 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v4 3/4] PCI: layerscape: Rename pf_* as pf_lut_*
Date: Wed, 29 Nov 2023 16:44:11 -0500
Message-Id: <20231129214412.327633-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129214412.327633-1-Frank.Li@nxp.com>
References: <20231129214412.327633-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DBAPR04MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8bcb84-09f6-4a76-02bf-08dbf1246447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZV0zzUbtRPEzLGu4a8GBtmMOfZ6ID/HfvCg1qmSxCG+tD0G9xF9484vVezJWvrRlF7D1pfM5DiazF5MT+8nRNTPS88OKAp4hta4hv+yIrud7JYyCycy2W2nqUBJ4DKNZCVTy1nRq+aPmwxTBNqeIwVaXIB8WEyGZlSOH8IzZ0y/4JKKltDNqHTyj+Hj7c1tq0PSd6OWD0ApldNr6SBiXpcidhCnUx1WB7BnY4OIsdqiYKSqFFUNBmlZttCEkz6kpFZMx2hCXkQlUG/JK2otV/XLXErSuxD77V+3bZ6ytyCcRCZcTEXB8NTTw/jraLcEvP2S474bB3Nm6Rf5Jah8ONZmjrY1mHpf2rtKYwefJp8RdoflxwQzBTKn+gHkIQP7K0b01UdNn/yIO6f3w1izIYRedeFaKLs3hYlEErIWywGsGe15aRml2J0XpBUah/UE2Gj7pA8gG9HNUga9zv0jaElhjDOam1DMMJQ+ZM/fEk8MGBf8ZIISLik1S14EL3lft0TueX7BYoC5PB9wyXYNTBmcd/N/jWKCKAJzkGI3lSmcjGDEgDGuLXfsTW1D6Qtbxxv65SzH5m9TrnpWVyuqS4tomRD/t+llK9zQvTCilZTabRQiPTnJsZJ1P58J8CJeVD0sEsTnmMAgrnBKLtEK/i+tOMhOEza4csVTEVfIYToA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(83380400001)(26005)(41300700001)(8936002)(8676002)(36756003)(478600001)(6486002)(316002)(86362001)(4326008)(6666004)(38350700005)(38100700002)(202311291699003)(1076003)(2616005)(6512007)(52116002)(66476007)(6916009)(66556008)(66946007)(2906002)(5660300002)(7416002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lMQBVrcaSkESHhj71zUa7i2L1OORRsW6OVwK+kNaZEKNHnnQeNekqve4bE/W?=
 =?us-ascii?Q?Yn+CXPyGSxSExxkl1992HetyaJC9PI9wHWg5ynZK2WTi10OCUTik+mZYSFCR?=
 =?us-ascii?Q?Gp0L/r7ZodWZMErX7l7gnOTsv2mbHeo22Ltz+6VHM4Ba5cR7cPEzLMyiR/H6?=
 =?us-ascii?Q?Aa5G+NRtTsRir/Ur5GPAlB0spAteOfQ04ZjsIp28oqiQ49JIFx7uJJmGMxBX?=
 =?us-ascii?Q?Rehoz+mMnXVPfsKV+2ojnnzGOOlrNW95+O10V/N58w5TV0SZpcsN55pJsK7j?=
 =?us-ascii?Q?Bl/qy7yabel8bwDQFiLlFB3hRok9WuCtUhdVxRrEBibiUY6dDCt5WXTvKl3O?=
 =?us-ascii?Q?VWEKwwhmoVN9BaFeX1AeF2eUe/802pdyhLGfHLZadwXSnuySeBlS6ejJjx1v?=
 =?us-ascii?Q?SV54LxShkZVFan1vRPb1r4xcGLieH/uH8TUTQZgz3tRpFL4mJ9kLjMDSRfQP?=
 =?us-ascii?Q?+ueq8tT0EjpU5ogSFeZAp+aek9HKKC1WcGsdvns97uQWbXePBKjivM348iIi?=
 =?us-ascii?Q?b9JPfIuSY8uf7PFp+tzLTVDD56DJwcjv3Tjye+1ux+H5rfl/TvvrDgIlsjWr?=
 =?us-ascii?Q?PVsoZgupV5GKwAC5tsymwrn9PbgiSQiU08j+qV/1Qq2pSrNPVGKPBHaMCV4X?=
 =?us-ascii?Q?32PSEadWjpkAeeGqZazT9vaddCKEZmD8IkCM/4htgEL3k65fUnroCDHz/+tD?=
 =?us-ascii?Q?S/lLh6PFk4bPMcOPR4AwmNLRylSNRk4s1g7XswsuzHAu2zMGlDYL+vAJVnLf?=
 =?us-ascii?Q?vugbpEH5xQiADXIHvdRnH85hXPXhXUytFh6/hLYc6AWG7O/zYftk2OxaT/is?=
 =?us-ascii?Q?2zpU0Rv2/s3BfqwuucOWnhzaBLwSovsrYJhVfVoqeBdXJMz+j3vsmU1qg9+C?=
 =?us-ascii?Q?lxCwuKl4T0YSu8s0E8/glbQ6c/ZW4twsYvbEnBqHLqvLcx2ln5pICG12faXp?=
 =?us-ascii?Q?4gknnRlOv9VuZ0zCaE0IGrluFv/92nDaoCVQJthjHjtVds7jwiXkR9KczO1V?=
 =?us-ascii?Q?g6vm5WdPWqgOBoGLTtNt8+AAPK9uUp4CBDjio7tsbI1OJNOHScX4/76x/7Lr?=
 =?us-ascii?Q?vB9GqCfsEOq/QoJPBvJwW2SHUdFtJYz7W4BOFygposOb3iltNvz+j4OhIVdV?=
 =?us-ascii?Q?Vdwk7MW+aAbLzUyRMnVPFog4mK0vsnlidVNQ/BP9hWw1UJ2qK7ekR9UECs+n?=
 =?us-ascii?Q?gkLs2AwvUQMgrvnLtBYs6Q8cFt63nQTG6b4Y8matYS5CldyNoBPA49D1wjj1?=
 =?us-ascii?Q?NzSiSUXmQbDLU8kTPaZYHf3nmc1Q/b9xC6ChQIHpqCl6LInJgDVjHQqxoTRl?=
 =?us-ascii?Q?CxTgBq7wY3zZEJuF0EzgCkDJnly4uRo0iQQ912J1juyamyPa4ZEZZr9M6Ya1?=
 =?us-ascii?Q?krpV5MC/j3fy+Lrzk1aBUpKHB40nRpSaWRsNpzfSLVqZaMYgp7e91iessZ2l?=
 =?us-ascii?Q?1RBzryBuWENDggLyuXZ62PWqGHmqVPIi6JkgzeV4IriB8XdKMimUDO7Xh4uA?=
 =?us-ascii?Q?3nKr6b7mZM6UeNEwbm3q2feZesUbP+t9hLglTkNc2wH1HjlWGAd8nHv5zlAW?=
 =?us-ascii?Q?Y8C3aKtAemSkAOpeiBs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8bcb84-09f6-4a76-02bf-08dbf1246447
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:44:41.0554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ww6Z89gAA72QetzSiEvYk/4fw5k3wQ78oxYNnXbRnnzfuyIy+dwRIUnF6bJ7xAkVlwf+moRl88The/dTXW1TJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7416
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
    
    change from v1 to v4
    - new patch at v3

 drivers/pci/controller/dwc/pci-layerscape.c | 34 ++++++++++-----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 42bca2c3b5c3e..590e07bb27002 100644
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
@@ -243,7 +243,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 };
 
 static const struct ls_pcie_drvdata layerscape_drvdata = {
-	.pf_off = 0xc0000,
+	.pf_lut_off = 0xc0000,
 	.pm_support = true,
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

