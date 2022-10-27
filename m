Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C94C160EFE0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 08:07:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyZvX5BKxz3drp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 17:07:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=NfXED5gu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.80; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=NfXED5gu;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60080.outbound.protection.outlook.com [40.107.6.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyZrX3dPhz3cDP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 17:04:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrNXFFIYmNQXdbj7QK1y28tf+hci8zQcc0EkgiNga7X3Vi9R00ItxFD7HweudxwYdEfi9vr6rG1OF/14ALfaWWbWp52NQ2k4nhCZQJFIfo5dFel3H6Cv4SI/sokt1qMhDsvq86Ot1UMc80uT6vC8fR+tovwkAPCcxv9/LGwJBR064ZjL3pxeNflY3HMDpqTlxDQR/VABLSdmotCqmpFOHhASJJ64WAOILFzEYJlNIABQ8m3Dmj3wCJbRehQQB7WNvU8BWLwfuL7cQfMieWodeUw4C5TQQJ2+Z/O0eAKHecDVXnvqvvhZOiXwdx9Dg8yJy1A2LAk8ni6TQxQRcKqjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iNoHOP/7uOmpQk/Qaj7iIIAKCu9xX4YVFkeJ3MlVzU=;
 b=c1VqvoWjNeBW8T37e7OipXVQsha0oI6BKYDBYdDwznrIkLWLiA/ivC5okritI129RoXVBBVd5FVU5VStW6pqp59bB8nxplIMMqQs75g+VwUe9399t2Le1616y2bITn4ulTcbUEgvhpsbWlExJgfctSEip91sKVLPMbJW8ikLGYdEVd914in+bK53+LXoJMTJrvthE/U5VDRp/yEpAyv5cgXGwdfvw6stoj09DBdrFs5bVpVa/GWEDvBhOIkeSjRk1j4Ez/Z5vZcETy2gvWlCm2DM7E7gYCSegui/X1d8LoNQtnggUrD5mQFwKVkQ609vebkYxwqLwxOs6oU6HRpsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iNoHOP/7uOmpQk/Qaj7iIIAKCu9xX4YVFkeJ3MlVzU=;
 b=NfXED5guisZ/2oiv1+Y79LbUIlLkGGMAJgYXzVf4XFYhysvpUpjYubQEA9rFXezFNcqTk7CX8095ZjvYslgqnmIfG31LX+nRoc/YhxLN+Ndnxu/B6dPJ3qOhfRi5Lh0AyQBtUWdJmVawB0ODQ9Rx5h9X+3C5tcntBk/GDgehPB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by DBBPR04MB7593.eurprd04.prod.outlook.com (2603:10a6:10:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 06:04:09 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::33ab:7f2:7263:ee79]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::33ab:7f2:7263:ee79%6]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 06:04:09 +0000
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
Subject: [PATCH 3/3] ASoC: fsl_sai: Specify the maxburst to 8 on i.MX93 platform
Date: Thu, 27 Oct 2022 14:03:11 +0800
Message-Id: <20221027060311.2549711-4-chancel.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|DBBPR04MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: f07e1b64-bee2-4e40-e658-08dab7e10fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UO/yCH2rsvzGUpXrwGBq/OrlYQuwsll2a22IcCixnJc+WWFQp+EBzXuzvQDo73N5r+2wPEFouFugeCRBkhM05yRnP+F6nXQRHsCHOUNOixCTakkowES77pDzqZaVmaE/VGV1aPkr0QAR9lAGKo3Yl/NuBUo9fij8w+DJcb8inClfXf+YeeyvxodSDQIlXTuHs1f6rETrdfvwzWa/z+cj4YfVFus6YbEH8rlHZDOLZtYSwCF9RWhDRSqsMDilIawl1ruralaAk55ZPev8aRP9VwHksMcCwf8fYxn11SvaPvS74a2EqTI6ak/X6hVorpCQsonZ9mwIyEgHvE9d1LMF+oslIdF2z/r2HbnfdbEaQ8hWQCHPyJKLP8kVt0wwmXHRxpZA9uW8xutDWTEowYCatgdTL9saq82Hl+fYEbzXWHgHmnC9rROYKyNmxyCswGHVvsgQvEr+Fdq8PVROsSwhz5I2W4MZIGPQHYE/c0AB3z6vKWCpGGBfiYSB5giGAFaf4bFHkEr3o6Ad5Kj9ptUDStlNtkvIZtoneqE4t6qcqrQ8KSD2anWM6MaCGqfNRLTkBZ9b+T+IwaoXYn/4f8sSI4SkrhrCjTe/a2McckqExR3AsVYX9DmY1F2GEUxy0pcp7QVe2ZAi7BCiGkjtFuipqNGPZV4yTQr4oHw/RCT7KzH6p/NJg1EExbIpby33oS0UaHgIhl7KuPPza8jcIIXdQ/pvACE2T9El0qHPxuKQwLmAuCuUQYMDzQkGq/WXD1TyOnLYZoHsyxRrIDhRAjgmtK2s9vOxYeRVjj1eCTVyCBg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199015)(2616005)(26005)(6506007)(186003)(6512007)(1076003)(52116002)(2906002)(83380400001)(6666004)(478600001)(8936002)(7416002)(8676002)(44832011)(6486002)(66556008)(41300700001)(5660300002)(66476007)(316002)(66946007)(4326008)(86362001)(36756003)(38350700002)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?D6AdaQdT6bkgIqrp9AzhDYutaVnkzsvi+peQh168yVKKHKXyjxgkwWIsLl/d?=
 =?us-ascii?Q?5wD9BGCoOLm0pgzh7KYgaE9KFg1aILxk/u9A2HYogeyvPCZgmVnNGbuH7FaY?=
 =?us-ascii?Q?uZKKwEcbHI7uaJI3jesStcz1+N856/YvksClxM3kAeFLBFuVrpgQ8OfkD+KC?=
 =?us-ascii?Q?koSSGmif3cIPXHEE6PxpDQ5JPKb5lvGcmFo60q/knHF7/iZmHIOyQtTTsEyB?=
 =?us-ascii?Q?OngV75tpbhBUDUh1iKhiTOOzWYPWhZ4HRNpMe/L68onFelv8xWxmrLmfuUDA?=
 =?us-ascii?Q?+7tRa3/Sj/qnenv52ywxoQytmSAIp9r0mlnrpGAn9WXFNW+i6c+oSfqU39/o?=
 =?us-ascii?Q?fMYCI+XTGDksWr0QHqJR8e/vz7sjy+OciQmptvNW4CRSYgEl8VwayVOmpY6I?=
 =?us-ascii?Q?htYh5JHv/PXTQ6glYjlSLjyjng6YXSBImVPhIvO+AIoyfG6R8G+FexS6WgEI?=
 =?us-ascii?Q?LCipHcJ3mV4LHHFpWig6ljCal/UTuB4yckED7PTTjhvte/T4GMUwI/DzVHfL?=
 =?us-ascii?Q?JruYsf+NNoa2H5O35w3vOMNdBGHiWSuYkrlPd7S65zceNxgkinXLnBjKkCYi?=
 =?us-ascii?Q?2rUTcxL+8AFAWx6tlaVbQTcvtGMknfnnRslnbXwiAJ+8zkH+gWI5z0HvuaNt?=
 =?us-ascii?Q?EIAPU4wa6BOlV5ffxPUiOhrtetehJnQeoGhysCsGrSD1gvASF/nUE74Iq/Cc?=
 =?us-ascii?Q?I+t1tUH7w33k/0PqM3XC5XIYmJHaLbg6wndkIyFZnAW7pHz/ksAX/JxXS6D7?=
 =?us-ascii?Q?mgzMhScUrcwL123xfeOpzn8kj7eoa0rTt2WEh+L7PiqFJRwB8G0/MD3MRBDd?=
 =?us-ascii?Q?D4Da8jz1yW71JigVezQNe9tr7/D7A/MDQqMCkofKPfzjx0MUNqx7Jg70jw+N?=
 =?us-ascii?Q?lA/tNlcU9jpVmcrk/ASB20L7t8xRVP2eZqPjQWN2j5F+h/vkPd62Qop5+TxX?=
 =?us-ascii?Q?pgke90rNDT4lyW2XiGlcy7vQjJkPCQpPfdO+NjoEzow4jP8ctY0UYB4K7YAZ?=
 =?us-ascii?Q?D6S+n2AnXohmJqhpTszFkBeCjhVYfkhsmsv/rVdvwIlclTQ65tUDHdUkx8MQ?=
 =?us-ascii?Q?zzKaFAMYMd7rA0WGrIC+MYr5uSJKspHMGBrdiof5vKc/DNqqxyHJexlXxImj?=
 =?us-ascii?Q?5IxiN7Pi/LV/cSpS4xkZyaYMbhuQak/Ya44bF9TRB5O5gqfmFK8GaEjgNbwE?=
 =?us-ascii?Q?7w23rKh3pnkHLt8zUigIZg1zhQG4jklT+nfJetroFFy1tiVz7RBshu+2vbDr?=
 =?us-ascii?Q?tAIDAazc2baUQYlpO5TU1wSqQI858bq2PLjSlTQMYZ5vFaCsxCBEq49cKBOC?=
 =?us-ascii?Q?Cay2a5YwkfY1P+pWEZzTYMIChY6hjY2cblDFvOFqFtH4SYdetbYtf18jB7dn?=
 =?us-ascii?Q?jXv0i+KP+F0qO/FVWDxkxxqNjSaijr5vlyDWqLwgmKVjzHdAmHMvQOa+pn2I?=
 =?us-ascii?Q?3eN7rOa4y008cXHxPgyX9O6gPpsBH6sGViTbsuC7mQEz1piZEydh68vF4CWy?=
 =?us-ascii?Q?zJrYJrbs3urAC+bGpCwyCKpKe04HfsrGrXwsV0oxpzGLNfmbgpbfA0jyvfk9?=
 =?us-ascii?Q?xA0LHDd7ogUeft7XCPn2xI0ck24lmRQXankb41fE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f07e1b64-bee2-4e40-e658-08dab7e10fd8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 06:04:08.9775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5t8nk18vpx2jo2CzCmblUxT0mpLJaJms6QSmN+1R/nW6Uco/awhEyQBqZhyAmcTo+1lMBDrZYB6y+ROWNbg/5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7593
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

There is a limit to eDMA AXI on i.MX93. Only TCD that has NBYTES in a
multiple of 8bytes can enable scatter-gather. NBYTES is calculated by
bus width times maxburst. On i.MX93 platform the value of maxburst is
specified to 8. It makes sure that NBYTES is a multiple of 8bytes.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 11 +++++++----
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 68e1cc4c369a..a0ea27f06997 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -872,10 +872,10 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 
 	regmap_update_bits(sai->regmap, FSL_SAI_TCR1(ofs),
 			   FSL_SAI_CR1_RFW_MASK(sai->soc_data->fifo_depth),
-			   sai->soc_data->fifo_depth - FSL_SAI_MAXBURST_TX);
+			   sai->soc_data->fifo_depth - sai->dma_params_tx.maxburst);
 	regmap_update_bits(sai->regmap, FSL_SAI_RCR1(ofs),
 			   FSL_SAI_CR1_RFW_MASK(sai->soc_data->fifo_depth),
-			   FSL_SAI_MAXBURST_RX - 1);
+			   sai->dma_params_rx.maxburst - 1);
 
 	snd_soc_dai_init_dma_data(cpu_dai, &sai->dma_params_tx,
 				&sai->dma_params_rx);
@@ -1416,8 +1416,10 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	sai->dma_params_rx.addr = sai->res->start + FSL_SAI_RDR0;
 	sai->dma_params_tx.addr = sai->res->start + FSL_SAI_TDR0;
-	sai->dma_params_rx.maxburst = FSL_SAI_MAXBURST_RX;
-	sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
+	sai->dma_params_rx.maxburst =
+		sai->soc_data->max_burst[RX] ? sai->soc_data->max_burst[RX] : FSL_SAI_MAXBURST_RX;
+	sai->dma_params_tx.maxburst =
+		sai->soc_data->max_burst[TX] ? sai->soc_data->max_burst[TX] : FSL_SAI_MAXBURST_TX;
 
 	sai->pinctrl = devm_pinctrl_get(&pdev->dev);
 
@@ -1588,6 +1590,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx93_data = {
 	.pins = 4,
 	.flags = 0,
 	.max_register = FSL_SAI_MCTL,
+	.max_burst = {8, 8},
 };
 
 static const struct of_device_id fsl_sai_ids[] = {
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 697f6690068c..197748a888d5 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -235,6 +235,7 @@ struct fsl_sai_soc_data {
 	unsigned int reg_offset;
 	unsigned int flags;
 	unsigned int max_register;
+	unsigned int max_burst[2];
 };
 
 /**
-- 
2.25.1

