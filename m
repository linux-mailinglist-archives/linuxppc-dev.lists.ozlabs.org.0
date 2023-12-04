Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F68C8039CE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 17:11:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Boy/edya;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkTF34glsz3dWv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 03:11:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Boy/edya;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::60e; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkTBJ4JVGz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 03:09:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxH4iqlC+Gllr+SdAZTwmzJZsSXUmWcuaE6kE7rmtq0IVxUj7HY0mjlJU5hY3eEDU9C4/oW2WHZJFJqrJ6AAI6BL89NKSYhhPEOY1YDYWkbs9xEZcazAKZxp8k/G+PXF3QOa9Al5BGJ7zcGGPGY3UqjAKHaszhqQISnPJlr0zm3JM+n56B5wM6kqf/E08kW6WYBWIXhz0Ceq6ivGsUWyXzuzrRcF9quDq703jkf53ABxfEGiXLWdZX+/fb9no4V+vckYFwJVLtUJCm26voXxdMLPSM3i6H6pishPvG8a2hcaW61H6DS9pF+9efRxOzKgp6bDJAQVKN4jGuo2kkEfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sJ/quEg+uV/jOy2kz6YPod7nZFPL2/fMAkoOgvmKO0=;
 b=JVL/SSOQRQMvkcpasEDGUrk6NNDjyz9mRzCIiX2MtmOFaOH8WVS0gtaIipu8H7c8AUqrxmjyZZwbs53f5UQ9WGYXS9BQ7TvAxDJLEvsSiL8HpKtHQwazk3Uq6aaFnIr/6bH/OYUkPNaRkk3ouLIHpsagTbotUhV4+w7hVa6GCxtw+MzcBsOZ4jdS/4U/c8g6IZXl65ydyJGhJzSItpsAv8PnlAqdtZBgS53ISoluQe7KLRI6wwXV/YFshVTNKlf0hy/gkKl2yJT0i0W9IxyOxSBWKtezOxGOcNa4hm/or3fouSa2fLgIQf4SUKmTDAJ5Cybe80wHz9glUda7V9VDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8sJ/quEg+uV/jOy2kz6YPod7nZFPL2/fMAkoOgvmKO0=;
 b=Boy/edya7aoXKLEmU22wagGx3zTWi/aUfJBTowL2mwlwqcjuv7BRhiw5vUaHj/1p86MwRei0iRyf/HY8cOYe2m14Bgea/x85L6M2NWc6nhYullT1Z+Q2/clGr7qkfdvR+ymTDrE5H81heJ0gHoxdOI/Gf63/R/IvtaU06wcxJW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBBPR04MB8057.eurprd04.prod.outlook.com (2603:10a6:10:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 16:08:56 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 16:08:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v6 2/4] PCI: layerscape: Add suspend/resume for ls1021a
Date: Mon,  4 Dec 2023 11:08:27 -0500
Message-Id: <20231204160829.2498703-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204160829.2498703-1-Frank.Li@nxp.com>
References: <20231204160829.2498703-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0027.namprd21.prod.outlook.com
 (2603:10b6:a03:114::37) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DBBPR04MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: c32978ae-40cb-4e11-9511-08dbf4e35135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	i58ffvXUsX7sFZvGdZTQl/c0xBpEVLodzgmaRGO8FVoKddfBCB99IS4qJLhmC/kwCdWIzkefW1EVG4Eqmv2lpf7VcicXQyGtvcY20EGIELamF5MY9ttCCc1hgcNzjnJtDxWG+KSDgukVY9b9/EMSpXeFp5Jr5a6+bOZQBAjQzK+fQzU+HccAgZ7GlbZX3UY4qkzTzs0pomdTT5etmUj61503Dc2o9tjCMhxojlBGOjIJJhmkzPBiZCsak+guBKhJK7fKHK6otPhGhOQWZfR32fOKk7b99CpNPFXvLIihzVa5ZzXK6jorUKzHSvKAuEs+O5HSCS53vp+zpeP4t2cBCYSLwPLwJunslpn8Vlsswxmh4Aw8ftlRNtIsUFwbpuUf1vUVyBYXF7j13P0BtF8K3OOeNY1cY5FQnn4FlWPUNeshZWiMdezbGMkcmK3kSzeUTDq/WaC9h2yHC3xpr63MdCLIpsPG6xpiNlR9n2+DV/KZ7Va+7m6qc3dlbjjAJmuUVTWJF/dk0bD5lE8hst1UF1hHpT0rLIb1/NLf92niiNc1qDT5tcYMct8wEiaG6lh5Dvu9bljTbE9E0WK8c8wDbAW5fA3w+pYNFJeRmhFTI6H692QkT2RtytIq/wAui4Ei
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6916009)(66556008)(66476007)(8936002)(316002)(86362001)(8676002)(4326008)(6486002)(478600001)(66946007)(36756003)(41300700001)(38350700005)(15650500001)(2906002)(7416002)(5660300002)(26005)(2616005)(1076003)(6506007)(6512007)(52116002)(83380400001)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mDdPMbmMSOcHYKEo7vGOnWxzTS++2BbXjrvRfBsk0qt5idOag21jauwdplWo?=
 =?us-ascii?Q?wwbKpxXqK/XliiEj+TG5jLpDvi7R/Y39wTbs+Om0SzuzunKHJwndo0aDKcAi?=
 =?us-ascii?Q?8GtknFNi/a9xkA8yUR4kzmSYk1c7phyYU/OV0HGWUpGklwh6NzQQNnXQAvi9?=
 =?us-ascii?Q?JvZAavM3tm1o5ZjLI5K7783a0hlo/UbCtBKyjy44zKrKdtUUvUF2nfjd+VvM?=
 =?us-ascii?Q?gSWmzBwOj/cnOfZmAbT/mbgvrPptIRbYoqMB+CKh3L3JU3Mv2Ix+Dt/N7jer?=
 =?us-ascii?Q?boZCt6g3F2f8zOiG7AF+nfWjb0Q/Lg2Y7Kwmlk+4fG2mEl8mZT9KzAG+AYlN?=
 =?us-ascii?Q?8V4uh1PiF38YGlDz25s1fKwXr8Af+2tPgRI+f6Uj6EWSoeP+wfPJxxc7z7zY?=
 =?us-ascii?Q?htc/UWWW4HioLP2yjOBxnkNXk2hR8RcoVB44ukOoZX7lNuAqztwJBZ9wU87f?=
 =?us-ascii?Q?8i8pNjWMZ31G3LFABwHXTSFBCcXRD2iHf/gTVAJk6lk7cnyps8Gg/D4y9044?=
 =?us-ascii?Q?97vuqvk8KBix1P7hJwEljeo9KFsqsBjPtaiTxqxvlAhZfFzCuvwbbxVO2vrT?=
 =?us-ascii?Q?1TIIfKlGitSNh258TLBFfuRQmT5WJ7bqaNquYcJDGBT0srXA4c8+95gVQTj8?=
 =?us-ascii?Q?Djo8VtWeJRXG1mK1XdyXYNqsJkv58pX3JMmBsVugp4lIBmBbXkB0FlC6U71w?=
 =?us-ascii?Q?+adN90t9ie32BpXixUFWJ3nBdasHxw4ZDGsRxX0eJjy7EZy2nP0rGGsFu/Hq?=
 =?us-ascii?Q?HIpgAF61kI+RglKeggm3CgL0xxuJ+ffEbhV7oCYHKTqTpLgtlSsMJfpQG3ve?=
 =?us-ascii?Q?Trk+9DoAldClDT1K9ux3ecK7RCt/k710UbKZaxDrLNevXFMTnyDOPDD3+l/G?=
 =?us-ascii?Q?9fMKy6HrAqM4FtclF93b1Jb1eTK+MFD1ShTpurHMQwuHcfrfQ9H2J0CpgTVp?=
 =?us-ascii?Q?cZ2MTTskP/Rg5uN0xVI7Q4P4PfsrC9029pWNc8WPR0dDkfg+vyhHsHZ4ZS+s?=
 =?us-ascii?Q?cmvj7Vhw3N19/b6bIEKMJOHZfBrMf9/n0Vmvan7A2aPYPDM7rdap3BzhdN7o?=
 =?us-ascii?Q?um6KElqHeQA+4i4KeXoVKLkoJms4EMfYpjYutbRPoMc1cuxEAM2ZnjpJiSvz?=
 =?us-ascii?Q?buvwxbydVTHfxd2k/YudDUBaG1XgIEE7qYzKAudvIc/nIKmqNhoW5TLaj0z/?=
 =?us-ascii?Q?tE/LdG6439W4r4EQNqsrnzi8F+SRxwbUad3zw5UwBsBpq170yS8x42nmSDu9?=
 =?us-ascii?Q?9sR9UV9DCbbn1P/B4tvxViIfwtNGFgwMDgl8flF360sPtNyB9GGuKu8I460t?=
 =?us-ascii?Q?uyRuWXSt6+ELP/g66MpEUbNE3LOLdOCuOWdlEjNsJi+TyPyGxpPSyIQEqiLU?=
 =?us-ascii?Q?X4GfhtcJfT9LUJltxKkxmK6m6p1MQE53/EBHJicqAKVLZawtNZIIQtWiV2SJ?=
 =?us-ascii?Q?PmSd4O2YOkiv7r0jAEzPuuNqL8Dl9WTdEgr6ckF41R5KMZMlJvDBXWxVVj4m?=
 =?us-ascii?Q?njkBDyOHdmp6x9X5GRGeXG9NztHe1/haxJir4OMAo3zWE2BWvZTwtgOWeCpS?=
 =?us-ascii?Q?n515uDveIxsfjxmpGk4RHuGWkwQBl9oX2Vj0jPQE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32978ae-40cb-4e11-9511-08dbf4e35135
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 16:08:56.2185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8t3aJfPrbmn8FfH2xo75WxxLD+Lo+LVezPPFLy1vSyc30UmkxqZu/8Mcjp84cL76cntvldwz5zIenhRl37f0Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8057
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

Acked-by: Roy Zang <Roy.Zang@nxp.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v5 to v6
    - remove reduntant pci->pp.ops = &ls_pcie_host_ops;
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

 drivers/pci/controller/dwc/pci-layerscape.c | 83 ++++++++++++++++++++-
 1 file changed, 80 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index aea89926bcc4f..711563777aeba 100644
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
+	.ops = &ls_pcie_host_ops,
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
@@ -217,9 +281,8 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pcie->drvdata = of_device_get_match_data(dev);
 
 	pci->dev = dev;
-	pci->pp.ops = &ls_pcie_host_ops;
-
 	pcie->pci = pci;
+	pci->pp.ops = pcie->drvdata->ops;
 
 	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
 	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
@@ -230,6 +293,20 @@ static int ls_pcie_probe(struct platform_device *pdev)
 
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

