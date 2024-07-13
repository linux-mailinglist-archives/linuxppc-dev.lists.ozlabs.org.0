Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD55D930803
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 01:11:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RqzJCq64;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WM4385Mdjz3cy9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 09:11:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RqzJCq64;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WM40l4lkyz3d8t
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 09:09:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xADbt9XNZiQdVWOJty964W03pBxMkzZRiQF/9f0SwIXB2uCFx47RhCHhryBfgQq3hwao36vzP5yYFbky9pTn7uelK1Zye2LdEBNSHfkgx0jkboZWMQiVjaVi8Ail0aTWXoJIGk4fKOfVIlbZ+FF9zcpJRB3cCCXfLywN2imsznStlWx2Ba4OlovkgFi/Ru8MoFwNw1RxiluSyvIO2HY58w2+eAXE3NmGPEz/VQxNwGqeGqzOX4wcJ8plhoVUI+VWLJu6b/4xbxyn4YQesQTv4sAsR0WEO37P1JYtGstlnIknX6U6prVaQBiCjwwieFsPvKzfYofRLUhzFXVjrymsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7dK76Tr8COdd1ECnEbBHmfZQR0iA70vm5dbcSZyz8o=;
 b=GSlIrUWPk/EnBKuXVfl6vSJvjBWTyaws3V+IblALmeglQufFjwvF6ZGBsJ0vGGbjSG3X56KZ6iiBTX2csIZrXgFKIBtGiYfclarYaG9b25UVF1GqqkJGHVZouFBx0dFqlbwaaOj/DqCk1fVajnQirvexoXKQSU0YnYvVLXRV8ushgGEofwTRjEAFsRnMWSDP97y00OSRi580gl5nmfZOgm9y1Ymy7TTwwcWednpmxigQKY3Z1Wd3ICJMcu4X8TYmHn5AYvn/esfsFZsJSaFvNN/m7gC+cHBNVnVR9xsQvdh9Fz0DkBQqYkBIG4uLRJb56YEKR4SQpbi/TeFSNJsOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7dK76Tr8COdd1ECnEbBHmfZQR0iA70vm5dbcSZyz8o=;
 b=RqzJCq64f9bsFb6qSVTFjUNJ5kcSgDYs6rINyEA8BQqGFPOoRPPd7jHVO/anoD407SRfwjRNz4K6Zd1r5ANrgyJQsnDYlW3F8+6ymuiRwd0Z6W7yC/M6zdl6MiHGo3XWX/8AWLMl0WfbzPbDsTbti/VaRxDT8MjWzpVsVJ+1iS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 PAWPR04MB9911.eurprd04.prod.outlook.com (2603:10a6:102:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Sat, 13 Jul
 2024 22:53:58 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Sat, 13 Jul 2024
 22:53:58 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 net-next 1/5] net: dpaa: avoid on-stack arrays of NR_CPUS elements
Date: Sun, 14 Jul 2024 01:53:32 +0300
Message-Id: <20240713225336.1746343-2-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f7b49fb1-9534-4dd2-ddf7-08dca38eae0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?kDb0474Xu7aduoE/91A5DyPvaWLzXkDAU8n9j+RMceIZfzP76fuPmoQGvcA+?=
 =?us-ascii?Q?pwolegkmGMDSsh7vRBgYWt6TCx5l9S+WZQo21zuGBfc66OWwqY8Xzy0odLVv?=
 =?us-ascii?Q?vmbJyecCckSjyzUCZxQnPHsbSn2rOnd/q8DwSSzBEfV4NLCCmiifqYUk8yMF?=
 =?us-ascii?Q?1aNoj/O+ohTzCq4YjNylgAXbmCeD/T1O7ACciB4URorcSzdMXB7P19hXeD+w?=
 =?us-ascii?Q?KLVV/BttZ4rbr0iv1sIzMkOyefWj4sEHuV5T1eAjqKxZhuiINsKnQHsAuGNX?=
 =?us-ascii?Q?mmTdt4enF4mcO6nIHXHiizyVOvx2LEAdLYKh2dxLycLYljbCGKNjaa4fuKl1?=
 =?us-ascii?Q?hs7U+g+6ZypSUioGFxNKb/yFt+UDx1EwgCPnepoLjg/u4njLkyCdLnV2Snlu?=
 =?us-ascii?Q?ptU3fm6IHF5df2Bvc5X9Lqu1aFmGkpN094CCw0YQSlXxgyo7MoDkg2pZMxhe?=
 =?us-ascii?Q?j8kKwwrNDM5d9zpnX+4LdiryLfqvTxOBQkrGYdU4HBIEbfqVgPKvw+3rGlj6?=
 =?us-ascii?Q?H5fNVMxYV2HElT4uVJ6UZeUrtbzLvP4F9dDDcGXDA1hsxUM/hv/ckjB2go6j?=
 =?us-ascii?Q?HRWUMZGUVXY7j/QpEMq3RRt+kDLlmZzhGx3GY59W0ac4SEurmvNbgTlr8CsV?=
 =?us-ascii?Q?pfJWRTZlZ9bIa8Cj6w6fAboV8T7onDCxIoGza1/RYTMIBbvBEEkwvD0zhwty?=
 =?us-ascii?Q?7DzKp9BWu0O4c+95oPyl7fwpb7b/vcY5CCMneK+JuF1Fn4Om5mrDXuOk8ePS?=
 =?us-ascii?Q?e4rqkiJSSAxMfFE6ljF+EYdPJvi3AhgZuy61dnOQoWUGeZApp/EI0+wOxi2O?=
 =?us-ascii?Q?JjWmRs0BDxORuCQJVkSaCVb8Ekjw3FvSRcZcq2qMkLxSUQ1y7zDJXDBDuYyH?=
 =?us-ascii?Q?5DDP9GJGdrmpV6cUAv49a8XZkUjEFu/AiOhFvseWdJmsmuv9xEDNeJOUxNEI?=
 =?us-ascii?Q?xRMejKIcrsqkXBvvot7dX8Vdp6TpcuMldDCU28e9tbSfKLApVsYXHMLj1z90?=
 =?us-ascii?Q?npmYBhSKCmvgfRVdOxregJTylyolSRyHZxFjvtus6dj/jAhMAa5XbHaXV8uM?=
 =?us-ascii?Q?K155bWOc4z4IoMFE5ddKXsd2W5S322s7LaezP3rTRUgXm5/EIDjqZaiBcxzK?=
 =?us-ascii?Q?6mwRHuEBC5pHfb0Pz2N0foIv2D8eW0NWwikf0naHkfI2OxwOhsPUrOwxHx6I?=
 =?us-ascii?Q?IYxfX+D94WZvcFCf2OTz/3UvF9ZjAwfbPO8SyVtH8+eJshCRIVZ4e4XE39Wu?=
 =?us-ascii?Q?aRg7t7G3W49FV6A2u02NsINjLP492ZJ9bOTLQcinrsqMpSLBOq3J6BUErpKA?=
 =?us-ascii?Q?wL47xEORFut2HUGzxP8YQzQlUUgDFZypEJFw4KBotp4kzY2wgUVrPqHGOZsY?=
 =?us-ascii?Q?Mq3lE+Y=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?BL1R2dxSGCb90odTjTdysFJxkaEgUIZDrYOhV5olpSwe8c9nN/0DE8ZRLgF2?=
 =?us-ascii?Q?/XPAN6xG8ewSXmpdA9jzS0+w8EAb2ieIRcXiibCe+bJWaYfsVeaSvL7ZwpLr?=
 =?us-ascii?Q?0KPycEsDD3TFHSalVCl2qDMEPhqnbv2D1rtrU51dVCSFPUHUFp7Jn6vemoUq?=
 =?us-ascii?Q?DtG5HgA8x2TEY6LQymQAyPXSLsvw4BkqQpqXZqsCrjnCDWLC5sGuh1YfFNh4?=
 =?us-ascii?Q?INjYeH+YarC8I82eFv9RSJigA8piAQOihnYFlo7Z8prG5VQQDtWriqWpO0yN?=
 =?us-ascii?Q?MBGcA2lh3sM8jTOJSQFe4YcHNEi1W2ViAvK3O5Rx95eIuQsZxN5a8k184aRi?=
 =?us-ascii?Q?zhb8Oy7vEYc3S/vLfY1U+AbGjjWoB+eUxyhLuTIjyVeglCepKIO5omMEu1a7?=
 =?us-ascii?Q?oQl5KXcDw0XqJgefgAIJQKX2LC0idVUpKe5HrpVUWj0h0HDTfw7R5ib0y/p5?=
 =?us-ascii?Q?x8/iOH5DYVQ2fbc4LRwCsM0UzEy9ustK+4+bx6R3S97R16yhIKqKFnbfolHp?=
 =?us-ascii?Q?8Zrsy0R+NZ8T1k/bcUF34n9SqU02+VsytI2PfCbhAUjqmPbHcoK4Iv6LvMoJ?=
 =?us-ascii?Q?wSpAJbj2/tHIDeiDa5iFIj9mra4obTSn7GjGKefd+GvqJ1NjSFBACBBo2/Ih?=
 =?us-ascii?Q?ITXJWyrDm4+Los5GuwdJS3QA4DsbFtSv8SQQuWnJ3ZKHY0UD0WpTLtbHPKW8?=
 =?us-ascii?Q?6xtSMtH0nT+Urbe4TX3id6NidYE8+oD2WFgGkTXmItI+fycyNAxAhYV2GH1N?=
 =?us-ascii?Q?v6Z2iylUqCQBrBozpb4poe2j5wX7ePZZAyQB6lvIhM3s5+JStZoQPouCSLhU?=
 =?us-ascii?Q?XMF+wvXb47P9TpGRRN/1+O2oBZswF4dqafQ4y08YOZXUhj9BjVkThRzZQBi/?=
 =?us-ascii?Q?rN0znOJDaUc9Hrxr0mI2bm0J7A3IF/y2dVzoio40opIMBDx3729db60E7W6j?=
 =?us-ascii?Q?QEeKMKaRtxmIwZVqG/DRMdzvhk8z4II/WyYbk9Wc/YuxBpxydoa72S8gF3dM?=
 =?us-ascii?Q?ujiGdJsUUSMOD8rJQwEyB/iiIF1VgdZ7H6Yp8gm5ad4ZckPEipgb8p25Qlgy?=
 =?us-ascii?Q?zlUwz9S8LJ/P4JvNEnHY5ZZ3/E/0wdQRWnvN6RWf+YVCe49bY+M+LZVU1vMp?=
 =?us-ascii?Q?k0pkx6tQEL1cjximZpxaW/SeYNGgjEgXjrnR0683FryMNoOn2jjiMNPPGjfs?=
 =?us-ascii?Q?t5a9PWmsh8Nk7trxAKKYzBhpWDkBQHgw4UzTQEzausu9i+blicZcMU817oV3?=
 =?us-ascii?Q?DamGcA9kHBg4sWhLqNGP5XVgpLV/84hXqCJV/B0l0jvApCHgw1Fg3QR26vUM?=
 =?us-ascii?Q?6smPvm5MdatIzBrev3QZ/bh9ZjU9DUYbokFC8iAXccTpwRXP9z0kmbmMGUfO?=
 =?us-ascii?Q?rWBdBjeh+Ua+N+cXZ+NwP5PCldesLF2KHXme2q8eMA3Z4X5vY6phy/cZ7T8O?=
 =?us-ascii?Q?lwtYQktC0ynRVdnu2KkCF8Iv8AHZ9zOemlqcODl0zhxTuviUCeOYXtqWNHNV?=
 =?us-ascii?Q?eMne1lMkzEwbRHICZF5AmKT548lk6MYrGDa/18H3Hw0J8TQmQqN4JStt4cmT?=
 =?us-ascii?Q?IVgy6A7KkOVeOT4QPFbAwcGmA0sR4S5DWx6hJfJiE7ZAYdeEex5hU7xvGNtq?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b49fb1-9534-4dd2-ddf7-08dca38eae0e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 22:53:58.2138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1z6nr5x0Zflr/Wpxxf8BA4/0ebG4YO4u+qU3+zdPOAqtkT/lGHPXomZvlU8hZ07lMb2XT5zmas+wX2Rsj4BVIQ==
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

The dpaa-eth driver is written for PowerPC and Arm SoCs which have 1-24
CPUs. It depends on CONFIG_NR_CPUS having a reasonably small value in
Kconfig. Otherwise, there are 2 functions which allocate on-stack arrays
of NR_CPUS elements, and these can quickly explode in size, leading to
warnings such as:

  drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:3280:12: warning:
  stack frame size (16664) exceeds limit (2048) in 'dpaa_eth_probe' [-Wframe-larger-than]

The problem is twofold:
- Reducing the array size to the boot-time num_possible_cpus() (rather
  than the compile-time NR_CPUS) creates a variable-length array,
  which should be avoided in the Linux kernel.
- Using NR_CPUS as an array size makes the driver blow up in stack
  consumption with generic, as opposed to hand-crafted, .config files.

A simple solution is to use dynamic allocation for num_possible_cpus()
elements (aka a small number determined at runtime).

Link: https://lore.kernel.org/all/202406261920.l5pzM1rj-lkp@intel.com/
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
Acked-by: Madalin Bucur <madalin.bucur@oss.nxp.com>
---
v1->v2: none

 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 20 ++++++++++++++-----
 .../ethernet/freescale/dpaa/dpaa_ethtool.c    | 10 +++++++++-
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index baa0b3c2ce6f..946c3d3b69d9 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -931,14 +931,18 @@ static inline void dpaa_setup_egress(const struct dpaa_priv *priv,
 	}
 }
 
-static void dpaa_fq_setup(struct dpaa_priv *priv,
-			  const struct dpaa_fq_cbs *fq_cbs,
-			  struct fman_port *tx_port)
+static int dpaa_fq_setup(struct dpaa_priv *priv,
+			 const struct dpaa_fq_cbs *fq_cbs,
+			 struct fman_port *tx_port)
 {
 	int egress_cnt = 0, conf_cnt = 0, num_portals = 0, portal_cnt = 0, cpu;
 	const cpumask_t *affine_cpus = qman_affine_cpus();
-	u16 channels[NR_CPUS];
 	struct dpaa_fq *fq;
+	u16 *channels;
+
+	channels = kcalloc(num_possible_cpus(), sizeof(u16), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
 
 	for_each_cpu_and(cpu, affine_cpus, cpu_online_mask)
 		channels[num_portals++] = qman_affine_channel(cpu);
@@ -997,6 +1001,10 @@ static void dpaa_fq_setup(struct dpaa_priv *priv,
 				break;
 		}
 	}
+
+	kfree(channels);
+
+	return 0;
 }
 
 static inline int dpaa_tx_fq_to_id(const struct dpaa_priv *priv,
@@ -3416,7 +3424,9 @@ static int dpaa_eth_probe(struct platform_device *pdev)
 	 */
 	dpaa_eth_add_channel(priv->channel, &pdev->dev);
 
-	dpaa_fq_setup(priv, &dpaa_fq_cbs, priv->mac_dev->port[TX]);
+	err = dpaa_fq_setup(priv, &dpaa_fq_cbs, priv->mac_dev->port[TX]);
+	if (err)
+		goto free_dpaa_bps;
 
 	/* Create a congestion group for this netdev, with
 	 * dynamically-allocated CGR ID.
diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
index 5bd0b36d1feb..3f8cd4a7d845 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
@@ -457,12 +457,16 @@ static int dpaa_set_coalesce(struct net_device *dev,
 			     struct netlink_ext_ack *extack)
 {
 	const cpumask_t *cpus = qman_affine_cpus();
-	bool needs_revert[NR_CPUS] = {false};
 	struct qman_portal *portal;
 	u32 period, prev_period;
 	u8 thresh, prev_thresh;
+	bool *needs_revert;
 	int cpu, res;
 
+	needs_revert = kcalloc(num_possible_cpus(), sizeof(bool), GFP_KERNEL);
+	if (!needs_revert)
+		return -ENOMEM;
+
 	period = c->rx_coalesce_usecs;
 	thresh = c->rx_max_coalesced_frames;
 
@@ -485,6 +489,8 @@ static int dpaa_set_coalesce(struct net_device *dev,
 		needs_revert[cpu] = true;
 	}
 
+	kfree(needs_revert);
+
 	return 0;
 
 revert_values:
@@ -498,6 +504,8 @@ static int dpaa_set_coalesce(struct net_device *dev,
 		qman_dqrr_set_ithresh(portal, prev_thresh);
 	}
 
+	kfree(needs_revert);
+
 	return res;
 }
 
-- 
2.34.1

