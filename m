Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA0877ECA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 12:19:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=EVCuDCVk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtZ6P1GCZz3vbt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 22:19:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=EVCuDCVk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1f::60a; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtZ1D48FCz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 22:14:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMdEP0eMkUcU11PDBdAw4rbf247ZZywF/OsJsF+sK7EC7mG4Mk05QnMWHtEUDETG1rXXj9z+WHug8GszHFSyhg9HuifyY1cleomf6vI9VJadPqkUeon8/NT+xzD1WTlpE9KuYCl29Y3I3Tpxh7+cdFwyrdaonm8LxGK1Uw1IOZPTrLjvI2H/WDNWrzzrQQPGX30AjEM2fUYyYsCS6PDm0JIL82f/I/nznNMUdi1zHS/jEqrKgi/c0hCJDvQOIRwoQuAxjRLqNqDB7v9X+Eynqt731WqzJHX5jYRWa7YjOx1IF0+d3AyLNiX4dkEKy3uVNNQ4WefX4xMM/azOrDVZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usFJflqaAIQAVMktPObw+rK+eyJhCtZONibE7XKKYLg=;
 b=h2+rlVEGd2WP2rin3of4DofefILKICr27XGKPmPta5q9ECTmNdIJPOYznQ8EYJZ9qhicpv9bC57lebSKjEFB9MD7f/V+K8mDH4br+ScQPqA3fCxgkhKnvPCgu0zZpqd0rJOnbth/aftpvKotPRYO/WyWGAouacjpGxEPx/LHbArB4LODw2hXYofr0XLzGfREiXaNYQYmDY5unCu6qYZt7bCGKk7B9yziJ1buCH1lAgeRP7xwh4pKjbNqGZtxAAt+PaWMqaSj/StA6uuXKdVxtYIYGiXI7OlFK1aL/u5zBLyUAO2gxaQETaN6Yv1+7lykkg2zChLk3KAKyqokVgJTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usFJflqaAIQAVMktPObw+rK+eyJhCtZONibE7XKKYLg=;
 b=EVCuDCVkVl2z2NpRUN5jhckIDBw7HugWuo3/EC0zXo877UDhGAAY6Kp/Zzr3vFiXFHIvaK0s0AQ8KYv1N7/M8Aglw6h3RHkr5fUgMAExE6Lxn9NTmCXxRZKA4H1/fdVxZrDzAvmegXCBo/i2Vt5e+NU5Oixb0yOlF7MYmORsHGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB9145.eurprd04.prod.outlook.com (2603:10a6:10:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 11:14:28 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 11:14:28 +0000
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
Subject: [PATCH v3 2/5] ASoC: fsl: imx-audio-rpmsg: Register device with rpmsg channel name
Date: Mon, 11 Mar 2024 20:13:46 +0900
Message-ID: <20240311111349.723256-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311111349.723256-1-chancel.liu@nxp.com>
References: <20240311111349.723256-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6a5f85-312d-4608-7aeb-08dc41bc6b0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	z4YKP//FkGWJWjXedlif15mYH5DI9SOZi4o62qPaCuRvfyTzgNJo/KKUB72fkTxyDcF6/IRQYhbLEZxt7rbtAvoTOPsIrcfZ573zfvrqAADJvUEZ6dg26I5JFAbx1BSdxR7D/Vz5Vei3w9m1WbKavBb9VXS5cEy3SQCoLUZeYpxxZO2fdmzb+URdSUr880VouEMzpbDXY/043HlDBweW7lNSj3lFF3PmoLJ7+0oZFnj4FKacW9nkWyNnijvjJp5wx0e+jDzrbPoFsdunwxNX7bCPjmvyq7W+w//nI/e18jS8PgG0dAeOlBaymiy81NLom1zlsBWiMxZY5XdpoCAcZ56w0/4W6NQvA10vRPf7yUAhevY0RWVydivXq/WptRzvoCDGXxesBITeJvYW4+5yDqTZGK0v7H/NIfWQvy9tCDgfD0Qynn9Ui123kO1LurL/LqsLOH4zjVSZfsUkNOoyBhAEeQeKh4jLwH7LsxMEzbvwS5RtuPUG4GRVa4ss/rFD4xCmliP1rp39Lku/9/7aA7xLXlwvKyoZlyTFLi2p8zR2xNN9sB6X++qEb7vbcvhOFoNFFLM9F/7KsSm+TrjqzP+QwM5xhJ7nuLdkwbqk2AvEEUSgnm7tjVjJpovNURYoEif4xvvKLebpuLvq3aez/+cSwk/n1JGNjkxCy7THKl0pPh/bDWnVcZmJv6t+KczyqW9uIMFaWDKmEtq25JwW8ptYhMSznSXtwZz2rVSO8uU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bfNzYetF4HRvJi3PD1cNSNd1V41TcG2Co8pqBeCdhItP5WL0/AN7rDR1Uf4Y?=
 =?us-ascii?Q?CeP6lPbExuhB+z/7Qvq3GOBgs8bZtIuVMPUKw0oPZnCamY7XD4DIl+aqLAJf?=
 =?us-ascii?Q?U7U9pPFcri+R1a1Fn9EfuR5219KEeC9vOnoaw1EIxXB/b9vwB4JAoG1iyOQh?=
 =?us-ascii?Q?87AL/GbIRTXGgwjUBz0uudiBDYeTEcxcKX8gSxUVTEKFeSWA1cEwNwQJ6JDc?=
 =?us-ascii?Q?H5wsVQ7hEifDeuM1VFYMfgSSa7S3tRtgtMWaPuPV9puiXvJvkOUfZjUi3g9d?=
 =?us-ascii?Q?f25OyOc7dfKZJXdfJJQaqaoW2DPGwkM/ODqkM1TmdDHtxbpXgwfaKpy0ZLVh?=
 =?us-ascii?Q?vKY0f42h9pt2O1oXqIUMjmqNsD6mG/hMNp52cRbwyS78KSIWedRQJ3qBbyzJ?=
 =?us-ascii?Q?3RqWa4tbQ20tJ8LA2kBlcHsZgHsbZvOtIp1wObfzd99H9ZqUcrFDTQeMypmf?=
 =?us-ascii?Q?fgwmSVwDr+eYgHKWbOSgSSxlyU7vIIHCfRVaMc4W4kvPvPO+npM1H4NIm/xl?=
 =?us-ascii?Q?xmVwnwqF8tawTSVKJZZnd+/irLgvgkzEnbMXOzBP0Lf3UVi5nxHupT+Z3W4U?=
 =?us-ascii?Q?JsxmOlfbja77vemiokovXaLIUIczvlQf+RgGSRATKaunvUQxtz3tsJAMSx1m?=
 =?us-ascii?Q?RzxT5WqbtLjo1x2jtrbBLCqhPl3/hy1EuaalEODWGh23JlM8kn6x46D1VD+L?=
 =?us-ascii?Q?9bX9pVTQNNUNT0xG6E63Q5o2wWI10nQMVxOfsmUr3rvJ94BdtUhZyHu9N7bX?=
 =?us-ascii?Q?AY+GPRrnLTAJL33x4UaXskpTef/VEcIbSLc2fkRoYJW5VVc1h3ijutcAbVwD?=
 =?us-ascii?Q?misl5Z879areBO2aoXZxf+UjEcfxLm6tClldxnTpsOqh7DgCECwkCatwZkx8?=
 =?us-ascii?Q?kMzfasMj1+k3RAhh2Pwm+J+uHZGseQq2xpuAoVKjc+Om4INcOuT9pkRj6GtX?=
 =?us-ascii?Q?jjVVr7eVpNTB0E95aCXx9YfiDO8BeTQbH3Jor1kxJ9KsrvUkFi+6q8TFYTxL?=
 =?us-ascii?Q?/dKqit0BLxb34ZeIAqMd4JW4Lv4b2zqQJ0BjmmtDakzQc2zVufRbpGTmkopo?=
 =?us-ascii?Q?V3R6kUaHLHh7MCN+JoQMZn5yMnZXSbZp52Dip7m5qJygivQIFWjmlUmOUrwV?=
 =?us-ascii?Q?w3NSucFedJXSuFjeFpKQZZ9SFZpmvbp8gSVk+2t32GExVbcUK9XzUpMNlrTB?=
 =?us-ascii?Q?hMZVCApA3VmO6rLtR7Ah//kQ1dEi71s8C9sDGMd/gyZ+aUJn1MWowJ/JpQSl?=
 =?us-ascii?Q?I8xhF/tfIIWMuswhVIFt0AZ4EUuRYWGFE2CVWbKz1RduKIKji6VMk7uQlftY?=
 =?us-ascii?Q?nGig+v2PlkdQn8IQ4JAZKdPQsLQBNBkgRo1wQk1i+0WeUfcCbkPQJnpbQmK2?=
 =?us-ascii?Q?VUnwYDtq0zlmg7B8/3lX+xk5ElrNuE4O+gaNDS/qePvtz2G/+41BnmhyqEEi?=
 =?us-ascii?Q?IAWE3CVl3jYvfdIsf1h5tv2BvBt8PriKhKYb52JtY/naz6Lc6eE+OAAKiZXJ?=
 =?us-ascii?Q?6fSbj4H6JCRf+4HYyodL63ts16TtH9Ag3ssjs+zDAzoTVPaCtWU6S3ZdqjUw?=
 =?us-ascii?Q?dwG5gv08mrTy+bRBkDYID6P0LRVHxoZ/XCVLRG3m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6a5f85-312d-4608-7aeb-08dc41bc6b0d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 11:14:28.8908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkv8/kGI35tjvf7e2fd1gUl4RdGlFQy6+un4sTrSVk7wH7K48dxlPQZ0dMKtC/ZLdDMQkkbkfqLwkPi2U9e58w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9145
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

