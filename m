Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD21F873022
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 08:59:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hAWNN0IY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqPw93zsJz3vmK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 18:59:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hAWNN0IY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::601; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqPs11pgvz3dXb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 18:56:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkuC9q7aC539gb/8YqlAxGvzvAmHpHqGpjirwOcXMXTs5vF+XIL64bjv/wi3i2ocqLwv2x1nQy4hK4AN5FJ7dwpkntxqQ2FJv+3IV8XKkTgcU2uz1fyQvDO/ZOKlcXCfbCiTGhxwLwSyMdbuBEPj/g8LqlfSg7OHCjEeVsOhWhp4KJEqCB8n5puOT9nZxyI9ad4FbcxnyrfGEwoFdthIch1E608VXl18F2u2b8sJnkFHvNp14cYYSQu0LEJCbJNFOGj0iNRFkY0fNQtfhg9YT8OCq9KNq82r1FFSwRPjvryx4ZRSpjKbBMWrBf47oQMIZAg9JXgOsQqUY7NVDI+cDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usFJflqaAIQAVMktPObw+rK+eyJhCtZONibE7XKKYLg=;
 b=mwh7puEfHl1Qxm6aWLjkibevS5o6RlE+m644/RvAf9F1NCHI6BiZ5dJpAq/ga/4DunYjei/qLOZv0rtnrfWpZ6zc1HvVS0jit76r1OLwOVEZVUvgnvZmpjnxmTDGxF+FhtENAqozxGhWhFobi69POVXvP0ChjMgHnI2KSChRJzLZvKVC8g3lhrsPXejAkpprDvxns+aSChJamytziF15QVLVtBMF2IchQdlKjWrjkzro0xwgB5iRQxmFGqNU1WKzZt8F/I+cHIAq3bstjU0u6Cy66iPfREyb5zDBNMQ1gMuFBZ2qJ7rGPAs24BaLRHco69LVvVmbt2Z6ZkXiZmU5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usFJflqaAIQAVMktPObw+rK+eyJhCtZONibE7XKKYLg=;
 b=hAWNN0IY/6mGha08sAIu+pUza98hBFT/Sqsnyes3rEBEs8+ktcJpoRa1pUndYQ5x73xnPiF4+R+frpWVTDwysXsl7tiboVdK8i0RdvffvaDffkEJJEfbvMM2YR5KBj/pr+kTFb/DSkM44uk49CeTWLzBPyW6BeHDONv9Jod7Vr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by VE1PR04MB7376.eurprd04.prod.outlook.com (2603:10a6:800:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 07:56:21 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 07:56:21 +0000
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
Subject: [PATCH 2/4] ASoC: fsl: imx-audio-rpmsg: Register device with rpmsg channel name
Date: Wed,  6 Mar 2024 16:55:08 +0900
Message-ID: <20240306075510.535963-3-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 30ce7820-dab1-4c86-7c4c-08dc3db2e9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ohzJlRAKso0PYrQe6XDF4im2e+yUWnfxfcR0Rn8VeOkexLyj9GlAU+KRQ3G0si+nlY2A2MDUXlfb/2b7gjbpLJPZ0PKFMxdyDxwKHK3LzjhP6fpPN8RggW+Ex9P7awDZaSIlszdlrND2dBcEnfUzzhTvPicScZiR+eyD18z7HAy77mPYVugE681+NDhqLx1F0XyecqfIc29QtgFERhA1s1XMmhsWGDSTABk0N4ijsY9u7hQ7dEktVUYl+l1eBSOaVeMXe5VrlAMtwcoGeO70Q1XxXfpm1LFRiotUAmlATWJL9PvDMf7M0W6Sp0vwlIdgoJy1AWtm/dMAdFTL9/1/OrSH8NmJ2EVYI2G08GDWtHtyvGaUUvBuLQDECZfB1EjmAx2xApEaO2+8Y8Z0G8p/BFH1D4/zjUFfGYcoUv7XfPNMS8VxOseBHq4d7jwNt3fi8LBEk+5+8eML/1B5Ia9wfej+lymbkjk9Tjq01Hpbhye0N+EIRzru9iEujmvcAF5B7qix4HX1Mb5qHjU7ELrnz6WyfAwnsCwWgTkXePHxZjTATrPS1LCJGgjamd5wCAMTxQ3wq9D3be80KESt6MVuaGSpK7zOmMMjiCEVjhmLYnniJuaVd5ybQO8WMIJMptZxSNm6893VF0ZWAbxk8U/ih7VnEczghq645Oc7qCswFIbDSHW0XZlyxbB2ge4Y8N2jL5snmd4QSJ7Ye8V8TIdwG4ELlEPb/eC0JNXbuvdb3oM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?2v2o5RvmBg20l4LPfAcE6+RV65KW/8dvneESR+NR+PQwjtwB7iNHgaibYD2d?=
 =?us-ascii?Q?n30bq71eF4Kd/3+8gIkc4E41BqM0x8AjjmD7gq1RzZvBWgAjx6SZs5juJ909?=
 =?us-ascii?Q?ODOBNB5EXEHkUdsONmO9eF6Lwp0bVMojDUt+FaYaH+0J3biWlpg0Y1qGIU69?=
 =?us-ascii?Q?blF3c00SE0SPHJF/baanInM8N5S4qrFmPknA1iCWVIjbOAICb1pOKbaGrcxO?=
 =?us-ascii?Q?sYyEdjIGnPDzvy6HeAaR9gsJu97JqW1RrNwHvP7y6+OtGQhjNmaccgb5XJYP?=
 =?us-ascii?Q?W1+8tFc2tpTSTAMZS2tJafZH8sUvOEULGQzCqh0iNG5Cqna8TPzKx0AGi/th?=
 =?us-ascii?Q?c/+hjpPU94RNPB5S2uaukpBL25mdZvVLBvmqrG0VnXoUf7iMj4rxAgrAnkBE?=
 =?us-ascii?Q?rEbsbEgdgKtJKA20uDsBCECO5ZymDq50C0NuTBN073s4EshJStisWcTGRDzy?=
 =?us-ascii?Q?eeo6y6Ft0FglXSt0aSyLiSRJaVYVWjuJJi8EHt1Vc06DCEqb3PBiIn/S2cIO?=
 =?us-ascii?Q?MYMUrguqfjc8JMgGjm5en55TNCl55JrUczxk8jzH9IRoh8PzjlkbDBEjhsPn?=
 =?us-ascii?Q?rT+etYwHIGx8vOf3hXBhYvWhPB+w7eSe6LvrE+P5soQQRd+lJa9WPwXwFw6p?=
 =?us-ascii?Q?20/2sU6T4R6CyPbmTRHf/1riOcrf+lgmArrzByVYfZkr4wLVxoqhTe6gwaj8?=
 =?us-ascii?Q?dijfg1lqEX7B8ESedalI0c7hMao3lr3viGK0d212c9QpC36jsWTzEtXFzdxn?=
 =?us-ascii?Q?WK1enVK0uZqrk7Cd648VZ4LbC4eozuS+/HlJzjr/vocKKr/R5qalBrB5Dt4i?=
 =?us-ascii?Q?w6xLE5ARHiNg9R8GmYiE2I62s2rS0ZCgiBXsjLn9NiS1ffjTpgDbPt4blR1y?=
 =?us-ascii?Q?HHmVtoDnXU03DTGtgfOvUnXS1o1to10E0wJRom0b0UhSOWTkdBVGamNVj8xv?=
 =?us-ascii?Q?0tsOXdQ4owKK22eHaDQ9JHim+X6Dcas9rPHtycVuXEGBznbJ5ipCcJwQbcGi?=
 =?us-ascii?Q?5yDbas1cQOLXoG1FX3o3UlUFTdOWT64Y8IirsIST/TPL3Xj1ute60TssbZYk?=
 =?us-ascii?Q?Pqk/ty58Yh1K1a5ldKB8BF//YBGgD2Xcw+Za8uAIvvAgpiuk7kWh0qLdegme?=
 =?us-ascii?Q?+5/eXWFoCAlUkX2iSNJX0AdTygoW2d4BBX1YzNq0aKiiKiCyCHiFmPwAosfj?=
 =?us-ascii?Q?3fVK/o1SETTSEiESmDa3Ezt6AM1/Z8JXXLyC/J/6ba9u1g2STArjAr3XY21R?=
 =?us-ascii?Q?JVEtbI3mR7Ze2JfPTvDD74YsSK+vdJqpusNOjzRujnigpmPTf7I9aUxeZ3Z8?=
 =?us-ascii?Q?my8QiuBDSVcu2AA/B3VhdWa3S1HLYVRqqPfegOb+rJigb4PdlJainvvf0zvn?=
 =?us-ascii?Q?LkoIreu2Cm7C3GRoJM4Br3inz4ZLIL8cbb7WmmYE+4GwuP6J0mWJGMaqKeQd?=
 =?us-ascii?Q?Tees957iM/6QYy9u11cl6isawlzf0c4TFfHFCEIELs4UzjRJrsKVTHXLchxG?=
 =?us-ascii?Q?OlRcd10uPAuDlnWEXNQXs74Nx2ByOOMML7GdE8LDMcS/A0SdD47PsW6aB3nq?=
 =?us-ascii?Q?qnoBpyyXByAB339l4H1b7uJIrmdmLGpRaP+ylEYe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ce7820-dab1-4c86-7c4c-08dc3db2e9a7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 07:56:21.6593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoF4gP6BIR22KsKg5v1ATRk+wrkB+Jj5ZOzAfR6z0zFRMJPC7W2hYtaklE2/HUfDGoUkG5+LMm043l5XsJ7iNA==
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

This rpmsg driver registers device for ASoC platform driver. To align
with platform driver use rpmsg channel name to create device.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-audio-rpmsg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
index 289e47c03d40..40820d5ad92d 100644
--- a/sound/soc/fsl/imx-audio-rpmsg.c
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -87,8 +87,8 @@ static int imx_audio_rpmsg_probe(struct rpmsg_device *rpdev)
 
 	/* Register platform driver for rpmsg routine */
 	data->rpmsg_pdev = platform_device_register_data(&rpdev->dev,
-							 IMX_PCM_DRV_NAME,
-							 PLATFORM_DEVID_AUTO,
+							 rpdev->id.name,
+							 PLATFORM_DEVID_NONE,
 							 NULL, 0);
 	if (IS_ERR(data->rpmsg_pdev)) {
 		dev_err(&rpdev->dev, "failed to register rpmsg platform.\n");
-- 
2.43.0

