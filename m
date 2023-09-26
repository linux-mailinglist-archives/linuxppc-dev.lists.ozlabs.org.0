Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C91B67AEE50
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 16:06:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=D3Wkcn7x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rw1k74ShDz3dFZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 00:06:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=D3Wkcn7x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::625; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rw1jF02fGz3bst
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 00:05:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gybZIo80J9MaMSYwN/96E3/3QHmbrkrA6ln72Vv8xzVE+KzbBnCbAY/6pJYaC50JbZoEf8/2vkAH85PUtxz/eUo54us8i6xKr/ps8vV+exNZrsBbi3YsMaYadLZSaS4qw6d5ujKT6DKzUCGTMyGk1yMrrs7C6H+pKPgLH089UsAViVHZ026Sj2yFBptw8Zwo/jNVCYYW964CNcy+u8RHcSyfJwRe0byldZelhK+Oz/ac/aV5GLpY1E7RSjUahyFTEr7JevZ52mqS3DmiYaQu3UCFkfT5fPQYclznCvgFQoyZdsWzmHdU2JPzGVnNujChDMnHdRBViyTKy4gCE1qBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlyh8vwETYESwYwgXe38QDcsWIhrSffS1ZxPq3/Q7BY=;
 b=Z1CJExPQBe004QORJL2ty6nJDwVB6YtcQFi+UvqZsLbrii/AIo+yHNzlp+ZbzKLjW9DwxBgCt+YVxef5c6jLqY8OTvNPDw9IH9sRLEfwtHLl5RQYB8mdEYr1w8YZMVOYJWZlZcQtxmzT9yjYtqa4ca//8L+MWtncz3Asygyr+fg5vUfuXBK3eLFGPFHRRm7LvYGPDb5JHfBp7pC8wGlyS0Vp20CCSMd9hPQWZRnbJ46rSBKtrN93KOfTGcGX+iRluSSqOMWmeCVyqyIe7GMU6elNhrDkd8tljxDnWLFw/Wme819lgDKUPRhS1KRf/s4qLS+1yCAUr27A6t/678qIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlyh8vwETYESwYwgXe38QDcsWIhrSffS1ZxPq3/Q7BY=;
 b=D3Wkcn7x9B+iv1wyokI9vdfbsLtGo6M1XWgEkHyTMi27dv6mwGJndzeDXwP/U+eHRH8O5KhEaDBPWJWuKi9XnH8BCQfJwiyxybk2AIYcruCOqaV1xBeymNdSKLPgdI9tiAiKHa9kKekxcTrCZwGzsAwjaRoilLOao1gDMAGCVLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBAPR04MB7429.eurprd04.prod.outlook.com (2603:10a6:10:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 14:05:01 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 14:05:01 +0000
From: Frank Li <Frank.Li@nxp.com>
To: hch@infradead.org
Subject: [PATCH v3 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Date: Tue, 26 Sep 2023 10:04:45 -0400
Message-Id: <20230926140445.3855365-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DBAPR04MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 185fcf7b-2531-423c-4cc6-08dbbe999361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4DtxdnozAKMJG9RT7j6M8wNxO+/Nq132uQbJLiU6wttEZohBzDeEud6HPpO3mJ0HRpo+K+6h6JcqbPTMGzcd+21KX02uuEZZ11jOt6zkGmxqPAvgoH4lO+OXwOLJ8lioHWaOQk+kpr53HZWocvOAhWN949/Hczo1kfVtaX7MRqyN92gRyAIM4aYhb00jp0lPPaWaiuTNoOoBM61+xYGzX/kXi4PZMqx9E5LEMy8O+0C19nHBFYPVsGubjFQzy/74Tmp8UtlTvq2Xht8XPObC1rqUvf6+R5CmW/FYOvyOOu8wAPeFwbNpYxxr4S7CeCfevwMY9JLDvlhIKo/wbCZeMqREoicdQfW2YaEVQnqiLsRZAf46QLQz35yLnO5S4iHAi+QNgQe6HhtbyRgZ1/gM4Cmx2+dfyBY+pOuPpG1hrVnOU1P9zZO5qpG8Drceyi3u7xy5RHuMG34kwUBuufJEN6sMojkY4GmkTiwdUHFRTdflHjuxUyOckLcLdiIXZrZkpYvvo5R6KaFwmw4S8Mn5YzCdxinzR6zn9RIkakCVZT3ig58LKHdjL5r8t2RGtMo9XzpQ8sBzTGaB/BoCPgyfWuQFinPjGcl+Vfw+AXlCca99uYDNRPlAxkDLBXaN37Ct
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(6512007)(52116002)(6486002)(6666004)(6506007)(86362001)(38100700002)(38350700002)(36756003)(1076003)(2616005)(26005)(2906002)(316002)(7416002)(41300700001)(66476007)(66946007)(6916009)(478600001)(4326008)(8936002)(8676002)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9q1HVKydWBYasikPO/F7Mu2kAaIqpQethbNdTHEFpVzc+HEFKBsGS7/dfAi9?=
 =?us-ascii?Q?mroh+kml5sAJHRpr37JwuwcinzoXGWDLBi22NyC3cdeSwu+LFYTIKSTADMvX?=
 =?us-ascii?Q?vqs6G57656a5pKIDJKi43yvUMiqifZi7OoGluVw4q2Z64B5YfwIdDu2JV3jl?=
 =?us-ascii?Q?6LpGEmlLI6bM4FaXs36Qmk9ERX9yC9CafRO/CM04ir36ot4fKfSRqBwrnnuW?=
 =?us-ascii?Q?aOJYdJpGmlQXE0RPni13/uL5UcXInT34z+WIEQy92xfcx1MNwg4hHm7UDz/E?=
 =?us-ascii?Q?GppY0hgFVdOBrpsu/r98K6l6E4UdCM+JGj1LvCmZTOfKVctHYbAfFqlZPntZ?=
 =?us-ascii?Q?M8gPj3Bp8UrC+KwIHJ1/XTtpuTYG4mhKzQ6RT1nRmAGMZM0rsLl2esAPPW3m?=
 =?us-ascii?Q?mYs12EM9I8k12oteu6jl94C47B6Ary25EgDimJd00KSASK9EpFW4zB76Jaii?=
 =?us-ascii?Q?c5Zg++iTOx0TuqYt9WZ4t9g3av1wvAGWYKXDbIiDmCRkP6jgdl6u4CGFsa3v?=
 =?us-ascii?Q?j1Pgf/xOhNJOXdRULY8QLNbJbTL+neKAoNynCICvVQknQHXCqhRmSPS2bbJa?=
 =?us-ascii?Q?3Izfd+rBnPpUC/gK1xndjRwGvc0L26vBPEpEBmr4KfkmcynFeW1Hd1TSWw7+?=
 =?us-ascii?Q?f3TFYZ6ZfEy47f5xlexfBke+eWWK77bVZ0XwTIe01jVfT/Pb8FzDoSKC4xny?=
 =?us-ascii?Q?rduMidNt2M5qcM4W5S6QLAjbOMTTmeYmwHK1LANCDaUHcwcHYR38lvWsVEwN?=
 =?us-ascii?Q?xXz4Hz6I5+qLbTnE/UsLX/3fV4J1aKQwIPBrTMnYly4rTqgFARrTqrRWxw3b?=
 =?us-ascii?Q?L/WE8JXP1SwWHBY43j50Sb6pLdP+n6zD958XhCJnuJ25IcImc0146mXrvPVL?=
 =?us-ascii?Q?/5+wD7i0cQ7MLXcYKn2Zd8sL0jHbA06x9Dfc1GMWRiIDDiD9NIA/atNAhGs6?=
 =?us-ascii?Q?N6qitDalXkCcODMcrlo5z5g9FbSyXC28AKgUMPweYS48D9u4q4w5RpkWwPHv?=
 =?us-ascii?Q?PVrfyHp0SmKYLYLZBQeCnqmHaWJqbysWFdtgaamkJUClpdZTjwgOVYNy1l/S?=
 =?us-ascii?Q?cyKjP9S5SuuXY40OsNfRLkoD+66vVOrf6XeDnG1noy5BtU8EzgTtavLVISgd?=
 =?us-ascii?Q?Gdas1ceV6rOed0tLPwYvcqE1k0TWntZDi2t5driCAmoOXSmvRjJsqoOZz8j7?=
 =?us-ascii?Q?HMZy12IedBU9YuzN0Wnrygbysmu7mHeO0Ua8zYbEsYBtcZ9sfIMbhi18xTuw?=
 =?us-ascii?Q?bBQYw0l6Lmf5aMBdVesHL6cUpcY/x3HxuzYcS0A7HRFQHdIlhs8e90rFLDaX?=
 =?us-ascii?Q?BYr5Us9ZeVM7mxQY+NokDWA1RMH5BxtbCHVy2I58X9QC5PotE6VmX0DiDVmJ?=
 =?us-ascii?Q?U/5a5rn6uGnHTDPo6e7qQmVRaYNNcBrZb48jiQk4Fk9CTmf+WrjuCSABdOGK?=
 =?us-ascii?Q?c77CGS6jXd1PY5Iq/DP0Uut5HzY2H3CRsJ4A9W4+/IWLDa99H0UXJA+imXv7?=
 =?us-ascii?Q?1m29rUD7XRRQSohNp1XpLLlmcYdn+kMwQUSkOjzD65LAJsBu3kROyr9KafW9?=
 =?us-ascii?Q?arclnmTCKCwabdXPUZ9svghvmDLzwSmx6afBUGL/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 185fcf7b-2531-423c-4cc6-08dbbe999361
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 14:05:01.8234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tw+fJur7bQM8tzNYmHzbUkrIgfjIeOeEd7D0F6NXTNAhSxjGiRuY6cTNGCFaoSnP5qhH+PPkO0Ho938sZVFLkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7429
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
Cc: kw@linux.com, imx@lists.linux.dev, linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, christophe.jaillet@wanadoo.fr, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guanhua Gao <guanhua.gao@nxp.com>

Set DMA mask and coherent DMA mask to enable 64-bit addressing.

Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    change from v2 to v3
    - remove check return value of dma_set_mask_and_coherent. 64bit mask always
    return success.
    - remove redundate comments
    change from v1 to v2
    - Remove 32bit DMA mask set.

 drivers/pci/controller/dwc/pci-layerscape-ep.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index de4c1758a6c3..2c2c9aaa8700 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -249,6 +249,8 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
 
+	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+
 	platform_set_drvdata(pdev, pcie);
 
 	ret = dw_pcie_ep_init(&pci->ep);
-- 
2.34.1

