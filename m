Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8E46BC37
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:14:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7gkH5Wtfz2ymv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:14:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=Mi52BNgW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=40.107.255.130;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=wangqing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=Mi52BNgW; dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2130.outbound.protection.outlook.com [40.107.255.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7gjS3r5Yz2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:13:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQR5PtIfQZd3VzSQ2IjFIFI5VoW3qhfF68+/wbU2cNLJ7vjy3euB/ZYlhPKGi/HxT3WE681U2ldoteE7NQrO1YKGlx6pKuBCPDtpvXNpFxXQMH/9QuswdTuQoN+YB75BzPJnOpKUgg7oPxkhXpVLcBgtPOYgtR+BAgAy4zaqshZrF2n/v17JbYEfL2Bcwfp51ycQZgiipvr6f9rlD2kd5dKrPg12/zC+LcHcoAaiaq/ik5Ia/9v35M52w11IRVNkEc9jWXfI/egcHFIjhclrlOMdmzR9cV/8/5MSfvmL0TD/WLfL167blXekMnqA7Qratk6N54HC6/+V+4GK3v+Abw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oy6PvJAcwgcCGvjUqjJgS4Jnugfiedl0bwvStSCFAG4=;
 b=eRu5vEQcNNT/6J/+0/eebG6Jxvb7YBfC5uKoRNnPJlIORGFENMSTQZOmzjiGq+ZzwRix8Hq7R+lbL214ZKUstHk9catrRspZeS4HeqIA5VzON5HxSjPV0toF3RPwWRCObJkPpIpjpHBS/kLgFJxwgYL75JbU0xFIp++uP1Mg9n49K2+wd1nOaNY+lLN2IvaOxL47n0EVpTbDcEZ5Ni/FBZlcTa2lDM7rWEyCP2TDnv0madrKWpeMM8uvl4aM/4yM7+C5Tq/IZTb3ckW7fK266Y5NM/CJ+1mmfHn915PPcjD2qqNlauBMV4NNnWiASw9f1e7oK25H+um4nDytk6ZfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy6PvJAcwgcCGvjUqjJgS4Jnugfiedl0bwvStSCFAG4=;
 b=Mi52BNgWDJB50bBKZvDkdGDYzWsR3qVzYlbIINWPYOdc+kMTDaoGwoaCQH3K3e1cNOJwSL2BidxgGXilbAVq8/CHRJJztp9/0f5yeuM8qQAY3SCNSaEX6OW6NzIZu920860yIQ2MnJw7c7yWKzHWJpLiqu3cC6gdw9B6ef/n2IA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3388.apcprd06.prod.outlook.com (2603:1096:100:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 12:57:12 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396%4]) with mapi id 15.20.4755.021; Tue, 7 Dec 2021
 12:57:12 +0000
From: Qing Wang <wangqing@vivo.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] sound: fsl: add missing put_device() call in imx_hdmi_probe()
Date: Tue,  7 Dec 2021 04:56:58 -0800
Message-Id: <1638881818-3407-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0212.apcprd02.prod.outlook.com
 (2603:1096:201:20::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (103.220.76.181) by
 HK2PR02CA0212.apcprd02.prod.outlook.com (2603:1096:201:20::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4755.14 via Frontend Transport; Tue, 7 Dec 2021 12:57:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d751b8b-ab56-41db-0286-08d9b981164c
X-MS-TrafficTypeDiagnostic: SL2PR06MB3388:EE_
X-Microsoft-Antispam-PRVS: <SL2PR06MB33880223E7DAFFC374BEF712BD6E9@SL2PR06MB3388.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zu0pz4PwI1gyAoAvdDN8OuiKtk+6Uu67AZo+ylvT8oLiKjiEnUdqI2fqUzH7XLxlEe+HD8ZSxmjO7P4S3KRChK78t00dPe+5cwZ1LO/UUMksaHoi/oy/rpa39VfrZ0edDqknpe+HlzLeBJnfoXQ7yPWO8Z+4Lnq9EoUpQmojk95oU/9MujWuro77omA/opFA7gRjthWQdLeCFaS0S3M+qtBQOPMdZPI6PH7NY8uGAJyIzhkq92ckTe+A5NDJmIhwCjR38tkflhS77oRhpBAqUkTqTgU4Hwk5EyoWZ4scXTsDsY3FWT2F4BLYnw6jwo9UW+fxj801wQ67quYKwtfhFB9fukY87l7re3yRoWaPcLbU43Vx2BxnK0R86dIvyfzke+nAoQ5nVTdnQ57gF5bD4oEyer7cTrav19PMvMaCTEmUMAIC3Rlkh9Nqxdt3vg9c9BDaKN/Uo+iADxqrXTZX3pfyi1C2/6MY5GDL+j+aIigYvHNgRiO74ivve3QQrXDpOUJJDGM96V63rIddyyPIQpQP2Dd87d5O1bQcJr58yZVmUZN/PlRf26Vhimkd9noFymJ2wbbtBTObauT0vDhBP4mT2cdHzFCmBpr+Bp5Q0SPhmF+mWyZ3fteKrojYPz4O4uKChprS+9mjHimRTviW5ZtFZ02D2A1bkhPB6FZkPu1eob4zkmNF/PAEpYOXH90+IbA2PlUXevRfDQT5zsf9ReUAzA2A5BrlYadmE5O1Deg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(186003)(956004)(36756003)(5660300002)(38350700002)(107886003)(7416002)(8676002)(26005)(2616005)(4326008)(6666004)(4744005)(316002)(6512007)(6506007)(66946007)(6486002)(508600001)(110136005)(66556008)(66476007)(52116002)(86362001)(2906002)(8936002)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UwDB0846iqfkR7NLgaNgztq765pWeO0AIH0C+Xdc4AXLCQbUBHp/jpGP+gU8?=
 =?us-ascii?Q?d+LihZE5ImNlUkQyWDfW1UUIm0YcAn6TyG0iaCxwuwjLR/EtR5xWUOM56vpw?=
 =?us-ascii?Q?M4gxzHWOZpYaGNR8zLY+zswYIjYVlm6TkNz+qSHlk393M7qKzo9nKLE7m/PN?=
 =?us-ascii?Q?fXlh1hMnFocEm5JbyldwiYT8DdWgHg2H7Qn4DhG6laxN3rlUQ+4Fv5nHfL2c?=
 =?us-ascii?Q?Eiras1K++viMnzZh6gGfks3At7qsbF3ENXtfNqEUGrqhi4UBsbwZ5Vguz9Of?=
 =?us-ascii?Q?+WPCrs+7I1XmruZyqzh+Fe7QUSUQWFTQGTu6buKqQ6gyurkbuR1s5SDZ4tLA?=
 =?us-ascii?Q?S74gSf0ggBWqhv6p6ymeSHPw/piljaWlwl/yWyjShXNZVjU0UXX9zzvx66lB?=
 =?us-ascii?Q?zEAXWN1pLBtLhDB8N8YYByRScGy/xr/qKidLfi6sg28ajLXgGcyOcrqPDxOt?=
 =?us-ascii?Q?dsuzMm04DwhO0exyEGJKvZ7rRBB280rN+IneAkcfdpniyrm/BqAA0JMLDqzY?=
 =?us-ascii?Q?y73I+JkPycGQO0dDJZndIWbxgZm7DJxNnhy96eryb9PTPRRa0/440p0yKymN?=
 =?us-ascii?Q?IQfG2ZB59YY8YQk9nh5s7ewn0kgRHPB54k/5lQdqSh04FvnSmgebipyBxdaJ?=
 =?us-ascii?Q?5ZP6ijDd9nAS6iXjqb9S8lMSV2HaO9/RNfVGGa8YXIk1e7G9n58A1OJIqiZx?=
 =?us-ascii?Q?0gpgsDAEP8bOdmXZOQtrC2Rjcd2Z1qUfWKhKQGGm0WRYvsSHkwpwf4Ql2KiS?=
 =?us-ascii?Q?06tDMeVTBHgydddNtnBTiANirfr+hRO5t2sE3qdeI+u4x6srRJsXlJPOWuPp?=
 =?us-ascii?Q?1BRkPig4c0ww3WGORI5bm34x1N1vhL8TF2F8z4FINldX8UVekZ7C6bMFCbmd?=
 =?us-ascii?Q?21mCgV2gMmy+vmbSyKAgVI6wITYhkChtqvYwxqaQmn2mELYL2zj4tqfWcVoE?=
 =?us-ascii?Q?ZJWQBCjuO1bYYRx+Unm2RCG+XTi6wKJlVp3qOOek+NkdfMHMlRnQSp3KMSnu?=
 =?us-ascii?Q?aK8+pTZ2Cbu5wQC1KW8z6Z+PT+12x6uWpbvhW5NtzyxyLk3eUvD6UBl/WqRe?=
 =?us-ascii?Q?pUNUbFpsfcteGtV4zEfKmUWKwC4L2SLj1Oqi2dG50nsMvk6Ge3bS9ToO+dGT?=
 =?us-ascii?Q?UouNVaqUfLDYrDnUbdvvorEJpe6zCp8ycL6RDdeMpc1Ns2KFdxed3aEupG5u?=
 =?us-ascii?Q?JXpMpdD810FyD9AIvd76CcBCNQKUpRuualuvK3OxjIv50Eh6P71armmYzxPH?=
 =?us-ascii?Q?mPOdmyxT+n8Cgwo5TR/vJwo/Poa72YX62P7lF2psu/L+bSGAGaFeTjzXo5GB?=
 =?us-ascii?Q?KF4RuXl5/vCxGlVo+CJ60SLpbDAp/ejbVeeQOiVjbErrggUOoGrIHAC8okui?=
 =?us-ascii?Q?3SJha4uV/HjlfWRQT/o1Bu5MVxBiD+60LFajYrPkhM7q7gXQPyK5hgtODCY7?=
 =?us-ascii?Q?RsS5yeCPYH9UjP03ns7pf6V+baG1vP/VTIVcfGXO8VIxj6iGKMUtlXaBYymG?=
 =?us-ascii?Q?yjwaq5QUqo/jdNWN/kAJbywt6h+ZhmgCZbczbtYypPc3Koey0wInKfPQ/9RL?=
 =?us-ascii?Q?YNQp85pKAkS+gyOySM9xX/7cWkz/05rw9NFoTcIVvp15zyhVUd9IWvwlJ/IM?=
 =?us-ascii?Q?t4qCP6AYBpp7DhoG12A8d6Y=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d751b8b-ab56-41db-0286-08d9b981164c
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 12:57:12.7302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rX1+xgqEihJC+wrcHRcs2IzaAk3Yn2DxwQ2WoQtGxvH2+0QBZfafPHTxZbZdgbbIA+kZakea3oZNhQU8mZ9zkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3388
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wang Qing <wangqing@vivo.com>

of_find_device_by_node() takes a reference to the embedded struct device 
which needs to be dropped when error return.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 sound/soc/fsl/imx-hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index 929f69b..89fd8ad
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -125,6 +125,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data) {
+		put_device(&cpu_pdev->dev);
 		ret = -ENOMEM;
 		goto fail;
 	}
-- 
2.7.4

