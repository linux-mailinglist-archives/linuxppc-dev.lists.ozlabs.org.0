Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A91C92F88F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 11:58:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=XHI3vHKq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WL6VM6qNcz3g3Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 19:58:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=XHI3vHKq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WL6TZ63vVz3fQs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 19:57:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwm4XMe5WiZ7xl4FV5oWdNFSEHIOEzrg3mZC9RQxXq6hYcPcVxXbZFzGJBeqTweCo9QCOJkke/eYQa+F5+0TajvNwAafClVirzdxVOVTYyxuugUmxF+n7Bnglk6SeEMkb0OAtsUKEs/+MBKPos5DUtGBpoLdToc+K65CbMaAM1uGr3kuHji3+QPpdejKZloV5iCApPzev5WPPecAlXHcVJLMaVC7qy9T3VXyegezQzsth22Fs2dD3CCYUpDyleyPfr/yaQr8szGvE3B8BwoAEEa5a4Vnr0XtNrvH30UoEYRfj3qQ8GXFFpFju6PY+4yGApkGbuUMhdsAdUuHLSMPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/bIWHweZseYmKh11oTyydP08zCUd2gjebeBMQ6AUW8=;
 b=CoFJUlfo5fjuvem1lDcLgz0sq6c4Cpy9euYlAXFqCobx/uiatFE6dJMdPQlMZNWFdUQ+VdSadvVLV2M3ecOygw+nf4fIVGgZogv7G9Psn7QzRCBHxZZeSnlXgpkErbjCvaMy3ab9/vB2HLl2NGHOQyRkZGtXhPa9kpvxe3cICBWJ8USYQsEfB2M53NRDtBbNnTxs0A3j1p2588vxsVk5yiwP+8+08ES8i0KsCInvF3UooOBIj4IQ+9/HNFW1N0HXJJVGe5dn8zhR+h9QiwsNuhYjhKJatcLson3oY4lF8/EHjWsj+Xy1OsRhccUlZoduZEObscTM0aVhW9fwrUBc3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/bIWHweZseYmKh11oTyydP08zCUd2gjebeBMQ6AUW8=;
 b=XHI3vHKq6W9Zsr7TT8GaCAtjwSSF+8JWO7ukjswd1sZAfhc8TGM+AYuLLp/ngkvcn1RIklreITCB8gKShSuq0ZU48EkwGTaRuiDn7YDqu+FDFOxQQi0il/8UgyEUH7z1Y8V4sG3Uphwgq6FQYL2bpoRHcKW30StCaN9/sh+QGCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 AM9PR04MB8340.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 09:57:13 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Fri, 12 Jul 2024
 09:57:12 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] soc: fsl: qbman: delete bogus device tree fixup in qbman_init_private_mem()
Date: Fri, 12 Jul 2024 12:56:57 +0300
Message-Id: <20240712095658.577186-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0050.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::39) To DB7PR04MB4555.eurprd04.prod.outlook.com
 (2603:10a6:5:33::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4555:EE_|AM9PR04MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 081dc07b-45e5-46c9-80d6-08dca25900be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?isW492uIfzAXF4VpacXsTEy07KafXD2E+9qFZ8eytrzCQEPQ+jQy8b/jRioZ?=
 =?us-ascii?Q?7pzowf/7EDpFyOJ6WxCF8bWCfZ5Q0ji4kf5YeL2okzOLOL7yvYA7vuDjUAk2?=
 =?us-ascii?Q?jRPeLBi4pVI1qOS3MTtc7L0eK0uMbby21S7UUdeSOvpTE3WVrEXITeZolbEq?=
 =?us-ascii?Q?M8WOk2biDfBdX5dUUlk9QK4x0Raju/XXQvd+O9/BdspQKPdi35l1s8FZcLfH?=
 =?us-ascii?Q?Fh40uVD8HXnVXf7W73/wOOJixmTbcA1XulB4nNsBo0woW71aiom3akO6Uw63?=
 =?us-ascii?Q?eMIZHhBsG+zPvV+NoZFuTNRYEfCYXY7fIKHBrACST5SaN8nlZ00VZYExDfSv?=
 =?us-ascii?Q?Nd1Lxer8luNKrD52vxRcIZH2ygvEKT0MbLOU37OitLMTDzKQ2uHTMHi5VD6l?=
 =?us-ascii?Q?wL5epDswQ9jo04bJc7pE+6MPtaiV5HT6/qOecBeV4KwJk6/ppi3PrPtUzyYI?=
 =?us-ascii?Q?jFLCiW6HAll+6yyAdS3VSYY133+2E7OAuPohh3860dpQaCztTuTrDPzEL2IT?=
 =?us-ascii?Q?fDyQgvFOSZb0w5kO3JeAUTu6Tx4WUF7gUabxMOFXHft8MN0I6COK7pb+d/uY?=
 =?us-ascii?Q?YqBrgRR+hyoxLdRdC79l6eb6+ZVZ6naR9vdQcvcPk3VLHpK2aW52LOQmozwz?=
 =?us-ascii?Q?rqKYav++PA1BgdPTjnwjKC1KpSYeuIHO3PyXl0Sh7Ua0UrDuOXuONuqEYaPL?=
 =?us-ascii?Q?CcG2RMHTvNJT2WX7hUshVOu5arIPyHJf0+sWYL6DklsE4GDCX8dlLmmjtxZD?=
 =?us-ascii?Q?Dnwn3EXkgicrY+lQ2E/kumAw8mh2BDAqX2Nu/ssdCsaBLh44f/nCQeLgLvFj?=
 =?us-ascii?Q?iFZCiTmkwDPPS9lXFrW3l6Iw+gnIOWvzYC0FdiBIdqi7qt91LTy4AXs1vWvE?=
 =?us-ascii?Q?ULoCbjnjTuV3d907mrCjTt6ZpZcYuXupJFCYLYIjgwAzfyED9OX5cX0NGzOl?=
 =?us-ascii?Q?nBCX8ljOpqz2YInsGUYNVIPFx6qQE7kB9gTi8401EkQFs8Xc7bhIjL2t/9/y?=
 =?us-ascii?Q?u60fiAuVZoPjFyYec5fazvH+waRuoSFf/ACWXOFEZzjB0H7hPy3nuYi3cXxz?=
 =?us-ascii?Q?cRtz5TkaTvxKryQ2AHGrOO8tEUWAnTMtxNXba7aLWzivy8yanvygkGMuMK3c?=
 =?us-ascii?Q?CvP6hwOPQy78RMhRh2bFXhkWP6HtkPx7x1sMBNKLo4ty9akrxxIC9lh5wyrg?=
 =?us-ascii?Q?1ujZxrDjrhCNcQpQCSdcXG2xZXOtQMFR89LNmX5f2JNd93qYgUqODGcA4TcS?=
 =?us-ascii?Q?6I0EErfTlTxllNzATtvct63TRLdw/zh6IrzFTQCx3U4J5AKoITSyTqOHXYTJ?=
 =?us-ascii?Q?tERGxrax35UIjaHRJkpACNlaarHWwJbGYBI3ykhD7yvm4k6/RjtGr2Qz6t1E?=
 =?us-ascii?Q?AA0JKuS0Ne/1jL/nJIURRP0X9ntpoaP2eUByTkwZdt5bYJqTVQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?J2BNNdDdDV/a5w+b0JDHFpfsj3Ss/AL56lQaUB0HJqOiiKIjgwjnthGKuEDR?=
 =?us-ascii?Q?BKFJRvIG+eBiBd4GY+twjQd5VLSLjn0IGdsf8GST+tF2QiqUmClANIH27jdQ?=
 =?us-ascii?Q?QhMxe8hZJTK4vnEVDNpECcArTJSE9YbM5h/zsIzOkf4nnJGGo317aPbw6o2Y?=
 =?us-ascii?Q?cT4bhTUUF6FMZSKayhLDmBS8k4RkoyJqXEenRNl+Z6LyKpwO0HECVvq6EXK7?=
 =?us-ascii?Q?PIYpcPfQwyGFVteD47kmrPB+nddOJtRrorKEruPUYvVhhoaVe/arQ7GSYOJd?=
 =?us-ascii?Q?Ozs+Tp7olubVnF/+9JNfGTpPCIp09nufpNrGZIOnTtYUtU7rUSf+2m0YzK5y?=
 =?us-ascii?Q?ly1Nl44DbSGfDPUOCyol0907vg7/lJU2qycPVuS0yCWJfVUL+fVdoqJl4hv0?=
 =?us-ascii?Q?6AU53PZkqngZbj7M8MtQatKgI9ScWNTwG8evlfVHzXuAz4f5sPvszoSHs4EN?=
 =?us-ascii?Q?7W2SzwTmAhHg2wfXPqqY3GNInW6gpEEfV/2fFte/Nw7/q/tZPV0PocXm5R9J?=
 =?us-ascii?Q?dawJycQWW1OHMkehN30/vS4cG2dm/OjIdbryT0sci2V78z/ZhJGM4ng+wZjj?=
 =?us-ascii?Q?efRLsSjbBbTnwY5tTbdQgkaspmlgKbySlpMujvDb3+RhZ07CQud44R5pqHcq?=
 =?us-ascii?Q?AlisoEJMhkFxnvGBt6Jcm5SElzKtj7uRmC7QpmPC2z4O4/kyYuzthr+VOdTP?=
 =?us-ascii?Q?sbUazY2Ifz3ySkgryr1rOXs2a5LvY/uOSTD3CGE+iFMVap46F+8BEVIYc91E?=
 =?us-ascii?Q?l5vsbxGoQdVTMvUnuyKu5fkolOVmydcGTj9HgeEjBW7KZHiOlPC5ibplqkFY?=
 =?us-ascii?Q?9jq90Xje/7TVBmUJxDds0kPm2N4E7Koe7QGScoG7mRCD/UZP5BxcQ9AunWjy?=
 =?us-ascii?Q?waIYaIL6FJzkZu68hUsqGvHwRoT4BMaPeiiESi2COoesZldrgF1UHEVSxBqI?=
 =?us-ascii?Q?38sjJe/bx0zcHqnMiE7pKPFsTtSZ3CMx43bk82JHnVpMZudxHq+UltAu+gGv?=
 =?us-ascii?Q?GHQy7jQyGj6O6TZajd+ryhVDZcfgr/TmegUoXqxgbuIOcFAQcQGKTULVfkov?=
 =?us-ascii?Q?nV8x8LeJ9c/lKNOmNt8Z6H199c543iHWfasHorn5MUF59CoW1uMKSEK9Of5v?=
 =?us-ascii?Q?2KYi03ziHcfLaKd1EzZGxK+N2/B/8+tG+RTOVwaNXmceZ5Mczriw8YcECSz+?=
 =?us-ascii?Q?u6f60co4uqE01PaFgT7068RPTyyeqxobrX+BtpvBxkea8oK043gL4G7wwa4C?=
 =?us-ascii?Q?1bpHHVqgNYxBAm4n7GZWC2s6BwNdKJlZtCWf7XsceIMGddE9osvst61wzokr?=
 =?us-ascii?Q?uUtiLg4rT8qPvYWnlqNLCtvwk9Zad+robx3VkSsP5cJrKx/OztI5VeQMQj0H?=
 =?us-ascii?Q?e26AgoXZT0Ms+2HC+omrrBkyNtZAgw3Rbb23GagZdYR5a/+5N40ogd+8SQhm?=
 =?us-ascii?Q?jlI2b2dAjpggEcMiGbYHBaskWA03YTPXN9I2tiQx9fr7CoNoFI+K/sQNdtyi?=
 =?us-ascii?Q?5xTvg9I1Z6FNW0IJvS/2C09G2D6gKiBKH33gkxJG1ORCMK3Z74yrNAJVnq3N?=
 =?us-ascii?Q?/Zo8t6tTvzwu4r2qF0DWDprfpmQorUwFzCH4j/F3+mL11EB8ZqZRWS0zrAD9?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081dc07b-45e5-46c9-80d6-08dca25900be
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:57:12.9473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJq0T69ZqtLe8AhrvWEcYezkZvgKOpfEgaNEo2tBd69fNox5ZwTYlAY/uuIn94FoZGY+bP3eMXSFq4pWzs7tkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8340
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
Cc: Rob Herring <robh@kernel.org>, linuxppc-dev@lists.ozlabs.org, Herbert Xu <herbert@gondor.apana.org.au>, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is effectively a revert of commit 6ea4c0fe4570 ("soc/fsl/qbman:
Update device tree with reserved memory").

What that commit intended to do: Fix up the device tree that is passed
to a subsequent kexec-loaded kernel, so that the reserved-memory nodes
have the same base addresses as the currently running kernel.

What that commit actually does: Fix up the running device tree, which
has no effect whatsoever upon the device tree passed to the next kernel.

I would have refrained from making this kind of non-bugfix change in
stable kernels, but qbman_init_private_mem() grossly misrepresents
what this function does, and for an actual upcoming bug fix, it needs to
be refactored. There is no place for the bogus code afterwards, so it
needs to go as part of that, sadly.

Cc: <stable@vger.kernel.org>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/soc/fsl/qbman/dpaa_sys.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/soc/fsl/qbman/dpaa_sys.c b/drivers/soc/fsl/qbman/dpaa_sys.c
index e1d7b79cc450..b1cee145cbd7 100644
--- a/drivers/soc/fsl/qbman/dpaa_sys.c
+++ b/drivers/soc/fsl/qbman/dpaa_sys.c
@@ -39,8 +39,6 @@ int qbman_init_private_mem(struct device *dev, int idx, const char *compat,
 {
 	struct device_node *mem_node;
 	struct reserved_mem *rmem;
-	int err;
-	__be32 *res_array;
 
 	mem_node = of_parse_phandle(dev->of_node, "memory-region", idx);
 	if (!mem_node) {
@@ -60,34 +58,5 @@ int qbman_init_private_mem(struct device *dev, int idx, const char *compat,
 	*addr = rmem->base;
 	*size = rmem->size;
 
-	/*
-	 * Check if the reg property exists - if not insert the node
-	 * so upon kexec() the same memory region address will be preserved.
-	 * This is needed because QBMan HW does not allow the base address/
-	 * size to be modified once set.
-	 */
-	if (!of_property_present(mem_node, "reg")) {
-		struct property *prop;
-
-		prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
-		if (!prop)
-			return -ENOMEM;
-		prop->value = res_array = devm_kzalloc(dev, sizeof(__be32) * 4,
-						       GFP_KERNEL);
-		if (!prop->value)
-			return -ENOMEM;
-		res_array[0] = cpu_to_be32(upper_32_bits(*addr));
-		res_array[1] = cpu_to_be32(lower_32_bits(*addr));
-		res_array[2] = cpu_to_be32(upper_32_bits(*size));
-		res_array[3] = cpu_to_be32(lower_32_bits(*size));
-		prop->length = sizeof(__be32) * 4;
-		prop->name = devm_kstrdup(dev, "reg", GFP_KERNEL);
-		if (!prop->name)
-			return -ENOMEM;
-		err = of_add_property(mem_node, prop);
-		if (err)
-			return err;
-	}
-
 	return 0;
 }
-- 
2.34.1

