Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A72887301C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 08:58:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BoOULznL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqPvM6S2wz3vcb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 18:58:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BoOULznL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::601; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqPs04y2cz3dX5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 18:56:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goXPG34nSduQRfkAYCd9NUTspWHrb7giIeF6hQPZhGgQGx81wt/fAwDhquLsLSR+pGXsUGglf+3/hI26npAS7D798GYVIko5ETx+Uei7O+ON9wiYMLb9FCeIiXBTLlAxpbYTiYXP39b+Q8/AY0+t4zBzQi54QN8/ty51fNY3piHBEmVrjNUa9pN0AhyB5tx338fcFlfK6gKF0/RgehQVQsD551XdBYIxOxHlECbsMSlMdgNeAKIlsGP4QxkOe2gtKmoELftBfM8JJsCwPepuXz5IRsLzCKQbRoibiVFsyN2tsFmEqChcPiZzqbVNgMqKQsacU2B6UQEFRhMGMO+Dkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbsh0ootkphFdcrrwWuCS7B7NeWjjhCbN1sssmNZ460=;
 b=OXnLpbL5vQBiFOBC8VNbJ7JqWcwLQ6tOekXs6MEm9HbtzkElL4xKO32kUxH8drW23uU4KBsR3V+rIlvyTo2szaCXgPBg1Oud5uffn8DtEa0fC7dAii8Wr57HgAPR9/c6+z1PXn8s2iD9co5X3f/IXlSiABIM/lCa0GI0dUpJO9vEOB5EflmLB5oPUpvw8QeNZrngfkmk5pk/b30CAS/6Mx3s6UgLzxuciON8fN/3FUh1chBaA0MLXgGbidiYfEIrpO3a5w9sMBi+V8/CWiTCMZGFmdFpw7PZqO5BtjT6HtOrHCFdwoshNuZWYGvo8CEv6kBzYv8Tjqq5zjmUHIFFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbsh0ootkphFdcrrwWuCS7B7NeWjjhCbN1sssmNZ460=;
 b=BoOULznLMRvSud73/1jIOlFdAZDURdlyUy/ZAuzaLGLTHkgQzOPM3+I/Gc5gHe+EDZrfqauVd2HcyB69o6JwbpmPKmu8zh0AWO6PEZnN1smidXvOKH2U1HcZ7sKcjrOKdTVbH0SagIT6sUVCIWujNyhHaktzGl/wtM0aVBDfXN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by VE1PR04MB7376.eurprd04.prod.outlook.com (2603:10a6:800:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 07:56:16 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 07:56:16 +0000
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
Subject: [PATCH 1/4] ASoC: fsl: imx_pcm_rpmsg: Register component with rpmsg channel name
Date: Wed,  6 Mar 2024 16:55:07 +0900
Message-ID: <20240306075510.535963-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240306075510.535963-1-chancel.liu@nxp.com>
References: <20240306075510.535963-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|VE1PR04MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbc6de1-481c-4bd1-8273-08dc3db2e6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VgAO4cgjbn+eASX0QrHLaagJML+x/WGogIEVoui8D6cV3Y7ftXp7VDc1GhJ8oKAhptPLxBg2lZJooRRaTbv/QlRSr7375rjVWiJPGx4VCuhEtD2cpSrk+KMb7DDw9XbpWVd4+i7O9xYMq1Q578Tb49Wpc1+fo656sYBeOqKEIowmp8n1fZrgzXurT+jWolC9HU9XLGxuyZF9TabbEFrC6t2TTJEaW/rIoq2hUmyWe591bO/Ie/+3qMJ9zoCrNCuPa27fwTVylbvmU8AefCPOfkX63cAOoRiIVNcj9YmbylPxkc0n+7sYEXINMdM7eLLekSZv8Ui7wbxUCpMuUpY5BMFKbd4UZQ+waJbqqdijFSbMuPftQkx0Qd3RJa5xzcJNX1ypdzHD35RMnsNtOKpK37jv5WaFPSEfxVHiyM215gNLug4WA8gMl3ZC7966MKTiUurbu1qqHF/MeaXm1LUq8+25QIiUk5fckdDHoagkCeA0l6L4RX5sH/iq27HJQyjDnM3DiJjhr7hPqR+6CQ/L69877nmJeDTPdE1gUY0tQcSg1oi5ULu4SBZ2UUKsbb35vwGLMSZRdxbkbDkSfstQThTBJl6ORQTUk83kilo+awLQQDGO8Yccxlxop/5mEQuSq+ED18/C1AHtpmXka3bSa07hMW8ZxAC1jCAueQ3k6TQr5vAIqexqPPKTcFy2CmgGmWydXTgHjh90SyUupXNYo+e5Eup9fm7zQtLtOTRGBYw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lDwwzhr9FKhKY38ezFsYmHH4fsM120PeKZnh/Rf1/+n4saR3pCNpgVDGaG0o?=
 =?us-ascii?Q?bRico1NivmgmhENX4VXWQwoBeUlgc3K2tYib/3saTnu/+9Hl94IVjfnLSVNH?=
 =?us-ascii?Q?gr7z3DyaANYPean/eFmdCUwHW7kvY/g0ylB1GgslN5TCZXNTS591oboSLdX0?=
 =?us-ascii?Q?mNO8WhG8ywjvUmBHLPRi35ZtEJygjHXkZnLXk/CoAnXuI98vXQkB4mfbvGx2?=
 =?us-ascii?Q?TWKvJwMm732wqlHIdzZzOSd6Hp3aBqjA0VbuxmepOraqQQcYkLAr//NlF3kn?=
 =?us-ascii?Q?SWxuVk6nbUmC4JFysiwf5oI7ZBPlkENP/a+NagelcNLXadAOEXdKThROpVxU?=
 =?us-ascii?Q?wposZa4554UzPCqmGnvkjofahn0aPakAC7aM5HStyXsxr33sfgT8u8KPOmB7?=
 =?us-ascii?Q?rqXrHY+6rFyKHrJS0jyXD9ujYTuFBwBCjWOusnXUG0uCQ9YrIXEwYf5gjDGA?=
 =?us-ascii?Q?o/uvhG9bl1XbW23woA9fUc6IAuqmxthtodoo0I5CBvGmihClLDo6i1FhEXtC?=
 =?us-ascii?Q?MusHp64j6sygFmI/868XdK5JPRTg694j20eai508FbwwiVJKtxzfDMkAVyTW?=
 =?us-ascii?Q?FhQOn80NYnRdhUj2FzH5n+bwAuUCKD+h6SH9hq9TBCzMKwGf8lQkjcpHBnfJ?=
 =?us-ascii?Q?V3FOLLxjrXmctk7iT07Cz8zujR9QZENZTJgA68hL1GZtlrSK/JWi5s77UU1n?=
 =?us-ascii?Q?/lwigu9a/3POzVRba+naf7VbttFIQrezc5ZB1OTH2M35xDcpGnND9UrNx4F4?=
 =?us-ascii?Q?4SiQCbc2r7WzsXAY9R2FhNfsGPeQXNn9cl9/OzmWEU3S+NBfWkOWEa8D5qNT?=
 =?us-ascii?Q?MMHeNR6vP1IRuz+8F5jRhl2AE/+oOzGDoDbbeMJkfcXFjaDSM6H9xznuZ0ml?=
 =?us-ascii?Q?qDP9vqEpW2ffvD3NgYn2soC8qAAUypnqypL2LUaaMMOiAxJ68NIZktY7vL/S?=
 =?us-ascii?Q?BQC2m+S36u/XBPEDdH/xUvXCs/+5WOOPvHcp2be6drHqLq1BystZrUpsbtT4?=
 =?us-ascii?Q?HdITDdWyrugRT4sFwlWWRhqxfZ+KZd/4qEr02Y4Sie85oinYRzehne3m/Bk4?=
 =?us-ascii?Q?JQKQuQZLo4ax6PKk1zkG3tzp90OT+EO7gjPhRTYOSVd2AL3alPiDDEOFTIon?=
 =?us-ascii?Q?V357HKcxOVuIEIvwWqbQPpjArVqOHqhtBzfFfG+ytjh46hv7MfZRJcVasw5z?=
 =?us-ascii?Q?Ptr0bmYq52YhXZ+ViYjPHREQkcLVdrZnXnU8uJ6U8Tqp0vH+IIadF6i5cRi/?=
 =?us-ascii?Q?1J8GKAifmZqNPBDEdK3ZXO5K4cq10Fbt8Kr72ol5YJVlgzbJenvEtXHSSQ/q?=
 =?us-ascii?Q?snRJfdJcrFyzNm8L+kBGkXhvumKXSrCRy7cApJ/IUxAz+2NpDd8JnC2QvxN3?=
 =?us-ascii?Q?xcercilASM0N5WRg2dKHRgEyQY16KUqyp7YQDVhl3+y8Z0aIZ4QmfasMJf1y?=
 =?us-ascii?Q?ytW7+QR1uu6leV4eCCpyNndqvRXl8nqxbULu3mFBGm2IluFJgIxTwqwbUWJX?=
 =?us-ascii?Q?nhAL9tcTJ1ctl5s21pP5tkta71Ie8aeimc6FLNLXbO/m65HK2gosXq5XW0nH?=
 =?us-ascii?Q?Ozo0qtrhVLky5L/LHl+owUdCY2ZJs8e9I+PuNq75?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbc6de1-481c-4bd1-8273-08dc3db2e6a3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 07:56:16.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuyBNhfc/CBCrZKKIPp6/M4Dqo5s1QJTM/Qqw9S0Hh/oKPfscDUDv8fpLttu0vpg3Wc1qTbPF5MOy5OOUU43iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7376
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

Machine driver uses rpmsg channel name to link this platform component.
However if the component is re-registerd card will not find this new
created component in snd_soc_try_rebind_card().

Explicitly register this component with rpmsg channel name so that
card can always find this component.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index fb9244c1e9c5..2b9e4bb5e0f7 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -732,9 +732,6 @@ static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	/* platform component name is used by machine driver to link with */
-	component->name = info->rpdev->id.name;
-
 #ifdef CONFIG_DEBUG_FS
 	component->debugfs_prefix = "rpmsg";
 #endif
@@ -822,9 +819,17 @@ static const struct dev_pm_ops imx_rpmsg_pcm_pm_ops = {
 				imx_rpmsg_pcm_resume)
 };
 
+static const struct platform_device_id imx_rpmsg_pcm_id_table[] = {
+	{ .name	= "rpmsg-audio-channel" },
+	{ .name	= "rpmsg-micfil-channel" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, imx_rpmsg_pcm_id_table);
+
 static struct platform_driver imx_pcm_rpmsg_driver = {
 	.probe  = imx_rpmsg_pcm_probe,
 	.remove_new = imx_rpmsg_pcm_remove,
+	.id_table = imx_rpmsg_pcm_id_table,
 	.driver = {
 		.name = IMX_PCM_DRV_NAME,
 		.pm = &imx_rpmsg_pcm_pm_ops,
-- 
2.43.0

