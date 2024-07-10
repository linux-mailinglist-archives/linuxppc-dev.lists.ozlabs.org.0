Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0977492DC44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 01:04:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=cAWIyp9e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKD1v5xDwz3d36
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 09:04:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=cAWIyp9e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKCzh1fzzz3c03
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 09:02:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+8QpEZM8QdY3gxBmNRxhqd4n8n3um/UJr45pKgc+oA8Vij49KmlK0MXg5mxf+yw80YjbRYLG+c/WSTHdT5oQ4rzQZe+4H0uXAUpEi2SIAJcs3hx2uc5dpczpqkZZFfEMRQLjzTDHztLikMX51qP6tuAlcknSD0wavwhrb8jBPkgHH/JS/xrT9NhomjYE/6Dv9mrqkye+16d8hjYh35XzayW98gQpfk8Ql8Nb9M6EiaUbM2G/0L12te5bG6uzM7v4WtBZlpKPv1wN7XYnwUjaAsvfg5LGdvghN7sjniec4eRQKKCc1wtzOnMKz3BpFxs39p447yc58h5f7Qx8tVb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVziIGgqiuo//YWqE8wPtpIQDnNL9ns/3Nq4xxaMHYo=;
 b=ZIPIUZK2CDzl5hzyoEBu3eNyOGNJhUbevE5o84fnEXYh/5iLG3jDlW156zxRfcHP+CIyEgLMxNLdnvzuqBn4B905BQlswk52NqzU4z2DMAvZicZWhSJgsP1pf1pisOZBV5Uf4asFHELJsGvbwJyTW8eFkkMZ0x66Er89IYS/hSgcnJHbptlKS1/aAoTC5IYP7kKVgrg6qOmNvxAiQSQYiQzeTs7YUxEbBveVN3Wmp2rcIhUDFG71P9ZdtkDPdntgNzj6Owyjx3TMY0fVF3yOsTEv/zvqKlfaotKbZjlxHzSydgQXo3TyIW0snTBMSo60fAko6Py1Q91XwDBmgml7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVziIGgqiuo//YWqE8wPtpIQDnNL9ns/3Nq4xxaMHYo=;
 b=cAWIyp9e+EGF1oZtNkgFJF869OMXWiB8lLTGiLqf2LOXlOV+Iph1qztZpgVWipBlEj2WZe9X8AQjF1fOg5Y0LezG82Qy5CPPmD5Dx0YoBZBrpM/lyCs0lG7e5xK1DSxpmjyAesik0fghVte0PEoGfHlfzv84lLpwMmGv/FXc0RA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.20; Wed, 10 Jul 2024 23:01:35 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 23:01:35 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 2/5] net: dpaa: eliminate NR_CPUS dependency in egress_fqs[] and conf_fqs[]
Date: Thu, 11 Jul 2024 02:00:22 +0300
Message-Id: <20240710230025.46487-3-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d5b5c1b4-7686-4cd9-82d9-08dca1343f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?XDuN4V14F7cBchziZH0pt7I9rWdEJgg4h4BkVF/qdHCbC/dPWXAFGYCBpeKk?=
 =?us-ascii?Q?82HR/g9PcncPya28UqtU96U//E54w8GAD3xYBynvQwFjEQiGUIBaMCYFOp3X?=
 =?us-ascii?Q?HvXx5H89p4xdVwQrRbApFdl7l/JOIRjT7lTzEOwkDy/2tMYCrkQqzYtg/EEc?=
 =?us-ascii?Q?w7wNuXr5Itf1D/FbPUWNxiCsSYgNs8RKf5iGdn4tMFiEPjsne/5HkmUseIqV?=
 =?us-ascii?Q?qu2JSklIvAKhPWRHdTqMFLtQStRUnmQSjhWYXhXscaEGF4R8jPfnEwsEpGy9?=
 =?us-ascii?Q?5ID0QTbSFzMfNf5rkUgItOhV8ayVvmWGjuoghiKuwv2TMtp2xyP0z8b+bn9r?=
 =?us-ascii?Q?97SEtrxJqDP4L3F1m4egtXwLSnqypd1gzTrEAf+yuxEs4wSrVEBVqOzwY8Rr?=
 =?us-ascii?Q?3YYgQU2VtA7ZgrNz9IsqmD0xVc0TkKQtxm95WX2Cjp0JnNUPbCFRJYOAKqTV?=
 =?us-ascii?Q?mEvMSVO7aImmXdPowzSXiQkgDfRaJx8FmTfdQ+zPHJ5ZkAzxcugIB20IsxLM?=
 =?us-ascii?Q?we7tvoahwz/qcLAXJ6gPx9beMXJh3ZdTcenOS+Zf3ouhHiPJb+SO7BxkWGXA?=
 =?us-ascii?Q?RYjP/rjNRb472qdICns+I+rpYUYAGjMSL3t4tl08Fh2a4CYRpPURhs3GFnE2?=
 =?us-ascii?Q?pbmZNpCrHWGE9Q77klrm9R6E0Jkk4KvunxcTNQuvymvIZlLt6foeMInL2/y3?=
 =?us-ascii?Q?sTyXIzD3sA2YFZJ7hyn9LG/lbticXCGWoI9ID4Dp7vtyQY3Mcf46La369b9p?=
 =?us-ascii?Q?vfX0yVTGlRB+l5kIq570OvRsJQqSTvcBtzPnXERzw6/UcVpwIoApJL26Q+Ih?=
 =?us-ascii?Q?QKY2tOU0F41D4awME+OzaV1dYk3khi23CNq7eo1JvmFbMs+VD2JuCSY72ZIK?=
 =?us-ascii?Q?b/zX6ci4a6FXRAi4Z+WXHbI86qx4FUpif/1Q75SynqakQ3hjQay2iCCBxVVw?=
 =?us-ascii?Q?/KUJgH4ejsXFKEQp6T7EjDhRUwBbR5g4d5TKycFXbl5jA6PpctxQ1UUSIuYQ?=
 =?us-ascii?Q?NfCuQOInXv30SDf87vSLxoORzovAHHflzXEux2wdYRTFIgxVuYiHVWvUoda7?=
 =?us-ascii?Q?Dw7QHpXI8cSFvKutrxlE03HpOl6wrZ9jhzz4wJX+6uDURR0O43A9OvbZU7Bg?=
 =?us-ascii?Q?6exIEW34GPTdvIwyAxCew6S6dxtMXquiwVfESPAl8n7QTnMpxZ9nH8LyakWg?=
 =?us-ascii?Q?lQrRAPRbGJkCA4ZyGBEvjftBUvkfO0g3EGVRtq89iw+e+axrRcUhmo5Ttw/E?=
 =?us-ascii?Q?sQZahmdWML/TXW2NoBSPi5VwWvlsPlgv602nBWmMlQPeNRC64WYP8Clia94x?=
 =?us-ascii?Q?Gr8HxW8olijPa5Kdlq0y1spi7VYKv5cOD1uMZ45XovxIe929Hp+n3cTSp4p7?=
 =?us-ascii?Q?/LCxU2MG1315EmbYM0OXHcxZd3xD1qQby1+kSc6x0zb7TVvhxw=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?gkH0+ytB8yg3ChJe8o+zuh0O66qdZhs1Yq3SYjpaT9ZThxcG+CDAhHJctOzs?=
 =?us-ascii?Q?1hDV57TYQobHLQ6cCBdNjL92UrcLGmJrpSMNbjVIvO5Sx2u4cmOuojnEGb/V?=
 =?us-ascii?Q?yGzGbjAJMqnf5tq7iSOFhrVqZMj9QyIdu04A+MfNHsKRiUMDNLnToXzIvZU/?=
 =?us-ascii?Q?w1xso2sf7mL2bpjeL23dcGcf6h+52/dDgRlKOCzXm5XIFABjenuoeeOWUs5E?=
 =?us-ascii?Q?+CBwrLzbe+WYDgq/fvfIppp1AJznrItrX8txPD2YjwPZGvb7SETrnBWeiRpm?=
 =?us-ascii?Q?4O00R3VLQFEyBOvOXwh8T9udOWUOqYkb3Mfun4PCw6aNs2+dei7tHWBttTUb?=
 =?us-ascii?Q?vuDd4inQgvVgVahZG8u8FHVDv4Oj+d1LQnuxKY+XvgTMmk+4fZgV314jSxiU?=
 =?us-ascii?Q?ta845YdU1A99q2CJt+8In0S59SR+6vl+OxWQAV04+w4/wtQwPS+YxyKETvtX?=
 =?us-ascii?Q?APW+kbVQ/cSeOwjpNHz3RJXmw8B/uzcz8W09/mm69M5Xq0qoH2mbpJlf+3cv?=
 =?us-ascii?Q?3HFFkNc2iw7ZmJhQteEsNFnNnFRSaaFd2d4slVJhWHvbLi2TdbzlsVd/vW/p?=
 =?us-ascii?Q?ZJkrFps5Q15hStR3vTNk587mqPTI4kCxEjDnTS6iSSEnr5wr+hvZk92WwWyK?=
 =?us-ascii?Q?ZIsiZNpbtvCDB3vcX5WKjHNpA/r3M0/+9IxnQvpg5ond4JOa7lZBL/LdpqT9?=
 =?us-ascii?Q?BcDLdDVztuFA/FQ1LWV4OIvFEZV55oeaM4KL2YB7J3o9RnI3ZJ9yfFhBV098?=
 =?us-ascii?Q?g7W/xb71OQD6GgdHTGBeeq/1WbPPFXXS7nIxQSj1xFASFG94WT0fqmW89xdq?=
 =?us-ascii?Q?FPUbl2pkzf1kB1/Cfq5DpFqKVCvz/eO+6JSuL+LGFGjSyJ2mjhK40lia6+39?=
 =?us-ascii?Q?ibNVdyyo3BrldL28LS5modmXJFn2G4QmFaKFTsbWdqhOUb5X5ImijKLSBtQQ?=
 =?us-ascii?Q?Kc2bNyYrR7LCggsYYY6rMP/nN/oL+OVl9hfd0Abl5vD512+uPbaLZOMy23Se?=
 =?us-ascii?Q?aBQir/XtH6sCjHTc8z7qb99moQ6Zgf1BwG9QHontcYbdBUWXnUppXT9V6T/p?=
 =?us-ascii?Q?nLdYammH+WHKpaNF8auzqcYzG5+brgs8uJTX2ezzy2aCRIlheez646Pq/Fuu?=
 =?us-ascii?Q?90AzV+S5ByRoCnk8H9qwj72HpP/+9Sb85l2ReC1S4cCP2PipVSSqrYOQDk3H?=
 =?us-ascii?Q?QOuitZQjDFTaW0aPk5XG9bBQz7xlj8Ag4QZPqXDN6lfQhk0L8yPM8BtFYkWo?=
 =?us-ascii?Q?mubPaAaC+XqfdQsmePGt52dPFCqEiy3tPcew9IzxgDKLds8hKTdx47y0Si9b?=
 =?us-ascii?Q?yfeGSbpKdp4CnNeHHTZMrhE6VL7Lwaor1GUEQmgtmQds2anKkulDekbQjWdP?=
 =?us-ascii?Q?GiV9N5/vW4A3K+VdZA2C0r9zRW3xBkorlyaPgIQDqGxPuyXjU6Nj7PMktq9f?=
 =?us-ascii?Q?YyhR7Y1J+CnwjlT7crdt9KMfjacJgtxoT879tNdBob8C+sBYz+ab5mGqkv20?=
 =?us-ascii?Q?uPfkUH4wfCmxwrmodFyTAvrr2oAAjYoysaRr0pKcNt4WmdPV2QQRe+nIBsNE?=
 =?us-ascii?Q?Rg6pPRBBx0pmCvY0BbI/fz3edAOOcHR/gwqrtBjRQ285GxDH55ECDsEmZGQg?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b5c1b4-7686-4cd9-82d9-08dca1343f54
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 23:01:35.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97E+EPn42t4iGijqDKnOeg3w32acdNEmNbJwuImZ8wZVjQKr1aSr1yc+Gq2K1uGWwPahUgEkOHKFFO/BC42RsA==
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

The driver uses the DPAA_TC_TXQ_NUM and DPAA_ETH_TXQ_NUM macros for TX
queue handling, and they depend on CONFIG_NR_CPUS.

In generic .config files, these can go to very large (8096 CPUs) values
for the systems that DPAA1 is integrated in (1-24 CPUs). We allocate a
lot of resources that will never be used. Those are:
- system memory
- QMan FQIDs as managed by qman_alloc_fqid_range(). This is especially
  painful since currently, when booting with CONFIG_NR_CPUS=8096, a
  LS1046A-RDB system will only manage to probe 3 of its 6 interfaces.
  The rest will run out of FQD ("/reserved-memory/qman-fqd" in the
  device tree) and fail at the qman_create_fq() stage of the probing
  process.
- netdev queues as alloc_etherdev_mq() argument. The high queue indices
  are simply hidden from the network stack after the call to
  netif_set_real_num_tx_queues().

With just a tiny bit more effort, we can replace the NR_CPUS
compile-time constant with the num_possible_cpus() run-time constant,
and dynamically allocate the egress_fqs[] and conf_fqs[] arrays.
Even on a system with a high CONFIG_NR_CPUS, num_possible_cpus() will
remain equal to the number of available cores on the SoC.

The replacement is as follows:
- DPAA_TC_TXQ_NUM -> dpaa_num_txqs_per_tc()
- DPAA_ETH_TXQ_NUM -> dpaa_max_num_txqs()

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 43 +++++++++++++------
 .../net/ethernet/freescale/dpaa/dpaa_eth.h    | 20 ++++++---
 2 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index c856b556929d..7b0317020c89 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -371,6 +371,7 @@ static int dpaa_setup_tc(struct net_device *net_dev, enum tc_setup_type type,
 			 void *type_data)
 {
 	struct dpaa_priv *priv = netdev_priv(net_dev);
+	int num_txqs_per_tc = dpaa_num_txqs_per_tc();
 	struct tc_mqprio_qopt *mqprio = type_data;
 	u8 num_tc;
 	int i;
@@ -398,12 +399,12 @@ static int dpaa_setup_tc(struct net_device *net_dev, enum tc_setup_type type,
 	netdev_set_num_tc(net_dev, num_tc);
 
 	for (i = 0; i < num_tc; i++)
-		netdev_set_tc_queue(net_dev, i, DPAA_TC_TXQ_NUM,
-				    i * DPAA_TC_TXQ_NUM);
+		netdev_set_tc_queue(net_dev, i, num_txqs_per_tc,
+				    i * num_txqs_per_tc);
 
 out:
 	priv->num_tc = num_tc ? : 1;
-	netif_set_real_num_tx_queues(net_dev, priv->num_tc * DPAA_TC_TXQ_NUM);
+	netif_set_real_num_tx_queues(net_dev, priv->num_tc * num_txqs_per_tc);
 	return 0;
 }
 
@@ -649,7 +650,7 @@ static inline void dpaa_assign_wq(struct dpaa_fq *fq, int idx)
 		fq->wq = 6;
 		break;
 	case FQ_TYPE_TX:
-		switch (idx / DPAA_TC_TXQ_NUM) {
+		switch (idx / dpaa_num_txqs_per_tc()) {
 		case 0:
 			/* Low priority (best effort) */
 			fq->wq = 6;
@@ -667,8 +668,8 @@ static inline void dpaa_assign_wq(struct dpaa_fq *fq, int idx)
 			fq->wq = 0;
 			break;
 		default:
-			WARN(1, "Too many TX FQs: more than %d!\n",
-			     DPAA_ETH_TXQ_NUM);
+			WARN(1, "Too many TX FQs: more than %zu!\n",
+			     dpaa_max_num_txqs());
 		}
 		break;
 	default:
@@ -740,7 +741,8 @@ static int dpaa_alloc_all_fqs(struct device *dev, struct list_head *list,
 
 	port_fqs->rx_pcdq = &dpaa_fq[0];
 
-	if (!dpaa_fq_alloc(dev, 0, DPAA_ETH_TXQ_NUM, list, FQ_TYPE_TX_CONF_MQ))
+	if (!dpaa_fq_alloc(dev, 0, dpaa_max_num_txqs(), list,
+			   FQ_TYPE_TX_CONF_MQ))
 		goto fq_alloc_failed;
 
 	dpaa_fq = dpaa_fq_alloc(dev, 0, 1, list, FQ_TYPE_TX_ERROR);
@@ -755,7 +757,7 @@ static int dpaa_alloc_all_fqs(struct device *dev, struct list_head *list,
 
 	port_fqs->tx_defq = &dpaa_fq[0];
 
-	if (!dpaa_fq_alloc(dev, 0, DPAA_ETH_TXQ_NUM, list, FQ_TYPE_TX))
+	if (!dpaa_fq_alloc(dev, 0, dpaa_max_num_txqs(), list, FQ_TYPE_TX))
 		goto fq_alloc_failed;
 
 	return 0;
@@ -972,7 +974,7 @@ static int dpaa_fq_setup(struct dpaa_priv *priv,
 			/* If we have more Tx queues than the number of cores,
 			 * just ignore the extra ones.
 			 */
-			if (egress_cnt < DPAA_ETH_TXQ_NUM)
+			if (egress_cnt < dpaa_max_num_txqs())
 				priv->egress_fqs[egress_cnt++] = &fq->fq_base;
 			break;
 		case FQ_TYPE_TX_CONF_MQ:
@@ -992,12 +994,12 @@ static int dpaa_fq_setup(struct dpaa_priv *priv,
 	}
 
 	 /* Make sure all CPUs receive a corresponding Tx queue. */
-	while (egress_cnt < DPAA_ETH_TXQ_NUM) {
+	while (egress_cnt < dpaa_max_num_txqs()) {
 		list_for_each_entry(fq, &priv->dpaa_fq_list, list) {
 			if (fq->fq_type != FQ_TYPE_TX)
 				continue;
 			priv->egress_fqs[egress_cnt++] = &fq->fq_base;
-			if (egress_cnt == DPAA_ETH_TXQ_NUM)
+			if (egress_cnt == dpaa_max_num_txqs())
 				break;
 		}
 	}
@@ -1012,7 +1014,7 @@ static inline int dpaa_tx_fq_to_id(const struct dpaa_priv *priv,
 {
 	int i;
 
-	for (i = 0; i < DPAA_ETH_TXQ_NUM; i++)
+	for (i = 0; i < dpaa_max_num_txqs(); i++)
 		if (priv->egress_fqs[i] == tx_fq)
 			return i;
 
@@ -3332,7 +3334,7 @@ static int dpaa_eth_probe(struct platform_device *pdev)
 	/* Allocate this early, so we can store relevant information in
 	 * the private area
 	 */
-	net_dev = alloc_etherdev_mq(sizeof(*priv), DPAA_ETH_TXQ_NUM);
+	net_dev = alloc_etherdev_mq(sizeof(*priv), dpaa_max_num_txqs());
 	if (!net_dev) {
 		dev_err(dev, "alloc_etherdev_mq() failed\n");
 		return -ENOMEM;
@@ -3347,6 +3349,18 @@ static int dpaa_eth_probe(struct platform_device *pdev)
 
 	priv->msg_enable = netif_msg_init(debug, DPAA_MSG_DEFAULT);
 
+	priv->egress_fqs = devm_kcalloc(dev, dpaa_max_num_txqs(),
+					sizeof(*priv->egress_fqs),
+					GFP_KERNEL);
+	if (!priv->egress_fqs)
+		goto free_netdev;
+
+	priv->conf_fqs = devm_kcalloc(dev, dpaa_max_num_txqs(),
+				      sizeof(*priv->conf_fqs),
+				      GFP_KERNEL);
+	if (!priv->conf_fqs)
+		goto free_netdev;
+
 	mac_dev = dpaa_mac_dev_get(pdev);
 	if (IS_ERR(mac_dev)) {
 		netdev_err(net_dev, "dpaa_mac_dev_get() failed\n");
@@ -3472,7 +3486,8 @@ static int dpaa_eth_probe(struct platform_device *pdev)
 	}
 
 	priv->num_tc = 1;
-	netif_set_real_num_tx_queues(net_dev, priv->num_tc * DPAA_TC_TXQ_NUM);
+	netif_set_real_num_tx_queues(net_dev,
+				     priv->num_tc * dpaa_num_txqs_per_tc());
 
 	/* Initialize NAPI */
 	err = dpaa_napi_add(net_dev);
diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.h b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.h
index ac3c8ed57bbe..7ed659eb08de 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.h
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.h
@@ -18,10 +18,6 @@
 
 /* Number of prioritised traffic classes */
 #define DPAA_TC_NUM		4
-/* Number of Tx queues per traffic class */
-#define DPAA_TC_TXQ_NUM		NR_CPUS
-/* Total number of Tx queues */
-#define DPAA_ETH_TXQ_NUM	(DPAA_TC_NUM * DPAA_TC_TXQ_NUM)
 
 /* More detailed FQ types - used for fine-grained WQ assignments */
 enum dpaa_fq_type {
@@ -142,8 +138,8 @@ struct dpaa_priv {
 	struct mac_device *mac_dev;
 	struct device *rx_dma_dev;
 	struct device *tx_dma_dev;
-	struct qman_fq *egress_fqs[DPAA_ETH_TXQ_NUM];
-	struct qman_fq *conf_fqs[DPAA_ETH_TXQ_NUM];
+	struct qman_fq **egress_fqs;
+	struct qman_fq **conf_fqs;
 
 	u16 channel;
 	struct list_head dpaa_fq_list;
@@ -185,4 +181,16 @@ extern const struct ethtool_ops dpaa_ethtool_ops;
 /* from dpaa_eth_sysfs.c */
 void dpaa_eth_sysfs_remove(struct device *dev);
 void dpaa_eth_sysfs_init(struct device *dev);
+
+static inline size_t dpaa_num_txqs_per_tc(void)
+{
+	return num_possible_cpus();
+}
+
+/* Total number of Tx queues */
+static inline size_t dpaa_max_num_txqs(void)
+{
+	return DPAA_TC_NUM * dpaa_num_txqs_per_tc();
+}
+
 #endif	/* __DPAA_H */
-- 
2.34.1

