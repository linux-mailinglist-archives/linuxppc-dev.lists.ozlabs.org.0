Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9235930800
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 01:09:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HMv0EKb+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WM40j5jDXz3cZ1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 09:09:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HMv0EKb+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WM4016dv3z30Wq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 09:08:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnlWmpT6FpARsycIoEADTfWx/Rgx0S0E9WsSwrCIe3beYvvDj3X5pMP1phsu03GpVmPcAAUXsFAYJT6SUzINBdKyrK9lx1YokL692fKXkvmca9pZcEMldsTV6mfg/1On8AWvZ3yLay8LLQBQFbzL5R5g4eMhVmZ7RGiMUUDHVRY9PdScYgETzKOPHfWWKwgeLOeFNf9CvIKu8xlsI+Gb/1tTqfwS/FDnOklJaEaTZu2gscp90nLwgsm83rXnvaA5c4gdnqSxzgy4l6MbSO/WlA/esFktFnuCFNVq0e4y5olRlVhnz5rr80qBtbZ0ZWW75ZwHcHCtlXI9ikwVLrQ4Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWpEZlDOAvjqFmicNvjYhzYnxtBGTi/p8qJbBUJitZM=;
 b=VLiIevaoDrggviRQhNoXvBxQoSZRGSkbNycXsxJiYk3iUD/TIYvbCYyr6ZtXfACddbJwAvWGFw9rg+K6teZ7g74kuS88PPAdWeWr684mj/2R2k1WfY6ULMWhpj2oi0CXAcO0N9NEEyoLN7eUz7P/zh/zOUZ6dzlGG6KvfH6L8cF6uT/smLtIPmyUds2gpwlIssKiceASPYqDaQI63ZZ5xzXv13EpnVvoZYfXM5p5vkVjHdypd/8hGDip1ij3rbEGY9i4/HMeULni46ycbQflwZmtqmzF5gaBGy2s67n5+x9P0cgJGmqZtEE0SaH9d1L1lKc9j3sNQLnZv8gOQqvw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWpEZlDOAvjqFmicNvjYhzYnxtBGTi/p8qJbBUJitZM=;
 b=HMv0EKb+JutvCdVS3gepw+T7pIJF1lLkFjUBSwFrekE7r3mg8iiOluFraqgT4PjbRoA+3yOzo+Vi8qg4bvjzhpCtXF1wArTwuV1FfHb0uQyXZ+4S4c9vdKkFtMX1s6DjG5IGEq1GZCJEA9zU7Vb76pjzcVxWGdACs/mOw8Bv+a4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 PAWPR04MB9911.eurprd04.prod.outlook.com (2603:10a6:102:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Sat, 13 Jul
 2024 22:53:59 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Sat, 13 Jul 2024
 22:53:59 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 net-next 2/5] net: dpaa: eliminate NR_CPUS dependency in egress_fqs[] and conf_fqs[]
Date: Sun, 14 Jul 2024 01:53:33 +0300
Message-Id: <20240713225336.1746343-3-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 59f13133-9e65-4850-b2e2-08dca38eaec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?oSdmOpOuQ3ow31CbexvUhd7xW2xRqu10ACaelwLts/KIEGCY01oUtd9KcmfD?=
 =?us-ascii?Q?vPwXbM7gLANn8CjiZEvKC9mKzloANsvFOFQZHoV16Ow4472dmo21T4yEEzPQ?=
 =?us-ascii?Q?/bL8wlcayVo7d/a83VhzT1GNHJIOQyqBc+3RwOKAHoNndP2Pduq5c2JrlOLS?=
 =?us-ascii?Q?pU6+VNA28dFd/h2OnzggfWsZETrJFCE6m9gkHt6VEOxDMAS2qkQ9asihqCnF?=
 =?us-ascii?Q?AGcyHUh74Kd2wc1A4lgl/gDG/xnYW/x9e1TpxrRxEAmgN8lK4SwWu0T4UhC8?=
 =?us-ascii?Q?ws8GaPTReSxn+XdtmEA6Y3dTUoVnoWYM2Uvpc2Q8cN9GwLrhqAEc+sdPosfu?=
 =?us-ascii?Q?J07MkFLTyOugAaT8RQq0UaQuo7qWe6HuOSh6eO7RASIGXlR1F5W11fLe5hhF?=
 =?us-ascii?Q?dO5Cn8pW1LFLEWeVzpBxljq6RLz6yg8gKMNaRLABJMGQaCvVT6CDY9OL+d/5?=
 =?us-ascii?Q?AVUwbI/3zoAPFLNjiyaShRkGNXGkiji85o3GegpZg37BnsdYHdX2kUBIORu3?=
 =?us-ascii?Q?flYrEkSt7hT5jiX1gn422zYk9FE4DjCjs/fScuqhuoBK7ftjYYYC38cFJF+h?=
 =?us-ascii?Q?B6r46wzfwV+htuxRNXE9Fr+pgXNa6kBjQhi/sVCwI8u6dgwXtIHdvEhx2c7R?=
 =?us-ascii?Q?ZZbjMJeEzk05I/NnJIsyGLl4FeKIa6x/nAynCMhiDI8JaRPl107wS7sJ5i4z?=
 =?us-ascii?Q?Vmdt4eulPicfPKB9LSbVNT9ZxO77JCzY2xhfYX3EN1ixGRG428q0O3HN/tpc?=
 =?us-ascii?Q?zMBnIUSC7XIgquQkFRXxLOSyvJ+3IPlt0H65knPua8Eif8FIsfYON9k4tuOn?=
 =?us-ascii?Q?B6ozctmyvVqY3dEkb2/weWVDUvwssqqMPonadFV89aKB38S+hKC896keye97?=
 =?us-ascii?Q?zPY6srlftchfNAvd4k9Xjg7Mdz/QT6MI71MEEe9XJRXM9saf73drG4vz7QFm?=
 =?us-ascii?Q?aIWJetzOc9mlFyHdmeTczop8wq3CNWOFV05LwtOU3ubjbk2wMO+Jr0AVmV8S?=
 =?us-ascii?Q?Ay5/g+KH0Cn7dSZmAjtnpe7ZAiau6p0uDCGi4t4c5Ws/m3fCE/rI4ftdUD9w?=
 =?us-ascii?Q?WryAyEUzY08oeyy0LOMPCylKKRrMBQfkCiMkGy10UA75SHSBvaknh8IODnUK?=
 =?us-ascii?Q?Lx+Sx4ohkKZataafyxFlNfzzI3luESA6q9xFeYDRosyzC6B3Sc2wqxa5WyPW?=
 =?us-ascii?Q?uaKMlTCuxjRHgSAyoM50rY6GiLuuTsoAn4sRQpNbKZ7dvkP1/lajUyC3lIQR?=
 =?us-ascii?Q?bp6CnhfKZ2xOAltTBoKYpqK+y0Ew1UnQNEcyLHfPPmznssyofZ6nn0ecg5Co?=
 =?us-ascii?Q?QOOxC24HF0mfxr8/DUFLoFIXMnN5VJW4JS6kH2y1F7kcOKLedwOejb5WGrV0?=
 =?us-ascii?Q?6err1WPc9sfjZDEQl5C0G3QHTRSkLhGzUiRXCa6gNUCnZw8nxA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?MsD7xH7oAhZh/TGmhybhmESH4QDCWy+t+ktk3gKY3DuUG/Ilolq9js/3UWrD?=
 =?us-ascii?Q?euJHojvjuISf474KWRmXMuAhhRN1dCaXu5b3slXFzr5Ni9pjJsvwLbp5/BgL?=
 =?us-ascii?Q?S0wJ7pkbWsJ8wxSQv3DefgfZ/gUlYFN8ws5U3LwXQ73ct0hs/+Favj/lyS+4?=
 =?us-ascii?Q?kTnFWdIq3P1T6w2PIIqJ9ocjTo1yDxc+KlKkoi1Y22OQABzv8tTqLcInrC7N?=
 =?us-ascii?Q?ektg8DdDwuK8ObeWzWfdQftJjWxAm2Md+pqbVzuhv0aPR2I8LXLcyq4XwTap?=
 =?us-ascii?Q?IITW/MUDosFS0iQHtnmjAfzQaxhHlrKSpzVN4gcTJtMkQwK+Ou0X2AwRRiuW?=
 =?us-ascii?Q?xrhXoWDoWD3f4PuRRsie2gjOFN4YTkc71AObQtYbtO+p2yINfIfO3husrUXp?=
 =?us-ascii?Q?Tk/0COcfKALTPU46EWybRHijxXQgKZej3NMUQIAfBjwqfwdSy+r2ScB2CdMS?=
 =?us-ascii?Q?VuHFeNdHrQdAo5TBcjnB0cMIwBbo8SHgluXMgKBOhX5CVm113dD7L0m1ZtmU?=
 =?us-ascii?Q?rSuP8pjU7rJeAJy1xFjHDvDN3h3ho9suTPUWQ6dxXGaWmd8hV3PgC8nSlwaS?=
 =?us-ascii?Q?uMG6s3XXa98tphBWZ0QDN9kcYIlAxAnJMLj361+ItQN6BZBdoAzz27WmDVTs?=
 =?us-ascii?Q?dbGHPktO0xscE3NnSdMsBTvBIhrDosvtyneZTyXdb63XwbBu/rUi5gAWSIC9?=
 =?us-ascii?Q?QSxmVjzxunq70RRIwxe6KAeIwjPowA3jc3rV43t4o1uU0QqmoP/9QFV2dkUi?=
 =?us-ascii?Q?eHkB+jn+8mY/qRBJqS2kLRKr3FdlD+U0d4RJAf4sWxcw+0cqbkzGPJWtGpiH?=
 =?us-ascii?Q?U5pETFWmqZpfXdcT4b2tQ0Ecj3W9lTY3Ru5EhNTb1VoqyLemzGrE9axjxHNh?=
 =?us-ascii?Q?q0zJOmBKD28eEhu17saw5wDZElgnk58ED+U3n6T2JVpDjW9H3k0RPdbb82Fa?=
 =?us-ascii?Q?FtYgJpKPGEZbM1FGF0GjkvvNb70H6Gzv83MzbILAq3RTEVhHisW9O/YFLq2q?=
 =?us-ascii?Q?sQUcwKnrrFyxCntKhPqHO9CHpD91xJPBcLMB7jKC0Mbz1W4Mz0m9hSVR0qwm?=
 =?us-ascii?Q?OgYfFl6IhGQ86YWAADG0sh0byDmdeLTKFbVsKybBwezlO8EGKAMrWzlYuu86?=
 =?us-ascii?Q?opViNl4CclK8Ugtg3PWFVWxAvaq1LKJRWcPx+fmgIBdXGWGowyatZ15sS4Gv?=
 =?us-ascii?Q?Co8gsA2fiKCQTmzbOLSeTRX79W1nLXvSISF5ccgIq6AVCyMwgToJtvb+TN2K?=
 =?us-ascii?Q?QwwG9zo9SENB0VnOHQaaLVKJrr/9X+tHDQNyITPTs2YliAoUaGzhDY7EMB+I?=
 =?us-ascii?Q?6Nj8VEcU15ZFbnnBIKrQq7v7MrpR5Vy5kkyRKzIMkdICIvUe2Pb27oEy1w5h?=
 =?us-ascii?Q?VW7uER4sTh/cpGmh6d+wbqepFjlEyd9r7folbXfroR5ZHUywhrtkq/J6gTBC?=
 =?us-ascii?Q?VAtbHweUOkBeNkGIdzPnQ14aXpfLa/VKPEiP9sRIw4lY+jyAfz85gJtKpCk1?=
 =?us-ascii?Q?P+tYo/z9Fzg+zzgcX8tIT0r9zQmfqOKvcuxRZWP0TQqVtT9Ruxt1TTWWcDNA?=
 =?us-ascii?Q?3Z2ANoL3XoUktKBfFhH+lCOi6D5x6/TyW58TLamgEO8GWPYp/DWtaqlb3b2B?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f13133-9e65-4850-b2e2-08dca38eaec5
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 22:53:59.3957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7dcpnzp6k+s6d63YNtGEGHH1MkMDcBgoaBl+KSJuStAyl2W7AGEAvsTwggYwWTahFKpoB42QlAnxYkASFWwrA==
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
Acked-by: Madalin Bucur <madalin.bucur@oss.nxp.com>
---
v1->v2: properly return -ENOMEM in probe() function

 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 47 +++++++++++++------
 .../net/ethernet/freescale/dpaa/dpaa_eth.h    | 20 +++++---
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index 946c3d3b69d9..ea1fcee77f9b 100644
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
@@ -3347,6 +3349,22 @@ static int dpaa_eth_probe(struct platform_device *pdev)
 
 	priv->msg_enable = netif_msg_init(debug, DPAA_MSG_DEFAULT);
 
+	priv->egress_fqs = devm_kcalloc(dev, dpaa_max_num_txqs(),
+					sizeof(*priv->egress_fqs),
+					GFP_KERNEL);
+	if (!priv->egress_fqs) {
+		err = -ENOMEM;
+		goto free_netdev;
+	}
+
+	priv->conf_fqs = devm_kcalloc(dev, dpaa_max_num_txqs(),
+				      sizeof(*priv->conf_fqs),
+				      GFP_KERNEL);
+	if (!priv->conf_fqs) {
+		err = -ENOMEM;
+		goto free_netdev;
+	}
+
 	mac_dev = dpaa_mac_dev_get(pdev);
 	if (IS_ERR(mac_dev)) {
 		netdev_err(net_dev, "dpaa_mac_dev_get() failed\n");
@@ -3472,7 +3490,8 @@ static int dpaa_eth_probe(struct platform_device *pdev)
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

