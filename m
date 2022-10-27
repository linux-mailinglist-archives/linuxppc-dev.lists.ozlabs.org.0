Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53DF60EFE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 08:08:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyZwZ4g3vz3cbV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 17:07:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HVkcb54W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.20.69; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HVkcb54W;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyZrZ57dPz3c87
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 17:04:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jm8aJwL2EasBQoDDm3WhfD0CSv3mz/1tk2z8iu06L60a5biie7APXTJN1HIihjhlMPgrPjDLuSBmxABhL8r+YQDNEXeULIciLheWs7WGTn/2L2GzLrvwEAKwyOAFLYGg8+dOm3QIevH//eN+7rD9fTJ3uFem04emRCliMffgm8mqupjIkQvkoJqju1v5/M+FODRDyPWcS2X8vuJ9h04plyz1gz/J9BRYnmn+FF5hZu7r4OMxUwH8ooFWuVa0M0nWsogsPWT3G+9LqkKcO2UVYpLsZ0WCU17K9+vMkA+RxfWEREglyg12+oQbEL4HWf1CLzpLADazBoC83UsAIdbQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8D6fK94z9bkr/WCLrzqOXpjsV7zmAzm5B0HWwNZVS8=;
 b=Lvs1oWQI7oasSkovEJlgSgjWsoHXQeWRGW/X8H5BydbhgjQFoOwdOm6eQLxnXv3fsBWWTkf1b0n6L2GGuIGajc+TorqNjdfJJ7uITwzfSK5plD0vJzX5H/RU5KH4pbcat4evmiNHP3MZYH67qX7zUEycq1Dc411TPgwVNfKagneS9l2Ib0hPQYN8UIIag+uY8YzoMlCiOPbbaemCLZSBXPTT611zJxJNnhJfLEcn0SQ850UcuxwAs9cpMyE6n1H5V2BQ3srfDw0zqwNNb2BB1lVZO5bnD9XT+/JXslw23/u8/Uz2QmK8CMCtlr5MOFoL/58QfN/K6UiXFq3k8ILHvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8D6fK94z9bkr/WCLrzqOXpjsV7zmAzm5B0HWwNZVS8=;
 b=HVkcb54W4xRzNKG29G4XcO12XA7mWoDPvmng7uJbi14IAX4EVHQJYhHJ0Qujdiy1iqT/Kkr4zpltb28GWQtoZsysHDfhnnNZrsgGHv8IZvsH2rlWRw4wrbOIs6Nasi3KQ3RCucPdVu86lenh+ZTd4D4qxRJEipEzY2aDbtoRK78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by DB9PR04MB8186.eurprd04.prod.outlook.com (2603:10a6:10:25f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 06:04:04 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::33ab:7f2:7263:ee79]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::33ab:7f2:7263:ee79%6]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 06:04:04 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] ASoC: fsl_sai: Add support for i.MX93 platform
Date: Thu, 27 Oct 2022 14:03:10 +0800
Message-Id: <20221027060311.2549711-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027060311.2549711-1-chancel.liu@nxp.com>
References: <20221027060311.2549711-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|DB9PR04MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 920b2dfb-4748-48da-eb88-08dab7e10d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qzLb60caBrx6Bf+/N2Aj4vktF4CEjifSGtxdwv/WVHK0GawSV0p0JpAJ8qWNr6+758NqHJwZiNRl7E+yqncKez4gq4N3eSKfOiC4cQgE9qY40P7rxUdsOG7Xxd3gunn+5pHdL3g6a1vFtJd8Si2IbxyeBTj1PQkkQAThGRDz9e/T5Qid5DP4rlIbYoJuZXw6yqKmFvse2AK2OFlOmF6blRxVFA+JkzaEGxsHSD3Xk0zBSlqNN4lt87l1UI+r6PQuhE2EVTB/YwtDNpRrFJKOXNfLqDMJpYc8fCqB2hRvPQ/ssM04QxdxgabWaUbeEzRUrm4ZiOYjm19NwwbG2IgtUY0nSe9A/DeWo3z5kO1wqfTiiRWkxgigZ6296cvtBjH5sYRj9l5ALvpORRKVllOLMbR+32NHDWlvv5pb4YoB4OahDSRQqHh2h+sWFT+piGheUq42YW4y/Nf9EV+r+s7V+MvvpKKVW6vsXtdSxJmDldgqMB1jCvIuK74CrCbr7IsYSeqwjcs4AWJ5mFT7LcVVAZAxbmPT8WJthleQ9aBziwYY4LtlC0UeOzv91WwkIQChNotPG6c6HqheNjJcCTbMOj8kNjtF7d1k55VRSZRypAh+BUekVt90+C73k0Mb2pra9CdMeaxzrN9CGVYdg3DHQBLzEyNXA17D2EHvya4xn6FKUt9F1nmYm92Q4cJPLZx5M/uRW0Py9G0KIpu9XQp11KgtFXfG7ahmFjHX+CiVxkXygMfU39CdmGZ7lSM70fbidbd9WakaseUYtu0XmEHs9IES4A9cXtI41kFVaZ30V6g=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(8676002)(66476007)(66556008)(4326008)(6486002)(36756003)(86362001)(316002)(66946007)(2616005)(38100700002)(38350700002)(6506007)(26005)(6512007)(1076003)(52116002)(6666004)(186003)(921005)(478600001)(44832011)(8936002)(41300700001)(5660300002)(7416002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?R7Esh/cu/m3GxV/eC0PyUimBR+7a6HvDI3IrF7ueJCDBW4R2mYkovrGqGl9c?=
 =?us-ascii?Q?ZBhKQ2mxfLPHXmC3mnTAwzCk+gjao8YpvK0G3cQGzJrdXcdRkKW8cMRGGYCo?=
 =?us-ascii?Q?0v0FgHWa8Q6IV0BGVlrRsDfNzXYSBtcMDQvR5hyVLzgWFoIlunIoH8UGe3ru?=
 =?us-ascii?Q?OKIu6g56OVaPWh9Nk5Lwb7muCy/E6ve++gkV9HuKupuLbauwd5GJzWOgANk/?=
 =?us-ascii?Q?urfdlwIegETnhrlFBUSKQ/g57t62ZWLCr2PHA/qgNasTOlG+adVXOz4ypnRg?=
 =?us-ascii?Q?p7rnoS8uHZf7x5ChJd/hxnqscfBEyWBJe3fb+hO09eKjdQoRF9mFBKO8IZYy?=
 =?us-ascii?Q?ps2zBu3G9vZwXl1MJtFBnkZO7Pdnp/W2dd6AJXcgwBy/mIZHtN+WulvfUmSy?=
 =?us-ascii?Q?E3y2MKUAlSrSva04QdtzLsR/SMXZiLIffu3jg9wkTketH/pMZ6j+UUSLClN5?=
 =?us-ascii?Q?FOUxE5enoE+8XCn4a6EuPxp7Dppc5GdXD29eY+y5juuOi4Kd6NmW8hB3CPST?=
 =?us-ascii?Q?gL85vgSmqWX89MrrBmOYdv1KbpZ6RTkoL3BMAAk/AQk5y83XJd8gkkCDCOqp?=
 =?us-ascii?Q?7mMfwctf+xIl9uoAzOU1Mhu86zqNdkyjvTJdkGGRTOFo8YnjpPAYvEQyaRRR?=
 =?us-ascii?Q?AKi1dKWfWWuMO4sfdviDmFyi978Omq6wauPo1wAMeEt+OivVc6PGXSqk381C?=
 =?us-ascii?Q?xEsLue50AjlFSxeUklT6a4uvIF3f0N0waJ4Yjni4qLOAMQVidpuXkoIZYYb/?=
 =?us-ascii?Q?aW3nOa2sdPmD4anBT9szD+g2eW5hfvtdKWCAE7Z0XNbP/2JEWmxBwp1sYlEf?=
 =?us-ascii?Q?6kZrHxUlf9rhx9Ogj3qWXZdCF5OHs7gK7nv3JkZi+2NH0vZO8PGwiWbPJH7z?=
 =?us-ascii?Q?mk0SBGqyX2ECYQ3ZvuSfCs7gmoBYO+ObLYU4ZvogJ0ZQlf3q3HwKJS09bi5W?=
 =?us-ascii?Q?R4eSA2W9nWNIGBISM5zXNr/g1LgVmFsV31J1AXXKMy4ar+DSxlJD2BTEisrJ?=
 =?us-ascii?Q?N7sGKuSOkQO+sNVE/KL97+mwawV/Q02uSZ8Dpb7MZ0Ii4k4+zJ7l5sTHG4AO?=
 =?us-ascii?Q?Bf0WRV8mbn4v5jGd5Nmv4QAL5NUeKc4ToVRdvX80lvbDyv7UH/9cvxB88zUr?=
 =?us-ascii?Q?2Udz635OQZhK7+4FaOptSPkyMBkMGZcYy83JbNkQzh4R7sS5rgvrpo/gRkoB?=
 =?us-ascii?Q?/Upatb+lBoaigvwKHILVoIkAl7oI9uii/nSfzquucPkVJ0tRZoDMq9h3Bvvy?=
 =?us-ascii?Q?uiLbM0/pftQL3NjcIS/jj61kKFwDdiUykGWbtBYQGPyVN36XKzrvMcL3cRuG?=
 =?us-ascii?Q?iiFh/DAjxuCzlO6mBNLPRA5nUHai7yxt/ydiOXblrrMqt5ChCiuFO8PwgO/U?=
 =?us-ascii?Q?2Hrc93HOmETSe/OtCgmx+emRhemP0Ug7NJTK8WMArfhwvucEe9Aq5iUleg1h?=
 =?us-ascii?Q?Mq19lbfG6saUDweDFIA5dp+Ui3rMs5uMV4yIT6gzWd7IG3o74mrv3xaQDR9L?=
 =?us-ascii?Q?ULpidtc2mjGpii+t0M/2bwaGIz7WDNZHXGcF5WDeJjlfEqnIxjCay7GdJPBT?=
 =?us-ascii?Q?ZtsfMoKgo+guawQ4N3re7Sma6HnZHf8k3sjV1JfB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920b2dfb-4748-48da-eb88-08dab7e10d27
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 06:04:04.4309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZT5AWLvrkmH5Db8vlAtcV9AwBb17kflKn7OvnjXGmdR8xFOZvQ1UnUflLlBo+GpOckRFodAFrqi95V6MoeBeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8186
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

Add compatible string and specific soc data to support SAI on i.MX93
platform.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 81f89f6767a2..68e1cc4c369a 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1579,6 +1579,17 @@ static const struct fsl_sai_soc_data fsl_sai_imx8ulp_data = {
 	.max_register = FSL_SAI_RTCAP,
 };
 
+static const struct fsl_sai_soc_data fsl_sai_imx93_data = {
+	.use_imx_pcm = true,
+	.use_edma = true,
+	.fifo_depth = 128,
+	.reg_offset = 8,
+	.mclk0_is_mclk1 = false,
+	.pins = 4,
+	.flags = 0,
+	.max_register = FSL_SAI_MCTL,
+};
+
 static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
 	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
@@ -1590,6 +1601,7 @@ static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,imx8mp-sai", .data = &fsl_sai_imx8mp_data },
 	{ .compatible = "fsl,imx8ulp-sai", .data = &fsl_sai_imx8ulp_data },
 	{ .compatible = "fsl,imx8mn-sai", .data = &fsl_sai_imx8mp_data },
+	{ .compatible = "fsl,imx93-sai", .data = &fsl_sai_imx93_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
-- 
2.25.1

