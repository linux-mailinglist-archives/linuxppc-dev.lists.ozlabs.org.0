Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B992DC3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 01:03:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=qONo9SeE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKD176bPkz3cdB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 09:03:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=qONo9SeE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKCzg3P3cz3c03
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 09:02:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFeyzavv0ZFTTexIGVicGBSxvnUVX/nsKuawh24ldyKc4SJrf5yXVYJN8PlbKMBBtyWLAdG6zs/Ke+I9GbnQ3HHjkLzBt67D8d3Aj/0U1/N1QbDeOdNkfktc+lQ21AQCnrYUtekpZu6subfOGOQl/fGqErNH7Jb+cX3zyj19BOQgX2sny3zhqbZGllHOl8FGdpjGX4ZZBLwXLtRMbbhUttAgZctlkvVHCKggbLzBEjBOo/5EBGeW+kDqrddCnGOop/wYHY8VMB16eLvnOfiO7z2O4FZIsVuvBaRxX/2/bCS2pBgzdHK80Kix5CUzn7Jee8oVTY4AaU90/NEN4ElTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OX5Kxh2i7L1ONCVRUfVtr9VckOT4uj5NsOntuOFlsg0=;
 b=mz65lWSyHagVd3SjYy3NO4fNxDO1Xr/2VO2TxPBGrZzuUwYKA/+JnBhyWsJkS9t9LYGeFl++RIkvA6SKHvYKKCjH7EYXlu92+aKoJZ1Onm+Mhl36E+wplxIta+JNjbKxxCMvHi8+GhdIcLgAUM1B2WXuiQiyBz889qPIFLkGguY4TvDIkzA3OfC5chRpMb4cCHy0atlDA4Kpfg7j5jec5aBUd2OIS79wQ0/FtMXRJtfzF1IylXPJJoYjzLYWWyO6y2xJyh4GgA5cK3xmAMxsmLC9zSwchh00qBKxUnNkzJTmnGvTtLViRMe2EV9I2kqHq/HiPnUfis7chN40ipgcQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OX5Kxh2i7L1ONCVRUfVtr9VckOT4uj5NsOntuOFlsg0=;
 b=qONo9SeEaGG5+sNK5dOd5zghIwJr5FqMuWgTuL6sHzQrFE30aDvCGdrx5Ue9SRAn1ZuqTmfvflyBmve0HYfFHc/SSF3edJFwAS9Jb+iyO/K4IYEpoDMfaAC6r68aEySEpq9QIeJhee7uhw+uEdRENi8pt8EJSlJcg6xSbIDy8qY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.20; Wed, 10 Jul 2024 23:01:34 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 23:01:34 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 1/5] net: dpaa: avoid on-stack arrays of NR_CPUS elements
Date: Thu, 11 Jul 2024 02:00:21 +0300
Message-Id: <20240710230025.46487-2-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 357708eb-6dee-451e-7117-08dca1343eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?465cMh7tJS1qQIiA4U/auNv6ttb53mLoCwvX0Uo5HpFQ5lQJUimFAlaYkaMb?=
 =?us-ascii?Q?9FLjnCCnXVA+T7Q9FKTgIAX99oDVqexAqO4nWAetTRh3+qemTyjS+LFTc4CD?=
 =?us-ascii?Q?CkpA6FTubM5gwHZBwO1Z+0qQRnOT7I9uQMGlZusS9BjG0sTpR0bqu4Ipu8G7?=
 =?us-ascii?Q?ZO758d3eakGfS9Ng4Uv0n9fAw+QaEG7keuV/QoMaOYVZH+jFmjtEkleEpm9y?=
 =?us-ascii?Q?n/gXqLu6ymugdxAJ2fR9qDZztlST9aW5guUF6Ou/VWAuvfLAN6VlmBAOR7PI?=
 =?us-ascii?Q?ZDsfA0cyhS34c89UKzJ3yfX8WQF06v9dpxALCeSJO7EUlMkLjWE5rpKTX7Zl?=
 =?us-ascii?Q?r4VjXScMjDvLTr5oDGC3uGvORKd2hRZyxxXChnh+a/tOYnoS/bDKx+JSUwV8?=
 =?us-ascii?Q?1apib7WgPOvugIP7Df7MJ6m7JMfjdTy9YKsUZpNGhcpc16I5e9HT6shUBjvu?=
 =?us-ascii?Q?b55A/fsdEuESmbluTnge19laQ3vmVFIu0zQiVWIO6Wka0sr1WZl9mKH1bPF6?=
 =?us-ascii?Q?cS5934kSqXFjzaREktM9QFyOFckjgYycb5FdA+mOIlNW3pmjFPW6Ehh5DBIW?=
 =?us-ascii?Q?/nYj5SP1xwCKZSgcVaqIPmFrVAz54XONCM1vAt+MmwMiQaoFS24p6d+aLvWS?=
 =?us-ascii?Q?dE7f/w0mt+yVE/XgFDyS8O0Ae+zYK+UM81nNOzs2v/c7dKnBRGMTMldmF9Dg?=
 =?us-ascii?Q?clIOQDjtkUojfu3Z5uyx7t8wuowae+AN7EdSGCeGM1T0/+cUjnLdn8jzlDF3?=
 =?us-ascii?Q?NDnOcvYxQLySJ1/2bPyzey5W/+bpql6PnWummf/Uaf9t0kKr/obhZo46JTFs?=
 =?us-ascii?Q?VpL34RfeXLk6Gr5hnYMHnkuaHH+ZDpb5CoB2/5qUHx8r+YehLlJweDJQnnZo?=
 =?us-ascii?Q?8EsmBVPiojsIDrgsauUfPnGaPFwqmv9FYNFiCKvNki/LYsKjvfRESHZ8rZpj?=
 =?us-ascii?Q?5EE1KjkEgb7PssvoIYd08r8hccmlkU0KlhEu2/VB9qjgn8iFHWrTvfiV1Pv2?=
 =?us-ascii?Q?yU2FOWPQvj/cX6bwlxuZO61r3qf52cx73VjC3qbc5zIgMC9ACu6RjXFgtUgf?=
 =?us-ascii?Q?YvNijSAotZeQLp3nTh5jfBYSOQtHKuRez6MyuouCnzjlT/oQaKGiIrFWCcfl?=
 =?us-ascii?Q?3PKhvVUojbBUjuunAXvzwmM0eiEf+avyqC+uMu5wM6WA3weQuAJ6+gZTXXmH?=
 =?us-ascii?Q?WqZl7XpxH252+Cu/+OB9nDLNnnwdEKe8rHrH9HWboMy4idXQDnk2r0IxUgf0?=
 =?us-ascii?Q?x4OdfJNDgl/pRM0+nQ8Mq5cKinyVGQs3gr3xCyudMuaMZZclGBcMiytfFyNE?=
 =?us-ascii?Q?02ubLIPmsEvasrA1x3swCa+UHfhbCZbnzAAlwdmyi1wJELn39f3W0tPZwUcU?=
 =?us-ascii?Q?GuQ/kYY=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?u//x5zYD3qI15WRcopmx4s4Ekz6q6O2Y/s0MSV2Nmeo6ptkGB5C7R9c+ISrM?=
 =?us-ascii?Q?LA0AUI1CLwwxCRAWB6g96t2S1i3Tk729HZc7Od2mAppeb372sozePdgYyI97?=
 =?us-ascii?Q?zLpCDpAHGxymT42Xu8U/uuhEX8JBNcZD+8i7fcz/1yukKNUy3p/1mYxN0nV5?=
 =?us-ascii?Q?yp9fFUf0HN5TxYSVRlERL96Bzjufvf16YyZfggYJpDVLpqmqB3uZ3wM9YrEK?=
 =?us-ascii?Q?fJ6PRTqwwXLUeA5kXgsSIItgJRgcOloVHQVGHNIqZ93LawUITp1WQPL9EJYa?=
 =?us-ascii?Q?YG1t1uMMNs/5SjqTGP1YeGHKliUEeYvRNnpdu+//5IJ5AS+38zhLB3HjNLaC?=
 =?us-ascii?Q?8m3x/mdqQQ/pgebNL7R6Hnd2iJyEYInLH2lzg6w3Sl3ny9yCfNj78iFXGIaP?=
 =?us-ascii?Q?yLQTI3A4zRAWvsYz8VLNDZb7SZXAI64iQqoxMANG6N3DQB01h6r3VFMtRfio?=
 =?us-ascii?Q?Pa110cQykTAwkvyfr27CIZisYAl7JO6BB0VVyrUonMrVQx+C4Ad/Daj3Ae3O?=
 =?us-ascii?Q?vTsn7JklmqEMNjpasX2hEUW++a/8oiE6lrEpr+Y1ftiztpsN+pqLeMb+Rol3?=
 =?us-ascii?Q?MzLiVxYE7TrsHaCGZZYmNmMO9qioWob8djbw5FvBxT9MsstJnlZDUlYVeGMQ?=
 =?us-ascii?Q?F8rWZDW1zwdpRP015R3UD9Y/gyY7wwv7+hyC86k6oW5yciWAekdV1MvRJwaM?=
 =?us-ascii?Q?0pBpMZqN3NKYfUD+eubWkmhhKIu2777B2cQYiUNl24zl0JRxxLglsr35/UtM?=
 =?us-ascii?Q?n+G/koAnxqtNSUDOJfzO6PoSUPkjC3z09qr/84q56EFL2veyr2QcmkP0pYMk?=
 =?us-ascii?Q?VrUnzy0a7NdCbVRsDiDGB8M2zQKwvad+SKkNNb5tHZ0LndbtEzp3Gge2qFyH?=
 =?us-ascii?Q?M4uh0coGbYLiFO/lVRDFG/D0zA+5puT1nBHNM7i5j0U+/vu07EKa1op4ntOa?=
 =?us-ascii?Q?oibyGykLC6DjqneC/txQHrk6X0akU5li6xWAsfHQTxQwsMR8y44rDX8fnvSu?=
 =?us-ascii?Q?Ocey1NAZVdHdD1+GZNDsD8znAIRtyDYV9+HuUOG8RAl/Ck/N/gRv23Oi6u/L?=
 =?us-ascii?Q?jeu+1llQX0x6JXA6a8cLOb2b+07vuUnFSyCU+G9OZS2Ac+k1Vz2lLxEaTTow?=
 =?us-ascii?Q?R+wEXB6nJp9lD3PErowPS/Pozwca/Po9WoV9/Bca0V3J4KylzW3+ENx0F4fQ?=
 =?us-ascii?Q?kenuRaMx3bcp/LCW1mNBgFL8a6hWjHHhYW+YpaiOlVWJsIcvgkEKswm0HTNt?=
 =?us-ascii?Q?6tTO+y3ZCNOOavW9bV/Ho8mxqPibbCPfDdL1sSlEsDX5GSAuzEtmauLXmXmJ?=
 =?us-ascii?Q?IT2H4xjqM/g5IRkF7zGfY964Hh2bp5he1fVJkdgS+VDhh0S5brbm1zu1ra66?=
 =?us-ascii?Q?M/IloKT4G3xWa/sP3JktUsJOsPtzDfyv3SMkuV+Qa9IuhpakC3K1grbTp8n1?=
 =?us-ascii?Q?YNXcMYNuJQvSmNBVq58BnI2O0OxTYIFRDMrM4bZBYdjrdzpF9IBiNxTO0CFG?=
 =?us-ascii?Q?pJ+4L37YfZhZvzroxySh9BZgTbCz9CmJWPLgPo5SpCEyEcLJlECRCPzavTKX?=
 =?us-ascii?Q?6Qm+5TIQp0DTBF9dJgElgIUH9SHT8UOBJ0vBH6S55eQb2vTXh56VlahJtouZ?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357708eb-6dee-451e-7117-08dca1343eab
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 23:01:34.2935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrDSoGLKfszAhq/Mjdfu28S4damfoK2xaWXV1nd0TFMCtVwlFTfLvNCR+hsral8oNWaHbtFeFYBGvQKLdg0iMg==
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
---
 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 20 ++++++++++++++-----
 .../ethernet/freescale/dpaa/dpaa_ethtool.c    | 10 +++++++++-
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index ddeb0a5f2317..c856b556929d 100644
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

