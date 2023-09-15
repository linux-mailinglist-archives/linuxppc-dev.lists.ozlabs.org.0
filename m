Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB86B7A2675
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 20:45:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ALrIEt9K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnNRd4zXPz3dJb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 04:45:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ALrIEt9K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7d00::628; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnNPm4B1pz3cHH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 04:43:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3d1O0IDAWUNQJ2OQPySRbbZoNnVu4WSD/jUYqbiDT2/ZtO6fMRCv1WbYY/8VSo0jtCv89kwh27Q+cS/+bMgZDd11C/1bgakheZqeunJkWB/JF8EZ9vssgRSYgbN8SRxscupHr6V3cb7BRITAFDnBo/GEX+AGshxUQSoT3rhdWSeUQDKBiAeh9Xv08/faVO5uBQcU1NpDTdcMl6wspBjcJgymNJjcWBw9W+0/zubfamRcLjB8ENytsR6KrehUfLo89leBuPAkL3yxadIY7IXCvZtPdwwLcNNr0ul/8GhQTTWHSntHLLNu8GmMnLAsdIHVHe32fbHImSsPD/wYSZmkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QumOeoWtlkpcZNKxeTPO0UIw55ZdtSB9pWNTJIivito=;
 b=kgS3vsJM6pLd28hpoJSV7PwpDRs/7WBYNq/hAhJr7uRWgJrlpQsXbmatt8i5UPd//nLg7R0Bq/EVQ2qavShb5lvX4AnISZbxDFD8RBsuugQki8cMo8OGGdtK4MqPSmTmLHPEqgoOTHBnvp/iXoxRJMHqhH/xWaoGCIiRCurQZVj+5X3tRDjChcOPKyEYuxaawq9zJxVgzU0Z1J0Vby3U4YUbc7kgbxoqcnlzomnT7CEuqPH9FdGqtZh+OQSyBhe03glGc76TgvbJuNn1+DU/mCx3ZKtIVZMEwOLA7IyXtwFaVk1NeH8ySWCAF0kUMSsAW8cNgTVj1mqr6g55zl/7ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QumOeoWtlkpcZNKxeTPO0UIw55ZdtSB9pWNTJIivito=;
 b=ALrIEt9KSRnXqd2Y1Zi+/7H7SFZbqnYiJWIdEu25FLtczfCX3h8K4hnYvAm07wP/Tvins63LZLjh3wWkTAnvNkJnadKil248RC8pP9zq2CSFA3iIYa9XrxJvkrhyu7ZAyg9/SKtOsFYyTyKrAIpVwoXDYyRbVpH7cW3ct91lKdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by GV1PR04MB9184.eurprd04.prod.outlook.com (2603:10a6:150:28::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 18:43:31 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::aa90:117d:c1d0:346a]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::aa90:117d:c1d0:346a%3]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 18:43:31 +0000
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
Subject: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Date: Fri, 15 Sep 2023 14:43:05 -0400
Message-Id: <20230915184306.2374670-2-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2c5d930a-77dd-49d9-536e-08dbb61ba858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rCK2+podRajhIiRYJTdg4kmq0lGIbMEtqx8Uf7LWqRXch9GO4EPvmz9LF9bXVSdaYuk2YjApTjSuxHYDnx8QTFTgiBrAPflgfrdZv17H9MkpsitRw/C5f2nZHsEdBIF5qxwpCA9dlhgiK3kgvjBXUjXDnsNxI8q+F63FFR4OAhHjG0XDkgEQBfCZXprfyqyXI7l/1AUZQUagdrLQM/5wu/UURDCXDra2wQ4f9qoWx5zi1BA9f3uuUY9S6vAglQRTBik4W3O/r3Wov6K1sCFzeb5wad87aLDQ2e+jfuK/WKNB8W1Ansf5In3tiM1zWwrwBJMHz/Di/K/D0+AdkxNRlsuYUQ4QI0hDWFFzMQSptzZae9xCLfpjCkJh5guD3CeVZwPOSO5pPVDcNjTq8B9YpsKm/RdqeEogWcd4bG+xz3TCsB0Sq2vE2h7QyrnTacbxaBcrV13lqmSngNNYOmhGclpU8elpXRk02Yq+GYJlqKyZCdEYV3kWbwDO7QHAmXJH0S6sAm6VDNYFEWBSYGLZBlPixl6s7rtdFxPXs0/NuBXnkemD5I/e4KQqFsTDsFGDMlnm1u9suNXLT4xcYEhqqhAz0eyQkBqeq1VXK7CRWMQbt3toTzlwcHSzptkrRJhPQA0dtGivmWheNck+F8+Q1w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199024)(1800799009)(186009)(15650500001)(478600001)(6512007)(6506007)(6486002)(6666004)(52116002)(2906002)(4326008)(86362001)(8676002)(5660300002)(8936002)(41300700001)(316002)(110136005)(66476007)(66946007)(66556008)(38350700002)(1076003)(2616005)(26005)(921005)(36756003)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?d5T25l3cmeODg2lNlVqkQXnmQTEWajP6BO9fGNnHG0a5Wi6UKzPcuXKDIXm1?=
 =?us-ascii?Q?LTrid8mLK3oIlsHFZCESaEyClz0ApOu8UGLENllVMkuanMSe6r3/vw6eIjJK?=
 =?us-ascii?Q?7y40AhIS5TBLj3M9vHgJbrE2sisUfZi7q+Dqt4+UhqCCJSfj+p90iiFjsaA9?=
 =?us-ascii?Q?oFoYAlk5/x46En1sJfWdup65pAbKD/UsznJzgibS8O47bFFpeD6STjpep/iR?=
 =?us-ascii?Q?gvWc7a7/rmavtieRNYzjZWCBaIKfzlfEPTFC08vW2PvXwfYPgMKZOET/1KmN?=
 =?us-ascii?Q?OpTP6Evc+e0+9Ac3Xtj5uPXd0e7KR6yXTJo0LLWDc8H/pOT1DZ5Itzw/0yAI?=
 =?us-ascii?Q?b8EzfcyAntIid246h/49LsmeUcFzjD/7gaiWT+wKhC9/vSf4iPdEZ4k+y1EG?=
 =?us-ascii?Q?fBgAixEQjtKTalXDVtZ0coxp0cJgnOZaDZ011Opi10/NqC1vYM587bPKeXxD?=
 =?us-ascii?Q?CBXNUzm5KVuOAFLYLpoepsuhzOIZC1wbJcgbvBW++30uues/YZmnS03ZKApB?=
 =?us-ascii?Q?LaWx+chKgIPYm2d7xvdwH6ZQbw3DH8zQfi1PB0TT9fFgLFfBWS6QYR+aa20c?=
 =?us-ascii?Q?4kxQoysyuvNGtLXqZUudF3CgjRe+Fo30EzQx8zs494zespQRtLFZ2hz6vs+/?=
 =?us-ascii?Q?NzLP21AJD7NyfKNEZh9myL3nRHdbzQ70B1T0ScDA9tjGlniPxJ0bzKRyc+5O?=
 =?us-ascii?Q?SSYChewb7Q9SfGS9ftKdednbXmUad8yG3mTeUGXIYu9rfLKdlTXHxM6YQMPB?=
 =?us-ascii?Q?T76COXQadiaaajkZxvODNBVNEWGKK7DuIrRhQjR69vCB4bbqjJqeYM9iF0zK?=
 =?us-ascii?Q?hKPAW+cDNM6sD0aVk3ro6ChAffLjbvMJqB+HohpfZeneGqdQbvFBtY7lP7hh?=
 =?us-ascii?Q?hLpQ1wbo1VRYycOfKjY0NJWOvq79zfrgrTDqH6MQDMDyrro1tCO7NLUhzB+7?=
 =?us-ascii?Q?nrfbpLm3pgk4tY88Im/KMSM1DGEjkOURjLOQjWpSWbwM39ECokRiNW8YsV+P?=
 =?us-ascii?Q?o5NaKPNCWO1nm6vfKApjR6leKm+dW1ZUHes6yiCRaOxeqPjCkgJmPRJjLR5Z?=
 =?us-ascii?Q?aBG7B/9TMI0VPpaQsvxP4g9rdgVAfgenK8Ox/LHMNFkW/mPzO7dyeX7rHxSq?=
 =?us-ascii?Q?+0JoGtyDcbzTpUMn4KYCLSm1OQEQAudkKkCOxfF21QWUV6fpvK/mzgdnvR9Q?=
 =?us-ascii?Q?SNaKmuJUU6JO7hXeGFOfVsgdvbD35AjRqrBzygnLeuLWd6cyVZSpYL1Fap+Z?=
 =?us-ascii?Q?m6sAvilCfEw3cGr5KL/0pNz1INI/qlGfn7GYnUL3AuWlaXwXDZ9FuF3lRGlF?=
 =?us-ascii?Q?S11HTVV3gCoj8D8Y+3l1kwo42wiHUYE593inOfgc2j2TxY8EJFMSk34ai6Tt?=
 =?us-ascii?Q?WG0LE8HAUk6lPTz2KXommA1OE6bJXnRNZNswQW9nwf/5j25Wgv4QBWRqECrc?=
 =?us-ascii?Q?MR4m2k/klAuG306hlb9vxhOuxY+J1r24NTJL8o1QsLyxla2p4stFP5IoClZL?=
 =?us-ascii?Q?2GehgLTako9vy7iTgc71zvdrFsbgdTc1WAySR9EbRTITaYOwpkFGiBWUw/0K?=
 =?us-ascii?Q?RmkFHmJzo0juttDIphelhmMFoEYVvdW65sYxybTI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5d930a-77dd-49d9-536e-08dbb61ba858
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 18:43:30.9410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDx5pDnr2ez4W/2qaphZj1s47pcAYcIq8PsZFdzxQvxcsET9jOK6nUJubrYzVozaWqeizdIxrXv7OWkZHUP3hQ==
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

ls1021a add suspend/resume support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-layerscape.c | 88 ++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 20c48c06e2248..bc5a8ff1a26ce 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -35,6 +35,12 @@
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
@@ -48,6 +54,8 @@ struct ls_pcie {
 	struct dw_pcie *pci;
 	const struct ls_pcie_drvdata *drvdata;
 	void __iomem *pf_base;
+	struct regmap *scfg;
+	int index;
 	bool big_endian;
 };
 
@@ -170,13 +178,91 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
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
+	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
+	val |= PMXMTTURNOFF;
+	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
+
+	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */
+	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
+
+	/* Clear Turn_off message */
+	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
+	val &= ~PMXMTTURNOFF;
+	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
+}
+
+static void ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	u32 val;
+
+	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
+	val |= PEXSR(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
+
+	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
+	val &= ~PEXSR(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
+}
+
+static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	struct device *dev = pcie->pci->dev;
+	u32 index[2];
+	int ret;
+
+	ret = ls_pcie_host_init(pp);
+	if (ret)
+		return ret;
+
+	pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
+	if (IS_ERR(pcie->scfg)) {
+		ret = PTR_ERR(pcie->scfg);
+		dev_err(dev, "No syscfg phandle specified\n");
+		pcie->scfg = NULL;
+		return ret;
+	}
+
+	ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
+	if (ret) {
+		pcie->scfg = NULL;
+		return ret;
+	}
+
+	pcie->index = index[1];
+
+	return ret;
+}
+
 static const struct dw_pcie_host_ops ls_pcie_host_ops = {
 	.host_init = ls_pcie_host_init,
 	.pme_turn_off = ls_pcie_send_turnoff_msg,
 };
 
+static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
+	.host_init = ls1021a_pcie_host_init,
+	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
+};
+
 static const struct ls_pcie_drvdata ls1021a_drvdata = {
-	.pm_support = false,
+	.pm_support = true,
+	.ops = &ls1021a_pcie_host_ops,
+	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
 };
 
 static const struct ls_pcie_drvdata layerscape_drvdata = {
-- 
2.34.1

