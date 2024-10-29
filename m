Return-Path: <linuxppc-dev+bounces-2687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E1A9B4FAA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 17:44:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdGL05cZyz2yYd;
	Wed, 30 Oct 2024 03:43:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730220232;
	cv=pass; b=fB+lJ89sBOXUKz0xNeCVH5CTsZ3iMdHUfdhfr8+3YHNdetPnmLtPNPVVFgRw6XHqhuDdI2KisZfsJ9IR51CIOhKgadKosBMSmG7DfJPmYtWHo3vO59YSlLAtqzvmkQfYlOu5RKb0WeppVJ57A+YZVB+dOHtLXU0DZaBeKX6CDqWYj2W/D6bnscBytciO/TrTU/2UVIQccX1mkL/GWJbwldVnYy5C2kkCLQuhXC4w/RK7wiGpJ2uxncIcgP6YKq3j2OeYFTYrREa0nJ1JfKTaCpgeWLE6rb5byStCf+bYx3/aQFLiAnINka3XpBm0ZQ/LvSEOq2eioASYH9+oKT6I+g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730220232; c=relaxed/relaxed;
	bh=UlX4tvx4PX6V1MC1MexVEXQxjIgRjTUSiiDURBbT6pc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DcM1N3T1kc78xecPDjdAjqpqClG454473Dyu+4d3GTKg/WpQihviLGfkCGJYgjdw+FITnTz5cCrJ+MsqKKXPe90xmieZNwdCinAOz7t+G5+577vdkwhjID6HFyad4AATE4GFcy4lXwFU618PQ/cnxGcz0UqUOBMAmIiYsfAr5k6rIcvz4ln2JtEuMkcnoN8KTMljWZEOPfPbbAwceu1YFLQ020df6M6auLTd8DzLQl3DGq5G9OhoPOsoPdHKyvlzT3Z00/j15Z0hQxdEM2ZSl951zW4tyFB0dJfSS20dgekDAyYU5XoaDLjcGn6C1d/VUOJkaqy+azbaS8hV2OGRcw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ay2QwBnz; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::609; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ay2QwBnz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::609; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdGL00CdXz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 03:43:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTJTdkRUqe2mC5wY15sC+e4tLrLdWTwwy7eOidfeocEJDvdV1ry6Ae7afERh3VdRmCesnxcxJNjBhQYTcF4IKJ9pxEwBn09/XGwFQhAu8o5NA7AIs4Tk5FaJKSmvug3rHNhLx6dorCnscDJu5WrYwRqaMxqKdEtd6p89RQWhMhpjgKRwXnHafP6M8GE/giYcNA0Od8F5jJ3HMMqd2viRPIUqZW1EWzUQ1Fd6PQnPKd/SHxbn7zOy+1x5/TGZEW1Bf4HgrTHRvlepk8ght0kmmRTljrPlcPBcE9QfsZDzmI9tGI9zRsZXomu5ufnQ2tV1O0ThgNWLi9vGvuYOi2lB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlX4tvx4PX6V1MC1MexVEXQxjIgRjTUSiiDURBbT6pc=;
 b=olt/jf3x1wL5eJfdDkZSSwAOPOUzytQINjIiqZY/6NMR4sACqn4Rgp3m/XtpbCE9Oh6IgxJCweYRH5vSVBcaw5rdAHHP0OwYE1Yl5sx0SfQVoVIF4VkaDZiCA+awh0l1A0of3UzryqfdgOvg/QdltDwP1WtF82BdY7PRe6pb999ftcBJwmoHfxxVGESpclEku7fAZ9FxpRpeb/lCegDd6VARyAoK3VdrJ/iSkeHSuVJJ9f8/eNpMnrM7GAnIBlleoqWSmJ/Gn3O77HDOuLmH2C4o1slcXkSLIHIO0F7mKp9q6sOiZbYKsFxM4FLe7vX6iHv5F03dS+tdCI5x5L88Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlX4tvx4PX6V1MC1MexVEXQxjIgRjTUSiiDURBbT6pc=;
 b=ay2QwBnzl8+Fj7g/37bBoKz8vTE9oOzF4YLFv3pAiFVNoil3GJcr87Y97r8Tq+nnxfhyHg9SmlfKbQvh4J3TuUxCgIeLmEGwbOSBbtTQEPOc9qp0EvwtZwX6EB+1B2P1to1Grt/Ker19Rpyfpr6fuO7Gr/1P1RXn0FZMHitDqAtixVrUDR+HCHv2p1uFI0iMtHxVeflXiJoV+pDxNSMs/cMW68f3ucW4HPUx0JmF9MBovMrltN1SLW0quc5uKySZQsdZ2I5BbCHnkxZNJkpsG+H4hKgutlCLrKP7pl1hC/WosDKJlUJmu7WSMSVsOwZ6qvtbzJ7ZW54u9JOf/kqgyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 16:43:33 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 16:43:33 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Radu Bulie <radu-andrei.bulie@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 3/3] net: dpaa_eth: extract hash using __be32 pointer in rx_default_dqrr()
Date: Tue, 29 Oct 2024 18:43:17 +0200
Message-Id: <20241029164317.50182-4-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029164317.50182-1-vladimir.oltean@nxp.com>
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a3d34d-d44c-4574-862c-08dcf838d341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UZ/yN0JVvZX13KsGOwJEeWXkbnGSY4wpBaA/cfCNl4NINaEOtV9uvl4Ona21?=
 =?us-ascii?Q?bfjNY3WS2JXu/M7bHBxFlOKeNAjsRnGPX/qs/ubWWI8NLoeYB+BONqoLA8d4?=
 =?us-ascii?Q?/rCvTdhgoovsDdi/ezt83Pw1GfsdB93/1eySWN8RUcX6Pm+R9LEjbmLLgUiq?=
 =?us-ascii?Q?0hBVTO7L9eJmGEC3RImQ1JhFWlqJXoamAoBJZ6qODFbaHNoYw0dB8gind2kb?=
 =?us-ascii?Q?P3PTYA3VzX1UliTqLbVF2i2FZN2Jqq+D24JBDcjRxsF0/aaCFT6Ku6G7uzVv?=
 =?us-ascii?Q?cBptBq0yiPBAYC9f46NzDJFbaWBXPst931ed/Gau/e2zOmcT/86hYkibM1Em?=
 =?us-ascii?Q?yYuMJl4Z+1CtYA5Qxr9KkqNetrmDpmCrRqXQ/thg+TwRpqxpBqEiqaPgsEFs?=
 =?us-ascii?Q?YRXf1nU9TfMj9k095to1Dnd0sOOZpyAXulSUYuxjPmoZIJEoD462dN+rOX1W?=
 =?us-ascii?Q?zU2/QUSsMWdiDPm1vhba0qXzSHjtcSuzPECe5Beyk3g6q1l6cHIeRHzVVYQi?=
 =?us-ascii?Q?99NdmDgMgyQ2jY/o8N2W79598IKIQsYsZFeYleqawR2A8vezQSCYnKp5g896?=
 =?us-ascii?Q?1uJ/9fRloiqvAVY8VzlmHpmTL5ybo6udPfGKixtZA6vvX9Y1cPFpFXB29ucf?=
 =?us-ascii?Q?gvJKd71BEnNJBd/4I+wGJXnBz1MIY9kAuuqruqj2iVm5iafIc/gaBF9PYhcZ?=
 =?us-ascii?Q?8JdgzL7iz8LFHvKrSo4ZegegAJCNLe9ajQ3/a2oyA78ueZbALe3xMoIS8+Vp?=
 =?us-ascii?Q?FYOXiq31folp2a/weXAkbeSdzMthG/7SiLdBwFJAKblpgaSbEbIIPLJdSPFF?=
 =?us-ascii?Q?/2UKvI5Ei6rCqYibiRlHQM7aniBB7Zb1CuSKSyBYk4h7KEmY6AUfUVEIS4TA?=
 =?us-ascii?Q?YrwAf6z3bgyItoR6H54qNYdm7+2yA2KCwWc0vaZWjZVWZ7JUwfzyFdJazUUt?=
 =?us-ascii?Q?TK/LYycCXhWqYou/O8waWaFHoD+vz3ZH4bCoyJOlsb4WnYzuxD6Fy315eDDR?=
 =?us-ascii?Q?ZM5GJ8Bg5o9c1Cbk/JkoqXdxoNvxcq9fiSjYlI27Zcjet4Wd0cq4mSvEFh71?=
 =?us-ascii?Q?xG0vMqTa+OqP6UKD5cJxW9xqyqFw1dqGnE+0wMVstOmpFfcR3vc5vdVt0uR+?=
 =?us-ascii?Q?N0IxhcD7Y+4XzsNCCjIjn7g8Ge9sZdQGR8eQAD2yMUA2i2LH4cg5SRA/J1in?=
 =?us-ascii?Q?6JN0KgvK8lI1Lvs5aH4iCvpVrwwm78vqF4ZlezagZokaaB+XPs6Lw7cAF2JC?=
 =?us-ascii?Q?nNsh4NUD2BAKUOqCnJhJGK/NFzBaJmS6bIVdr8A7r4REGlbZuPBNPS+5CD9n?=
 =?us-ascii?Q?uYmPXwK5u9jDeE8eJKnCZkrtx0WRWInfwrvcft3i3y95bSpv/QiE2NgYPKLb?=
 =?us-ascii?Q?oJPcfj4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V/P1oTBXVOMphf3eI3UPuyJVkv+2ohljAcMVb5NOMn9jR1j1V/nuAcwd43JP?=
 =?us-ascii?Q?S5DHyzkw4d0Fo7ux+dlXYmR5E6ilWKiXYIeXm8oibmvUPy0aY2PmOiYgkADP?=
 =?us-ascii?Q?8Ag1wSpFJEUbEmGjIto0LGCaClHXVFr/cpHlr/gBfsmPPrVfhu19nsGiDfeg?=
 =?us-ascii?Q?EU4VbL2nFWV1hkn6CoTni9tVACCci+qnYig0DyygasC339gNnZpueLT3cRE9?=
 =?us-ascii?Q?qRyvZlAcTASqeaYVTZzIWfa1gvJuSTBeWM0AZz9YxoAZuV3L6vfyveJTbp3G?=
 =?us-ascii?Q?MUe3u84V14GsAF5CewW9aM62NOc1YcgGFWjf80/t/qBV1PAtLCXZIfvVphCY?=
 =?us-ascii?Q?cA/durxWhDM/h6cmqGuC1f52EBM0Oz8Iru9Ang8QXMGeZdITlUX2ZeDZ5/+u?=
 =?us-ascii?Q?T8HfJsUr7pjh3BD39XJSjM6qNfZFiKaKh3GPNqNR9dS4jqJb4q0yBrFGxes0?=
 =?us-ascii?Q?D9uLf/LIfYr57/mPtrJU2wU/dnmuUrkrspP9o8YPAKw0rfIK7Zk1avAiTR1c?=
 =?us-ascii?Q?AvMQ1267x8Qc6rZpgJv0AAfByUJFkUSdFJdd9tfp3qo9zfupjNQs70tXpMSq?=
 =?us-ascii?Q?1MhSHVs83GP4AEGlozIxtE9MZNtJOCjGpQ8eQxUaCZguAesoRzks3kY2T2vL?=
 =?us-ascii?Q?nspUq3t07ax5tbfFFXlDcZUi7AskYMfAqpoM/llBegQkBWwNqQcukjs++9mF?=
 =?us-ascii?Q?gw8brnlLVNUDa2SWyOC1sFX4qMX20bKw2qE0CCsYL35ag9wGYbnrCWy2W67T?=
 =?us-ascii?Q?MW7s2b4xTytn+OCgydXXSt3Lh25edZxMg0B/FTiiCKsgKODyaPwY765FNNoI?=
 =?us-ascii?Q?DinVXtQC7lbTi+emvjmcPQGA+D1PZhHsE2fM5LeDVxnTfXUIhN/6iehXkEVn?=
 =?us-ascii?Q?VtPXZ6fe1klzi2hwjdFB+BT7SgMdVjWr5x+/yRv4T2qBfmlL325EbVw1mkfq?=
 =?us-ascii?Q?YYRmMQN/14sHZ2Kb7OckTnHN0K03Xl+v5AG+jSIGNZcC5ZAABfJSwepXrZDq?=
 =?us-ascii?Q?tmdskp35oJOxWwaqlU3A7GSDn6NsiTqEPJBGCc+HIkbtEhSPccoFn16kXYIp?=
 =?us-ascii?Q?3yzuaJC7iw/h8Te6FzDClyc39UvXbrGq9Z7ZpnHcY99mHwpJ9W3N+f1/dn4v?=
 =?us-ascii?Q?oLQdgzpj9JrOuLfMxYAT0yBzkcuq+XYc6p76nheB9QyIIjk8bB3mz7CqgXFl?=
 =?us-ascii?Q?gjPvapgEW47aXljoXx3TCftToUN1Y9l0oR5bjZnjaDCdDyikEUCSjrrIJiwr?=
 =?us-ascii?Q?Zl0aQ/aCPjDXOUEj+cWnLG3o79e9rW4o/HLsFwWCQeMZUNEdQKhHHEegGUvv?=
 =?us-ascii?Q?+3TVhbuT8APMA0PO3lbEreRD9ivsMEwlPxZlqmlrGYZFiRQm1Xz2S9Mb+iBZ?=
 =?us-ascii?Q?bjitBgt/+NLrYtp5cYALzXvk6bJrxq6ths4KDAELX1KaTpTo830bMDKX4/AQ?=
 =?us-ascii?Q?65kAl7DbEQ09QIcb+siZhUO0gIPPKWY2445pz1RlqdnUY+LK39H2BTC+h9+3?=
 =?us-ascii?Q?8eNUvNi5iyU4Q/2j3WmzQ9EPSOV3tZ9lfYM+oT522PmrIATaDsGe8rkKMrb4?=
 =?us-ascii?Q?LA8TCeVr0SmboV2yEbrcUenGxkwS6DvlZLoR2R3f96mjovKpsWvus6FMpA2I?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a3d34d-d44c-4574-862c-08dcf838d341
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:43:32.9899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwx3zVYtpcLVaQjU8lO2kz3576C2gXphFgZfWkCPo98zoEPuNO793D3zxvWOgIKt1d23Srvddbgklmqw9SgCjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Sparse provides the following output:

warning: cast to restricted __be32

This is a harmless warning due to the fact that we dereference the hash
stored in the FD using an incorrect type annotation. Suppress the
warning by using the correct __be32 type instead of u32. No functional
change.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index e280013afa63..bf5baef5c3e0 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -2772,7 +2772,7 @@ static enum qman_cb_dqrr_result rx_default_dqrr(struct qman_portal *portal,
 	if (net_dev->features & NETIF_F_RXHASH && priv->keygen_in_use &&
 	    !fman_port_get_hash_result_offset(priv->mac_dev->port[RX],
 					      &hash_offset)) {
-		hash = be32_to_cpu(*(u32 *)(vaddr + hash_offset));
+		hash = be32_to_cpu(*(__be32 *)(vaddr + hash_offset));
 		hash_valid = true;
 	}
 
-- 
2.34.1


