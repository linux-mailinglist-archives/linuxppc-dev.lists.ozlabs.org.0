Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78862800FF3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 17:20:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Y9Zem0cm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShdZg70BTz3dH2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 03:20:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Y9Zem0cm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::615; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShdWx40w2z2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 03:18:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TC5e8cu8Ox7RFbjvEp6+SKUv2FsXhhlsu6h1gcAwdICmuSSqklsODJvTc7P6FU5dUoJc6SnuiqJFrtdOIjr+pdciVRJB8Wsad/aUNZeKY3kcsSJeUEO2WBWby7K4BwnWRlzAa0GK7pndwgWAe1llkgoDhB6iD1VWWuvPLXwFzq6kSQhahZsgeqwEjat1Pb5uEHGKCzNdYeCsFt2Ah/lgf1/GK84Bte3B51lRdyQGvNRBxg2h+CwMFu/q2OA1OeLZ3eAWMzbEi/C6hWfVApES0gTUIk8nab+ki6Yla95ehB4aZuPCr5CKh6Ao3WH4vwxvWMx71e27NVUUN/Gm0bOvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yNDMKFiwS7ub/xZFChRGWt4ujBRA1Io/5jPbEhzwKo=;
 b=A+wrvCJqls4OiCcGD+vOxD9cVHsWnnmuQXVqZnK26akAot1WjRtxEqlwZL3KUWozTNg+/hP0a9rJcPT6DZEgRYJh4kfINHBUtFJaCSpcufnw7OEfLIiVcosSxKkoWUUkD3rcDBh2KJuPoKbhqA8NQBbrT2itH/FPRcbHM+UUcYGkE1Vua0O6w4f9gv6HZXFnjXuvPBpriCzN1miDyR8lud1PLhPOLsA2B+zbM67URmvKWmtKFiaImYSFJq/KOgit77Opr78b4/tIsjJ6OOtXBRh2xscIueOkGqyXp7+RsBRp1MvszSSpQ6k+CVrsBJ++6Moq0h06a7HAb46LRLCFwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yNDMKFiwS7ub/xZFChRGWt4ujBRA1Io/5jPbEhzwKo=;
 b=Y9Zem0cmT0Wr9GSipC8QmuhcjdQet1i6KAW95VWr+ZKNIBoR3cJ8JRps2tz2+oRJVU3J80NPla8FBPEE8aziFGDVD0SHZ3qNDk3zAdf3I3jEYTQ9ifHHkuQSPXRUN7QxbKXsOYEM0RnWikVQs/2oNjtK2PoKytGNqnHwCpUUg/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DU2PR04MB8695.eurprd04.prod.outlook.com (2603:10a6:10:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Fri, 1 Dec
 2023 16:17:39 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7046.015; Fri, 1 Dec 2023
 16:17:38 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v5 2/4] PCI: layerscape: Add suspend/resume for ls1021a
Date: Fri,  1 Dec 2023 11:17:10 -0500
Message-Id: <20231201161712.1645987-3-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 83dd3b3a-4767-4b68-3484-08dbf2890943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qV3ELql9CJnSRfy5LIrNsr/b6lT8LEOKGsz0oxVrv8wwp+j3YwuUPfmIPLON/dZ+05RtkcUNedenscr/3L+Q1AokhVevOSOR08qZ4tStUbVRW0Kr7SFHu1AOyrodyO4YcAICOyx50X7h+kM9msqo0/WHSb1lDBZEXbo0TUBAu0DIZLgoaVA5kPjMoemJjWu5vwZzCQQgX6S47oLrKcEOXGBAHI5umOCBZijpJTQ014ohPG3syuZ3FoljPMAW2E3ESf7iOl+WUiHTgiMCaPmP1NzV/3AHzULnZZhD25hWmCc3gaKElrjU2VH5VYz70xAhNI7LSqVBkxgy2CQrtWE1tabLRcTKtNx92zAgIZlANBZRar6ByZBSKWFyMzlYIgoABORcKg9rzdcI6ztva1e6ND6ifDsoY+yqmaVB8F6ytHtmhWr8U/wA7Vl71HDNpHiv3xPsjnlyhiBfkm4vEd4ZP20lzfEjcgPPPvmnaaZ7VpgL+8tjPX4FwOYoXvUTHeciP1VV27BgaySyCKQ/RUT6Srf0/TQj3tmpY95D+ApEDC1Sf5fZpG8q9hGVX4kHk06fe/Xmh7IduXx41I0yMtEpMGaGwmSF/nVLZp9bgyCxAg7Cizdjfah2J/XS8IJAEqkX
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(38350700005)(6512007)(41300700001)(83380400001)(2616005)(316002)(6486002)(6916009)(52116002)(66556008)(66946007)(6666004)(6506007)(66476007)(478600001)(36756003)(5660300002)(2906002)(7416002)(15650500001)(26005)(4326008)(8676002)(8936002)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?z5xVGM/wt5MohXrtOqaXw1HrEvhRP3c3g6b9tZSzs9y7gN4IuPYND6mKttGN?=
 =?us-ascii?Q?ai0NqjB/+4vq+LxR/hwYEukSTh/mjxThm1x8dv3npDFJd2s5ZvlpTZ+WUgP+?=
 =?us-ascii?Q?tZnu1RYMjXEGlDYGFKKArGpuw77Fuy5vXhHbFK4Ly8ldRS1SUjZg6rtyYesJ?=
 =?us-ascii?Q?06m3EJ7RsF9DGdcm2xl3P2W6yv7U2DiCcyEhc4jhQ857S/sGRBk6SOMwz8dT?=
 =?us-ascii?Q?Jdg7ZoQpZQkUdlr7xOrpmUiNxhvp5L3bJCOi98DmSzA7bHgNmcjhKK+otPnh?=
 =?us-ascii?Q?9kULUp5z8rBYqXyImt3NyvBW1fLPDZboX9h3k/nVz8mlsApPZOAnLivRAwU0?=
 =?us-ascii?Q?2htSVjGO93bVCJgRRY7z8r4KC9lVXk+kvh24CvJnIF5/d54yqrzesRI109qW?=
 =?us-ascii?Q?j8tcvAcrd0V/9afvo2FojAhE49LhQihODIHNmaw0AK0NLEZv4Hi2aT20fn7F?=
 =?us-ascii?Q?djaSjQdoR6gxSuNiZ9Riw7fUxuifgvnuLgaO23je2z7Sgl4xfy5vC7QFLX+B?=
 =?us-ascii?Q?/M3EJ9SPmLtP5sS44CBi7f66Pk5qSK3UU2BV3dCcFWuyZkKapqPvjDLJ8e33?=
 =?us-ascii?Q?+RL7SKY9LoRq/wF2KJck8E56s+Gq+1OfQJ5TUNa7dfhEYz875cp1WgQjCxOu?=
 =?us-ascii?Q?ZXa2iCd9SHpTJs0nFvdtnIoQBXEXz4ychS5Xkjjfdbmy2EN96acLjJy69GUf?=
 =?us-ascii?Q?+j4LhqguLc/iaJtaqGZpsSQ4xpGXnYvjn4SQCICkfWStzxNQen19Bn5Uy8Vw?=
 =?us-ascii?Q?l0E7U+jY3rYs4cYMWHXaZaCbo9HUzAVGqR9Agqwn/SIl0iMb7lLeqoHuZT6j?=
 =?us-ascii?Q?gCIYFug+/rpBoPlz5wAe61swJqqmrxTXw9ybG35TPVRvks5oMfMtckm/2BKb?=
 =?us-ascii?Q?AlizpTBBMsbznLRA4Nb+/GAjJybRnxHT582E1aSF4LWoz59sCs7UcqqK6dMc?=
 =?us-ascii?Q?USYFowevHkqTWHjXprSb/IhctmUb+597EiHJ6lQCQ0S9kqjnVU5wFmZlEo6l?=
 =?us-ascii?Q?qmu0mBqlghnBWmAZBTT2Tr9ctdncz4a/yx1AjBtNo+RBkHuD56mtT18i66S+?=
 =?us-ascii?Q?RVU/ejclo5iz7ukIYFeuMbx9ToJaLBU1/xzpBPuvBgMFGOqWj+1de16aEKv9?=
 =?us-ascii?Q?f9JE2YPASuzrw0HS7+JVp/0AhMcCGC74A8aYb0cBrYBKwiJ9MM8yDfF7lDEB?=
 =?us-ascii?Q?EqIUX0BZ1S7WpVYfcQIKowlCYRs2S7vpEvTH+AWEeAuDREKYQ3a6bBMGIbeg?=
 =?us-ascii?Q?UQcMO27iU8dWd9Cp9YDP2xIyFtrb8+/gn9g7Ds7FH8pAEsUvXc4BDHUYHX8E?=
 =?us-ascii?Q?Ll8L0EzVTKwr4xI5X0WHg2XT2LIfY/MB+7MbsGtqcPcAqQ+t+y4RQTFczlWv?=
 =?us-ascii?Q?mTb2YZCTsLq8Sie0NsYL63W+IDPzbVhF9sg9fiTisYuZ57Jgb6+k9I9nUQAk?=
 =?us-ascii?Q?GJNAQRFYawvHZfwgdn6tFcbwRnPiAnivxweEnUKd9jAadE2ZhSA4vxVG35oA?=
 =?us-ascii?Q?86Yq3VtKIUpiQNs5Da/P7Rn2NYGn0AnMQYFaHLxZWD9fjc9oKHxJ+Oc3lUTR?=
 =?us-ascii?Q?3FXeOeaafK8efIXbTvKLEw0Jn3PYnB2lz4s8ys+t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dd3b3a-4767-4b68-3484-08dbf2890943
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 16:17:38.4525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gA50gslnAgngHUkENUoprOamOTDmqLmQrnmfDIFMYeiagyubmF/uN9OMXEIELPpu+0Y8sPiy2EJaHzh4k4XjDg==
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

Add suspend/resume support for Layerscape LS1021a.

In the suspend path, PME_Turn_Off message is sent to the endpoint to
transition the link to L2/L3_Ready state. In this SoC, there is no way to
check if the controller has received the PME_To_Ack from the endpoint or
not. So to be on the safer side, the driver just waits for
PCIE_PME_TO_L2_TIMEOUT_US before asserting the SoC specific PMXMTTURNOFF
bit to complete the PME_Turn_Off handshake. Then the link would enter L2/L3
state depending on the VAUX supply.

In the resume path, the link is brought back from L2 to L0 by doing a
software reset.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v4 to v5
    - update comit message
    - remove a empty line
    - use comments
    /* Reset the PEX wrapper to bring the link out of L2 */
    - pci->pp.ops = pcie->drvdata->ops,
    ls_pcie_host_ops to the "ops" member of layerscape_drvdata.
    - don't set pcie->scfg = NULL at error path
    
    Change from v3 to v4
    - update commit message.
    - it is reset a glue logic part for PCI controller.
    - use regmap_write_bits() to reduce code change.
    
    Change from v2 to v3
    - update according to mani's feedback
    change from v1 to v2
    - change subject 'a' to 'A'

 drivers/pci/controller/dwc/pci-layerscape.c | 81 ++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index aea89926bcc4f..8bdaae9be7d56 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -35,11 +35,19 @@
 #define PF_MCR_PTOMR		BIT(0)
 #define PF_MCR_EXL2S		BIT(1)
 
+/* LS1021A PEXn PM Write Control Register */
+#define SCFG_PEXPMWRCR(idx)	(0x5c + (idx) * 0x64)
+#define PMXMTTURNOFF		BIT(31)
+#define SCFG_PEXSFTRSTCR	0x190
+#define PEXSR(idx)		BIT(idx)
+
 #define PCIE_IATU_NUM		6
 
 struct ls_pcie_drvdata {
 	const u32 pf_off;
+	const struct dw_pcie_host_ops *ops;
 	int (*exit_from_l2)(struct dw_pcie_rp *pp);
+	bool scfg_support;
 	bool pm_support;
 };
 
@@ -47,6 +55,8 @@ struct ls_pcie {
 	struct dw_pcie *pci;
 	const struct ls_pcie_drvdata *drvdata;
 	void __iomem *pf_base;
+	struct regmap *scfg;
+	int index;
 	bool big_endian;
 };
 
@@ -171,18 +181,70 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void scfg_pcie_send_turnoff_msg(struct regmap *scfg, u32 reg, u32 mask)
+{
+	/* Send PME_Turn_Off message */
+	regmap_write_bits(scfg, reg, mask, mask);
+
+	/*
+	 * There is no specific register to check for PME_To_Ack from endpoint.
+	 * So on the safe side, wait for PCIE_PME_TO_L2_TIMEOUT_US.
+	 */
+	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
+
+	/*
+	 * Layerscape hardware reference manual recommends clearing the PMXMTTURNOFF bit
+	 * to complete the PME_Turn_Off handshake.
+	 */
+	regmap_write_bits(scfg, reg, mask, 0);
+}
+
+static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+
+	scfg_pcie_send_turnoff_msg(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), PMXMTTURNOFF);
+}
+
+static int scfg_pcie_exit_from_l2(struct regmap *scfg, u32 reg, u32 mask)
+{
+	/* Reset the PEX wrapper to bring the link out of L2 */
+	regmap_write_bits(scfg, reg, mask, mask);
+	regmap_write_bits(scfg, reg, mask, 0);
+
+	return 0;
+}
+
+static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+
+	return scfg_pcie_exit_from_l2(pcie->scfg, SCFG_PEXSFTRSTCR, PEXSR(pcie->index));
+}
+
 static const struct dw_pcie_host_ops ls_pcie_host_ops = {
 	.host_init = ls_pcie_host_init,
 	.pme_turn_off = ls_pcie_send_turnoff_msg,
 };
 
+static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
+	.host_init = ls_pcie_host_init,
+	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
+};
+
 static const struct ls_pcie_drvdata ls1021a_drvdata = {
-	.pm_support = false,
+	.pm_support = true,
+	.scfg_support = true,
+	.ops = &ls1021a_pcie_host_ops,
+	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
 };
 
 static const struct ls_pcie_drvdata layerscape_drvdata = {
 	.pf_off = 0xc0000,
 	.pm_support = true,
+	.ops = &ls_pcie_host_ops;
 	.exit_from_l2 = ls_pcie_exit_from_l2,
 };
 
@@ -205,6 +267,8 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	struct dw_pcie *pci;
 	struct ls_pcie *pcie;
 	struct resource *dbi_base;
+	u32 index[2];
+	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -220,6 +284,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pci->pp.ops = &ls_pcie_host_ops;
 
 	pcie->pci = pci;
+	pci->pp.ops = pcie->drvdata->ops;
 
 	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
 	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
@@ -230,6 +295,20 @@ static int ls_pcie_probe(struct platform_device *pdev)
 
 	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
 
+	if (pcie->drvdata->scfg_support) {
+		pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
+		if (IS_ERR(pcie->scfg)) {
+			dev_err(dev, "No syscfg phandle specified\n");
+			return PTR_ERR(pcie->scfg);
+		}
+
+		ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
+		if (ret)
+			return ret;
+
+		pcie->index = index[1];
+	}
+
 	if (!ls_pcie_is_bridge(pcie))
 		return -ENODEV;
 
-- 
2.34.1

