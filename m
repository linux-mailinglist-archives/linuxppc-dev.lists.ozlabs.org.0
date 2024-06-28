Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D067891BBCE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 11:45:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HKd9Xynk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Vt12vjdz3cZv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 19:45:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HKd9Xynk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::601; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9VsH2Bg8z3cSX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 19:44:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4SjnD0lMUKYwOavDtP79N7NUynHuP8UMKmsGd02bPcVMzQy4mEHn0bYE7tN2MUEivdLpjvSjreP1Ga20cfP7D5kXIOJfDI9cZZZ5n9t2xpGgwMatx6X0NPcLvs/hxWRy5i5udxPNepRyp24LlME5Yj4l7jyonwFmADXDa3Ikawk5aSpLI6Utw6WJcmatT5an+laVIBCo3eQdNvCZZfrDz7YNnRg4gltrbAkgeTwHraTp5Xayo9YhXbK3vOfMInUAHmr8HqPaIaWfUZfzwbo0YxeBIUA4IE/d26AzA9YgF2JZnKBehcsfmV3A7YC9+WYNk0524KCG+ifFf+q8howtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAs2Y1hllEPnEtkbRstwmGKu0em8iRigETu7W2hnzl4=;
 b=gDgMB2hHDL2Ywib9OAgf6ydQRNjAUX2O/gSaNsafrOzTIjxtqFBhx/DW9NXd7DMeOnx2MC9mDouxxOqMF1CmspnSNZXr0y9j2epdmO1RXl5B60p8mSOaaEZXM93N6zcYQXtPqlIdDjuMQ0yxu8cRbnXJxw/sQ2Wxqqm/YPmmet0z9aM8Q/uoPGdgr+mOCGS8vkzJHbjgQRgWeLcHT5BuZXCiKt74/deuIc2jmZstKX/yv5vPLusIfTrLltZ4fnW+rJW5ELSfjh6C4M41rTK/okMjAe0aD8+6pPwds3xO8j8w8Xb++/PnPWAySBJQZLLZ6PaapI5m3d5wKMVYxcencQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAs2Y1hllEPnEtkbRstwmGKu0em8iRigETu7W2hnzl4=;
 b=HKd9XynkrB8AWJZC2M0xZcc4xreve6yX4Jpe0Vbbm3XhvWR0ZLTFW2W1Nxrh14HjoIyumrFE2WoZxH+PDIGN/CoGVd3b5cUw4T1QexM9g0ENBkrXDgcUZaUzzzgqxVdzGBnrpjL6QL8qag89Gbae7arUd2iA1P634xRMpEGF54o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by PA1PR04MB10170.eurprd04.prod.outlook.com (2603:10a6:102:463::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 09:44:22 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 09:44:22 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_xcvr: Improve suspend/resume flow in fsl_xcvr_trigger()
Date: Fri, 28 Jun 2024 18:43:54 +0900
Message-ID: <20240628094354.780720-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|PA1PR04MB10170:EE_
X-MS-Office365-Filtering-Correlation-Id: 005cc989-b24f-4ffa-c8b8-08dc9756e3bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?EwC/dHQF6wHd+qZsjYNvy6oejPX4psruiFYuVNdiMw/k4M1dTijb5rNaNfNY?=
 =?us-ascii?Q?7n3cMAe+LqAuKe+2EG2+ZNftwCcfCefTCcVXhPSpDoDgIRLpIOtDOzVh8mHb?=
 =?us-ascii?Q?GkPaJi/Et4z5UejKGBFBnW6/53KXj8AnBrBdG601rqTN+sWSvDFFH/d8CY99?=
 =?us-ascii?Q?ynRLQ5WEiQtKRtpRR4/ECLTrrSvMeFDinXRa7L7F+IYixPYcvdmX6czl9x/l?=
 =?us-ascii?Q?OMXHcoLW6npuJHDvejJ31rZh7WJbO5bfuccXDAdIdLK0XhgbXLOGEXZ48AFQ?=
 =?us-ascii?Q?/9FMrSJLKJ26jCOQtzFLXIrw+rLuDFhGh7dcfyb2EefNpHjiv3mIMqEJxpW3?=
 =?us-ascii?Q?WmMAhSFanvF03UKx9y+8SsDAKaTz6Hvd1NKB4OWdMn7wWYb3amFR1oTAQdMm?=
 =?us-ascii?Q?CH9ERLqcIsauYTD8Dzwa8W1+jSrft4qvtNXo7yeJ0YqrdeqC3FglQT3gn8S2?=
 =?us-ascii?Q?RcgbJzT1t2E/HU7U2N8GXGnobO311ogd/MN0zy6L3RCfy/e9VMLxX/tNjIrY?=
 =?us-ascii?Q?EE59EJl1Bfkn+8G6uurjk6/qcxK+Y9WFjihtMpIQljspvUKvnegjS6kNqP7Q?=
 =?us-ascii?Q?uNGWwMd0rdKEmKREGbLb0QOil03lK010CgL0jwaDr0qQAoB877Kj2TcShJ1l?=
 =?us-ascii?Q?uADfW2JpgQSll2HjDma4C7PY84D4WhJzW3W/IBxDR8+7epfKwwB9TsZls6Gj?=
 =?us-ascii?Q?uGhdU7aaA0YfaVF/8G7PvMGbQt7HZsIhaJazUhaxMxSqyNqRkPibUU9EGUDb?=
 =?us-ascii?Q?bJPZIE4UACgZa2P24W+LaWHYHVGkje1K6Jzc3bP92IX4h0sYJF2efT6GtMJz?=
 =?us-ascii?Q?Oa2UlJZhk0ViJZRjhPPWyW8s5u1MS7Mhu/NRjmmDnweXe64Ol9RN41IGXVBV?=
 =?us-ascii?Q?K0ySxaGzRQjsYxQnTHyqUBSQ16/Qlw1e3iWWgNtRVRWhj/HcG18NI8N+dEzn?=
 =?us-ascii?Q?6GWEGAuloR5GrucGK9MtberuRZ10hWukYXk8PtRaDqPRoT2dG41Qq6+lMndX?=
 =?us-ascii?Q?ABIemid1r4g2OZO4T+nRf0z9ERY9qd4bmjrEYT7V7aNSRKWDgc0ONID5q7x5?=
 =?us-ascii?Q?arar1+18lbeum2nhWhQ5+EfAc/YPq1dkDUiarTomc5WHE3n3qHXFsctwNumS?=
 =?us-ascii?Q?kKh1fyWgVKyInQ0Di9AmotYr0xNCYqW1T1OL3Tts7oFS8dKi3zY+vIPJ86pR?=
 =?us-ascii?Q?c6lXchheLeOZscUF4HOIq32ajfKJqVDQMg0VUStHoZv5YqsapNYrWoyQrMns?=
 =?us-ascii?Q?P+KLhR9UYolRzAbfyAqkg3tHrUK+gLLPYqycwv9gDL3IFqFhrEjFE/DGi7x5?=
 =?us-ascii?Q?kx4XD1a/hfZj0iD57wltJlYpLTZZ4a6UPjP7KVGMBQk83DP2b9TfZY/p9wNS?=
 =?us-ascii?Q?ZnTFjnrjApf5ZrVKcpdXoSNUggKXz9kYWU4+XMsO6RuZMg5EUUg3920oLGX6?=
 =?us-ascii?Q?VDnCEwtqj7A=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GYKHdQvnQp2YjOMivuL3/rxjHXyCgfkiWq5TVIKbnX44sJyCFWMgS622648N?=
 =?us-ascii?Q?D0b3JlihWwdAJ8kf2K1nC4JsD381mfGQGdWQpsg0y6qT99b9WnAfSJNPxaNf?=
 =?us-ascii?Q?94mz8JXvlCJpqut37aQb7Nv5Sy4ChUfH1vfEs82oRyYAMtEOTVG16wmE0k6f?=
 =?us-ascii?Q?9/3/lgWUpbLvUpsAeFI7kUsPK/cRGl0QPSaH96yKv8m+DLdCPbc6Zd3FPkQu?=
 =?us-ascii?Q?KcS+r4LiuBMhjimm49nWNGkdqGNRv2MF/SwFHjJaHK+3r/gcFJ/bWQb+dZ55?=
 =?us-ascii?Q?WnGti/vllg0cTimE2F/gw3GK8z/Mk29zhjjxB/1ROhV1tzkRU+L34Pqn/ml4?=
 =?us-ascii?Q?mL+AR8QjZytUBxdwddfc0emFY2mPp7r5yGq1thXGTkbwUYv9s+OgQowhOz41?=
 =?us-ascii?Q?9BYnyVY6z6bBOlqT6Hz16e+62xyb2j7u19cgti4HLTdMsMUtk0xaEsA6T/aD?=
 =?us-ascii?Q?JvJaBSRCmr313/Y7L2mPL7m7NklMTB4PKBTeld3bqO3TeZWAJXUvvQVLM8c7?=
 =?us-ascii?Q?jkN5mvwJskVuqicyArmcQjbLjwETPFv0fU0g706UsfvXz3pRH7P1813AEIQS?=
 =?us-ascii?Q?kDS1/WArCKxesv6D1jcAw2mvZ/R1uIpwgpPZ951a+k2Gaf45eiR9+XpdXc4C?=
 =?us-ascii?Q?H6xuJ4a5qeKNduq4awLXuMuZ/tu7yeQfXNG6F2vuvXDAu9SzuTsaZsucrmK5?=
 =?us-ascii?Q?JRxd7W+Oo3sAVztz3lJjGwLWe+H84RPw/MrRJQlMfyUXxlNhoZBcGLolhbRc?=
 =?us-ascii?Q?YfRtQSgadDCVIEPfPfGEGdX/+ZTnRHTnRZsNSaCn36pv2bqdkKhVi5J0ADe5?=
 =?us-ascii?Q?nD+X6Dl4DUsBbIsH/clt+EyRrWcuEcR2telrtOSr6w1v9hLkoPJ3pWbgFJGm?=
 =?us-ascii?Q?AtqJdXDTlLx0GpkSI+gtvhuMssOGmelL9WjkFU0i7bFFZn3OPf88n05nirgk?=
 =?us-ascii?Q?an+sSrCDE9NEocZ98PIk98HQ/2KegEtG5Jn19qhYtDxJTgSQ44qkq06hIN9B?=
 =?us-ascii?Q?GzaAVodMk10p3pqZW2bWn3YGmq8l3HwU04/99Vmh4KEChBs2CIm8A5bE+atW?=
 =?us-ascii?Q?MmTgGdoM3N+KA2UScAxzg2SgUXtpFhxY0IOxtBldZefpjngnAecw8Kk1ttCu?=
 =?us-ascii?Q?ITTWMhlRwzRhYsrhYmIc2MBTff6BNRPf3pVGMnhRcUjYoTeF13aHfxRQdUie?=
 =?us-ascii?Q?ZoYW9ZGPIEKnnIwp5zotCg2sb37/Z2uNqIFdr5hYRzYtKpOqV7guW5H/2gaC?=
 =?us-ascii?Q?63dp39u5ZIvyYlGueTZxINSsX085L29jMiyF3mXUjZaEtxv5a20i9RWpUDP8?=
 =?us-ascii?Q?2zbvUiz2e46j2K8RKyXb6nGuDOAVs3Dq4uHDg+Ehofy9B5nLHqIx546LuWCO?=
 =?us-ascii?Q?u7rP81+K7gdqN2A+xjy0F0POLMUfTvnBogTUQ0t+gp2rTAvMv0k1NkZtXYTE?=
 =?us-ascii?Q?fsnREYXNCTu+so4Ozjynrv5917Rjxqd9h1h5n7ERsGGto5SOIqNayAiugdt+?=
 =?us-ascii?Q?zLtlVNvQ53kIlj9lpp/1GyJt1R3N94Wssy6V5L2DBG438se22zWafl9VAgLB?=
 =?us-ascii?Q?EKX9Si8A5nUxFs2tMdF+IJoXaqGwhtgP+S+4ZGl1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005cc989-b24f-4ffa-c8b8-08dc9756e3bc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 09:44:22.5045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dW6Hh6dR7kzN549E15zs6Z6I+3QsxlxG/AcHGsOzE9zOqS4A9rTKS5wKmJBGVlR5V7sNTHiHTd98pDbPAjPlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10170
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

In the current flow all interrupts are disabled in runtime suspend
phase. However interrupts enablement only exists in fsl_xcvr_prepare().
After resume fsl_xcvr_prepare() may not be called so it will cause all
interrupts still disabled even if resume from suspend. Interrupts
should be explictily enabled after resume.

Also, DPATH reset setting only exists in fsl_xcvr_prepare(). After
resume from suspend DPATH should be reset otherwise there'll be channel
swap issue.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 43 +++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 337da46a2f90..bf9a4e90978e 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -529,16 +529,6 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
-				 FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_IRQ_EARC_ALL);
-	if (ret < 0) {
-		dev_err(dai->dev, "Error while setting IER0: %d\n", ret);
-		return ret;
-	}
-
-	/* set DPATH RESET */
-	m_ctl |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
-	v_ctl |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
 	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, m_ctl, v_ctl);
 	if (ret < 0) {
 		dev_err(dai->dev, "Error while setting EXT_CTRL: %d\n", ret);
@@ -679,6 +669,15 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/* set DPATH RESET */
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+					 FSL_XCVR_EXT_CTRL_DPTH_RESET(tx),
+					 FSL_XCVR_EXT_CTRL_DPTH_RESET(tx));
+		if (ret < 0) {
+			dev_err(dai->dev, "Failed to set DPATH RESET: %d\n", ret);
+			return ret;
+		}
+
 		if (tx) {
 			switch (xcvr->mode) {
 			case FSL_XCVR_MODE_EARC:
@@ -711,6 +710,13 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 			return ret;
 		}
 
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
+					 FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_IRQ_EARC_ALL);
+		if (ret < 0) {
+			dev_err(dai->dev, "Error while setting IER0: %d\n", ret);
+			return ret;
+		}
+
 		/* clear DPATH RESET */
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
 					 FSL_XCVR_EXT_CTRL_DPTH_RESET(tx),
@@ -733,6 +739,13 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 			return ret;
 		}
 
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
+					 FSL_XCVR_IRQ_EARC_ALL, 0);
+		if (ret < 0) {
+			dev_err(dai->dev, "Failed to clear IER0: %d\n", ret);
+			return ret;
+		}
+
 		if (tx) {
 			switch (xcvr->mode) {
 			case FSL_XCVR_MODE_SPDIF:
@@ -1411,16 +1424,6 @@ static int fsl_xcvr_runtime_suspend(struct device *dev)
 	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
 	int ret;
 
-	/*
-	 * Clear interrupts, when streams starts or resumes after
-	 * suspend, interrupts are enabled in prepare(), so no need
-	 * to enable interrupts in resume().
-	 */
-	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
-				 FSL_XCVR_IRQ_EARC_ALL, 0);
-	if (ret < 0)
-		dev_err(dev, "Failed to clear IER0: %d\n", ret);
-
 	if (!xcvr->soc_data->spdif_only) {
 		/* Assert M0+ reset */
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
-- 
2.43.0

