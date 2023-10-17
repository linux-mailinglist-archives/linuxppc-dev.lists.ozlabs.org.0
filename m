Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8697CCC63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 21:35:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=KL8Gy7by;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S942q6fBMz3dDJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 06:35:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=KL8Gy7by;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::61c; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S93z82571z3c5k
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 06:32:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guFgFzPAa+UGrPoWx/Lnk4pJkpH0T4yu451c9U1NuJjbfbONfeKIOk5sCIeBXzuVenmRy4d0EE6XwKiayepv/+jamQjGwKZQ3POk9iyAgqNO/c850Xw7FgU8zu7BKkMKhGZr5DWSypG5di9ahe/x6OCLY/O1lbrWjnsD6AG8rwlUuGbRq0Qiuft20KmCYVDZceOmYUgsKfV607+TD7EULXbx2GZ4UmhwJFRtKABjwLO1PsPSSqYg8NYkZ4BxsvBB+wjlc8RWT59iFBiVMCCCjsD5JcP67JuFIqQUmQ4qXr6K7wJHWhc23xS2ELPVYsVeaHfEq1wOoYgaepI5/qNh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxkdJECaH4y9A07SriLtqtwi2hunRS2N34XPnJlu8bM=;
 b=T1XoinbFkOfB2EK2+4Kk5wut1HDsE4A3Li8aSLpkypI3TKtzt2yg4SuWctIsc2jr2hlWVL40ks/T5rzM+CiWjRD+CdYIc6Ib7y+fNeqMdM2xY0r/Fc8W7oG5D8DG6sS8UoxU5jsqARPzChW534dZVd+OQfBKDfbw09zAv1LHCj0Spmq8tLszizv5/Fk+GHcumCnMPxqYaJLnZFyirtMPA6lULPL87xMtETBG3kyCJQbPEQ1aNGBfSPQzLMg/nyytY9ZHY61c9OOVg0ejtV39mDbbRjAyrdryIDq8uwSoHB/FTKtd2KYmx1eI+BfA06y+5wR0lWSvJ62844M+zdAHIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxkdJECaH4y9A07SriLtqtwi2hunRS2N34XPnJlu8bM=;
 b=KL8Gy7byj8uDnppS4qvStgU/TW95uovlkwk8Mq90FGgCWBxq9af/2l+HbLDw07VZLZhM683tnIPF5EL9dRTEpDtO0UkMBueN9zDhzQghoJOhBqsb/uRRjzVmzBGypuGqpVzsdxEa8lc2d7PCMNuqJg0n2MZ8Sn0aRZ22j3+03Qk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 19:32:18 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 19:32:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v3 3/4] PCI: layerscape: Rename pf_* as pf_lut_*
Date: Tue, 17 Oct 2023 15:31:44 -0400
Message-Id: <20231017193145.3198380-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017193145.3198380-1-Frank.Li@nxp.com>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::26) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS8PR04MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: f1183563-d7f1-44a0-08cf-08dbcf47c633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AyBtbEOrjvIVYNixKRh/G5C1XcLpiqW5H8imVVA9Pkpw02P2iUb2ZzbCBitmZfE28LUW+tlrpV+CSq2GmJDYPiHdWFjBgYFbSgM0/ZIIl2WYTkAGJPZNMo516ha24tQf9g/j8Ehfx2SoNxUnq4rj/qWkQ6PFEbYkdk5UcEnli2RG3mIJqeRouhCxABAePJMYcVJ8gm6skmzEf3FERbee2P66A2GBgs/QpVdGejkXqAwMm/CBDbVfhElWOcr0I1jYT4O3unZjfxxrmvZoiAa/gfNsh21w7aLthe3gQLUqp7crV5q7jTcZM8dmEdqlQPKiCiYKHCsXVQEmfWss/8BnnVqQg/pbGUnLBI2Oz9Jelmwop7x6SjGI471NIwX6hnvApWEjNXdP67BimFbc3XwwOGAyqHJPGqZpzZ01GQYBK8JMh6iRwEH0eUq0g6PQnKi+KqLwc7cnDFvgy9Lp9OOZ4/jOCdyMT39o+OePKT1SAwxxIshtuQXUl6y/c99qdfYK2kP3BdxHiIrdYw3H9TM619L13+z4+kSXimbaI4AffOiGUJmtuJ/G8laPMi6S3hFxSOho/E4PlNS5wS55YUn/cDv0K9wQb+MJuFWj2mH1qCBp7/n29fxun6Z8mcz3B5UF
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6506007)(52116002)(6666004)(83380400001)(38350700005)(26005)(6512007)(2616005)(38100700002)(2906002)(86362001)(4326008)(6486002)(5660300002)(8676002)(36756003)(8936002)(41300700001)(66556008)(66946007)(316002)(66476007)(6916009)(7416002)(1076003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?2m3/5UJb9z40PQRoSpoLnPlP3AJPcMOu4hspvenvXQvsSIiz1Fx9k1aVUB3u?=
 =?us-ascii?Q?a1opBpDMAd54ilAoMG+BDU2alk5vjw9sGDohEnaCHN4uNZB9uarHOfq+3f1b?=
 =?us-ascii?Q?Vc4jvKQeJkJvFUR75YEGIgYsgefvX04Zgwc9tMaOdOT++s1AxyB/y3OBzOs6?=
 =?us-ascii?Q?eP8lurKXEKzNnTog3XHIdpLGFsKpzZZiv4XeSQezN+lBAdQYUHumRm69dFdO?=
 =?us-ascii?Q?u5ArTJ5X/rgo/TCCsJhoqrdAMwqoHs//p2+IKxQ2kezGYciDffKnMmyGVlS6?=
 =?us-ascii?Q?L1jCHX/ABAC8/WUqzL41cO2T01WmK4EitGcFz89iTLb51FHuHU+itqb235wZ?=
 =?us-ascii?Q?oP+s4TTnzqJvGhkhyPczvLW1MHz52aEpFNFFynwmJIdoCmgmIPv9q+Yg3PRf?=
 =?us-ascii?Q?goUgrqGqiTiIggL304FTsWIovVJosp0xv/jE1Tl77P/5OB0V+kFhVKdRwkcN?=
 =?us-ascii?Q?Xkx1qgWc6d+hF0bPEST89Hur6TufVHcvHry+Ln/eJJ/XXecKuBgJ8IngE/BQ?=
 =?us-ascii?Q?t+uen9/8LNJ9rHQAI5vHtk5AU87ZSRG/mIIk0RUmHff9ixEiqmrnTFg3QEZH?=
 =?us-ascii?Q?fai5Svti6x+WnBZtUhy2T38ZL4jFM20FI217LX1EKYTm4pKANeCDfQ8X9sWV?=
 =?us-ascii?Q?cP+PywEdw0neDTAcokdlQba4+e0quPCeafSta6aMJWXHjno4wczEGilvRDq+?=
 =?us-ascii?Q?xJ1tf57bRcCuDKoER/n1p5Pm2OZnzMrVKpjI+v9fSMiflMhWA05n27Cqd8+Q?=
 =?us-ascii?Q?pzz81iChrjnWEUF+G39ZatALKMnLasBbeoX13cowS85a3LQrj8I5/QvDB72+?=
 =?us-ascii?Q?wB0XdezPjCNM3tDn5Odu8gV6kzKWIDtuDmythY12wSj8A41ss6AhFdMk1YWZ?=
 =?us-ascii?Q?dbdV1+TLIHWwQ+MmylhwLPjnXrKk/UAhGgH8kWPZygouZVDjePFAPZbJTkBn?=
 =?us-ascii?Q?mhmoj+rTFhMw5otcCWW+U8qtOikmxn6TKROqtGZYHiS1/krmlN1EjE/83oAf?=
 =?us-ascii?Q?98abDqGVybWImgCNRcJbB0FJCLmdg2RryhzA4nqWIXO/8cnHE0ZyX+cJ3bnW?=
 =?us-ascii?Q?Wq6C12TqNSCF2U9eLfqdEvTIho1EytA6ebWjSGQxVX3jDy3wFj5JDfGTw5Vb?=
 =?us-ascii?Q?pHLf2+drX2QWOmL/qyJrXjvUVRy8eJooD7gPqFCcGyfPlhuOfcBsWQVbONRK?=
 =?us-ascii?Q?vNm/Bl+w3YWvgQztBmJMqIm4i0HhMefhmifEM1WOLwGl4PDMUflb/tfHwfn/?=
 =?us-ascii?Q?ytkMzYdvswK1J5idJ++UG9UFtn/X2RDOP+1X7A9rvjR62+Mja7/iGo92K9FT?=
 =?us-ascii?Q?iUBScEQKJ9tVTYksg+erD6Gss6vn4QCO5Mt93x/tcwb1iEqWzPGM8XfpoVUT?=
 =?us-ascii?Q?E3m0PR6o977xcG76Izs/G18NyPK2XChYi0C1+hozkTKE7Rp335/dLCaztQBu?=
 =?us-ascii?Q?5DborzanhA7iBapp3lXv+4KsAzpLNdGhPI0au5vlOaRmjktamhSEAMFgh1Ys?=
 =?us-ascii?Q?F2iRceDp569mL32tkUKL//LQ6VlhcwiDhNE2NFznC1+VsDNl70IynI6BckDv?=
 =?us-ascii?Q?GDXAMG332aNCAYxHY4fGzt4994buT13QDfIfVEwB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1183563-d7f1-44a0-08cf-08dbcf47c633
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 19:32:17.9413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIkFmdTa8cFVaPNvUY7SSl/wmVmPmS9vgZhc4Z0aonPWyBxi00eNDuTq7fE2W7YftMI99FFDrJhrCqd388ztdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8948
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
    change from v1 to v3
    - new patch at v3

 drivers/pci/controller/dwc/pci-layerscape.c | 34 ++++++++++-----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 6f47cfe146c44..4b663b20d8612 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -46,7 +46,7 @@
 #define LS_PCIE_DRV_SCFG	BIT(0)
 
 struct ls_pcie_drvdata {
-	const u32 pf_off;
+	const u32 pf_lut_off;
 	const struct dw_pcie_host_ops *ops;
 	int (*exit_from_l2)(struct dw_pcie_rp *pp);
 	int flags;
@@ -56,13 +56,13 @@ struct ls_pcie_drvdata {
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
@@ -103,20 +103,20 @@ static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
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
@@ -126,11 +126,11 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
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
@@ -149,15 +149,15 @@ static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
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
@@ -245,7 +245,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 };
 
 static const struct ls_pcie_drvdata layerscape_drvdata = {
-	.pf_off = 0xc0000,
+	.pf_lut_off = 0xc0000,
 	.pm_support = true,
 	.exit_from_l2 = ls_pcie_exit_from_l2,
 };
@@ -295,7 +295,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
 
 	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
 
-	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
+	pcie->pf_lut_base = pci->dbi_base + pcie->drvdata->pf_lut_off;
 
 	if (pcie->drvdata->flags & LS_PCIE_DRV_SCFG) {
 
-- 
2.34.1

