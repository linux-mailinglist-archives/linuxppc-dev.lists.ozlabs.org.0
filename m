Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C36D5F055A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:51:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf18t2nrNz3fCQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 16:51:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hxt86oe8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.56; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hxt86oe8;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60056.outbound.protection.outlook.com [40.107.6.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf13q2R2Hz3cDk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 16:46:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvFATu+y5LJjbIaUbcsnljB9cl/OdStbO/7Z94A2Aac/GjEp6+4KdJ1JVotVy9WMRL9auk3nXlghiKVpIadjip7OO5T4d8VeSrqNHFwyOlkBGbA5bbMCiCynchtGtupirhTRKnjigGjsMw2iwp4Jbw38fFDnOrc7Zwsy4kiCmNYvI9wxBcmu6MXJ2yW6HxCIjzBfG2WlUX8iC5LZf+98Ynqe8pzPkEQmT7tU4Wea4MzyEU4xyXNR0nw7XljFJ7yZBRKKSRlEsbrL5nZbD0hC0bKgI/kK1kvHT+8cWoDAlguFRnRZb68KKrkkRxFQr/qwfQkn5a2h+gbwNyEq0VkLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHKoZ/w4g5hkrRVBGiXAnTDf8+HzWV9NMppMRUHKI9g=;
 b=aX//diFq2XIKd1BLhoL1ekhC5Mhgtf9zUHFgBvZ2ErrxQP1wTQ+d2n6ova1vmmEI5sR9RpJlmrdkx11Pzoy3pCGSZeg7I2qpx4JLwFtSKvl1OJ1co5ZBQGKC+Tig10CFwxsV47Y/BA5gZ36UpjmOKlu88kEY4j7n2WxNju3gtlOdvwQUP1yeDv3HhAVkByRVZrM/CuEaebiKl9+Mvsl1ITX0yr/2W/uB1GEYHA3nOWZ4Ku5txfrUsi3owTlvcdqiXK4Z7mpxAij8ndy8PLRD6PDimq44hN+xjFQ1FUwGttePvw0gKJx5hG4pOjBnvxSBzI715LtBsRNOaOXNhuTLIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHKoZ/w4g5hkrRVBGiXAnTDf8+HzWV9NMppMRUHKI9g=;
 b=hxt86oe8q54/U0kZPE1CytSPEI9XjpyJfSXc4JBo9K8faWM+NWl9OmF3gNvQg1dr+DHoz/nzm7h0Fgd79UQbDvAT5p1zX0zbDGeW628/pFs8tl7c9x4Uz2gg3z7wokLDeWcbXZ86nvykQJW9P4mEbDqVh8lgxQsPEPMY19JVGlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:46:28 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:46:28 +0000
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
Subject: [PATCH v3 6/7] ASoC: fsl_rpmsg: Multi-channel support in CPU DAI driver
Date: Fri, 30 Sep 2022 14:44:40 +0800
Message-Id: <20220930064441.2548505-7-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a4e422b0-0507-4027-48e8-08daa2af8007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dMbDt2jdEhs37iquwcLcCCTqkwYl/34i1JYp77p9l4unXswhGKEprfxWmlqii0T51HdclNMeBpteT66jWdijO2lyCRkUou4MtLTRB/JW/S2CQu/iVu1QBHiXG0F0hLaB80UM7UH+28vn8oYLgGRp8p0DFkqK9lPPKqxsfeaPPHi7nOVCqT84kn8GQenAqViKfS/ixEm1b62LvbyUrJf9AUYrCKLQ+SSHSYUIB1NgBNjzpEMVxrpw3NseWA0BsSz8ndE75w7W5aLivHAXNB0p7eY9Zq8Ch/mv+ZRsHwaIsuYrgkjgOCi7DoOuLylRsCkDbau+qmimoidCbfa7cZQkt3JgGYWmm/2ZtrQeWtyfN3HEXHcB0JJCmVLliufGng7wqQhk1ZW8EtlsBjtFF3NAC+rqMtB9ew7yEDk8B0LcB62DpmZHH2RfDS5RcJz2vqgqB7/JEMNJPrpxYgVrv6VD4YnYtrTdbpNuHPe0AekCN+hCjtSe673I5Xn2Y68YBMBCcc6tIe1Ulxxr4x8qAxIJfxE2Uw/FvPs0NaE7VD6PnWZpeCwCA2hiMm9u9R8TApqw59ZKuOPg0dN/6sBb4qyM+Dki5X44J0DmQN3gVey3jPKeuWwf10SxIt47PpfdJOpS4fkUkAMDmdqXsSMoZmxnyRu2Sg6ekZUXTaQHF2MdHlu+Q1JEbbXvPbfOWxMtqj9FLvfw7vrxYbzYcKqnpTuTlcgu1Gzr8Iqx7AmAmviiGMGoPik8yyRqua9/TA5ZkGe5AQUopjJ9ueilFuw2DlVVaPcqDi1h/owLfxC8eKNXtKo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(83380400001)(7416002)(4744005)(44832011)(5660300002)(66476007)(66556008)(66946007)(316002)(6506007)(41300700001)(4326008)(52116002)(6512007)(26005)(6666004)(36756003)(8936002)(8676002)(86362001)(2906002)(2616005)(186003)(1076003)(38350700002)(38100700002)(921005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?rJvU6mkRPQYwbYd3nPBaclWO/maTKvL3Z1hVEXkwfKzIRbR+lyAURsLleLzR?=
 =?us-ascii?Q?4Qp5h4PI7xzuNrTFwMKAi2cM+lzBftPxXxw0wElUhr0cCr+RVkxj3Vx2irL4?=
 =?us-ascii?Q?H9hg9QdYqtfrF5fWfv4dekJWJO5IsL14v0GxsWd6rYGBpXzulsIak2K5wM0d?=
 =?us-ascii?Q?Yp76LmsOedHkqhvu8UiAHkBijnSaZpuFH9sYgbHDb/Lt6dA6ySvqAZl/HEet?=
 =?us-ascii?Q?sMs4ejNl0cK8KuNBByzzOKBtL4D0NavE30DJcn3/gxEsvwutIhdSNqFU4Zte?=
 =?us-ascii?Q?6oZPCEiSzpy22REj6SQyPQy9RS+Fbm2imDXEeVyxAwWokswfhZeMSg7P0xAL?=
 =?us-ascii?Q?Kj36FhRFub4kSou+lf8AjMhfF9Zv8DiNYoNGJ52U33YGwVvdI8Ciy46o9muw?=
 =?us-ascii?Q?5cSssrlVHx+wBe/GKhksOCyiCVQbiT/bsZ8rXg/kq56+SvFSEB1a8X4AfGTZ?=
 =?us-ascii?Q?hTXkS40vRCnOwucsPvaeFPZlvyrwbA+3wcMf5nqlhcjBygfop8TRYR0gdrR2?=
 =?us-ascii?Q?d4EYbtOHVZfOPszILUe+AhNwbIgYsz08/VovjfAJg/JkqiqBGQ5wZnlJDfRQ?=
 =?us-ascii?Q?xcCOwQu6Z4kPUAQ0g3X7veYskrj6RJZfdDFj7o/fyh13o6EP6mEH7QluhLkj?=
 =?us-ascii?Q?hrB1pdWSfK2qkAIQr6ENnffFpYOKBovLpqG3FPp5S+5E2lxFW/agFru2T2YV?=
 =?us-ascii?Q?okAI3wxa2T3eCYG8HAEBihQ/40uhbxr9r/5e/RvY0I7MqkURaDLuV53BgKLc?=
 =?us-ascii?Q?QandW3EqLNPIykaOHH/bufcZmTZ8sQgAhWPqk+RBSDqa8CQXYT+m7OFyt6B8?=
 =?us-ascii?Q?w5fc/KUPDbsBdCa1a1ahJc75KDENeYFOU31aGBpxESJN4kb196fhh7D1lSZ4?=
 =?us-ascii?Q?AYSHkKq5qJCQ+Jnmu+EhwBWeWsxkdkqDBGFwZdcXyPH0BHirKvpVswqsthj4?=
 =?us-ascii?Q?/0bU5eJGxjujr/uHsUQ40BZWmewqXUD73+nNTqctUJHuB4tc25rJa6iP3zjm?=
 =?us-ascii?Q?s/cLOCreq2LfL3RChOpQfJ6MtaumhHmnpSVY3auXssqMox7GuIXDWbB+I6uy?=
 =?us-ascii?Q?o18qoii/CCwBfHqkh0k3ucvJyDzf3/QEd8pRYEtLjY7P8h/LNXthMw3b1CUO?=
 =?us-ascii?Q?8ExGIfTh1PycV+1YelVDq1WrLqYjtSzcHJ2ft8nixJkhxrenF6a4zlPra5Gw?=
 =?us-ascii?Q?QoOBwylgRx0sJbM614XKsRybjLXbO2sE6ZD1YN8nIbXP8gzphCdSehG2KEKD?=
 =?us-ascii?Q?0Lq7RsECi7dLFZw05dsTOsbFRGbf1wb4/40knNenQfcs5h16i2d0Y72jelUI?=
 =?us-ascii?Q?8dZJTQjsvJ2VnEKuiGUjSTS2yMePd8sUMvr8u0JtxrPg5kB9anDJabCOOPLk?=
 =?us-ascii?Q?0peyeSC3jHbWP8wzwqh49VKkzGXqZY+ynFpZ3UANKm0Dj6iUI1Z1QFsIqmIK?=
 =?us-ascii?Q?HDStOrJmj9DveCjVD+8VOoPpHeMqjCYDgo8h4R2ZYHvurQTjgKL9nx+Rk9aq?=
 =?us-ascii?Q?qwxnlz63Wvhiy89REAh2epQsvQRzH2Y/toItoXKGQj3LD3ILqyzCh24B4rph?=
 =?us-ascii?Q?5PYA3eWbYN9yadiH29fuqvEkGRpKo6Q9WzL8HJxK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e422b0-0507-4027-48e8-08daa2af8007
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 06:46:28.1346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHJWxY6BYjUKLLOpC/u/mWRgdpuABG6tsigzBvgSwIErB8WhA0iRSZm2jkcpdxX8TAXWRB9nNdutbGPoNwh1Kg==
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

Some sound card based on rpmsg may support multi-channel. This patch
expands the maximum channels to 32.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index fde3d5006ce0..46c7868a2653 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -117,14 +117,14 @@ static struct snd_soc_dai_driver fsl_rpmsg_dai = {
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 2,
-		.channels_max = 2,
+		.channels_max = 32,
 		.rates = SNDRV_PCM_RATE_KNOT,
 		.formats = FSL_RPMSG_FORMATS,
 	},
 	.capture = {
 		.stream_name = "CPU-Capture",
 		.channels_min = 2,
-		.channels_max = 2,
+		.channels_max = 32,
 		.rates = SNDRV_PCM_RATE_KNOT,
 		.formats = FSL_RPMSG_FORMATS,
 	},
-- 
2.25.1

