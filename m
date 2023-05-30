Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3866715BD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 12:31:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVpbq0ykcz3fH3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 20:31:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=E8pygQAh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::620; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=E8pygQAh;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVpZt3RgJz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 20:31:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXGPBaXubFDmxCZy8hAbdHYBfxQJ6bm958tAsh4kEXQzTDI/1+6pzRsIGVxzXXGdYcmZAsy0F2IfelQGF71LW3YJcFfweaWJBxsIHH7EYn2TCzZuIVqNaSglXLPGou74H/KGlbMY6MiD+p95mXsOpNkDO5EhPv74dGyafM/ZbMLOkomusTsay4FdVbYTIVIfnS77wUD7lz22hN3LS7oXBjICYVBS13Mq4GY8W4KUW0iIyOgF3Xo8VKER/K8n52539WwwnVqhZS8yPmeX8tc70sjS9nGbldGj+J1/i08KH7kWBdL2hpzDnFjSd6fpnA0yhVVBzeeDjIlsV7VoQJugtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7AMVWF9xVZUTxz9DTSUBCzeMv6541p4nFNehZgUFrc=;
 b=he/1mVkeB3i/IS0OlJDUsX3HZx7qljSn0wEppWyxSbPQ900tX/BlhvjnYr+QYtSLuPqHLNuRwvRyCC5s8XG1w/6OLptmao1XZMF3b+j0dr0sHYtouVwseRXt2jMfBkbCX8TvhGDfPsAA28p353npkjzCCkXslzoUoTVitUJk4qkh6VEmtKGez5X9SOPZ5ac+06tulRE1eLjhCVX/fN1Om93Fm0l+ItI0TcBxLgDJYsOS7w4sXZhemLrrNtZ0etoZg5XVTmslDdOfwGIE9vEaqMHt301gAb2Ac4vtE+IpUogfM+y5dg//KOhJzTDHm220zkCJAb3ESuyfQ8ZYIZcseg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7AMVWF9xVZUTxz9DTSUBCzeMv6541p4nFNehZgUFrc=;
 b=E8pygQAh2k/0oMxyPVN/b0Ee1935WI8fKJNQNNqyPkE0QjA3yORGY5i5OgWicNfv/5kOMyw4bz3s/YCpC6SKUAOG+9qoKbC5E1gTDt024xtSGitAMN4XfaMGw4FyrVUCovnvod0fNPNs/x8cXGPHjq9dYH9W4h+SJn1bsn6YSpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB8154.eurprd04.prod.outlook.com (2603:10a6:10:243::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 10:30:34 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::a853:185d:bef3:e335]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::a853:185d:bef3:e335%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 10:30:34 +0000
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
Subject: [PATCH] ASoC: fsl_sai: Enable BCI bit if SAI works on synchronous mode with BYP asserted
Date: Tue, 30 May 2023 18:30:12 +0800
Message-Id: <20230530103012.3448838-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DB9PR04MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: f2783b6e-80ff-46dd-459a-08db60f8e6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ykOjkwBsf99AETd9DPGSaET+lDuFBNluxzKBFpRf6SGR2CgEI5S7njDInVmBzfiBrd0NMsKfO1Dk6zHSes7bjIXw6wjfcRBc28K9bt+TIrLHZNPTwgL3xO1mpT9B6cNdSmQBkSuDv/4E1FjzQh61FQEdnTdr+qE2mNz9pSWzk2X17Vbgf4eKaYtozmFXGk8i0GKekheFO1UrBC7Do5cgEx9dohxrLrbYHMSvReX0Wb1+0+9QmYrLb7UQcTk/LT4rxYt+2GFa9V9KQrzlcK96E07nIx+BXdGOnXJsknkL4wOq+YNsZaDP8UTgoUpbbgaZOyu/YhpnxE3ZOL/ZejYfm2YhW52UEZx/lsNd7t/DOhdfAPZPey1E7gDrzlEF6/SDxcR3GmGZfABBlHwLob6F+7neZprncW5g7hWCy6W8eVPgki/enZpkgpFQjYWxyLzvClleVf93WKAtF8vMuFwBwgPvzaeClAY4wcY4hs073esuVhkfzFhYObjMI6d6+v/OjN3y10OkrNs2msdbz3x0qqrDTXXgp7yhA5mJNfGoOlbK4c6SqOaoUlZ9Q+XAyUK/GQQdySGpr+pxIYp0DE+YhdRuPEpzy86XVma5CZg6dsAkUvs1WMNHUYBVBKUEGCTQMZanlRj/K42LlnyX/WRs0g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(478600001)(8676002)(8936002)(7416002)(44832011)(5660300002)(36756003)(2906002)(86362001)(921005)(4326008)(66476007)(66556008)(66946007)(316002)(38350700002)(38100700002)(41300700001)(2616005)(186003)(1076003)(6506007)(6512007)(26005)(52116002)(6486002)(6666004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?vwnbwn9nptZY6f7/uhaM7y/qgzvCL+tRZ+X2gwd7IK2NFinRCWUxwHOkCYCi?=
 =?us-ascii?Q?z5FAycBgBk2xKA6CAHrNfBBwcjBSYho3t6uhJ7dsyAKJpfHcC1TYlofxf8x3?=
 =?us-ascii?Q?+k9k5q6v0q+gXd0vjYg7AMbYf8BUVhgAzGYU7YJD9aP5Q6VdRFG/EFx+Zpzl?=
 =?us-ascii?Q?QK3YyLdBHmPZgSuSPzuE6ZGAKjwHuuxZLx9xFVisztRcg/jTbdfnff/kmS5T?=
 =?us-ascii?Q?l/fETYrU6QFqJm9MMSHu/w87VRi8UVaI9d2YrKwVnVVaIS1CZ/waYLw0krA9?=
 =?us-ascii?Q?C0WvzuQ5HfUURKDURKH5MuRghFqrwf4viuWkr2WCReKwvhSyRxfXPLPxoI/0?=
 =?us-ascii?Q?Q5Pkz2Y4tBfZc7/2bhz6VJ9fbYyRfv0WzqLcLJPd/Dh+hkYQto/tbUVJS3h4?=
 =?us-ascii?Q?96k8AEi1Z/77Pd8Qbtto55zgD5rdASUJTzuyBvqmDehTS7LTAGb6qhIEUlD7?=
 =?us-ascii?Q?Uj44ht7LPobwI5wKKGv28+JW30GojAcyonfI3bGg2KDDowwnOBPbAPHgEKCo?=
 =?us-ascii?Q?yuOEYK0ert3sKW6CWME/L3QVcaKQTEF+jj0ugVU7xupJKsGkR+bjaulkIQEP?=
 =?us-ascii?Q?6UqxrmPkTZD/mIRq34+iB1vn440NUovv2MTAc1CrKX0TuEAm4besUja0aGq4?=
 =?us-ascii?Q?T30ihw1lL9TZAOuRuLvWuzlLfTnq2deGSXOlGeR8zEelfibcAve/oy+PyTsm?=
 =?us-ascii?Q?ATssShmto4nKmOVhl0OtYUnpZoszKqiuX5moVajtlfbhImB2uJq57XFo3aAF?=
 =?us-ascii?Q?hhVZ/rNVTkZ69bRE1I5l+KvW7qkqNDrLnczvGxn2qGIo3YGPFr0FEwspbDKo?=
 =?us-ascii?Q?kAxphPLTKKR1gJ0HcSsRJuxRqAuvkHxUcr/nXL/sQ6PYEI3emSB+e3cIhQPd?=
 =?us-ascii?Q?HW+0zyRlomCV4KPPAIcz3Vw3GD3gBz8BHk62llsX85B0RAYOzx3Ia8OgNvXv?=
 =?us-ascii?Q?w90YsF9S3Vp7xm0lnkxiSt3vXlNrIyg7Zs8ss30x0cdLY4hYtauna99piwMB?=
 =?us-ascii?Q?IF8hEHRyvH5AACd/fZv4cWFG2sL1Bp/nIG7ZTijecpzcfYccPxavLO4mI6VO?=
 =?us-ascii?Q?ls/mU4MHK8fzJsFZM0TPq1k7LVrbvkmuXUn/ikNFgjbvSImfhkMhlhhOgtcB?=
 =?us-ascii?Q?+wKrwrI/hYm8yGqQ9zgKy/BGKW7QU4GaYQuG38RDTp7cbJZszlQ7yEICqnWf?=
 =?us-ascii?Q?StGyenFXSTOWQulHmbYMME3WrgLnsn1CG0xkX44eVw2jmSPENu8owXJfm0/H?=
 =?us-ascii?Q?5PpxtWpfBqTFnU8NOEIOZ7ebSMe9o67l5q4mu6lrf7BavI0IUg9E4fpsXMel?=
 =?us-ascii?Q?g3EjmNJIm8zSwVgwr5BzsO51kXQE9nUXEoPDm1J1ebVUyRLd7VRFG0SYXKND?=
 =?us-ascii?Q?YXN1XkoZpkXR9vwSHZTj5dtig78J9G8h/HNX0T+XlTToF2NHv/NMXrjwQQEI?=
 =?us-ascii?Q?ApRbA9eqoPV1cv71IQPwJEJpksa8nI05zSSzW5q/ee8hSSaqR92jJ9jF6ubx?=
 =?us-ascii?Q?2dQWn9GtzdMrgW8I/mdLO4Gh2EE473B1vc3EuTgk1syrOB3xbGoz7m3OM2js?=
 =?us-ascii?Q?nonTRm9pnCNKJkpe+gE+q/tckr963pBkqZdpyYtZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2783b6e-80ff-46dd-459a-08db60f8e6fc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 10:30:34.8329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdH8IP4b2TEZEpm7aoQNh24qfsfZCbkyT6QngvZQNh10KMKeAwyeWb3GTdp/4hsP4mq1wHXzPElkv1GK28a/7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8154
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

There's an issue on SAI synchronous mode that TX/RX side can't get BCLK
from RX/TX it sync with if BYP bit is asserted. It's a workaround to
fix it that enable SION of IOMUX pad control and assert BCI.

For example if TX sync with RX which means both TX and RX are using clk
form RX and BYP=1. TX can get BCLK only if the following two conditions
are valid:
1. SION of RX BCLK IOMUX pad is set to 1
2. BCI of TX is set to 1

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 11 +++++++++--
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d9344025dc16..5e09f634c61b 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -491,14 +491,21 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	regmap_update_bits(sai->regmap, reg, FSL_SAI_CR2_MSEL_MASK,
 			   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
 
-	if (savediv == 1)
+	if (savediv == 1) {
 		regmap_update_bits(sai->regmap, reg,
 				   FSL_SAI_CR2_DIV_MASK | FSL_SAI_CR2_BYP,
 				   FSL_SAI_CR2_BYP);
-	else
+		if (fsl_sai_dir_is_synced(sai, adir))
+			regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
+					   FSL_SAI_CR2_BCI, FSL_SAI_CR2_BCI);
+		else
+			regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
+					   FSL_SAI_CR2_BCI, 0);
+	} else {
 		regmap_update_bits(sai->regmap, reg,
 				   FSL_SAI_CR2_DIV_MASK | FSL_SAI_CR2_BYP,
 				   savediv / 2 - 1);
+	}
 
 	if (sai->soc_data->max_register >= FSL_SAI_MCTL) {
 		/* SAI is in master mode at this point, so enable MCLK */
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 3eb994aef36a..8254c3547b87 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -116,6 +116,7 @@
 
 /* SAI Transmit and Receive Configuration 2 Register */
 #define FSL_SAI_CR2_SYNC	BIT(30)
+#define FSL_SAI_CR2_BCI		BIT(28)
 #define FSL_SAI_CR2_MSEL_MASK	(0x3 << 26)
 #define FSL_SAI_CR2_MSEL_BUS	0
 #define FSL_SAI_CR2_MSEL_MCLK1	BIT(26)
-- 
2.25.1

