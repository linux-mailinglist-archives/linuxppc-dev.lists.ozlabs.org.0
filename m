Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F39A667F6A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 20:37:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtFFV2hL7z3ch6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 06:37:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=c98oOyEe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.8.45; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=c98oOyEe;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtFDY5glKz3bZn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 06:37:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N17MZumrWOW+PtPgO+iq09mhwe/LxWJveRLu6DS2nztLADJuE2pGY/KfVTuFvsW5hBJzqhJ3a2uWz1o3HALokDR8Zwm+gnPPFUERkYV4zgo7DonNHVMb+iay6K7eFqqYKKvNgByy1gWj5qnrq6hCO4wmZ0HcHC4/MXNdolO9mBqA0D7MFUYP6kxkG5CJNI4ojhuyKb2SQi5KzY0AmKlyBi6EB+gdWf/bjXZ/qGeykC65Dbku/18VNthC9bA0ffpYYqIAngvNvkZJQYzX1+WZnaR/eGLXtRrsHS7CYOESqA72vY+SoT87iX2ujWmtfzNDhOw36/9s1iAOPzdR24onig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iF5Hq1QwjgGRvLo5zqovqtlNmE4N1a1EZdHK6vBNKsU=;
 b=kg/GmVjWpedKlmF2jl2zE8dqLkRLbhMkWcdFr54YlHNvB7vDFOSUoY0ALT0DKPxKKXniW+kaWQWcp7U05ZHs0bjmb4Rs3xwJMeFj+TaRsCETGaYk/KDHwVQkMyFm2knd/S1jZ46ZZwhl/TFV5Nu8MCSS+ooLMH/rY4pT9UIu16yhZ7yoDG5VDfGNdJ7MhLc7dZMdgKuXHyr79TUzgj/mnJEVMF178zfMFTeUKNZgdN+KTp283uGDvT6R2feUiKzN7h/R02EdRAWyYAQwxMCI+GTaIipwT60kmJ92D9o8UxFvGRviI24i0ddWpqpOthGZQqt1Pz1adkru2poPsOQ3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF5Hq1QwjgGRvLo5zqovqtlNmE4N1a1EZdHK6vBNKsU=;
 b=c98oOyEeuZFA3e//HSZUILnbwGSQqsO3v+2L1JCZVYvro+Zw30McPwNSGyRXWi6raTrXSnB3rN03gCchLi36OzZPIlMrs7lFVo0krtRl2JSbIEDzFWe2f7RJgdWqmb0w3lzSt1wQAqHaHChXlSZDviWpycsjhC1Im16qt5PddRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by AM9PR04MB8178.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 19:36:42 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 19:36:41 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] PCI: layerscape: Set 64-bit DMA mask
Date: Thu, 12 Jan 2023 14:36:21 -0500
Message-Id: <20230112193621.1513505-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:40::40) To HE1PR0401MB2331.eurprd04.prod.outlook.com
 (2603:10a6:3:24::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2331:EE_|AM9PR04MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: cf440f79-6de3-4aaa-85f1-08daf4d45487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uIz/fH5g9ibwnYbidrAoTgdF2WhgwrojJ2fiUMQbfKg52xwoj7BsyYOLbrfJelyTISaPbjTnzf9puVc1r/a5ZyJv1GgaC/GlTG8khl0R/BudbH4aJ7K02Jp9we5GklvWUUJyCSHRbvTh9STheAdd1/qzLE8HKkAO3rHAovTz4ZMz8DcVCoZC7+PXUvSZ8b+WJofNnhpiZzM4D1aIARxPH3w8oG1EcSqSBAfdqRbG7LnRaqqIOF0Co2bJ95R4OnPo5Ag8xxtPZlqqWtdv7RqIjFZJasRH/9F/bRolL5y148MK8moM5drHI1/ccf/ZTHw1XQAQ4YuwDIRNUlOaVh31dkp8K+jClFkO8rtJm2tcd6AdiWtA10SCCQQk5Rpo0jH/qpEs6InAiXKQzVRdYjuQ8EXjj/0Y8GNVuu5YpPLtFpwKsksE2gg5jtex0jqRirwNqpdY6qQcPV9cgL1Mv2KHXy5NfnDRaMk7bNwTowUgUu3eikqXU9xjHlvrSNlT7lDoEYohgMUiz2pR6TLQ+sjxBBLLJ+JZ1cslgYu9GlyQlXcIUeMx5S5BPBdxRzRbDahM57OilGvrPvAiU0nqCh+OeyDTZWVbyQauQcQNXeJ1hhFUiIk7Hl1V8A1o/cig+APlyxGybaR+8lPRYlesCUMKX+AMjyT1gw6MOr6S/HFs96B/oy62royFr/b6ZJ9f1m6Q2zRthqp3ASgDIUHyx9bwn+fJj21JOp2b3XzTHo9IjAI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(478600001)(6486002)(921005)(41300700001)(6512007)(38100700002)(38350700002)(1076003)(86362001)(316002)(110136005)(2616005)(26005)(66556008)(66946007)(186003)(66476007)(52116002)(4326008)(36756003)(5660300002)(6506007)(2906002)(6666004)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?0UA//skogdyZVwk1HpTDGR+Gh6ti9LxcnuVrUCAJSNHdKNiivArbJqXilIai?=
 =?us-ascii?Q?isYayVYTRgRsEbqNf/GdtSrK2bjg5yD8sFHGCjEpGDogi3N7p25eGcIF3ELG?=
 =?us-ascii?Q?mOq3WkARWQLgldkE3yjtQfpiMH9XjPfUjbj6GQ+6OYQ0kwfMam5gxIboOrWz?=
 =?us-ascii?Q?ipuJ5/EfDy+icGKUG9iD/p2RqPpQWKcTwEkbzUH9bh8rlMdGYKqEeQ9dA9fH?=
 =?us-ascii?Q?QnItWd7Q9KSgeeydBYmoVnGiI26gfgZdt6AyAEOpTiWwC6iGB9tN4sPFOLFZ?=
 =?us-ascii?Q?6mTD0HAmyy0yblwbq2VJT3ZFCT55ST1NGyUwNOgU8rvww6CVxV8+NrmUpcev?=
 =?us-ascii?Q?1hKd0VsQ+WoGY9ijjWCEPrUtQkNw4eexeYhCFYFw/MS/y0EElatrW1L2E5Wf?=
 =?us-ascii?Q?6KWJ6WQ/h1G4z1LTs3+UnPuwmQbD4JzyZzZjqYdpvdkjxGv4UcEIsonrIrVF?=
 =?us-ascii?Q?q6XpIT+26716nwpDjM9B3lXT2mKP/G4y3458s963JAxaIIzi0R6YJ2pYUFxB?=
 =?us-ascii?Q?PkPeSlviE4JuU3qXuJYs/I1rJoaQkgN+weVEtLHaGz8QgYrWKdPzC4pw3LYy?=
 =?us-ascii?Q?L/B5JiYGGLACWKBMjCN6oKdOFxnJWH3CMPLcR2kRcY3Vgo7nncb5eqt6Ixs3?=
 =?us-ascii?Q?p0UwWu30QZ4Q4aqpfNZM6tsz+0GJwr89IOXV1SLcWBF7x8cViamEVItEGrG/?=
 =?us-ascii?Q?kSvMgFm3BeVB4RNQVn1ntVH2cl5se9+QzUTHGhBBZxgQli+TxOnKQGVtWbTE?=
 =?us-ascii?Q?8LSu+19RAgQC8cig8i1ke5zyV7+rEqUqCox18Gsjn/1x+9aqx6E6fLbCq+B2?=
 =?us-ascii?Q?/ZSdjm1jjaBNqET8Ha+zAvqMIu5U/Z98wYYOJV1YrTuqbMGtqjhY1hZDGh1J?=
 =?us-ascii?Q?Si239TvHILbX8LZPjceUX8k2Hu4jGaQzY9SO2bZRu3v14jpD6zL7xqfJd8bj?=
 =?us-ascii?Q?JZmFhu6rDg2z+INnpu9OehHN31WSyqlNJJou1aDdYaybdHg0UboLHZElAKz8?=
 =?us-ascii?Q?4MApPp71zTbG03nknCSZImUoRJ3vr+CQvRjSo/ZB2eOt+J6EqZyZgKsdgpm4?=
 =?us-ascii?Q?R1vX4NlD6BYBBI+Za75HEo5eYRoR0ULsedAYUrNAPoPBKbvyLYn1GFxy0tfv?=
 =?us-ascii?Q?kn3wA7pytYoGnFm04uN/56GgAQqoVnYPF4edMkS6qbOxlF4T9E/4KKGBGOta?=
 =?us-ascii?Q?ZJ8AoIyXxnteeZSwp8Xu531CXgVPiSP3cibLtJtlxNgLA5rkk4vV7jRPom6I?=
 =?us-ascii?Q?irKguYZtZOwK/qP5vHpjGOVVxb48j9LhmiI91kFiI273K23Imegud3pmbpsk?=
 =?us-ascii?Q?EKENLgiqi67pLafTEHoKq1nKA+bobH8ss3TWAB7PmTCHmw2LMqQ4CqO+5IGh?=
 =?us-ascii?Q?8bOTjMfhmmUyXEN1lNXmaxatC6WO3nMppSGlnozM20mbedBtDFFTmW7ZV9bs?=
 =?us-ascii?Q?jTJD5gkxCCWUpgo0bcTQS5yPCYMsYVMDLErIc/lY/kg0FdfhTLJEhhgQ6+Bm?=
 =?us-ascii?Q?zRpXWpR505HpQe33KUko3xXOoKpURL9su2LgQi8peJHwVAw+0eHTNvKsbsUo?=
 =?us-ascii?Q?jsT2C3f9Yn50sUGnF1cuEsCZNagc+2J+ZqeKD7Xc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf440f79-6de3-4aaa-85f1-08daf4d45487
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 19:36:41.8396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTEQ83cLxE5XM7f5pRmeXdONwuVegZOcBMMlU9p+4uHGdV+RxXFARWy38xjWdhyK39LL9i46Rb4ku9Ff3/JR+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8178
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

From: Guanhua Gao <guanhua.gao@nxp.com>

Set DMA mask and coherent DMA mask to enable 64-bit addressing.

Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 1b884854c18e..c19e7ec58b05 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -261,6 +261,10 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	pcie->max_width = (dw_pcie_readw_dbi(pci, PCIE_LINK_CAP) >>
 			  MAX_LINK_W_SHIFT) & MAX_LINK_W_MASK;
 
+	/* set 64-bit DMA mask and coherent DMA mask */
+	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
+		dev_warn(dev, "Failed to set 64-bit DMA mask.\n");
+
 	platform_set_drvdata(pdev, pcie);
 
 	ret = dw_pcie_ep_init(&pci->ep);
-- 
2.34.1

