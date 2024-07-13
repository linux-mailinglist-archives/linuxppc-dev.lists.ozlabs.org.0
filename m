Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B92CE930802
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 01:10:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=S7aX0Wzy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WM42N4ZbQz3d8S
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 09:10:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=S7aX0Wzy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WM40h6PRGz30Wq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 09:09:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IioCFRpZL/OEJRz0074hSDJ7O9Qwqy8dqodf+XFlB4t5C614KrNEYsNfQYTrpwX0JuZJdsjV77wqZxO6WnLWQnYId8ivY5Z0ETxkjqtqXCrnqVbwrgbFD1eo9A4Oq+/jBFichScVTKuJQt7+igG6YWRUuj0dX2JRmcZV9JxJfNMzPBI40Ky3sxZKPPAen9+933wy5KXr5GskIzLaeja7BgIvy9MO3NPpVEqJ9AmVSdXN/rBxIZV/pgh5Pk4i0/ryqLx1YiAlrI/UTUvx1L+zbDS4SlF0xJ744pyzL+oig87tBcuGc3mX4fBEt3bsWMUfZEZa/xcGCdzWTUEARl8BKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reBbLus/L/Mbwc1d66xSxhKpCm6GzyD+hP95eLSu8ak=;
 b=cJUFT9TI9aORNF4o/etEt5FpKqI78+yWC9h5rFDTob3pQwxc3TV+eoSJetVt6BdLPHMuimwj4OgVrwRqfaAZbRrPLPPTwZuPsBCsVVCdbB8RJejNa69qJubcjQhxSmN4WpotSVen2Ze8bAm2b1mqpFVLinguJp/6rJ7Zwz02AlALcUD63sAhHRNXk8d+cg95LkBqbyDkY9blUw++20VoGBDGUynQDYs902CQRGjvTPrvq5o1TfW4TTnef+NhloN9dW5dc4WCgNRbHSdZ8LGEd9mN3Jh8nrohwR+hWTTR3amqcjIyQfDgU/H6riCzqcLqfW48Sj8dM0P+S4aqgm9TsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reBbLus/L/Mbwc1d66xSxhKpCm6GzyD+hP95eLSu8ak=;
 b=S7aX0WzyHHbHmd/WZO7H99X30Jb/GCalaDLXuLHI2k+/j90wUbEjNOv366UT4kI7EXTYkH76oxeiISTc7Qx4sjrWhLFPFF2N+NQNYSHXZVstZtig4II5IgyPicKY2PGpDihT007WGko6FIs6hHkPKl+b+66czJnCWUdA5rNA57U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 PAWPR04MB9911.eurprd04.prod.outlook.com (2603:10a6:102:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Sat, 13 Jul
 2024 22:54:01 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Sat, 13 Jul 2024
 22:54:01 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 net-next 4/5] net: dpaa: no need to make sure all CPUs receive a corresponding Tx queue
Date: Sun, 14 Jul 2024 01:53:35 +0300
Message-Id: <20240713225336.1746343-5-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713225336.1746343-1-vladimir.oltean@nxp.com>
References: <20240713225336.1746343-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0127.eurprd07.prod.outlook.com
 (2603:10a6:802:16::14) To DB7PR04MB4555.eurprd04.prod.outlook.com
 (2603:10a6:5:33::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4555:EE_|PAWPR04MB9911:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d28a43-f95b-4964-8ef8-08dca38eb033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?BZsqmrS2IlfGN8yC1WRC9W99XZbJCoEAOcSchjO8hnR5XvwU8Kp/rgFulnvD?=
 =?us-ascii?Q?FDTwqfY+nAyz78KRLScdLh5RNj2NqwFM/5p2h5O3UYHCVsa1Wh+3p7Ac8D3b?=
 =?us-ascii?Q?MdQHBcvpsya20QGZymYISNy2f1FDZsJGQsHzB1BEhknzDFwb1YPJCLzGMYbo?=
 =?us-ascii?Q?kk/GciY7m2toGZINk1yLUrg1a8dD4veFEIk4iat6MJ0cnMjoU6ogzSljPD8H?=
 =?us-ascii?Q?aZrj6hojXusqusjxNUzYHtY8liSmTfj/9TBIoxt9UuoLrfHkhIwS7xOC1a8n?=
 =?us-ascii?Q?uT424uKfw+lJv3V//++k+euXE60qDbhKCDikDIk5ofAHxt47BtB2qFWldIyl?=
 =?us-ascii?Q?Qzf7cTYfZhhmWg55GHQhqV6MoSY2uN8QffiZ2VXGs5u8vc3HSaKx3xMKOYAQ?=
 =?us-ascii?Q?mDPTP8EpcBNKRn7OvqqQ46roLVPR1QrRt+eNJrhndNptXnFxTJkuCyZFkE+B?=
 =?us-ascii?Q?Cm1y67aUyAI2pK0nXv7jH8btj9ib+u6zS8WzfYUoQpRVqtM0CGTbpkLF8HTr?=
 =?us-ascii?Q?4d6SE+h/VdI4G/uSrwJjhT+XwgOLyUKybn3Gahj8yk0QP62SAMO1oeACCa0x?=
 =?us-ascii?Q?qqhRcG04JAxyP4bitAQupEUFZNV9BWkxbY+Jt32O5pXX3it0OHFguIOZ9V2d?=
 =?us-ascii?Q?gtgH9Gi0dLdg487Rq23SeIjoqn1kAhLGD9GR1XX+PYtumQPzHBUg3nfX7qeS?=
 =?us-ascii?Q?pZV5IW4Sv1cNh6r36xdlDarb0bTt4FR+pDmF/L8dLFYJq5dfppULmObQaKKr?=
 =?us-ascii?Q?MzJRU2OEXLMrPN6I+Q46nQQqQH83egqNHQWxGsa6fjlGCgICJnrJT/P6b4Du?=
 =?us-ascii?Q?8K6hZraV014/cvv5wnL4L/AHZzF5LOHG4GudREcWaT42u1Vk7riGKUXmvQDO?=
 =?us-ascii?Q?pqP6G4tEVEeFuL7/lqvel0FaKOp7m6a3SkM5UzwWUVQFkomGIqFbFmpl+okf?=
 =?us-ascii?Q?9RVZAjhsq76i0DnY+R1oyF6FQRg216rg/T5x1mvcQkom/7srX/XTq8qku6QP?=
 =?us-ascii?Q?CCoV2DtrMO8sD6gZPzesqmKZgMhv3AloAS7jPfwIDWR/gDqfPJAXK3Lr/u0s?=
 =?us-ascii?Q?Hztg0MnjbNEyXfYwvUc7J+ESTbfp74hjEnGWA1bTndOmJX6zX+14xUHKRhyn?=
 =?us-ascii?Q?OO3h6hJ9KoI0Iedosz72zYUgtlQOE5dUfbbSDK8LFWIgaqoRVwpMscMMd1fe?=
 =?us-ascii?Q?nvYwGZnFd7Z1wQUjRUZ4hcPqPP9P5GUOyox/0MWjoc6UWsEWqHO4z4EQGVnG?=
 =?us-ascii?Q?eOFRQQHs98VMuKl0Y6MhY2h/vqCGeuACcxbHSty8nddZ0v48/s91waLMgxAU?=
 =?us-ascii?Q?85U3edd+Cjd374LifB5HsNwg3ErG15BV9zXVvnfISP5rwrcRJtRqw4jR/x6w?=
 =?us-ascii?Q?ICJauG1CmTV8WzCIECMmOgzSwAvLQ7zTc/17cm7ZZziVoX0U9w=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?cNF8xoaLgEObU2/mUtGe1+asWhcGopARRFar8nzCZvZMebwT9fRFANmP+7ti?=
 =?us-ascii?Q?qAjW8SOsysgWI6zjAlCnv1B7q2/aVTK/nYOmOXgMldyWElhNrzsrPBl8yl3x?=
 =?us-ascii?Q?TAdIz4rfsz7glXwVsKYftTrB9xXyuBcYXWlCdsFNgT4HSJC+d9E66qtUJwNp?=
 =?us-ascii?Q?Y5ZRJGtQrPeEIibEH+v4cNg2zCk6iYyqlS9VoLHW8WHfZeHSepqgDlmEOxpt?=
 =?us-ascii?Q?AEk5LDCcleY2QAMhn94+SRt2C8J30hrvZaXe/UAXij3o8p3FnBYP2usVuwa9?=
 =?us-ascii?Q?v0CnluCK2Shnk0G7C8v/sP+vFF9/4yx8jwMusMqyJ/Kqwi7XNqvRX585UsXI?=
 =?us-ascii?Q?xC24gmqMws7ouWaAsBofkSD8CiwiRqZZhl47xW+iPZQWVLfOQT15Rk/NnMGU?=
 =?us-ascii?Q?02rb/la1prEwLKXNTGO6/S5NoHD257NYHZ1XEayxc5MV3LA/de9RzEOQvSjc?=
 =?us-ascii?Q?n/v4aP8j5QlaMvxpeeU4F62J4b1AWPnZh2Dc8StcVliidPRL0gsQsUfnGrtD?=
 =?us-ascii?Q?TeG0fhkRWTW0M19nJ5k1iNSNBuOovvluZ4Du0P5imJ9oxAcs/h1K4IkaIj3O?=
 =?us-ascii?Q?RxPpelxAYr8lnQaiIieVA02oNQN424OkBVcyzsGf5BRxiNwkIlraeFeJ/YM6?=
 =?us-ascii?Q?ef/xziRWhgC2jwd8Ematt6vu22nb/4furFtKsyEzD92mzpdSoMb4L1/5d/7r?=
 =?us-ascii?Q?pKIntrjCoTo0HwsQl8ghzxJAmA7A/bAvvyFN/cXlWw4JYOp4zewfC18kVeTl?=
 =?us-ascii?Q?lNn/tNmgLVhCJRBZoW/bgojM+ZsTPoMSE4tvO5RquPpbqyjTUwnLWtUsQdkV?=
 =?us-ascii?Q?alsrj6PxjcA+ajbwV5tcSJcjaASAlj0eE8i8BttTIvdtMZ4C1qJ+qxuR+y1E?=
 =?us-ascii?Q?h0q/8MV+TlCB3GCeyfzuF+hImsExJUeGd3pcJC17p5DEzXnCyYQ+a3ZIp/qB?=
 =?us-ascii?Q?ctU1VJwzf28tF1B2edYOyfzzSQUpZtMZlZXXNDMi+y1cfgOKqXDxubEPJhZH?=
 =?us-ascii?Q?8ZLAtD1rl/0shi4FpTJ2ha61a0qRhDXaz7J/4QW8pi/Oux3rigUAeeW1ui5D?=
 =?us-ascii?Q?BzkcJGJno6xiWQCjqaUkoJT9kYtADcpLCVHEOdmZT7CltXD7uRM2Dg9BCSs2?=
 =?us-ascii?Q?3MrZV36Sg3JJB6wo/1boR2pi/jiDwUIOjHmX5dlgRMrt5RI/kgF8Nlzw12zS?=
 =?us-ascii?Q?L+BCtQ1jgOE0mzSBTsKP7rbsb8JtSRL4tppkGwUwAijrG3edFWKq1IZh5nFj?=
 =?us-ascii?Q?68pCq49itoZYHeE0KlBgPIR7n0YQ7LnsffQxJTj+eJF9Bi7F/gxB9BP4y0KZ?=
 =?us-ascii?Q?Jn/MijUaVkTh8lKogSIudOqSZZ16kfayd9BJ4TzfqBvl/IZ8PSQvQf3jVXKY?=
 =?us-ascii?Q?TPtYpm/DrCNWAK0KpTd9F6JFq6UxPrc3N4r9j5yKdXFHn8r7RmyfYNfVsQW6?=
 =?us-ascii?Q?tjuuUGczuhROwZS8Ruu+wn9SDRr6AX9/2huKD5VIZfxKjdruml6TETotJhz+?=
 =?us-ascii?Q?ZG+CVCIPZpt7JUNM46KmyLfsCnCEYHTdeaXOBEJoe4CaV/ljv4OoiQjjD0bn?=
 =?us-ascii?Q?KneKWWJukRNCWrw9al7rwW5qOraB1Z08mfQQLPmK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d28a43-f95b-4964-8ef8-08dca38eb033
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 22:54:01.8077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFBn9Psauk6yjs0FFSTuYMxq+JHdxHaVEfWc7MnUmgnMB9so637o7freRV6v8vCOAH/5DT/0wn/Nx7rnyKCbKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9911
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Madalin Bucur <madalin.bucur@nxp.com>, Madalin Bucur <madalin.bucur@oss.nxp.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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
Acked-by: Madalin Bucur <madalin.bucur@oss.nxp.com>
---
v1->v2: none

 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index f844c9261571..cfe6b57b1da0 100644
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

