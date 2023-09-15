Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465347A266F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 20:44:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=PmPzzvK/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnNQg0h9Hz3cnH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 04:44:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=PmPzzvK/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7d00::628; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnNPl0r20z3cHH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 04:43:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gbj9NZ+KUU0uJAbCeuBkPgjWdmM+j5v8imj4YTJSp89jMtHpljv5jiINy3uESQzRBfBpZP8Z9k+pAuYHjDQ6KpNfmMATtJ/C202yU06B4t7VLyKJ/6Ud1j5HnxKaczz1D/xIa/QGkaNptD/FTk4FhtB8crJCSFfz8o1Z+elPvfU3J6Vn0qp4vu/GupUTRKoggkmowB65QuWGVxQy0AeFTplmwtHqcUtxgj8nd3+dkFc3gvI1mDWUQwxrAUSVwV5LgfIcCjimhBqbWWsCYi4tB3XfiFNbLy/DkTgRZtUA9aweIXSz3YgJ0SokE7gC2STPdhEv7X7fSMyGGh8wKfSAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa0JrSzrIWObI+M3MwG4/GbDzXhyXZdAEdLKKyybH2Q=;
 b=VUQFnWmVHASVylRMMUuQAEF4KLLo+hUgGt3usDvlI3Z8RouynkzM9+jSQ4EjzSvOKCm5KnZccUtjsRE3EE2cuwBo8LVIzOvd4sVjoIIKNQfs0qEa0xlBWHMfO2qxPZw9Ux6Wf9XuqFDmBfanWutOGpZfFJzB5qDVFcdRM9dPpbKky+xr8WdswB7n24w6Qp15RJx1Yaqca6PI7ccLM1qRQA/8cD0fxXKGp1vnB2zL3wVYGoKe2gDOjtJY263dRrcNDQykJFmXgsCDc3jTaYaWs1NRcTGgc8jq/36riUtCF1+57DJ8Z+hmDiZ+GuuiefsyqRg/pU45qKNM3Ct2HjZmSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa0JrSzrIWObI+M3MwG4/GbDzXhyXZdAEdLKKyybH2Q=;
 b=PmPzzvK/p5Uh/xliv24cjTM87dU378bz7bnPkhaWWpAOrwwcpZpScyS0DhbBR/sRMTaTPSi/xUmCmfvObf7LEvLBkFxn43V3bv2A8e51pH9UEj7INBtPSfggM1YBFMTEpOBgGhI65TSIn9PPusAmcH7ZBrY/nERq7i8cmZjswAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by GV1PR04MB9184.eurprd04.prod.outlook.com (2603:10a6:150:28::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 18:43:28 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::aa90:117d:c1d0:346a]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::aa90:117d:c1d0:346a%3]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 18:43:27 +0000
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
Subject: [PATCH 1/3] PCI: layerscape: add function pointer for exit_from_l2()
Date: Fri, 15 Sep 2023 14:43:04 -0400
Message-Id: <20230915184306.2374670-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::11) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|GV1PR04MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: d87edcb0-45e6-48d9-c32f-08dbb61ba657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xQJgz11ms0ET0a/a5/+B21+ko6ahYCMjdpO6k9+CjPwYG1F4RMx0b+IdYIx7ewKlY8eBjihH+84E5TyAmDmZlHQ1xgF6ii2/KPKBrf3BVzvJpAmfJePOwxh+tnTH2ArBCW2trZBU8YRNGn8B6VdLfZxayGYboK/OG/2WTf6LWJJ7NIcO751dPbS7Mblaw6AWTYx4KaH/vKCIyQWkmOc/W/fceHNtCLYXqCFZvjTYJL5BIG1ETiCnX5nqZzoeY4WSVSNNG5WBJYcZHpPgCH0riBpE/PScYkD1fEiJ6qeRUYSrAfCp+TzIv1v7VCKvQ7EvfJw4STk5FrNtVwibmLS0m4yQ3YQvUcgKiP/1HMGBcJWEcL2iv/mBOJVxyH9BYuh6EEwgPI8U5Jw15p6Um4YCk7R0GPDBjFnpuDtgwskMQh+Xfuu+FcUzHbn98NjaOc930tob79OkekFTZ/MLIRD490CizKBP90tsn2+N7spi8u0n/IkjeZ4L9Ld+KoKbUvZaJ+DzX/Fd3jPubDLHyno/YPvEw6uP30lZ86bJQG4jqu0MlzMRS4t29DKBgRgtC0tyFEMiOAKtkyDbPXEYSeGbYOiNNReWQ1da9dSFxMJlg6i5w1qTRWWJ8Zrh4U76irEpeFxTNSrBg8VKnAS0Gzrd6Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199024)(1800799009)(186009)(478600001)(6512007)(6506007)(6486002)(6666004)(52116002)(2906002)(4326008)(86362001)(8676002)(5660300002)(8936002)(41300700001)(316002)(110136005)(66476007)(66946007)(66556008)(38350700002)(1076003)(2616005)(26005)(921005)(36756003)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?zqxivQnPFaQ6+A2jiF0kKNL7NpgqRKPsbr/YDXPCD0UmRTP/J46Zt9DtOdaq?=
 =?us-ascii?Q?yUNj4k7xBBKMjie0isGbgmI28V+pWD5dvDFyRvSZSrswNcfP9lhEd5BUicJQ?=
 =?us-ascii?Q?7XQO+pp7EamoR1LO928lvVAYqA+LYY2OHg02VNn3aGOSMRU6Hx3OqtLiDTeD?=
 =?us-ascii?Q?9My3UpSEpyebWwatj2nf2T+uYKBfiNrwCOIMmKw/qBlX+BlepaSnq6bOILJI?=
 =?us-ascii?Q?Zphp75eOV8e21OLNF6vEEIH5nAVt3+LNykVBSSs2uTRxC/fxbtr6Q+3qeBLV?=
 =?us-ascii?Q?6jmY72UbOWzGQb8BCD1qNqNuEWR58cqy/rJqR65kqiN3mvRi9zGP6q72cuIC?=
 =?us-ascii?Q?dPEs1hO/a9RYiIeaG4gXNHwfhgnHZNIOozuc6frbWZm/CXtYo/5K45gaujKb?=
 =?us-ascii?Q?CoLkzbBJTxzEdMtVAh8mwLlNZQt5K4S5V3D3pJJoq+YHU4NRrUvqoyw29VLe?=
 =?us-ascii?Q?ogK7gdz0hjlynp7YXWUlFNQLUnU9xmKpJlVzKolJrPAMfgQu8M6IfNX4XyD3?=
 =?us-ascii?Q?5GlGkCGGJ3locK6diKizgN/pAnSniOTeo+KWfy0nYGM3SZy2yGkoYwzHvYOP?=
 =?us-ascii?Q?ueVukBW0+abjPcXqsdr5KvD6OnxJLz6UU+2ZQj03XM/oe8LmgbdwkXPo4o3W?=
 =?us-ascii?Q?dk1l3cQ2PCyV9TZmXfhtiA5s5mebpoX9p0XTTcs6aPJctp53gN56FbvZETqZ?=
 =?us-ascii?Q?n+h0HmOpPQKPCirTqdafEwtejoWKabP5SSBSM3D9PDpECz7Kiq7y58UZx7ym?=
 =?us-ascii?Q?U/cycbzabhLvtUWxH2AEY71U2Ms68vMgWRYmfTG9iueaLfOyma7yaTSN+9aE?=
 =?us-ascii?Q?IVVuNYtjgssHpr8Rt8CcOm9HKziH9mOGRAg0uQ5PBPCSzTxz+miacfGycad4?=
 =?us-ascii?Q?5UMwjoFI8T4elQv1/3Eq8jwS3XLmg1b8Yl6GOTOw2i7Wj3MdHzIcEfrYLQ8G?=
 =?us-ascii?Q?2XqOGtDZkpdqTqY3AyTAQoTZt69kQxY/LqdmRnjje3bUxVVhuGRRgNTKZe9/?=
 =?us-ascii?Q?ngzoc/ZvRO/NSwMjPkASWyLZJnaQiFlZrZPZzAmFGnyxpVe1DRkhU06TwXL7?=
 =?us-ascii?Q?0kYaV3qzC3mPR558G1SE318+a/PHZsa1EwWMNM/4+M5pAPTrHT8VKygtp4Sh?=
 =?us-ascii?Q?kBaHIinlR3YW3lNR32xQQ3rmbnoflCoPLy/Ah0WESzkiDynAv1Ybs0VX5gbB?=
 =?us-ascii?Q?xo/t3jSnODbHyH/+w36+14Ol35OLAJXHypiNmB1jSaot9TUTauvMD8MecEas?=
 =?us-ascii?Q?xwmbvmkIB4NvdXsZVuksHA7TiVlKRNhxHC02LKYaqlTEY1uqdVGXxFlwLMvc?=
 =?us-ascii?Q?uxe+28GcYHMPE6WIpTt3Hp3FYyC8rL5b//7eHaD/iBpdbIp0mKEkiyGjL1/U?=
 =?us-ascii?Q?V+qEarBnDIUnXZDZHbonVt99OzDLFgeO+hty/3FifkeLJmax0ePug+neekRF?=
 =?us-ascii?Q?PB8L6NDw7gTRB8lIiC8PhhKtmbtZL4lyBJTDKHFcSo7aNY+KOgiuExo2O7pB?=
 =?us-ascii?Q?/iK1Uu0rwgptdXRSJoSHrGZ9+9zsDEAlAcGewEeoTZaNsY+iyKA4wn+1vKne?=
 =?us-ascii?Q?5Bz8zh95ppR13Cws3glrmovcoPvGVYNNXKSn30AD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87edcb0-45e6-48d9-c32f-08dbb61ba657
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 18:43:27.6351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpogN6G/T+EQPwiVETH42g+cXHPXNssHdf9FBZPr37tEU0D/Sqk6HMhMY8vQC9u2uf68nS2zGK9R6/IcUjWjWA==
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

Difference layerscape chip have not difference exit_from_l2() method.
Using function pointer for ls1028. It prepare for other layerscape
suspend/resume support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-layerscape.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index b931d597656f6..20c48c06e2248 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -39,6 +39,8 @@
 
 struct ls_pcie_drvdata {
 	const u32 pf_off;
+	const struct dw_pcie_host_ops *ops;
+	void (*exit_from_l2)(struct dw_pcie_rp *pp);
 	bool pm_support;
 };
 
@@ -180,6 +182,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 static const struct ls_pcie_drvdata layerscape_drvdata = {
 	.pf_off = 0xc0000,
 	.pm_support = true,
+	.exit_from_l2 = ls_pcie_exit_from_l2,
 };
 
 static const struct of_device_id ls_pcie_of_match[] = {
@@ -213,7 +216,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pcie->drvdata = of_device_get_match_data(dev);
 
 	pci->dev = dev;
-	pci->pp.ops = &ls_pcie_host_ops;
+	pci->pp.ops = pcie->drvdata->ops ? pcie->drvdata->ops : &ls_pcie_host_ops;
 
 	pcie->pci = pci;
 
@@ -251,7 +254,7 @@ static int ls_pcie_resume_noirq(struct device *dev)
 	if (!pcie->drvdata->pm_support)
 		return 0;
 
-	ls_pcie_exit_from_l2(&pcie->pci->pp);
+	pcie->drvdata->exit_from_l2(&pcie->pci->pp);
 
 	return dw_pcie_resume_noirq(pcie->pci);
 }
-- 
2.34.1

