Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1967F7CCC62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 21:35:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=lhwQhJhK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S941t64vYz3vcd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 06:34:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=lhwQhJhK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::61c; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S93z74G1Kz3c5k
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 06:32:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Thmi/awuLN1su0U7f6fkj6tPGr3TYPmSCAD6AmEx/BDp9+roXPxTLpX03GW8SyXqORentVolS+Qh5OLXlIotSPef3oj8QdElc0lCzvJJ53BNluXBOKcNFOaiL210pjyYq8A78S6fH1XDz5EKHx4GXKqZKsslA3g2pSRPJ25V+lLyrv14ERxHJuPILsfhPaI0WEOPKQOh+Wovcl7FvD+kgKkZzpxybGHnfdLdZLRZcmJr9lxl7VpdHf12J6F9/d4XPw1I565Fv8RjUxF63nL640Zr5FK1DlKXYEwdegCp4oDBjxEojhx3QwD6akt7+MBJNqsefYwHklNyLlkWVEIj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5bbgyiXjy1ZwWl0lC244NceqXrZiMoHNxahg5vZLQU=;
 b=jWT/YpuVYN78I+zkmrBWwimmkfjno/Qm1ESvO/NZaFp+icV2bWLgN2mK13JIvJVhY43yXcl+vjXQvxN1TJNLMRN8QCdStN5I0nzohkg2LKQYeYs+GPb1umeevY+mPexukykUAcx96J/lHBpnmIPdKLvFrsxrxzvkDZkTmMO4mCn1t+5psmmflQqYS0Wr2FAgdCy7M1g4XLywcinozkk3eUNCETjVgOiTNJgnO8WGS/cEPnJAIE5MYMim13e10PnwPRG0hB6ALG97J+HlxQnQ8YQKAUzs1cfiTNYZjZbY2gIUIYvM2jPvHy04mlKtTwY9Jg5iQepOBVzYP+udTyzRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5bbgyiXjy1ZwWl0lC244NceqXrZiMoHNxahg5vZLQU=;
 b=lhwQhJhKWn19MGOVjL33vb3Yrs+34P5mT7hu9yonqV5s5Gzjvpl0DHFOlgvqXW2aMb0xVf6J5s1dCIZTyFGFwHN8nvqGakN0ZBPZRRkR3Bs0udFJbYYlubFJmCPk/bFr8NPEV3Jn9D6ftF+NHQ+0L/3Fr69NEm+shcBRppubUxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 19:32:14 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 19:32:14 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v3 2/4] PCI: layerscape: Add suspend/resume for ls1021a
Date: Tue, 17 Oct 2023 15:31:43 -0400
Message-Id: <20231017193145.3198380-3-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 54f07355-131e-4776-9861-08dbcf47c41a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	JiMgWVd85QcpWK2/F1nnDakML8dXDiIPSEHy4IMPZcMdGnulczCERNCpP3iouMX/SGi6Lnt+i28DZvX1DZ0EXpDq1AlfOSTrD4eVqLDEagOUAMEg9+ro6pl4EHwQReYCgBf08Q9lwr/droeRZi97vRj6JKhSA/HtN8VeZOa1oMD81IYYZggrwde0kGbmLZa13zBmhNmxhf0FfAqW7gErtBvO9LQMX+vL2VdZx8n0+wkEluTZ7IdwB6qMKvAJUqlAERTdnuRv6Yps4CLevzsi4lGMGqo7uQ2SjrtRMBt3yfF0B/IGYGxC23LVGR1YIGi5rjh8hu+hz0F4ktFW9yuNzIFs/1+oOoti5a5hcLit5Tv13LD4aaa1E1RusM0mnTLpt+jNc0HHoW3mOyy/dwZvKQ6HCdfXWCsDmRnRVdinpNw1GbSZTUfHVJbjGdXVkOVcHZ04yFDho9mKIypsgB6EJirk+wMVWEy9LX2wEy6YGFLFDPDGobUzye2BmAybTP/Z5nINojU5dqbvwQIGelO5Bne+ALiS9QOOz/Y1d1iQPMIVMXLRr9fFSqrPCncOKf9srV8OJUtwW071a+k0yozE8FTcUEWvLggX3pLUx/YJJwphaglUk4GQuxo9AvnmAUY0
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6506007)(52116002)(6666004)(83380400001)(38350700005)(26005)(6512007)(2616005)(38100700002)(15650500001)(2906002)(86362001)(4326008)(6486002)(5660300002)(8676002)(36756003)(8936002)(41300700001)(66556008)(66946007)(316002)(66476007)(6916009)(7416002)(1076003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TngB2IrPGR2LZF1cqDddCbTC6TLw4ruOUTQccUEeC7XO70QL3xepw3sFhRRI?=
 =?us-ascii?Q?QzOkVaVVlxCLR/64OaxRVPZyU0EcICKjZw8XPIPuEVKYKhmpYWaadK5VGlEV?=
 =?us-ascii?Q?7IHVxfwW1c2Bf1ZXU2+i5JbyjDjVJPGXqcNz3a3aOEh2WQkmj0uyonD9EAb5?=
 =?us-ascii?Q?7+k6BALwOmtbXJwq9AMn2ULnMCn9RouBD87P8mNHsjogW+R87vFXL1HpX/ef?=
 =?us-ascii?Q?2leuilcAk7lXr8o4xBz+V/1/9aSFsWGxeAPirs1x7ABnhcZy4VRbsvKj9i6f?=
 =?us-ascii?Q?neVZO9pEl/EZsiokd7+n1mf/v9SqPvChhMTZBKlZpQo4+LIvdt4IGfl2pfGE?=
 =?us-ascii?Q?iDsDgghlsgBdCDvAW8dj14bvOj3ReN4MlgQGwijMel2w9KC+S94kejznMIc1?=
 =?us-ascii?Q?JR37P8rtJkAOCXeODOBw6ykdmoY76HhhDc3Ug7PVrlqihmUSIcJeej1ARfd5?=
 =?us-ascii?Q?PplvaMenwJZ7aZPZ8S5f0QQyxMmt8SiBzkgnd7KAgwXd1XvZjj5EHrtXaK+o?=
 =?us-ascii?Q?7cEh8feDV9DLHx/hJKfBVTWvYU4cxI8wVUeENDNbar0VAEsSe+2yNJKHD9mJ?=
 =?us-ascii?Q?KJiYQEMYV2JDLX5FAil4ewtzGejwyRqrX2w9Ac8z7hLD5oH/BdHFacIcIA81?=
 =?us-ascii?Q?sRri8BqRFh47rvlVj07ugdm0GDH57JIeG4CqE5vlhl8a9zzxaYb0lW44Zl69?=
 =?us-ascii?Q?WDaz17OrxvYkvK+9GHDDe29PJmTdpQLzvofx9eeiJDxeCpECEOHGvrRsJm4H?=
 =?us-ascii?Q?umr0AYgQJgcyOsK9mzCo8Msyqe8s1V+w25w6ByvUXvkJYvwnMjz2fpt1z474?=
 =?us-ascii?Q?8lSgR9bQrh+m4Uz6frA4BFGcyMpVS/OpLGhDQcDVz1Nhhpxe+YCo5LLFWKmv?=
 =?us-ascii?Q?UWah/5XLaHMs0vptW7mB7h434h2vpTDKVrr7ybX5KBMVP5qcpOUYt8lNqn6n?=
 =?us-ascii?Q?4ikCua3MKFyctQHYOx91suWurBwWYn0VaUL+iK/9aC6dneET8a1Jaj6j8H25?=
 =?us-ascii?Q?qjWah0a5YE6rp1qs7Li+GYrHtE1ursLMsnRRWfrEJAaNPRBA0WGIggSDbchO?=
 =?us-ascii?Q?gh3RNhaZQzbxyNpO9s6VCrnXx3wS4eZiFtCoUVLmEvBgye8HgEBHmRWogImO?=
 =?us-ascii?Q?cideP1Tk03bKPw/kOycFGjz4BbO1mPaHJvdSJtuUtPW5JFq1dY6Hgio0WKmT?=
 =?us-ascii?Q?47SVxslAbpmHIgMjr9jJhvESYlS7ChNyvDfSL432fNTb4g7mi02KMB2Ii8CZ?=
 =?us-ascii?Q?hfTdiJk0qcm9zOdGoB+Aiqa56KopvITnTGMaodWHH8GtIp8eWlvF8vAU+Ois?=
 =?us-ascii?Q?8TXQaDSYPkqwX5K3KrSvm0XvP/VN0ZzyNW3k3lr04xTdM66/tmRrqFs/APmt?=
 =?us-ascii?Q?ZrkQP1Rz4ljhkX3D7gHGiH5wyu5U5p6iYAZrfsRw6iG8ZiJBG7ZebIpyRV1A?=
 =?us-ascii?Q?O1zzd+CmosVgEI6fBxzuTjxCzxT2e7bw316P5eMU+ilrCFsQQL/YaR8my2K8?=
 =?us-ascii?Q?GxH6QHBKGKtYWfsHVJEIuEtrQCSQ16RvgPhU8jihS8jgZty4S2GdChgL7jj/?=
 =?us-ascii?Q?aiyyza9DULMcnXmsTPwiVZP/7DHmQp+Mcl30oi2q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f07355-131e-4776-9861-08dbcf47c41a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 19:32:14.4766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0v4F4bwdS9kq5goU1x9S4rcoeIadioJ5I7KWLaKqNBMdCdmyXGS810YDaLcq0lq8l7gJRROKN4qMwSgLSr43Sw==
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

ls1021a add suspend/resume support.

Implement callback ls1021a_pcie_send_turnoff_msg(), which write scfg's
SCFG_PEXPMWRCR to issue PME_Turn_off message.

Implement ls1021a_pcie_exit_from_l2() to let controller exit L2 state.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v2 to v3
    - update according to mani's feedback
    change from v1 to v2
    - change subject 'a' to 'A'

 drivers/pci/controller/dwc/pci-layerscape.c | 86 ++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index aea89926bcc4f..6f47cfe146c44 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -35,11 +35,21 @@
 #define PF_MCR_PTOMR		BIT(0)
 #define PF_MCR_EXL2S		BIT(1)
 
+/* LS1021A PEXn PM Write Control Register */
+#define SCFG_PEXPMWRCR(idx)	(0x5c + (idx) * 0x64)
+#define PMXMTTURNOFF		BIT(31)
+#define SCFG_PEXSFTRSTCR	0x190
+#define PEXSR(idx)		BIT(idx)
+
 #define PCIE_IATU_NUM		6
 
+#define LS_PCIE_DRV_SCFG	BIT(0)
+
 struct ls_pcie_drvdata {
 	const u32 pf_off;
+	const struct dw_pcie_host_ops *ops;
 	int (*exit_from_l2)(struct dw_pcie_rp *pp);
+	int flags;
 	bool pm_support;
 };
 
@@ -47,6 +57,8 @@ struct ls_pcie {
 	struct dw_pcie *pci;
 	const struct ls_pcie_drvdata *drvdata;
 	void __iomem *pf_base;
+	struct regmap *scfg;
+	int index;
 	bool big_endian;
 };
 
@@ -171,13 +183,65 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	u32 val;
+
+	/* Send PME_Turn_Off message */
+	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
+	val |= PMXMTTURNOFF;
+	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
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
+	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
+	val &= ~PMXMTTURNOFF;
+	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
+}
+
+static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	u32 val;
+
+	/* Only way exit from l2 is that do software reset */
+	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
+	val |= PEXSR(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
+
+	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
+	val &= ~PEXSR(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
+
+	return 0;
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
+	.ops = &ls1021a_pcie_host_ops,
+	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
+	.flags = LS_PCIE_DRV_SCFG,
 };
 
 static const struct ls_pcie_drvdata layerscape_drvdata = {
@@ -205,6 +269,8 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	struct dw_pcie *pci;
 	struct ls_pcie *pcie;
 	struct resource *dbi_base;
+	u32 index[2];
+	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -220,6 +286,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pci->pp.ops = &ls_pcie_host_ops;
 
 	pcie->pci = pci;
+	pci->pp.ops = pcie->drvdata->ops ? pcie->drvdata->ops : &ls_pcie_host_ops;
 
 	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
 	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
@@ -230,6 +297,23 @@ static int ls_pcie_probe(struct platform_device *pdev)
 
 	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
 
+	if (pcie->drvdata->flags & LS_PCIE_DRV_SCFG) {
+
+		pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
+		if (IS_ERR(pcie->scfg)) {
+			dev_err(dev, "No syscfg phandle specified\n");
+			return PTR_ERR(pcie->scfg);
+		}
+
+		ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
+		if (ret) {
+			pcie->scfg = NULL;
+			return ret;
+		}
+
+		pcie->index = index[1];
+	}
+
 	if (!ls_pcie_is_bridge(pcie))
 		return -ENODEV;
 
-- 
2.34.1

