Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB7687490D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 08:49:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ZJmkDjme;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr1dq2cPFz3vrs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 18:49:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ZJmkDjme;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260f::601; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260f::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr1Yt548Gz3d24
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 18:45:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2ONkWDtUtO/9GFh4F+WcGsREP+3MeR/uJ47fJ/pyZFYH7la3nFsAXsQOyBGthNtS3qLwrAQ2YEVVZGrFddQiocoP2wA0FexjUgOPeeOw9czSPPukTNxFVzJujvU+LxILjrGVQmiLTGdid/ttULTGvSXQnnIKAh1jRgFE9szOiC5Q0B2n3qzvE2PvHd9qWhvw0MdZJxO6yeUE/Psf1IkYF5OBm1XroOWk7FGGqMbD2jh6TfqDiCXS5SaikVBa1jWoxAPAVrXmrDuzPNT+oqnbuJlYbCmF8nMV7tZduaFJCz2V8hPu4m2vxrr8wo1cDn6W04nNe23PLmi1dw6x97S7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0HxxwqbTUQyhMeXXnXFbjpyx5CV83NN+sqlk2mdOZE=;
 b=e5Zjm8sNyBkmxArtJr9HmxzMJYkxK3D83gLGPKWrOKMMlhLFa+fyAbf3g/U1ZTtNs7xIEgYFjTXy0RTiSNYseCLXqAah/ncwYlQ4pMfwhYIunvaN4+lWO1bD5kDnr/LvVTaLVd/U9fZ4Myn5DrnKgsf0jse1l6wHP3huHFxoX7KHpBir1v4fesFsHH5H/odZKD6RUmfQf7KQN0FH6lBuQGtAKfjh2O7WrfhdMQoxrCnYDrXseUzya2njkmpPadfmalAVeXZIdJcbMxzTZciDoyZvc9zXyB0RTezJVFK40sqESBGMwF8zjz8fhE+KRx8OPGolrLB26Ix53Li8Y+j5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0HxxwqbTUQyhMeXXnXFbjpyx5CV83NN+sqlk2mdOZE=;
 b=ZJmkDjmefw/Et47PZ+STJPHEMnpqgjRvb41VGaYlmOK/QPkTAwNnn2qyJrM73JSd0cuO/M1wYXVP+jIk9+jTp9kjCEhQgV0aof+IsKnETEWQ+S6v1yzCY4C3TF40FiXnFbvHvYKYxxMPE9tNQQYFdhjiYjyLlZw+RxHjiRkiJKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB9789.eurprd04.prod.outlook.com (2603:10a6:10:4ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 07:45:28 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 07:45:28 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] ASoC: fsl: imx-rpmsg: Update to correct DT node
Date: Thu,  7 Mar 2024 16:44:37 +0900
Message-ID: <20240307074437.1472593-5-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240307074437.1472593-1-chancel.liu@nxp.com>
References: <20240307074437.1472593-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DB9PR04MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b5b6e1-8187-4330-db11-08dc3e7a8eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	beI6JMLbyc9lm1JeMJwmAt4ZnB6s/pGrB9MmYvxQUU4vQuyaj1KsqdoZLCuKF7H0/u4WYbt9Qojb00/KmEedGxH8jXpcgVFhCqJt094kYi8yC5NC4oNvz0/j728aVTCF+ybTeClWHEhH+VJeeGMAGF8jdAMgTxLXRGv7QPMt0HPXxUoRfQ41+It/GhoeLqr555X2a4aabBHyBaPqYI7wSPhoNBT3VK93sDjp5NPFxPk0kIelAJjGht/m0IW6zhPbblA2tAz9iJVX/4n8CZf/HaeoilQyz9tpsJDpo8k29Br3vvnd/ofiZOj+47kBigMS9gc0iXXaWR1Plo7KAC++fd1ZI3v17VeSxEOQClw9VFiS72Sv7kRb2hXEjpvi6/LtP7RKhksEG4Ij7GnjfMFOy20tOjA10HklS4HIC/uP9768HQ0o/xhaOEiMIq79WBokmtIIpz2cdAHu4YLu+UL/JXaDUZY7ETbiMka1FTrLio1Kbc3BNTOkNelrA5GZdher4R25CeVGbCre5mP+Kc4u+bwbKcJe3cDGAhDjASNribPI4hMC61EAefMTAIVJkZy66Qs8ofp00ppNolPIV9aTBjBFAOAaZDNcWIGhsG9wBYYpStmRn28AGVwGbLlRUH6qE2kyIv6D+rJnMHgaDEVIdWrXxEIT2y/tWwvMWooZaYcMnVlSgrkl3Wvs2h8qm7dYpVN1CnpuynGt+rykgjct8c0T0T6wua8L8IVnxAM3nTU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/PNPw7YXhHsmpL3EBOkeotYV2SmpkF6210/1+3lgWVGpjXg7E1ZDlOL88SON?=
 =?us-ascii?Q?1YRNEVTBHogMzIg8DcFWjuG1JrolFOOR08m266jCBAztZ+tXYStUoJXmBbIE?=
 =?us-ascii?Q?zfe9v1PLFxIMO11a0mChKGPmzf0x0JFpWbqkFm2PAVQyAFSroETYBo5zip5F?=
 =?us-ascii?Q?GSgP2iDv8efGMkFo1Vlzye97Fatm4fhWIKcHjRMfdXhf+pqVY6mk08wr9pv4?=
 =?us-ascii?Q?0jSn3RiOAxB/OwFMx8/nA9bzWz2rTSs/i+Z3NVovLeeRinFU8/5AzMgbo/t3?=
 =?us-ascii?Q?+afMCRiczY4ORZH92D/vKuUL/hyEQI2aF3sK2id9Iqp16/c4vjN5/ZkXimYd?=
 =?us-ascii?Q?eNnVaN23w6AO1GaVPAP3g5kaS5p+pS19mltRuDT0hELANzJTdnI6N/2i4LSs?=
 =?us-ascii?Q?1OfUrn1tPJheFWJ3ggtVwlk87ftwsesFc2DPo4VdRzWpuNnFm5qw/OxKJce/?=
 =?us-ascii?Q?N8V6DQGvV5I/Fc6sU+zfBN/+9z8nkH7e1zT9hBDax4pgCye5smG5bHBdiEfQ?=
 =?us-ascii?Q?sDm1xvCAQJuQEpy6woL+Xow6hZsew1EQ8OjwxJZDNFrknsXG2dodvljqXcCC?=
 =?us-ascii?Q?n2AJPEcvVSo6qNG6Je/Dcv4aseQnGQ+ZaDpC5dv6howlQkaxgwJhInMN25kt?=
 =?us-ascii?Q?PwlekdwAX5ZurtLDEYOxhmRz1ov6+xW3/FnEMUkCFTLh12wzGCRBPtjOeCrF?=
 =?us-ascii?Q?I0OWRVBedmRYvY89ybj5cCqMj8G5pidCSwkv5VI2+XmSAQ/F7MTNqHx6xNje?=
 =?us-ascii?Q?Y7cLqqd1aFLtdpKoPuk05e0qaQAKzS89+vCa4xhpY+p3FcFFOAiMkvuSYP9j?=
 =?us-ascii?Q?XDkveUAtYNNm3/3ZJj3h9dxc6RwtCwzhfm7vNC0mvZNrPkhnmADlVTO13pWF?=
 =?us-ascii?Q?bUMae8mecRcoc4OBzB1Qrc9acy6+J6n3DhAvPWc6Qn1y1114nZ1hO305SGPs?=
 =?us-ascii?Q?ZvNfUkjYW7pmHOw8bBvuaBsXO8QrMhF/GrdVsAI3DXrwNgxQNyJLxK/aYsrM?=
 =?us-ascii?Q?z4Y6KUU32AT2kpDCjhIrB574i74py5ty/3IfhwOu8Vij94+8RQgNtTF7EDYj?=
 =?us-ascii?Q?aDUcrUslowBWi07OHihQVEXayEt178fXmjLHcKTa1EJ7RSa34Fv5HNuJ6b0O?=
 =?us-ascii?Q?aL6HqtFQWHa0mnmPurmeqz1mQOfKEqWJZHWJAkgpbf5D2YPUmnfKCgzyI8XK?=
 =?us-ascii?Q?TfBp0gSqZ41GWeRStfpq5fJnPeCcgFye2x8cGFlU7mw6LXB28RXQpXkqPWKK?=
 =?us-ascii?Q?LNRhlDRaWh3j/CO+1ezXYzcJgfOvikYd6HU4kIE4qCQ2iq8POtJPqNDsW6Ei?=
 =?us-ascii?Q?2ZH6YMafHoCcYYc17xBBzbr6Oh7g5GFIcnZb2s8fHNg9uEV/NdB/LOx7AfIZ?=
 =?us-ascii?Q?x1SIFdS7CN3udQEJdo2WkM5u03xmwzIuHoCBi6kwJVqsgVzosQ/2wFeL136W?=
 =?us-ascii?Q?LrFnOreWh07ScyxpZ+exzTcL3lJRatpEfH0a/a0fr1co7fSxX3A5XziDWRTj?=
 =?us-ascii?Q?1Rp5uzPPrUhOFP10N1jtivdeC9HEEbGDfnes+gC7No2QFFPqdihQg4GN90gn?=
 =?us-ascii?Q?OzoJWgMlIUkFh0QoMjKstuD780+4m/XEbbKuQuTl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b5b6e1-8187-4330-db11-08dc3e7a8eb2
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 07:45:28.2863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1xhy9todpSmwZEpcfCQtQOZ/++6/kq2zcFLeJEdznIFTgoiO1cOF38lIS+FQOQzIjtRRMScWHi/5D6Tj5wNAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9789
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
Cc: Chancel Liu <chancel.liu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Platform device for card to probe is registered in imx-audio-rpmsg.
According to this change DT node of ASoC CPU DAI device is updated.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index e5bd63dab10c..2686125b3043 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -108,10 +108,9 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 static int imx_rpmsg_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link_component *dlc;
-	struct device *dev = pdev->dev.parent;
 	/* rpmsg_pdev is the platform device for the rpmsg node that probed us */
-	struct platform_device *rpmsg_pdev = to_platform_device(dev);
-	struct device_node *np = rpmsg_pdev->dev.of_node;
+	struct platform_device *rpmsg_pdev = NULL;
+	struct device_node *np = NULL;
 	struct of_phandle_args args;
 	const char *platform_name;
 	struct imx_rpmsg *data;
@@ -127,6 +126,22 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
+	if (!strcmp(pdev->dev.platform_data, "rpmsg-micfil-channel"))
+		np = of_find_node_by_name(NULL, "rpmsg_micfil");
+	else
+		np = of_find_node_by_name(NULL, "rpmsg_audio");
+	if (!np) {
+		dev_err(&pdev->dev, "failed to parse node\n");
+		ret = -EINVAL;
+		goto fail;
+	}
+	rpmsg_pdev = of_find_device_by_node(np);
+	if (!rpmsg_pdev) {
+		dev_err(&pdev->dev, "failed to parse platform device\n");
+		ret = -EINVAL;
+		goto fail;
+	}
+
 	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
 	if (ret)
 		dev_warn(&pdev->dev, "no reserved DMA memory\n");
-- 
2.43.0

