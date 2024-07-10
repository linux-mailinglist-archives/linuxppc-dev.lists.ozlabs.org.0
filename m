Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EBF92DC4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 01:04:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=lpCCVJfc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKD2h19yTz3cXM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 09:04:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=lpCCVJfc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKCzh32RQz3c5R
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 09:02:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFtUZu/RawSmkE7VQmNkkdsG1UNu3WFfLvxsxJgTq4b4BwxCb8ZUE/amUEdOmTc0DDyq6Ls2SpfLF19DRD3ToyLgRIWHK5SKU/SMre9BsC/zRkU8J3OrJlosa4Mb6DcB6a8v8/b6sb826rqSelR2YPCYzEj35utF31GaaP1rip1sQQnlyhBYkXT/VPhspI0yjxh/bxWbtS0Hni6f+f2sLK+lx8hlq1SWV4gOew666TLu7DjM+IpiHW/1MtSBLyVAXymlRouW0mLZ82F866/0aIOkGeeqSHY1FL4wehLvEDbzlIhraR13lrAUdwUJZodQUMutfJ9JNaWJydgvKDcwTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQRyglssA7asbrla1CO1yv3VAbZ797kWOfCB6/c+YCs=;
 b=aFtJCiMOZOcMZupKpSKnwxGo6jf3FuZky8StIp2QUpETDtEDEGhJVjGn3DyE+drWrotK5yrE5fYnGp2PvZcDB4Emz1A2lgT8VqjOUC0sd0v3VgsAoSvZNC+SRjO3TnP+mExn/jGHjW2G3TKK+CMv9iyGnu2OfdJ3Rp/zI04ZK3vMFJXc2UbuksugjE5VlzAgTAhk+HlxQZ86ZcBEBnUB9y4S/YH757uNcU+c/Yl5Axs9MKvr6eLBtmxi+aLVXUkBA95pDIGUUAbFJ3KvvlCNfa8rmGl1NNF08xaeb0/G8l0eGdSb7WZFR7xwmbhDsVhV2Iv0ab7gqha14DNsNPKT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQRyglssA7asbrla1CO1yv3VAbZ797kWOfCB6/c+YCs=;
 b=lpCCVJfcX8eXTza9LAkio0aDdNYoJtf3OAOr3juwnKkDEQLVWKJ1AaMnEOXKhamka1xN2bspoECDkjmdHexRlBcsFkhGkEpWtbK5nB8EO878REyeKrpf1RixHVnYP2qRl2LIZ3RcHU3DvhF2WrJaZiw3wd+3Cnr0idIyfoO4sZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.20; Wed, 10 Jul 2024 23:01:36 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 23:01:36 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 3/5] net: dpaa: stop ignoring TX queues past the number of CPUs
Date: Thu, 11 Jul 2024 02:00:23 +0300
Message-Id: <20240710230025.46487-4-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710230025.46487-1-vladimir.oltean@nxp.com>
References: <20240710230025.46487-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0100.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::41) To DB7PR04MB4555.eurprd04.prod.outlook.com
 (2603:10a6:5:33::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4555:EE_|AM8PR04MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 41984cab-ef60-4f6a-e92e-08dca1344000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?5CAriIpUCTVAjHs7Lv/7RAt/rNCK8eul0NtI1K7potRXBdjH3UkhWoeEvx/o?=
 =?us-ascii?Q?AgOrd4ycu5vLLS0Dx65w9MH3xx+2Kh9I3PQVgtTL34cs1RZFQSKsDePuqsWD?=
 =?us-ascii?Q?kK6OF2Nbi7FyYsoOfAO83Vm/GSSNQdep3GKea/SPOYvdjjmR/U4GlPMRWPkk?=
 =?us-ascii?Q?N5L67j+iSTEwg5v6JscPb6Ka6WUlSPuieGTEh/J8IKFJF00BHkjF9med+Eh0?=
 =?us-ascii?Q?D8EjZ5lp0wwqqlw2qSw7cvbFQGqBPH0pGxIydY4TQWBy/lV0u3e+2n2IYoIw?=
 =?us-ascii?Q?PRX1orJyjJstSsOLKA1H1X1gnTsxBLXzOaYhpioxzHyLfcknULQYtyiahdKY?=
 =?us-ascii?Q?ElDUw1/FGE4JRoiBodS9UQqRAj/FdCKdD8LWBsXtS/LLGO/Fg27AWYpEQZsz?=
 =?us-ascii?Q?915yohsA/9X/NHDZ6+X3410Pms6qaO68y2i0FblRhmr2xem/JST3JftGsP9S?=
 =?us-ascii?Q?SwCYwzZQ2+ASkd9vDJrdXhVNOJnibS3stYgxF5cHttzm8u3eAA618ALp70Af?=
 =?us-ascii?Q?qzZZ/DMBOeENMv1v8/bnp19EsXarMIKePmiTWPY53WMH+cBZH/Ihatq48YNa?=
 =?us-ascii?Q?/gzJxWIPAIBiLjUJKL7qJVRZrnJvzGwpc9WVhaBpIrS1LY5zjBDRMkyXxTUq?=
 =?us-ascii?Q?9RblMJLUo2SaXhrqr1T6fIWZ5hFi/mAZ6TpS3Rn8nIy6AgpZOfvOgxPkMH/g?=
 =?us-ascii?Q?HFdgOB61Jk4PvzBevbN5akmwisCBh+7Ef9tn85QiGD/bgQqn0JUuOb7S4Xn4?=
 =?us-ascii?Q?5VYF1A5tedJeuJOmbGDLAcmfBT85jVoGc8p/PExlLPmRp+gblqSPmgiHvQLQ?=
 =?us-ascii?Q?sHMLHvYw/oxLyTIRmlTmaDw6jVoEmHhA3WZ4jII2xsvvuD6cAJjjBuEA8dXr?=
 =?us-ascii?Q?D4sX6gE8vNGlqz/7sdNxZiGyvgW1Bzu79AxzM0cM21tb0+nkRdQU/g22JalD?=
 =?us-ascii?Q?P42sR7tFFFvj+qcygjGFAApwBCdyznrjr+nbwT/igSuLkOmBLRFW/QqsMO3P?=
 =?us-ascii?Q?yasxTKYT2PosMJr04bWJazkXJ22CXyFMqE+K3tuDUgfos5+udG3V/AscKpc3?=
 =?us-ascii?Q?pBol5h9++hlJQukPWWkL9dpNZdroP4aH0RT5XvwD4lBov2K6Xr3WtAkN0HZg?=
 =?us-ascii?Q?f+9xvm4YXWfhKb1btvd6ke8j6fQRIFTBoGbM9hZyWsoz9qB8ZgjZvu3w2j4A?=
 =?us-ascii?Q?gL008iP1RM4vVUpQ83J7ufL6OTVfSVQResQnYdlR/PjfYpyiolWhdnbBBvtx?=
 =?us-ascii?Q?TvYhRI/9yiy7O0FMs8/mya1wyVEgymiP0SBJ9anQHEvRJ/y9p1/9/gKL2LBn?=
 =?us-ascii?Q?CKNR92PGIWNxrQFPrO+pRrp5kwvKUDu/sTEPBeRqnP8XrqKopzWcRQoIUjcn?=
 =?us-ascii?Q?/etMOJlmfEgSe3Z1HWFO9SvF50YGShJk38lPsOrWLBP2XEDGmQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?vca+j1sOJT4A2fyp6tg8csocS90aCgYEXoT7i50wXshScmjUa6cjbj5s5OGR?=
 =?us-ascii?Q?5PaMOWZixAk2cdsqQClqcdgWsuI6PWos/IeROkJKWe1BLhl3Ydpj2DlJIU8f?=
 =?us-ascii?Q?EKTrvEaarhJ7ThwKqK8r60OHzFcMpB48y2negc5Y8nzSBsqwVhEs6dT9OCbD?=
 =?us-ascii?Q?WaK8pd/PW62j4JwptTcW1XU5ImQy8fTnHX5vWVwQsNfFTGkXJgc0IQK6EaQk?=
 =?us-ascii?Q?81g29nWI9TBrj0O83ADRjtis+mhnJkZl9uQbmr9NMzvhvVFYYoxQ00tyNgEf?=
 =?us-ascii?Q?vp/sb94KwbSMLPLAZER6yovibQx4FFI1WSVdmW8cfq98tzIbGOXPNtltqXDT?=
 =?us-ascii?Q?x7gkp7b/5V2NXSHouWsZp/Fq2mLwDaf4gl5WMEY8Ubkdn6YByxww5fR0rpba?=
 =?us-ascii?Q?xfA3gv3j9ARkNmEPqQ8Q6rNk06ygYlaeQCyxZC3hInrMmLxPI0boHrk8Z9ZK?=
 =?us-ascii?Q?quRSPIthH6iYt834Y1QSIUCB3ntm2e3/xhUWZ/p9q0OEClSXT9iz/hupMTa/?=
 =?us-ascii?Q?bi3jNb+eaClajoKNENxISh+f7Uyr6SBsJWq36sP64cBXi1fzFloWZo1H2sER?=
 =?us-ascii?Q?y+Mn+U34gdgxg9MK5e/+nJouvRe5FDpKT+vhWlg8UD7gD5cILBSqsSnIDQ99?=
 =?us-ascii?Q?zIdwukOS/dcQ01KUTgjSoPJRo01rwjR3yOakz1X+BHrAKzSUTrGA4SPPaHY1?=
 =?us-ascii?Q?BmxHJKPTU3KdD0aV083R9cHiQWGrbJ4Af6lg/5wjA4PMpxyNJB1fSeL7iCg8?=
 =?us-ascii?Q?UMxyB+42dI/74Wsv8csTHnqbrhM3n4p8HSm+iMwihkET8UtJGQPMXEYV5Az7?=
 =?us-ascii?Q?P5ESiPl4VAy40cRJetz+v8a0m9pXIisOT6fghJsrtEH+8ZorNWwaXtByd4Ql?=
 =?us-ascii?Q?Fz+ZOGpsk4sLT2vJ9i99dgQBjABbi5059R8cuESOehHb66RVQ46aW8jtGLvO?=
 =?us-ascii?Q?uutmyM/ghslmZdKIx8S8gn4XdXMS390HM1KnZSEGQ2dVpZ6dNBg2zPxba52l?=
 =?us-ascii?Q?PS2BYd387qta9xZB3f120oWcWwJ14qRg/W3W7atKGqXjVe2Vbkrsh4Oyi7CV?=
 =?us-ascii?Q?0dQmP8z++h1+XvT5HP/gSv1de3F7hSKUHSge7/vA/0pF4lJfnFRRoBcxHIjX?=
 =?us-ascii?Q?WpvBViAbLl6va2arSevZtsmhx6zVRl5KD8itzzH4sQ206fqsF9e1qFkmcU4g?=
 =?us-ascii?Q?+/Hc3ldAGJ0zNNlgB1k49Gf82LvUOuIfZtRloz4grA5oDRs1bmHLEgas7Z/Q?=
 =?us-ascii?Q?aGCeCH0Uk10DpbAySmGf1lFFA5CwlJl2wJ/AqRl9WSoammU07TZkUu701azP?=
 =?us-ascii?Q?MVQk6xUsNdpjVISS430K5LNJ094wEAUS2ksm5ptMBEzH+K5iGs44R+w2jrjh?=
 =?us-ascii?Q?AUd99DnpeEQ6NLn53dfMlgC12j4lHHI03GCu55p4eIfocfvXtO8pErjfETUi?=
 =?us-ascii?Q?CZOXTVE5jALqiWJLG1X/sw1M6XG0Bvc/Kc5FGR81QUlQvy8MAJmtK5wGjEu+?=
 =?us-ascii?Q?K/rQSZcsm2TFg/oGkgq5UVmyndCfkTdmwbWaLp5asyeCFdtAzTh2W1bAWsvS?=
 =?us-ascii?Q?CZAoxhRpJ89XZw+3n7Y8Rb3fsEl6fwjeKsqx6VTumtgMDrpqU3nEDy9Aoaza?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41984cab-ef60-4f6a-e92e-08dca1344000
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 23:01:36.5451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85IsT+RV+GSMwQyBW4lXPGC/e8D97v1hzYiEZ8ZG3JLUKK1O/55nJ/zIdKwsal2ugPoF7L0g7ie+DoAmR6S+LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7425
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Madalin Bucur <madalin.bucur@nxp.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dpaa_fq_setup() iterates through the queues allocated by dpaa_alloc_all_fqs()
and saved in &priv->dpaa_fq_list.

The allocation for FQ_TYPE_TX looks as follows:

	if (!dpaa_fq_alloc(dev, 0, dpaa_max_num_txqs(), list, FQ_TYPE_TX))
		goto fq_alloc_failed;

Thus, iterating again through FQ_TYPE_TX queues in dpaa_fq_setup() and
counting them will never yield an egress_cnt larger than the allocated
size, dpaa_max_num_txqs().

The comparison serves no purpose since it is always true; remove it.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index 7b0317020c89..e52f4cd95f97 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -971,11 +971,7 @@ static int dpaa_fq_setup(struct dpaa_priv *priv,
 		case FQ_TYPE_TX:
 			dpaa_setup_egress(priv, fq, tx_port,
 					  &fq_cbs->egress_ern);
-			/* If we have more Tx queues than the number of cores,
-			 * just ignore the extra ones.
-			 */
-			if (egress_cnt < dpaa_max_num_txqs())
-				priv->egress_fqs[egress_cnt++] = &fq->fq_base;
+			priv->egress_fqs[egress_cnt++] = &fq->fq_base;
 			break;
 		case FQ_TYPE_TX_CONF_MQ:
 			priv->conf_fqs[conf_cnt++] = &fq->fq_base;
-- 
2.34.1

