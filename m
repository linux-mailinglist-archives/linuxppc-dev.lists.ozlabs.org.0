Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D719827FED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 08:59:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=AQK0wc3i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8Ncg0v30z3cVq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 18:59:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=AQK0wc3i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260d::600; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8NZ10F6sz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 18:57:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkRZGBJn/VvLnCYM7QEcVxXRJZNhj0cXmGtlvpez9a32sI0WofjbW15jic03WpvzjmDPeiLIkaY2aeD6Z9pxExFn080/B18HEC0l6YWfMYeMO6vpu3p/noZ+uVJ16LkcuWj7NQZW8/CeJ0sIuse5HaynDi03pxOs2FI2ITG9z8k2j1rIAMYJGf/ZOQDoYMDFgopo//FlgjrijlUU61jByX1Ny9S0Q2agNv3C5pFbg/oUiKmP+s4sOa8+GxSjLI79VfizZpy/5j94g1qWdUbHnjKf9MND49iCilB8fKiiQFeB9Hzu0GpoO0RGbi1JUq02QKKIkiycra5ujNU36ehtmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mBacVnmmEo6nSbLcbfW5aP18Z4DRu9hu0bQFtRtQN8=;
 b=X7UQpJZi2JeDhTNcuT7jxKXltgY9mUO15+z0jeCEQnckkWug6LrBO/8i0DaF5DLu/JSLn2hJ+XZRlv1d7Qbc4bXjQs5zEP+Qx3yZ09KGdCYqo2Twd6xkjIyiGRVi467v4rnVdbF9rsDgCKRFhcS9WL/d5NiEhtzn2LP2jZkgww3ELzf0+D1GNVrn3t+tS/6ffwC5+SIKrP4gzv8H1OztU0LUgoW6Fwqcqq1seZ8D6vcLsUJimfyx/uDyS9dzWwPHtLUCu87dIAOT1EthMwX1/I+i5btOcJEc+DZ8ERthMW1kOuzg2KI9S9fOjHayQAiTbLgnCnSyocqhCUqGQEqFLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mBacVnmmEo6nSbLcbfW5aP18Z4DRu9hu0bQFtRtQN8=;
 b=AQK0wc3i938UO4h+Morbt7iRLQPMqbPY6zLJvGEqraaoXZHcOGqpSqVkFiXbxaZypwCxrD9J/ahWkrLSo/ndPselyjUmoA6SLGcI2lEmaS8n75F+1hFWAmSY8SW58E2ss9w71LtnNljlisE4mn0NBMQULkFq1bQodqceD8oqrRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by GVXPR04MB9994.eurprd04.prod.outlook.com (2603:10a6:150:11a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 07:57:00 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 07:57:00 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] ASoC: fsl_sai: Add support for i.MX95 platform
Date: Tue,  9 Jan 2024 16:55:50 +0900
Message-ID: <20240109075551.870001-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240109075551.870001-1-chancel.liu@nxp.com>
References: <20240109075551.870001-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|GVXPR04MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: a87b1e1d-b0ca-4498-db0a-08dc10e88f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cm4UlonQSxV28XpsQlh9hy1OjLyXW7l70IKkvber5YOsgWxyIDiL8HikviJySAlpwHPdhGHd/8oMdX8pY1Lt/RjiQzvU3CsWOFayOY2dtQlyMxWTcZROB3kfFICp1mJ1BoQc7ZgoV6xTp4cuXauxQiAZGsWvlADBtVE+68LnsJgW7c+4P7n8Kfz0SAvpDC0G1jwzc8Yuitj6lnrwRV9Y7UHQbsHswjF0IpFLyJLAAIB9x+/1jjL2wY3ci9bYxa/ndESh1AqTGMh1lgdQCduSz7DmNL00uAcFu9MZXHuq3TH8DppOwRBVDyw40BsdYnd+ZKVsfUSh5dEQqgAqn5s3swavRM781QvpPSf/RhoyiSoIrAWHDPi3ygSMmXdSbqo4TkdwESsYLbFM7v7RfDPNRHde5G/ZbQd1UCy3p4n7FqBWSnEuDZGXp9rl4bZN5iwYzhehGB21MMnzoi28FLLLGN0/yvEbVVLQhIxvkwaahx95SC90T7uMeJ1L0X8xyGNT61HtLy42mU1+2T7gLeRgH4lIMLu4fgufvyMvqtvAspueVqc1RWt4ap4kX4G/5Q+qn2XK9tnUuRKJjQOUAiRQgxmqx2fG46TaeEg02cGRyJuzZaSClDdoy3DtrpHIos4LNtxZRRfyHQId2ABtzu8cpQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(1076003)(2616005)(26005)(52116002)(478600001)(6506007)(6666004)(6512007)(6486002)(38100700002)(921011)(36756003)(86362001)(38350700005)(2906002)(7416002)(41300700001)(5660300002)(66556008)(4326008)(66946007)(316002)(44832011)(8936002)(8676002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?kPoIRugS3odKFGVdOqL0+60hb7d+bTJc6kgwlqo2JYdEdKlFruuUIjCiztPg?=
 =?us-ascii?Q?pKglpv+86I+LrVcRgLOASKTIQJ31kpylOoQ8GkohDLBqjwze9DL0dVUci5Bc?=
 =?us-ascii?Q?QLQaMxhE5wSnw8rKkcTFuk3vg8gz9nEqfuGTK5cN/TFbfJ0Z/l7gq8wrHHdC?=
 =?us-ascii?Q?OHCYs0xDtEfBuJqouRY5AnCrf1VmgRFQ3VY4GzTlwLoi7Zksz4FEMGMcVx0p?=
 =?us-ascii?Q?Ad+yjiqVAcW0KarVPTKMOwogW3Xg/UMnfGO+G1TwQlXu7pQFJlcHAQLONjTN?=
 =?us-ascii?Q?nNTHx3epU6lFMczV+VqDFdmOzTejG5F5nqJavLss9/aWA1lmKudVX1psyfjP?=
 =?us-ascii?Q?bZxXamZ8kbGWZl5i3Nj8m3pjrXX4qnbBXu3UEaVND1H0t8gaQMNgiies2Y4f?=
 =?us-ascii?Q?BJE2qW4UDiL9MOEz4knHuHnNJcDHIQeT0ddLPeDeNJGQlAHDxgcGxDLDznxf?=
 =?us-ascii?Q?KjjJIBbcCJbJaFj+A+cM04pxYCymKSQYQ7VWHmAomPAVuvRKz1FShjh+Qsjv?=
 =?us-ascii?Q?cLKOgMtVnhGzY8XgPzD512mOg3uTguSkISgZGNd7w6QgjPZSSTr2NXB1nOn6?=
 =?us-ascii?Q?yNLrEWMau8mJE7fXPVKlud7A/HqudWY/eNOFwMnP9LlChfKXmI90MKb4N6Q/?=
 =?us-ascii?Q?J1sbFavRBUmcJoS6LINNq2RWh7ql4oEsosooMuEcnmnl8jj0mipHXnYLlcPj?=
 =?us-ascii?Q?QewIsOuBFOTOkPFP9rTdAc0Qy0tegedD6dDo8UeSqtqru5YNFlOnz0ENiXdY?=
 =?us-ascii?Q?lBFAa7mPE8Nx8VKlUxT85A3aCH+bgN8/ur2pl2XDctI3FAd1WbwZs3I83SZb?=
 =?us-ascii?Q?FQ+ZDeepcaTzV5Ta6lqBTWkw8OSX+gereuGAuTr66XzeA+F8Ejx7yDtC4lTz?=
 =?us-ascii?Q?CPYPUFzd9/EXaD74LN8Z8y143VWDfq3kv+w/gBNali2KUFxSE6KFeaKUqYnb?=
 =?us-ascii?Q?BoIaDIjK22Ta4NaL7z53pmVh1NC80guo52jfTzN6vXvO85XFd3aRPdWBOF/I?=
 =?us-ascii?Q?7723q6Y0z6uIdWul22AzJA2R4cWgqJOjNm6lA5iLPvf/c8j3l8IzugNCXrd+?=
 =?us-ascii?Q?TjnXSb7rsnP5/aUxh57vknkxj3rXLxZmn1umrWpNFlW971QXtEcI4+DYHWua?=
 =?us-ascii?Q?6DNfzeocHQEObl5JCcgALfGAVKX7TY/Aun+EHNv1ZFELx2f3bYjuJFpC1zUk?=
 =?us-ascii?Q?RIso2wIE/2PK+kdUdUNaBQ4R8uFuVGdsxwy+BdnqqiJOuC7HT4HjwdMQQQf8?=
 =?us-ascii?Q?1HEyA7TrAdpwVxoFeLolLHaRT2OZWqQKkLs43aJGy/WqQ01e9IapdydRSSIB?=
 =?us-ascii?Q?+La9MySho/3134vHl+FNwEBP3wau4koOxpnQNgRpkCQaU5HfMvwUahnCmLVL?=
 =?us-ascii?Q?lTBb7ZWO5/a+mHg4U2M4Fnb2gEwBPwXxaIpO5hnogE2TpsvlQjg0jj42P3dJ?=
 =?us-ascii?Q?MobMbN3SS3bIlfLyu+8H/Mu4qBeaQ2prZIF3AizYTtrBWorRw6+zdacBLPBX?=
 =?us-ascii?Q?cUuX2M9l+p060sAhRBMGDfNMpf0cWSGVGRayBbRSkjud4GQ9AZMilrWZSe83?=
 =?us-ascii?Q?7iFQqyy0SRnQvCUje/Ui9MdPD0bFjWD+0Nf4GkXd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87b1e1d-b0ca-4498-db0a-08dc10e88f35
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:57:00.4085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZmNK0/dmN9NRH447SiH66K2IG/E34Yx09X4lXFNCuiloekpNOpJmuw5W5jaljiCeGABHK+jVz82zh+MyYjOcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9994
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

Add compatible string and specific soc data to support SAI on i.MX95
platform.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 546bd4e333b5..0e2c31439670 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1639,6 +1639,18 @@ static const struct fsl_sai_soc_data fsl_sai_imx93_data = {
 	.max_burst = {8, 8},
 };
 
+static const struct fsl_sai_soc_data fsl_sai_imx95_data = {
+	.use_imx_pcm = true,
+	.use_edma = true,
+	.fifo_depth = 128,
+	.reg_offset = 8,
+	.mclk0_is_mclk1 = false,
+	.pins = 8,
+	.flags = 0,
+	.max_register = FSL_SAI_MCTL,
+	.max_burst = {8, 8},
+};
+
 static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
 	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
@@ -1651,6 +1663,7 @@ static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,imx8ulp-sai", .data = &fsl_sai_imx8ulp_data },
 	{ .compatible = "fsl,imx8mn-sai", .data = &fsl_sai_imx8mn_data },
 	{ .compatible = "fsl,imx93-sai", .data = &fsl_sai_imx93_data },
+	{ .compatible = "fsl,imx95-sai", .data = &fsl_sai_imx95_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
-- 
2.42.0

