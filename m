Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B86605F054E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:48:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf15Z5b65z3cfg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 16:48:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=MwaeS9J1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.21.84; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=MwaeS9J1;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf13N6PGZz3042
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 16:46:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCiffdrGN0N3r0t4T1Z4jhkf13vAjWnhXh85rJHvCGCuhoPwMqMRAaaR7a9kPDYF2fu8x3FQh6X+DI/a9klEMLBsFrYc7fDYn0jFAxJ0qR64mnBfnvsXua7NCMsbnxzp3Mki+nZohljEjnXh6BLBVtKvZzItHF8Lw0PT9VZ3KBiE0dc9GXQhyzPDPaVvzcu/99+5C6kD8LBOamJPif5PA+7x1mqzNokWS5nATYWkJT4kY50KaBYLA/0Hmz9WfbMqfn7bVxEsIkkTav9DY8qAqpkrhL0Fdq7uWe3Myz2rhhZgGWhPLNk9uSdp88+n6Yt7AxKW5oO/yzcVdoAeIfNzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qccABiWaUvVO+xTPzGBnYWyvQQd83WgKac52ZwfOQ5w=;
 b=LbTrg2Cm5rhbUQxKsFs5ou2yD56vcSCoQzjrirtl3nBY25JW00G+dHC/F02M38oUWidDqoLl4FL4LaVsHBxR1wgxiEzWoT0DKlJhLS7wfVTVQwLGB2lIKbsqwZl2u2FdifIszIhMCkg9gJOCms2dSikCBKAhnzHIPlTlCAsL8d6mLDYztDCMYl/uRVwlSti8pE3YS21SHwoeX0WY7MV8R/MqjHtX35Rv8OC6oMX1jc6XBQ9Afdk84b3RsEWv37i86ws7Ka+JuQ2TtoYP8Zg67fBlEEj093yFrhxmH9l5cXjeDkC2F91qnPiW/RzLYtwafRhx4mT4+09eFjT/wpGTtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qccABiWaUvVO+xTPzGBnYWyvQQd83WgKac52ZwfOQ5w=;
 b=MwaeS9J1GVomjO++nQiieCJPgmd0dKRYaa3Wo5JYYhbH4Yx46c1sx5jqsubtshgEg1xXzNpUSZ7kHnqqqo5d6LGjgwjao0MgAovLXZrPMziFNS1vAptaTC0U4QeABpHqaMCilYxSpXChkePCKsRZrkYGBF3pM4FBZOREWDoD7Qk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:46:09 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:46:09 +0000
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
Subject: [PATCH v3 2/7] ASoC: imx-audio-rpmsg: Create rpmsg channel for MICFIL
Date: Fri, 30 Sep 2022 14:44:36 +0800
Message-Id: <20220930064441.2548505-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930064441.2548505-1-chancel.liu@nxp.com>
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab067ce-1002-4184-50d8-08daa2af74d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PrD2fOMSjSl+qU8C8g9xfl4Q7GigzmKcaiLLjp4GDDpupbU1XbwVSziACM3Xqdg8vg9+FBbmJXvoBnYYJiMHPywW4VsRBKRrBqmjp7dNwq3WBAE/ya2KLiwWTQR2C48GV7DjksujwvdGM3SpqphAz82W97tqZK28NSc+t+FmuIwGD5CQuZfy93hGCmyDfBPdH46MmnE7+HNZRK8CrJGpZ6qoa0rwRGKxyCEMoQ/ztrQwjJW0eoERVUCffVoWuBiS61TZ0FrjMhhPDJ/bUAonYuVC6Npfzr1JJsAZzqOoZjvJPjrniyRUE47fIX3R58B0KXajWJjMVMif05LvBIAuRoLk+Eg+3/Ra4qbHQEOAPe5VdOJ6sqpoheTLQGuX9h6EK6gmcWqN4giXXxsZM236/a/PKvPcRxUZkI02pKd7SDWRE6/VV+LqIhBHTqoXlrQhx26/c3wEUjEHpiemhODba7BAIUsCmUNhrmzVJ7J6G7iuYb01S3wf2Dv3jVmqz9L7QGkSUtK4wRcKo6YwjLfVC6/ovNQNHsR48bVH+6kgy/CQim/cSdutSUw1t3BfCrGK3PsFPshrRxPfNVZ7OFtStYC7imsgvojkQ4kRs76vW2u+E92i0lNMWk3wMBOUOKsV+sEMHHNCS6KV53+IjQUj7tFQ3OSR5GdXcduUElGs7EEITe3OCAZtmyOvJn/gL24Tj9s4oirO8v7VLWNShya5e1U93shl1nI0WPIOihqVB/hv7kpNnvIQfUE5i0hclVRKRsPtLKtQ89WVJlyoiXln6A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(83380400001)(7416002)(44832011)(5660300002)(66476007)(66556008)(66946007)(316002)(6506007)(41300700001)(4326008)(52116002)(6512007)(26005)(6666004)(36756003)(8936002)(8676002)(86362001)(2906002)(2616005)(186003)(1076003)(38350700002)(38100700002)(921005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?h3FlQC+RhhzOi3o90rljCrLkfTRgRwPkAIV3dAbvFucSN/OO3IlESWsn2HQM?=
 =?us-ascii?Q?7ucuqh+A5KwmprCBUC1AwbMmbCjEANzd8I/wbv8DJeRv83wnGAEEgA/agSG4?=
 =?us-ascii?Q?Knw8aHOpRcNKYNqGCEpuS/Odk5FHga36n3/ocw8R3C3U+Im9FQNxeqGcqT96?=
 =?us-ascii?Q?AxTrjFE90lcY+PoutanwT5UGIpXWj7I8n7PgU0qL6et3g7sKwVK35XIu3olb?=
 =?us-ascii?Q?odOO/POG2K1If75QtOl7TuQ6/ApZHPF05T2PZMf/zu3l04Al1VxhVx1bVciB?=
 =?us-ascii?Q?kw2Z8WoQ9dSl5Q9C1rqI03jfCh4qqeD9zcAsZCXbFytUWWPQdPJdecpk0vgR?=
 =?us-ascii?Q?vnjQhBKqVv9jUxUnHE0YaE+iNcFeAkL9WY+pPGg1yJoM6rlrt35hXYqrhvDj?=
 =?us-ascii?Q?oeSwGIbHUYlC5V9REj87/nKVeSIvryELQQYlv99v/4oxkvgQIisFgCRFXg4N?=
 =?us-ascii?Q?bnOQMml7FPGDtwcWmtvBsTN2IqJfEelOTNsY9E0RjicJjqSF3E/iWxPie4AO?=
 =?us-ascii?Q?t8r/cM8PkQUZvAIJMqsmqajl4oNdzFZaPFc8kyVMjQ4fDst3MO1NKNaiP56Q?=
 =?us-ascii?Q?QFSHzSGPA8rxTv+RTvQUUrVvkM1mWmea+cNpXg7G4tOZu7W93LX4aXZMPlpT?=
 =?us-ascii?Q?cG2ofoOcjBYBj0nfToonAhn0ZSYJRwkccqs/g0BjqDbI/yzsBCDn3L4qkDSu?=
 =?us-ascii?Q?kFLbf6oxu5VAhl76S4Ka2rlynPmts9ibIuQ3HDW+Qms5aW7Fo5Y7fDVyF7q0?=
 =?us-ascii?Q?6qYANali9/ZUGtgVpib8pJ/dL6LqLntLFvgsO6MSqMy3yLta96QS6RscFsRf?=
 =?us-ascii?Q?IgQXr73VJZiJBf2QLifDXGZtLwjU+g5IpCmeSP3v5bmKGBKcLiOaXwKQ4Qs6?=
 =?us-ascii?Q?cIt7nYut5rTX+zoK0F2AUctc4YzYmbRIFfTqxU4GAwt7tWLa78TY2DZcuZhn?=
 =?us-ascii?Q?VzEu9+/67XCM4EGb6d5XWo8WYqk8SCHkhXUW1OCcu4bAvxSa4V7Uujz27akR?=
 =?us-ascii?Q?apGl5psz8Zofc6m/JsHyeLBu2yQiQE7NONJXxAqWbr+J7OVTbCbH/Ctyf3cQ?=
 =?us-ascii?Q?48Cfiz3dOfO8Cx8SKtC5hhA0Dv2LE8qlzDxIk9askWOtRwwsScklOWR/eEpW?=
 =?us-ascii?Q?1r2bdSgjlHaa9SWLCw0WU0QRsR4JIy6m60W8FcpksrQiIR6izpXPDKsjuZhp?=
 =?us-ascii?Q?PZFeNLKDjwhUoBjqhatymsFbestUQgUJklzpY97dbzFXg4EmItvqLhBiADSY?=
 =?us-ascii?Q?PR4uf/fP3hXMtEP9XrfDWoTuITihjZJrokWaL6OhbCLoTs7+5crJIW9i4o3x?=
 =?us-ascii?Q?XTqVp47LhRVNVZv3Z398pEQeFPcjTbb2CQw3yGAtCvRjeHk1Ffo6arwpfjrC?=
 =?us-ascii?Q?gG7KTI7pCkvpgRtaTPwpYEczFZAny39NeTV9DIutM3Dxt0jXf2rXH3TH8+Ao?=
 =?us-ascii?Q?wE0XhFfnDRPhxTp5OnnZz3RFBbAUxWsXyC75BwaYTXrFft3UMPLFFYveFbEp?=
 =?us-ascii?Q?oP6R1hVV+fUcJ8cAtyFq8KGoedSsnCGZyuVybP//Q2nwgrTf7nwd+hjKpE/a?=
 =?us-ascii?Q?x4g6m0u+3NQUxb5hYjijxYA8XzLVkeks1EQl5u/J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab067ce-1002-4184-50d8-08daa2af74d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 06:46:09.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wnG+yR3fd7DM4KXX29rAB2CZyM2islrsdDWk5Y/jIYwDhs9b7WqJAVjYRDiIITzK6Yxckmjl6TgeZDAgWMHJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640
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

Rpmsg channel for MICFIL can also be created through rpmsg name service
announcement. If this driver is probed, Cortex-A can access MICFIL
which is actually controlled by Cortex-M through rpmsg channel for
MICFIL. This driver also helps register ASoC platform device thus use
of PLATFORM_DEVID_AUTO macro in API can automatically create device for
each rpmsg channel.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-audio-rpmsg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
index 905c3a071300..d5234ac4b09b 100644
--- a/sound/soc/fsl/imx-audio-rpmsg.c
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -88,7 +88,7 @@ static int imx_audio_rpmsg_probe(struct rpmsg_device *rpdev)
 	/* Register platform driver for rpmsg routine */
 	data->rpmsg_pdev = platform_device_register_data(&rpdev->dev,
 							 IMX_PCM_DRV_NAME,
-							 PLATFORM_DEVID_NONE,
+							 PLATFORM_DEVID_AUTO,
 							 NULL, 0);
 	if (IS_ERR(data->rpmsg_pdev)) {
 		dev_err(&rpdev->dev, "failed to register rpmsg platform.\n");
@@ -110,6 +110,7 @@ static void imx_audio_rpmsg_remove(struct rpmsg_device *rpdev)
 
 static struct rpmsg_device_id imx_audio_rpmsg_id_table[] = {
 	{ .name	= "rpmsg-audio-channel" },
+	{ .name = "rpmsg-micfil-channel" },
 	{ },
 };
 
-- 
2.25.1

