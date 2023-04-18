Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AB16E5DCA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 11:45:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0zYd6CjPz3fR7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 19:45:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=S9rrZ2Qu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1f::62b; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=S9rrZ2Qu;
	dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0zXh601Rz3c71
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 19:44:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFlThUNOomqT4WodGQFsZxxqVRXHgfQLUbgU0MTk2nVrCaYKXOmfzVKghpTFv0uEaxG12ppTylUeFQSxRbGhCOuOJYhskPZmtOHWtxxUu92zCXtdwuW/PwQPmSkje8qedDe1u2/vMC3fe1TckTsD7hQiIEaTe42nozc7jy9x7yznUXP7KAqnSV8sw5V5cqXReMO3nanCF1H0hlrdBtX09LgLWTZtXGT3VgiZ5Kjmb8y5b/a6dwJcPZSa3IP18Z/w0quHgYPN96cGcnNaSMEE05Ixf8VGsrt6g50A2D9isL9VbPZYbOCH3NR95oV8+6Ew+63uhmN0cCtmB/ZYm/VWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CONOyBLJv4/5J6W0ZZNJfSClBAR7ADjSUu8dGxs8Zvc=;
 b=JJTXam9pYR1GCBGdjdN83V6zJGOFriQIHlD5u9tSHD3l6pbOTV0WOXYfgVDVzweY2fHlVXHJZL9EtGxqfbYHFPia6zZatCsEQn723YNiduSrBKokipSshvlwX/0e5zWD1anxBeVVTEGYQcmbezj4RLx8aOyZPN/6HR4kc6No8mqK/ugEYrNfmqNk9YU1EvkB1d7I7wIH+y+J5DO2WiNJp4kZE0mdFO/ZLsGAZIJNEeSPqb12RwQdW+YaO79Zxzp/tM8d7sPAhMxXOq2n0yvdoYVs1MCRiHrkCsini66bSKJ/JwHQRBtRrtJk6qd+X1ELPujc517KY397hv2C5cx9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CONOyBLJv4/5J6W0ZZNJfSClBAR7ADjSUu8dGxs8Zvc=;
 b=S9rrZ2Qu8ibcriFnKHLMFoBMPp/Ze5ke/Bncki8whz2jmWQHFfwF6GHDUmKrlBlDmgnng97DkcWZBmgKPfOCMbQP4O5f1UEnmH0U3uBqpmmGdxjf65eDxteLH30Aha/CIaZfvQpc3HznCjkcuIAVdlkYOJh7n0pL1Ve4biuYbCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Tue, 18 Apr
 2023 09:44:13 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7ec7:98d4:f0f6:f13]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7ec7:98d4:f0f6:f13%4]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 09:44:13 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com
Subject: [PATCH] ASoC: fsl_sai: Fix pins setting for i.MX8QM platform
Date: Tue, 18 Apr 2023 17:42:59 +0800
Message-Id: <20230418094259.4150771-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|VI1PR04MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ebcc95-4207-4ebb-b3a6-08db3ff17790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	u65xVpZaZfL/CIHWsEOXxQN/4K1qXv3+Ft2rXvF3atC4vESig/XC9HSGxxqZjh2jTa+0xevr2VwgvO3X3qk0s0bBjhzqlTcBDBTV2FctWJaHb2r6voSAWHyw+6Y8ScnBBk+Oeq09wfPVObFOjK+wizZ6jNA7oKmOpRaH/bjtGXdMOpV+l9eSPn9xhzVyzSm96UX6uIUf6XjhluxAYzFVT6z/duIl2XgRUxbAXcU8D7aFiPCi3U/gS5mTwUt+Jn/1OHHMzTS/zFdelJiqEaHyIQq4oo7wj0ABGyZN/NgGIZrupKWh/Lyyo3wm+8i5Ciia/YiiXjpAKpVM10O4YCzi41fqBBwtQLfDLyqLLyaseWdliXKKxnW1VSRe6wjj84aS+V6u456VpfH+HLbNroAGwmAwfnRTvlZVOuM9a+EvmXMpqEW3GFlRME4HuL2vVzyov6/hWmI1cnRqx5vnII4/SgMdkmY0yzAUIV2I6svnMlnu/Gd+3UVPcpDcb71XvvaHMTZufqh3Zj2/kKGBZq3YGDlqfnnuF6iNWmT79wHVEQAdDzbGO2iuJhfMlBm/qYapEnHzsrAsPEZSASpN9EPGPaunNkP4A2hBfrA7OxENyv0Ud/O0zQnKSsXme2EYu6R707+vot9vqjRC1u1JCaNJ+Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(6666004)(6486002)(478600001)(86362001)(36756003)(2616005)(83380400001)(186003)(1076003)(6506007)(6512007)(26005)(38350700002)(38100700002)(52116002)(921005)(316002)(4326008)(66476007)(66556008)(66946007)(4744005)(2906002)(44832011)(7416002)(8676002)(8936002)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ONfBTI5O7wp/DGcgfVYQoX7Q0ljqvqn+0qbzRSQeWVFbYsNyOYTcC5+ifTGm?=
 =?us-ascii?Q?PBQ0A60daEYGbqjiJFz8SHSGfbyzpzWf/dZoE5gv7nmRjXhKh3LIzrBM623V?=
 =?us-ascii?Q?Qj3S0HFUSgb1V5kXX0hqFxEkldGVI4fW0M/pn5M1uC5iAkr4SyNIKV5Hk1ly?=
 =?us-ascii?Q?O8huuwgdB0b1VNHJFCei3njO9/MIecr5CWqyagg4g2UVTP9sB/InrYrzGn7u?=
 =?us-ascii?Q?yILIurSDKMhIz263GjFbO+nqrVkfU+jGY1QRWYpTCzauRAn8YRBHGI1kP5vV?=
 =?us-ascii?Q?2VV8m1WFCLZPODw6JEzaHmUIvlahtJxI9Vgf+3qNsCWR1S37RXY3zNo739kc?=
 =?us-ascii?Q?0WJAuHrC2vu5JKzz1ZvQdIsrebBG66apkZiijl0ZwtVyog0du2brzG1pPv3z?=
 =?us-ascii?Q?MeMH422JKDHMWwZznLl78VnHNqNKU1juBj6hPGY/76uaGa/T6iUk5xoqOGnx?=
 =?us-ascii?Q?5zsiPlAUfES+MDUbcL7MwNhqegI2WFAGYrfRJNs/uSoOR+iczuJTMw7376MK?=
 =?us-ascii?Q?F7dp+VxJ0oYKXJU/m3JyvMF1tPm3mSfX4TTzEjvp0fC99cXgvkjZ5K3DToOr?=
 =?us-ascii?Q?zavvX3qxaKEuXmBlVatN26kPnpF76mxbCnGzFdPhjjcqqsgikCY0AXkuDFcN?=
 =?us-ascii?Q?7wMjPlrGpYYK6ys2IjBuOYAxP7A3e5U7/GmXO+9sfWXJuMvBv6ppVJ3SSufV?=
 =?us-ascii?Q?bwnXgM+Et89F6CPfxGJV2glRCrCrVTFzOYEtFqeRj0DGqavPqTLybS6Wq9Ot?=
 =?us-ascii?Q?09x9je6MSK5P5It7gYaFNhxLWSNNxsUhHs1HyieleXPb2OaJ97jr+nn0BNx1?=
 =?us-ascii?Q?KlEE3DcFIx/+LhYEC0w1wx9aVaS0mYUqK5LFfaitprCD+urPOsvmHRyJ3AfH?=
 =?us-ascii?Q?vmYDnf8cK/JYl7FgIfVKhCEeHsLFK9XCxqTXYOZBckQUJyYDtLBAVxpniFYP?=
 =?us-ascii?Q?4qjtRbkRbe8PE/xXDRVP/t/IIR0GhAsKyTsqXrVitEm3Qzjw3Pju8TINjXkj?=
 =?us-ascii?Q?DeIP+PW1BXxTLxSTXyzxXRxMPuaxSFHeWB8VaxhKy77KXqIs/FYoPQKiWzkQ?=
 =?us-ascii?Q?lpl/eXC2YaR0QoMbwoJSZq0Eyu3AIe/LiN6cwCU5WMKt63UYAeWDBzVMyajN?=
 =?us-ascii?Q?jJiqoMefUaFBpiV9aW4bPSUuVoJV/pKhr5436SzMASn31kPYMYpw+ZZpgjh8?=
 =?us-ascii?Q?9xmKsIjnR94j5IVsSXNt5LRdCl8vkKIK9pv0b3aieScK5NcBNwRW/HcBLUMT?=
 =?us-ascii?Q?0h5ZKkSfKU4N0Jiw/WLJ3/l+cP/3pAer1x/75qFmaPWubgBq+YYaGscH3tHY?=
 =?us-ascii?Q?uRpwnlMirsuirYKX+ZZWmGEaNhAIrPTNIkDbO8e9G8CbpwghQi4pZtsDyvx1?=
 =?us-ascii?Q?63LXxo9gZyGLAdPnbED4EPgsjWcDtdCs6AEb93Ls6wlFNL7uuSUlKVPGaWo1?=
 =?us-ascii?Q?8jZmTO8MTqBo8/+NdLFvJXaA252nLnC03cHXbkS/m6CNBDIMV+w6WVpvbY5H?=
 =?us-ascii?Q?xa14s6x9Mb7AtCVXc26b8XAwnrnkqXGqOdMPuZQ6d6cFBF4Av8y+3Hhi/CoO?=
 =?us-ascii?Q?TGCEiPXyjE4qpIeJj6uO0Ua+0r/cBpjuPX31qJ5X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ebcc95-4207-4ebb-b3a6-08db3ff17790
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 09:44:13.2459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOozvwtiSdaqQufriEU0CypBt55TFNZeJ0awNH1fZyyK2i+l5gv2gZred3jrGgwFdk0ZCXA//OPtDyuWswNekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117
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

SAI on i.MX8QM platform supports the data lines up to 4. So the pins
setting should be corrected to 4.

Fixes: eba0f0077519 ("ASoC: fsl_sai: Enable combine mode soft")
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 07d13dca852e..abdaffb00fbd 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1544,7 +1544,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
 	.use_imx_pcm = true,
 	.use_edma = true,
 	.fifo_depth = 64,
-	.pins = 1,
+	.pins = 4,
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = false,
 	.flags = 0,
-- 
2.25.1

