Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C1F92DC4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 01:05:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bKwRYjnN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKD3S024Yz30XZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 09:05:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bKwRYjnN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKCzh6P5kz3c5R
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 09:02:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKu9VSnqd8jtuKRGY+XC0aiv1f8E6ZzH2VlDjeRhQO+kFUgUTK7eLX55ItwaBRKRo3HjSCabhfBPtfLF1kxblN0uNqZkjM0xdOFHSGwhmaYl7YsYU92mc1Sc+Fr/LPpjEM3+dgXwAeC2j7Fe5RZ8H/ECYhb6HAZK+7nEhmwCooj82VY8cxLa5+PzgAkNYbosVA92LpEFJy5Hgka2iSrxzlPWTc6+ep0lltr1OROEHbxN7TxkSJcsnrBmU5qcjO0gcmxxGD2dTeI5023k6IJ0d+AkTqtNv7HuSqGgd0qxCfV9D7I+WBhrEMgAkeY4dy+6T+WWUG8POQEJrUOh8Iq1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsWsdmHly93/rDvmdQVyP4SfyLHyblGCvZkBjs9fKGQ=;
 b=S1YFtDYWtr2BdSTTVt+HpIt4dTRo6iq5fCNmxkHrFkQCV6kqlz81LBWuhck80OEj+ejrg2J7KLlSU1pnWvarnHbUTR54Y13hEalOOPcEL8iETa829nFp3xu939zlQNOvvDGpwrFbTZikd8Df1FFgaFhzUA39LnegpgssFVAkhlDNGy+T1QpWHG9swXICbzsI/sglf6QDdyqCY5GHdDxyPmIWyRDsz7VgVzAWjtykEQgwOy4IYYf+yiQDQ8/FLfafQ4x4SoxuhrDOZ7vAfdHISigP9GTyG/bnBqy5gMpMfuVpeNKKBDMGy/u9mGNYSFNmvJEtjMUwsKJhkpLU2g35IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsWsdmHly93/rDvmdQVyP4SfyLHyblGCvZkBjs9fKGQ=;
 b=bKwRYjnNI9fP6uY4Kd7QAHnA3mE1coaOrLkw4u3d1vtplGqz2VePPtdi5iWhMUSCjz7KknqhBrSFORHNJjXEYlfBavLzZQ4MXxC6FdObh7SPqTpc4eUUR8k+RDHJLtArFt8Z+XcnvUxEe1z8RlquQgkTxDdYamtAr+47mdIMYlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.20; Wed, 10 Jul 2024 23:01:37 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 23:01:37 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 4/5] net: dpaa: no need to make sure all CPUs receive a corresponding Tx queue
Date: Thu, 11 Jul 2024 02:00:24 +0300
Message-Id: <20240710230025.46487-5-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 24ca6036-6559-4553-3082-08dca13440b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?0/sNvt2LEQO/egUOx4MTRfTqLkQ+12NghJxMik3epTXTcv/lqJ90XYkBD2Pr?=
 =?us-ascii?Q?86qowvL3pTGQxLWcRwoysArhutjZhWz8DOWq7+aie/hScHQEkX+NvSMIkEqg?=
 =?us-ascii?Q?7ji4jHzRdCPe6bSQ+gILjCh1Cmo+UDrn37d1HnFe6JBrgR3YWbu8DvF2fH8R?=
 =?us-ascii?Q?cDbuWaQiS3PBQnaxZ0iGR0rzVa4vBqJwlZ85epuEek/smHKbZ1/xFbkk6Ny9?=
 =?us-ascii?Q?pDST5XqFKz91r9bFr7lqt669k6n5fysspkmJD0Pyx/hRgYG6IsZdFSUU5wHD?=
 =?us-ascii?Q?7J2/WEELcEjAM4CdeAs3mI/Mkl1+6diHFg8KdkZypdz+hQQnIm1xT3xIE2SM?=
 =?us-ascii?Q?+DvooRbTpUsXMQXY4viTWIKhQ2PuHbYgabZCnw6gBXF7+0a/f7Uv4GpYhIr/?=
 =?us-ascii?Q?DI7Za+Red0KeQSMrobrgmdAx7YacIAlNt7f3yywJSHalx7m84eCPsmhxs/32?=
 =?us-ascii?Q?CalmVmW7FNtw8q0zQEFqrg5Hpl90+P/LKluKfuapCXXIyQt07Gu9dToujNim?=
 =?us-ascii?Q?KNo9z5vyALsRG5wEv6lbb8e+y5cql4/0ywfQy9Tuyx4dgcJ58BOQyXTkjoaM?=
 =?us-ascii?Q?Jvtx/bfe5O0YBMc0QrxuNPwuQQWCX4CO8Jj6zmBKw9uOThnUWoltkKjmhXEt?=
 =?us-ascii?Q?AAGQBH95iy17slMzgNYJ7LNV9vsNtrtay615h9VBwRbRs0dEoNucvd9+IR8/?=
 =?us-ascii?Q?OHY0j7PmlD/oPXxICwfjdlcwAY/qEGGfTpM8wqnWn91PLPv+ZzRwCQ8E6Ff4?=
 =?us-ascii?Q?6RZ6Wnchk48To3wzfROVz2GHrT6n5W7t3nMxR8WmyZfFsJbiznnfIB3NTVmR?=
 =?us-ascii?Q?WLqJfTyCkKfuFHK0cSLd46L9MHeKIZ6xzDZVg0y8xfSELPJRB0s0J0JDgL+C?=
 =?us-ascii?Q?iqJDX/MM8RxzmfRmu3fwcQ01qxt0hcXyXM5Ir+OjtjotrkPTF+p/BYFuqGx4?=
 =?us-ascii?Q?FhteMHLftDkOCAF1q6/cRsNQdHsuOHlPvaBfUWFDd8ozqNUXGsw42IW5ogQD?=
 =?us-ascii?Q?S0hS2zsON2OV6bubnja+HLS7SUzEu9YbpkxwgEDkTDkPMJG6C0AHxassc+f+?=
 =?us-ascii?Q?o85diKQUxlrpiwcLfXIBOfrGvj9akqmWwFoqALy2/dDrSb7AQ108MWClLlwP?=
 =?us-ascii?Q?Xn7qRMwbvEgEHb2fEVW8hE2mMhdZvF0blZ/n1vbrwl9NjItDh1uHURwoGX7z?=
 =?us-ascii?Q?zMcQpLnwuiHekQSGETOExwRdKS4Po/q8aEPzgnSJiFsVWYBha3VW9tJQ/p4Z?=
 =?us-ascii?Q?Ek2fLZZnq0QfYxfB11t5odsQkkozxCvrcF9+P5ka+LYpzoL7M03P5SGplppt?=
 =?us-ascii?Q?8Rxiqmpz5ViHKczm9xsHVAvrQeGG74TLSQPsXoOvfK/8wcGyQtTOd+35d+6j?=
 =?us-ascii?Q?fQTDuDniFfxv3ITBDrGkZ2edqe/mRBFN3V5/yAoObjiPLRJCoQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mK4isxRgqSftC4qfp5SneA+idMJPNeML9y6ybGPgk0xyt1dehmVvkuiz7ovz?=
 =?us-ascii?Q?2bMJXPqqc4i7xEez3mB8tcR8CHYyVFhBtJqCxSXG8ohEfTkgzWnur/uoU9Or?=
 =?us-ascii?Q?CiFK8u0R205sBdPQro2RxHpOh+gXYeR0li96b0eQVc2CQfYpRECemP9XAc+j?=
 =?us-ascii?Q?fYTibKutagcXeAhHBJPT387L5jQii7SJmPw6k6Q2+9KEK8ohOO2FEkQZpBHb?=
 =?us-ascii?Q?8nObqmoP7+DfE6SGV35P4hQAdP9ZcXhEYLC2Jg6nxDDHsH0FaFsUHwAEQu9l?=
 =?us-ascii?Q?XIOiFf174RNgh2QFpAoYHwTw0xYr6my50C2Ab1xDJaQI5DAn/ZMOOspbHTR0?=
 =?us-ascii?Q?EDEgNI9dTOW3ctYhrGelDmtsB63HYpxdR6Hfepb7QM6/YSDFMD8MoB4jndL9?=
 =?us-ascii?Q?igtPezXiA4mh5OkYcytgjPWP3I1lZYgx/6rXjw8Eezq739sK87Amd/CrrJ8P?=
 =?us-ascii?Q?gGPa+xjTY/v/3x2q551B7PPramEGUhUtfNJ/Hosj2C+6Pj/0rlsaw+T6Kexi?=
 =?us-ascii?Q?Sbn27CeLzuBW8FL8/2MiuA8WoC3v21afi6OMVCjxQK4hKtjJsvIyU4OWV2IN?=
 =?us-ascii?Q?unBren3CspJvPG8ubc6IRZmIQs46Kg5HKno/ztrckjwfvw47EUnbCOT3+gLi?=
 =?us-ascii?Q?tl/1XqYTbtXzpcTbwFAuJCN36rpTbkOtiep1w+RsHuwKvZoXGjWvb5qmsJfT?=
 =?us-ascii?Q?HMeR7rB7F7YT9zERtfWpsia8CmsWv5gTnOtPIvjETeRv6BwrOAqeEgYNB07D?=
 =?us-ascii?Q?jQ1nPJiOZ3gWaHDPJImB8yaR3bSTpM0wk2QyyPWXBM8F7OVFfNfZpKtdrREf?=
 =?us-ascii?Q?13GBQB20NDtNWhFWs7e5bxd3CLNrZrSOAKfemCM43TO+MOzpr2WHzI3RDlee?=
 =?us-ascii?Q?9YweRt5xVk7cycFJWsqnRa2qxSGUD/RuCmx0Kucye2vEP0HWUrLKVOoXmA43?=
 =?us-ascii?Q?Vc/zfiK9JBMteRZ6C8PIRy1MhE7MinTdSCZFK0StPKdg1u+J14+w9nXSIAMQ?=
 =?us-ascii?Q?4ImF5SGmYs98+vudWoRow7eSLJI0XtYIs+M+vg3ZdrXAmbvFVmU4//8NQHZ+?=
 =?us-ascii?Q?a8cFARNBkiVAH3evsd1oG1uNCyiNUqNnmVekMXfQMBztdWWRlZnL4fijpNEY?=
 =?us-ascii?Q?n264h4fa5L2AaIcHW4bDpFYyOGLs4whYY0S6FzrbXdAvukJPQlFv6T8oYWnc?=
 =?us-ascii?Q?GLS+jMTv26xgYgfmf12Msfdjj1qPl8b8JMNbu/7ctuh9O5IVmTvs/ZT0kpGl?=
 =?us-ascii?Q?Djb0tgIfNaDvnFqoeYDpROp3UbvaYuhltwOtrt3wp3Tfb5M+9stjp/o8uHY+?=
 =?us-ascii?Q?svx7Y4nwM1Jtqr/w1e9wT5fbwYDQkPcM9xXsC1mcy8/ylCQEzEO2jBJwV9Zt?=
 =?us-ascii?Q?wdeAhvx47RZrlNGYFGWnHslCSY+TxkU6WHbOEB9qCD5Dmsy4JOO7xvZWyn+w?=
 =?us-ascii?Q?rgbq8M1vW/V268gwqKrEvMRf5Og6zjR8CisoOLV6qAaoYfVdwRKsCIuuOMGs?=
 =?us-ascii?Q?dfhuh/3OMYMCSCfQxRFdugOZvpFHxeG7RBQLHU78muwga5XsZH/1s+QVpv3O?=
 =?us-ascii?Q?1ZzCOLVqQzXiD0HnGROiGE6Vyht90Dr9khViO3AzmosXdfNsaiSZcL3X1fKF?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ca6036-6559-4553-3082-08dca13440b7
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 23:01:37.7347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRCV+CNfoCLqoswWIdoMq2mR6afoxXFtsyAWAnYDnV59+iUKsTTd8qVnTn0Fx2JCGOsBqV9niGD/Vj86ixcmPw==
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

dpaa_fq_setup() iterates through the &priv->dpaa_fq_list elements
allocated by dpaa_alloc_all_fqs(). This includes a call to:

	if (!dpaa_fq_alloc(dev, 0, dpaa_max_num_txqs(), list, FQ_TYPE_TX))
		goto fq_alloc_failed;

which gives us dpaa_max_num_txqs() elements of FQ_TYPE_TX type.

The code block which we are deleting runs after an earlier iteration
through &priv->dpaa_fq_list. So at the end of this iteration (for which
there is no early break), egress_cnt will be unconditionally equal to
dpaa_max_num_txqs().

In other words, dpaa_alloc_all_fqs() has already allocated TX queues for
all possible CPUs and the maximal number of traffic classes, and we've
already iterated once through them all.

The while() condition is dead code, remove it.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index e52f4cd95f97..9c0bac58a0da 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -989,17 +989,6 @@ static int dpaa_fq_setup(struct dpaa_priv *priv,
 		}
 	}
 
-	 /* Make sure all CPUs receive a corresponding Tx queue. */
-	while (egress_cnt < dpaa_max_num_txqs()) {
-		list_for_each_entry(fq, &priv->dpaa_fq_list, list) {
-			if (fq->fq_type != FQ_TYPE_TX)
-				continue;
-			priv->egress_fqs[egress_cnt++] = &fq->fq_base;
-			if (egress_cnt == dpaa_max_num_txqs())
-				break;
-		}
-	}
-
 	kfree(channels);
 
 	return 0;
-- 
2.34.1

