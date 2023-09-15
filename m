Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B5F7A267A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 20:46:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=niQbs9gx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnNSZ6cFbz3dKP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 04:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=niQbs9gx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7d00::628; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnNPn1lWDz3cHH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 04:43:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGHFUePS8t/3S0CE6B0Pq+pUHXBNZPTO9Io6yTtVo1FvCwdvOF3w8iFW6oyGlsEX4Q/596QlKIjiJ9XLQYwPZZw37D9OjqCQ1IIYzPvgNo0gE6OI8ESMx29WMe/oQlvO5n9PqhZwPXRo5HRNzvmeASEEaWgPtzD9ZrBwzyGYQShfJMsVdgaHqmQoIBacn8tSxL9Trwg8Euv2BXoK86AmTzihR7z36dNdoe824lK27FZynWuyNcVeSkmxs9fOeVu9tqd5k20K8yvol6H1CLbOZaNlgII64ewgP4U2872CBGpJKAB+r+tI9sVGAP60FD0rBpKSeCHwLg3XOW6dvL32Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOAmxkk1FLpr83vxYch5SYzBkOWvzUHP+VAG6W4Homw=;
 b=KwR0jU8yWQCNppinBFjNgM5ODu0hhUKZadRGRJLwZCslkbEpRsXUp7PQKmebdnshihqE3iBngfu+NrPRSQVvTOOsrLQUJg6BLXUGt9A55szb8gMaxMrssSTgbO3QtkPIPgVgrT5giwBWOdxLD8p5sIAQMO5NE9pQBqbvwc+UGgeRrxvNEen1eJBpVAfIO+I3y9AeGBYXta8Y7z1jRX19K5FRgTMEDKwy+JRTFNoT8pZTJ4at/OyYV+xFYQ7e30sav820EaiDvxWXWNoXuKDycZv4Ahwee3HFB9HHT8KnP53wsw4kOaQwQmXl4pbPRwl/Eao+m4ngIgk/9J2hujG/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOAmxkk1FLpr83vxYch5SYzBkOWvzUHP+VAG6W4Homw=;
 b=niQbs9gxA/f+4yw++Ux/+i3keVoGIU7j5Fou+C6EBuFbBFgjcb317RFrpxnYiank0mm8Qm2tys8+8MAgSt7Ea3GKRMdfo689BsEnBQO99t8dAJ2Il/1iFy1ek0d7Urmt02Ks4Ub/LCwjKFVrZVb8FZpznQ42KtEUtgF5I+Lu/Mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by GV1PR04MB9184.eurprd04.prod.outlook.com (2603:10a6:150:28::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 18:43:34 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::aa90:117d:c1d0:346a]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::aa90:117d:c1d0:346a%3]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 18:43:34 +0000
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
Subject: [PATCH 3/3] PCI: layerscape: add suspend/resume for ls1043a
Date: Fri, 15 Sep 2023 14:43:06 -0400
Message-Id: <20230915184306.2374670-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915184306.2374670-1-Frank.Li@nxp.com>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::11) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|GV1PR04MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5964a72b-a75b-4a12-bcc9-08dbb61baa51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	i9s4GNz6l4Lk12jFDBu8d1S8PBMt0cLW/EFpOHnhzDrfH2KRea4rd3UhVPrwf3TxsNffgB1FO5JVRyndoE7VgE7JjAVvwa0MWFvbVJwDOeQ/O7iGMpmG3A/BN6sQChsQVTQJm+HouWMFsZIKYe7XLrwvN+g8L8QmieYroauRT2yZgqtg6OtcxY7E0XCP+ny92r1ijTwFLhRQKJvzzZOutIjblmuZcFnCVvka2c5DIhGFBuBXv7ySCAqP3xlopSoBSmhG15TxvmjR3H1qNjpllRehulHbtzSDyIdeKKqTSBiNQKwKz/QUAx2lZTuacLLqfL+omp+WcCidwLg+FUx357g//gKIEpQYnytBjO7mpRsPqFnEy9qTgYLQCoLbGq416FJ7a00Rd7bTft/3DYUJc8uBm2Bi1M7IqmLmfbvhGyz8m1wztZ32Lrdf3BfnU1WI2m2oMYXXdNsJ/5ZTKU3dn62xHYdLNiNGX/h49Pj0RQBtiSFTh8CF/32V32Pxwdlau+D0we6cuxiDag7oVv2uyd8sRzDg5Eu4bAY1j48LK34n7sjdC9bjcgUqF9Ik3rTqGTmWI8kn5C3lTs46RdnckJ/gduo8psmBnzNsIjjKkD6M+YpEWiKZsYZEABCzac+wjTE7u+cSUoPNGR7Q+KHV0g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199024)(1800799009)(186009)(15650500001)(478600001)(6512007)(6506007)(6486002)(6666004)(52116002)(2906002)(4326008)(86362001)(8676002)(5660300002)(8936002)(41300700001)(316002)(110136005)(66476007)(66946007)(66556008)(38350700002)(1076003)(2616005)(26005)(921005)(36756003)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?VCT5wDmLrdnSBPYkhO5FPKNzyOBOHfu9tWKJLfrgl/aHFdYCAkoGDlGFF7bH?=
 =?us-ascii?Q?J0njq0rZMOwCyTucnSJkxMQ706TXqC6zsku2dJN0K5wRDNef5Y7JwLOnZnOz?=
 =?us-ascii?Q?36Gf0ZX1lfkalOik5ieTXnVzvT8ew0gGZG1QShhz80naivoxayikuXYah6rG?=
 =?us-ascii?Q?WmiT47FBK+US1xZQbiArhKlm2TDbqSc8LKdLDbHPAnRppH8PmHOJYuGtxb/l?=
 =?us-ascii?Q?lT/ZYGcMqRiG9lIZLSSQucyNGn0Xq67D7aJ+pBva+JoeJR33hWw+mUpz3x8H?=
 =?us-ascii?Q?y6VfgT1g12ae77ik29etPTaGWQvcFV8zpk+4CGWc9mgC0OeMgcdPBjC1szMP?=
 =?us-ascii?Q?SKy2hPba8baXiJZ1wIXI7MIggbOfOajI+H5FtD6esxZmUgxZqqNgKk7tzaH/?=
 =?us-ascii?Q?vfDg8nLxfzrgc+BmvcFtN2XeWFYT5hw2VzE3JEM8t6k2wif4SETPhht4qehC?=
 =?us-ascii?Q?9J39vvtyLy32D2Rgyqo3d+hjzTAKcKTT6wPRzaSefgNatGWRgVqvIAnWYbgq?=
 =?us-ascii?Q?4EQplQsP7Sktun/drra21P8MLkp3y0f1X8OZ10MtSK581j0QhfE57+PN1Va0?=
 =?us-ascii?Q?YLElQLwZeZfkxE3eEiZEh/XuXHk20fWqoFSwKFWJMBjKc1y9NzhG0T6eKnGr?=
 =?us-ascii?Q?oA2ejR9ENqHuz5KWPWSD9FGQFOVU/SjCdACgYog92THbSw4zOXOd5JT7Aj9c?=
 =?us-ascii?Q?REMW/2m8rXuC2/QOFSvELccbWGxKne94g28iamyyKTKV6syhPOYWCXdMyrg9?=
 =?us-ascii?Q?MyCMQgF3TECL1nApJVa+DzSVUOFcAk4YTDXqEt0NCEPeWaO3lUro6e8JbTD7?=
 =?us-ascii?Q?/+9ZA3aq/5fUJPf/WqAgPqsTmJARcIOrQHd3eRTINAzu6LRFsRCA2l/rzeHr?=
 =?us-ascii?Q?78DWVQNRyhRTjn0A7NIdxB6ZGeH5uSEsBlrFCYtddGuKcZN6+KQ7bvJp7iX4?=
 =?us-ascii?Q?ZlR31r/qKlm/+ZqpsZ/IVnK/RprdPQzeG6La2WBKS1KtwUBRgfkXipgVETGU?=
 =?us-ascii?Q?Y2nH2UiBmFtsFGMiHkyCr3JHlDUemTB3yoGI9MGsGR0KYSTqoL3/jGVtiAxR?=
 =?us-ascii?Q?lSgpz2lkJi4Em/CNXYDz/wYWyQDT/2uyf/FPXFFisCZcaS2umXJl5JxL19t6?=
 =?us-ascii?Q?1KAa19mb0mCs++NOXansO3IMn1uXH9IKgbeUTIetu5nHT+9sHku/g3y6G+FH?=
 =?us-ascii?Q?nXWK4RcKjIm5QBeXeNIhd/87fEjyttLM3cVueCL/FzryaZqhrVarIBp5o1TO?=
 =?us-ascii?Q?6rRHgHFa4IDcc4XO2DFU0cim9Nbt5tlKi/2E0U3YI+CAKwhE7vw/XxiYglOC?=
 =?us-ascii?Q?77YnXt3BQ/x22p6Ak6Wqf5zBqHLxrArcpG+8VHcKrb+OYGGi0vlayY/2eXw2?=
 =?us-ascii?Q?byzP3Nv3MdIEFCArhTxb+HlMyjjz2bzsLEtlHhEqw1ub7t093U4FAfSImGVw?=
 =?us-ascii?Q?9XCKnu0Oe/C8p3J2eaQGX/4I72ECe9N2fsEVS6If1cIzCMYSyCzphmqBt6r7?=
 =?us-ascii?Q?vgBKqPY5L3VQfDpt8YEAc5uicvPfYR6YIzzibq2VGF9aks+GBMXEcGzRwkhq?=
 =?us-ascii?Q?E5Y9GgJL0qcfVfiuUgbRSnI6eZ64+wQjoaYuQItj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5964a72b-a75b-4a12-bcc9-08dbb61baa51
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 18:43:34.2398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTlLAEQjFlNkqHkgpiuyANJd9Q2Xgv+NpOCXhjXX13RU6uJkm8ym2xy6WFphAO9ze8jVD+TwE7OgptqQNfRDLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9184
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

ls1043a add suspend/resume support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-layerscape.c | 91 ++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index bc5a8ff1a26ce..debabb9bb41f4 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -41,10 +41,20 @@
 #define SCFG_PEXSFTRSTCR	0x190
 #define PEXSR(idx)		BIT(idx)
 
+/* LS1043A PEX PME control register */
+#define SCFG_PEXPMECR		0x144
+#define PEXPME(idx)		BIT(31 - (idx) * 4)
+
+/* LS1043A PEX LUT debug register */
+#define LS_PCIE_LDBG	0x7fc
+#define LDBG_SR		BIT(30)
+#define LDBG_WE		BIT(31)
+
 #define PCIE_IATU_NUM		6
 
 struct ls_pcie_drvdata {
 	const u32 pf_off;
+	const u32 lut_off;
 	const struct dw_pcie_host_ops *ops;
 	void (*exit_from_l2)(struct dw_pcie_rp *pp);
 	bool pm_support;
@@ -54,6 +64,7 @@ struct ls_pcie {
 	struct dw_pcie *pci;
 	const struct ls_pcie_drvdata *drvdata;
 	void __iomem *pf_base;
+	void __iomem *lut_base;
 	struct regmap *scfg;
 	int index;
 	bool big_endian;
@@ -116,6 +127,23 @@ static void ls_pcie_pf_writel(struct ls_pcie *pcie, u32 off, u32 val)
 		iowrite32(val, pcie->pf_base + off);
 }
 
+static u32 ls_pcie_lut_readl(struct ls_pcie *pcie, u32 off)
+{
+	if (pcie->big_endian)
+		return ioread32be(pcie->lut_base + off);
+
+	return ioread32(pcie->lut_base + off);
+}
+
+static void ls_pcie_lut_writel(struct ls_pcie *pcie, u32 off, u32 val)
+{
+	if (pcie->big_endian)
+		iowrite32be(val, pcie->lut_base + off);
+	else
+		iowrite32(val, pcie->lut_base + off);
+}
+
+
 static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -249,6 +277,54 @@ static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
 	return ret;
 }
 
+static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	u32 val;
+
+	if (!pcie->scfg) {
+		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
+		return;
+	}
+
+	/* Send Turn_off message */
+	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);
+	val |= PEXPME(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
+
+	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */
+	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
+
+	/* Clear Turn_off message */
+	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);
+	val &= ~PEXPME(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
+}
+
+static void ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	u32 val;
+
+	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
+	val |= LDBG_WE;
+	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
+	val |= LDBG_SR;
+	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
+	val &= ~LDBG_SR;
+	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
+	val &= ~LDBG_WE;
+	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
+}
+
 static const struct dw_pcie_host_ops ls_pcie_host_ops = {
 	.host_init = ls_pcie_host_init,
 	.pme_turn_off = ls_pcie_send_turnoff_msg,
@@ -265,6 +341,18 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
 };
 
+static const struct dw_pcie_host_ops ls1043a_pcie_host_ops = {
+	.host_init = ls1021a_pcie_host_init, /* the same as ls1021 */
+	.pme_turn_off = ls1043a_pcie_send_turnoff_msg,
+};
+
+static const struct ls_pcie_drvdata ls1043a_drvdata = {
+	.lut_off = 0x10000,
+	.pm_support = true,
+	.ops = &ls1043a_pcie_host_ops,
+	.exit_from_l2 = ls1043a_pcie_exit_from_l2,
+};
+
 static const struct ls_pcie_drvdata layerscape_drvdata = {
 	.pf_off = 0xc0000,
 	.pm_support = true,
@@ -275,7 +363,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
 	{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
 	{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
-	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1021a_drvdata },
+	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
 	{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
@@ -314,6 +402,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
 
 	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
+	pcie->lut_base = pci->dbi_base + pcie->drvdata->lut_off;
 
 	if (!ls_pcie_is_bridge(pcie))
 		return -ENODEV;
-- 
2.34.1

