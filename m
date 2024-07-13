Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7653930801
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 01:10:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=P+ZSQlVF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WM41T5BRrz3cXG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 09:10:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=P+ZSQlVF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WM40262hxz30Wq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 09:08:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrCvwcpJiFwcwxFxhQsjSGANK85aNwEcAXuMAT+hyyIcQMck+qSYoVsxXveQBuoek4Ca7aGsswL/q4OySO/IAd/8/lG4KFr419JXrxTiCbaxmR5N5U+9kmBLjAa+LDQE3hbGy24Dpo3dP/CtA2PioXGnFs/gY6SppxlAR/u8ViIreyf+vDKARVkJcwOH5HQ1rz2NsE7AZPXnBUoWNieE/JG8vSTulk2zcSmYusKnMC0b24U7/PY9NXL4Gv3rhK8wf7eQuYUMiqZSCSzNYrPFOFHmMZsp3MxyaM6k7jQvlFN21pV+S/NrxP7YSMpugGfiSGM3ivpAGGZqCdwYS7MOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9v4et4kqf6akDULpyb97OeL3zo9BKzIfcLnB6xgqBAI=;
 b=wABSfb8WYQjcpvPIlykBaTXODRZeXFPEP2mRqgZEcb+VXx3l+qFsGcEjtVE/qF+7yhrpkASOFPvBL7zZPykX6ukOlCSKUwfDIT7eBTWkDjXwOQ2l4df8uREq8Run+5//lebx2/XEm8L+/9Pbw1DyPx6TELndgsWu0biTuwoV0WBPkTDBZCPZLuYAmFbSohw/BkDFH0HTFE40IomcZ+Y0JSyHKijOjeP6KU8RP0CvJy+bUFbAa1xbsm51Lbve3iDl46JAJO9PXzkUQtotf7JU8XNjIbqV6QtiY7D3aNP0nGO9rA9L9AlJTmc5XbQKkbuw/im58qpGIndYus30ICnSCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9v4et4kqf6akDULpyb97OeL3zo9BKzIfcLnB6xgqBAI=;
 b=P+ZSQlVF3sWBrlo3u26u1gKn63vLwpx0NI62h0mWHq4FcZEka8u0a5HEjHJnGz4Zq7pM4PjPsLuaoHLr+oRVsIFNWShJS0TPqYTAms+gFQhQOu/5QUOgiHZF8tazzDtHujFzLf0e857mghjad/AEl04faJHz77KEz0KLKkYA9s8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 PAWPR04MB9911.eurprd04.prod.outlook.com (2603:10a6:102:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Sat, 13 Jul
 2024 22:54:00 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Sat, 13 Jul 2024
 22:54:00 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 net-next 3/5] net: dpaa: stop ignoring TX queues past the number of CPUs
Date: Sun, 14 Jul 2024 01:53:34 +0300
Message-Id: <20240713225336.1746343-4-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: dadc02d1-e00c-42eb-ab04-08dca38eaf7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?uzxs2KYSgqbqQei/KAwA9DOAf4+Zfu2h4LAvVp1FxmsU1yNqpTBZIKA7YnoW?=
 =?us-ascii?Q?f2WpG++LAegQEx/0RJXmS4bSt7XxHUjVwvZdOHBtoLrF8Omm94SnCqs1m9rt?=
 =?us-ascii?Q?doZkOAohwBDqhVMP6wnClS7fTDk0Cx1CA7NNHz8IYbiZjmAPxzsm5Yxq8t9O?=
 =?us-ascii?Q?Zz/lMYUpBuOqo8usvfSjzmpvBp7UaWnQnNb1cyos4/iWQCEe/PxpZztikfQ7?=
 =?us-ascii?Q?MHHypV9uRfXXhyFe1EnC4N0RjWIaEeMc0glcYh1t2zL2bokxSmQljK0YTBQ3?=
 =?us-ascii?Q?GVAwCwdN08CFrVqvhG9VOmhqLhgezGq5R7sbjXVXdV1Cvd/vvCu6jpz+dqfC?=
 =?us-ascii?Q?AtQ6iLA5sYSu8wepN1HU+HBYg8g7bNDlmNBhpIjW3vrGi22Ijp6B0Feo+qqX?=
 =?us-ascii?Q?R4i+x+aKrSRwCs3lKKYm+SmofJLkr2Ue1Izc76XPyifS3FmGRWJw2KmP6Akv?=
 =?us-ascii?Q?yH0FUGRTl5KLRh8UALpQz+FPiRdUKS4wS9pOm29K5UovHja1CR7rSDDLUOqN?=
 =?us-ascii?Q?V/sOAqpKHDD35n3F+SY6S8HyoB92JGDs4SNvmhbf7Luha4986XKUB5K4iCLZ?=
 =?us-ascii?Q?qbPEeB+wcnZs4NO3K0rZ223EoIKsBBYslUXeSB1IEw3QMabkua8wc6iCjebf?=
 =?us-ascii?Q?poDLjKdsiOnL6N36MOupOie4huqBDJs1+HyTfMWH2jQ2/aUekc7WLjm36mRr?=
 =?us-ascii?Q?NtT7Rv+70Gc1MfxdVsD5sBkIVqDmfd/0lzLSo+pfjck4Vjwhlu+XUouOLw0I?=
 =?us-ascii?Q?TyUrxyeV3FL17ljCDQVEKraksopGhYKMuKPogHQUlYaapVlvvxFfvLb1hTJt?=
 =?us-ascii?Q?tdGm9aCbAij44V5fPv6GkyJraFMK/sniKNqIks86wvMj3tsZt56wq4H9FuQ5?=
 =?us-ascii?Q?OvOMTniZi+v+wf8BPaA/1zzaifgmIWfHAitCe0mtFwO3Kxf+KALrLfVSSEYf?=
 =?us-ascii?Q?U3oFoxXW50pPGktwTReRn424xde0mYcuWe1Zu5OKr04RaHMB6ttkgjQszYp2?=
 =?us-ascii?Q?3Mz9837yR5Gy73WBOIUEN17aOXfrQJ6RoeGZ2chI0oqGsOzndmUKFImK/Jbt?=
 =?us-ascii?Q?Olg9zgmOvM5DVhIaTbxGJgGMWf+5KozclPS38jEJMuGa5IRBk3YaSV7MQJtO?=
 =?us-ascii?Q?QEeBGXvzRIe/+qYn7tYOQdpuEeBuj17mBLg2jLyrFBOEfJUJpyg4ovxyVjqt?=
 =?us-ascii?Q?8L9WXF5Mp1grIAEdabiBfNZ+nQdXp+y0gTjrhdJozz0j56yHkWpRAyLjM9Vp?=
 =?us-ascii?Q?EOEx5JVj4J0tXz8hhGPNYEGIfvlJvlH83XAf3ApwDBS6U2McDOqlFRlXS6YK?=
 =?us-ascii?Q?GDS/+jj/SDsYzQ48VA3QXZrW+XXnzjYt4SNspqBuRP6JckvYKdaaUyMBQDVb?=
 =?us-ascii?Q?ZaHpsLRNojTNF2Ep2JWoLJjz9Fbf4Oz/6jbs9jl7nuozVEWdwQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?0vUavGvIqfF1aCuaND2ANR3Vg650NbHvIc6N2/mlA9b3bkbRuKZT2KhOKJC8?=
 =?us-ascii?Q?JPPGnQWKRWXqQngeybZzi2nMTRyP0jREQNWmzjxsdu5a6ZQhciObhYGLDT68?=
 =?us-ascii?Q?g1zK0LfVzixklzsjwHSvGYpbFft3sFqgr/0q6h+DsLw7ZADR+gUj36IqkmZv?=
 =?us-ascii?Q?EoEDoRBk+biVikRNw6/rcV0eB1XAsOmebFWY8E3UDqCypCP2X6aoxIsZ/oiR?=
 =?us-ascii?Q?UEWwx+XuYfjkL/CpYZ/ef+CX5tFGIS24WXOZZwnluBkh2DSFzCnHSOcD+w9W?=
 =?us-ascii?Q?bKQAc/6AU7weZYQ2Y0WGxlsigFffxgzUHTDTIWotDd8wzHpG90kZ8iAGFVKw?=
 =?us-ascii?Q?otNGZWeoes3uXWCzc6vVByLYUtVo4T8fJVhakRw0WxhFqVtj0AdA3QtImB3j?=
 =?us-ascii?Q?m0YN8/toaJgb+HIVk4gqVx4MfI4QjQAn+TbiMbaUU/eIxcQq6zYxslGuwYwB?=
 =?us-ascii?Q?izYAt8qimrTs3lCQwuLJ2mop7aXzJQiW4F0jPhrAiyWmVJuOj0IzLb5WVvuW?=
 =?us-ascii?Q?mBd4zS3lr/y6bmZQIJQeRuEEfjQUJsm+5x1jXftjawA22/n4EYkJgrQO2XFt?=
 =?us-ascii?Q?rW/FOT1iBMqxNfFeTq3uqXu6ilb4HkiM0TbmLeDKJBD2f3F2xnHD9kQ6qwIv?=
 =?us-ascii?Q?RBxT46tXb+6z+90j1QTkpdhRCA3l/yi34GrEeUDprksVHXOEuHM3/vnlQQy4?=
 =?us-ascii?Q?3RUID8+lwbDyMBJfr9ICCnVyrLhHXAYaJPqkDHjSrtWqcI1NX1O6yVyKItZ1?=
 =?us-ascii?Q?3U8bPd4ilpXiGgcWmhw8FDDGcq95hbTwWZleDBEGbB7cGj9QBsPF7lknZkxd?=
 =?us-ascii?Q?7P680BLC8x7qjjQWkDahyXLl5l/o0Cyh3Mm+DPFiLCCVDaO7RlChy82mTLp2?=
 =?us-ascii?Q?A6hjGRKY3b98NzxTbFqumxfX0TMeexD5hCKR2DMVw4p0NAfkI1ypGtwykERq?=
 =?us-ascii?Q?6glgigMzsc3WKR/gAlGyUW8p1jUgW65gOrOwYXm80NEWHBtXogutyA2MhVKA?=
 =?us-ascii?Q?VIjWSPxf8WRmp4psxXzrvNyVW6R30XA9f2LPV49OseebeLXWGjyvIQbczjF0?=
 =?us-ascii?Q?o7p6eEcF3WbQDA73Q/LAmAkBR1W2jZqUR9Urq6MoMBRPc8/CfW1l5RCirMla?=
 =?us-ascii?Q?Nm0pH+AL9Y7cSiGUjDMrmgBT6RtsZig490SX48L/qldYlf7ZdK7vxjVpe4p/?=
 =?us-ascii?Q?1nGJQZ65Ve37sXARwNoEaoLi96puDgXtbXSxirAfIWvQrvgJYuv2H/EgyGxm?=
 =?us-ascii?Q?tY+NjRGdydyz7/bmGUYixQA4UidabU+DpgbjGINoqnYXSKRTEqzh4BsMXfmg?=
 =?us-ascii?Q?M5Po9DLlqWAkrBOrqNSBexq2Ocdlu6/trVS7bkuN1+UYUiL17Ef+/S4Y5//f?=
 =?us-ascii?Q?zN35zWnNeJlJsOfAGkTL5OXV3Dg07fvwGXFAb3Z78URYdULUflq+6gD4OsFr?=
 =?us-ascii?Q?VlloWvEVFVct7Cv5APhmoig4dx24Qw4PZktawJNDgHmxJFfQ06axzyv9KYmb?=
 =?us-ascii?Q?RIJaCw8zRL/uw/o/hDD7USuEAD+mNiyaeSEJwTJzQrpqDloGw56ALe8su/1J?=
 =?us-ascii?Q?fUBs5iWCgacEGSIgw35DjJ55ByCROWsyyh5rq7g4Qux9+7fhYRRUnXqT6qnq?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dadc02d1-e00c-42eb-ab04-08dca38eaf7b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 22:54:00.6214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjcaMi43707Fqx9RcPNN5LQar6lMEC4ouvuHOylgJM8KWHPH7b165EYyYcGvyMgVY3vBzxNB/Rebw3ki+4OCDA==
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
Acked-by: Madalin Bucur <madalin.bucur@oss.nxp.com>
---
v1->v2: none

 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index ea1fcee77f9b..f844c9261571 100644
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

