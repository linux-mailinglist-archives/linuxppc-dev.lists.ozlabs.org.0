Return-Path: <linuxppc-dev+bounces-7110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFEFA64744
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 10:28:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGV5X6gsBz2ydW;
	Mon, 17 Mar 2025 20:28:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::613" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742203712;
	cv=pass; b=XvnhfoB/XtfMN+46OF72AyhE70GELbWbY/Qp4oFlXThI5VJmTCFQSAusNOML/9mFAOLSLFWhyYh2e8hg+R8sTE1kohQBiSE/Bu/GNLzQpBhQ46SVadgeGO4Y9lBKw8V2jan0HJqA7Y7YIa+LG/nYZncjyUBJ2e+WS4nfgXmQLDrYQ9KBpTUDuNIJGiplC35KtaPEIkJIHCDEjRE69Ht7rZRSIL6Dq+2OxVo4huMbPReCDc+5gqmFP5wQDhqwteCvjxv71VpYU42p+fd0TnaNPSiO8CvjsPOQpUAxL7r+hS/jpBzqBIlRrEFCDzakh8dkmJTPKYAMfonYcpvM+mvS6g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742203712; c=relaxed/relaxed;
	bh=BSI4nkAsmBny9M9nUX8HduTDqwiT6kYM7Gikh0HUre0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T/I6jQB5Jbk72ADGCYqj4GrTA5p9rY+/pwZ9kyQDWtMSMjeqjfNoKirRUvntz3gweaWR6fa0C66JavGei7tn5JpO2gZjLmKCrHnZyQ2xGXafQbwZHk88pLUslPSA0FyF7uwA7utWugZmSLx9H55KuVlz+OLz9cNvUAw+M4HfB87O98CT4zDPAIHs9ej0jDb7lG8fdmM+XTHtnip5T3oatVF/5J6n+vdiglsbIGmC3vQAFiu1tR9ZgvUp/SgepTzMA5lOrm22W0wiKqoR1ARu7EVS0kvkWzM8IFimVWThbe8rrVZhJ/1CHB7G+LX4U+gYQaiQpyyJ+3duW1BU4q33WA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nnMGCy2L; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::613; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nnMGCy2L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::613; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20613.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::613])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGV5V4Zr6z2ygD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 20:28:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLcuf137j2qYxahqPpaY7iggveEdxquGrP1B4+/Hz3tdyRqFGpYZDX1mUMJkcsSB4snOKlbCv8aSkhApzMwjwxw5diTRzpyTjR6bvQ4Bv5NVcFNWzHUuszwa53rO4Km5NpckrTj5fB735BtjBfZDJSfqdxvE5uc/n53fFkciL5mYmcGFKidykkFfDkOnrldLf2HQEphLZNjOc+Kr4wfg8d7KicnyYdjqx+AUp0KcVLZ/AFl7ePvXyO2tT2sDEgCYLxPL3Ld6Me5YawriERlCg6J0415PVgEUCCxLw8ox9bNtf7fRdJJjwi///f3DKVsUfvsjPknR7JTyr83ZcLHZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSI4nkAsmBny9M9nUX8HduTDqwiT6kYM7Gikh0HUre0=;
 b=iq/s+HzCUJ3BZoFA4D3XxS2xO71I10Ncz0GNNIO7Ym3EwHdKwgJhFhNEGppzdERywqjfL6ZZqb257xLno/KF1vt5/bbEboJ8n2cGbzeZe7wqV+Hnxz5nbYI4ZchxvwSF1NEKS9Y74dhPI0msl19zqgJBV9oljznuY6uhYbk9hG+K/VNY/gWqo94sR+dRumY+YSVRrCkqXp0UzyHnBt/InFqYUbb1bRCfeFhPzASU047s9oVK0XrHOxq28tk8QD84QGNwHIVclx5kqulm0isToTIRTqpp7mgRRI8XESC49nh6M2OOkq78Y8JBqgwBfRwSiBziyvBt+abCmq+wGcXBIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSI4nkAsmBny9M9nUX8HduTDqwiT6kYM7Gikh0HUre0=;
 b=nnMGCy2LjUkfsvglImUKu7NF4jP/WV2QD5czP514A/XnnYHYpb5a9u736LVrcSSxf0Qe8TuYqW0gEElMTG9tn470rx+MuHr0BedckRX2MzR8Ckq6SvoZNrBRcvn1VG2d5UcX4aBVZxBu9tnIOM6xjNk/PEW5/KJU5fCTwaurHwjPEa8RBQUBbWTPi9RtS71qIRV7HgVZQr/eS/Gn40+XexIq04/ZEX+n064Q22d+V8U8OSuFvQcIdEQxpl5XJ0q8VcC/pWbi+woMlAhoDG0jqW3R6NSxbUFmGRqr2UOLhRNx/v6y0ZikqQpU3L83cnRhNEtn7ed9VPfK9Ts2YUU+KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA1PR04MB10525.eurprd04.prod.outlook.com (2603:10a6:102:444::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:28:12 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 09:28:12 +0000
Date: Mon, 17 Mar 2025 11:28:08 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250317092808.jel2au3cgfwblaxk@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-2-wei.fang@nxp.com>
 <20250313163526.pqwp2wsfvio7avs6@skbuf>
 <PAXPR04MB8510327277CFEAC750FE49F888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20250314123715.fivq2cbczd4khxkk@skbuf>
 <PAXPR04MB851027E5F830F08F3395083888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB851027E5F830F08F3395083888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-ClientProxiedBy: VI1PR09CA0160.eurprd09.prod.outlook.com
 (2603:10a6:800:120::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA1PR04MB10525:EE_
X-MS-Office365-Filtering-Correlation-Id: f52cd914-c145-4b49-175b-08dd6536095b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dMfwouWdgiKeAHzq4wAbpz4o4pKwIoUmSsPCgxuRacozjOUtlcFAvIYeS9C3?=
 =?us-ascii?Q?PIVZaeFUdDlfX3D4xa+++s4+/eEUfmzYJM7oWPAayLMe9o0UugsVsFV32eeP?=
 =?us-ascii?Q?JYeNQiLbCtYV/ZPrJcNF3oJtSmBaQaP1YBAU+38AH8rSdIMIIJhN6uiQh0QB?=
 =?us-ascii?Q?8YdgCFWziND874XjAO+FTR57CveY1gsNpD/82GORWARLm53zWq12JUaV5f8t?=
 =?us-ascii?Q?JS7c1OBbLtdpfLFCgzZQM927kyF/+LkdbuGqgHr97JWDxdr1OQTLSae5owbI?=
 =?us-ascii?Q?+JLK81DygIH7Pex5Fz4yyseo6KSn/YD2GMarSGgA6XoYiftsNlCw5b125Nx5?=
 =?us-ascii?Q?lcT0WiAo7EdCfhp/GvA47pgYP+av/bsRIYkLNrZ6upjwJoAzNP0dJzEZ0Qat?=
 =?us-ascii?Q?uWlQ2UN7smmrTUI9XsdCxG7sG05L2iWYgFC+ev4ON0ZNCHW97pdXnSZpeVr4?=
 =?us-ascii?Q?jpq1eYep3D/7PpSLC/Q9jon0swBCxaJDdCrqplE3bGMqJXcjWn4GvrMMmh3J?=
 =?us-ascii?Q?vq3eVab+IHbTsKbfRB/wwgdqgQWZC65dxB+mNahgAa2bsg40ITKIw71vzHZO?=
 =?us-ascii?Q?KdveFray+u2NhgD73H3vjANkNtIgwpk7VFpd6EjiFYrIzCzLfdnbmmNyA4Oo?=
 =?us-ascii?Q?n9BmBjvwJ+1JnqtjfA9OlaavRA77goikhVG02PWu2M998QEp0NEO8kLsV2jq?=
 =?us-ascii?Q?mMB2RdrRPfQT+nxflN1V43naj3h6LXQk4aHYWeUS0MTGA58//U9SiOXt7/4P?=
 =?us-ascii?Q?FspybH3/VQ7Kw0iAc5+NA/JyaSp/0+TWUgd1OXCGrbMponz3ZT07u+uWcI6z?=
 =?us-ascii?Q?lE2riJn1nGoEJrmH/Nw9KXXMl8QiDIF0n09sgA73Hxzfd3BR8eYPhAsFSowH?=
 =?us-ascii?Q?383dp/xGUNJcJ0/SKbWrjIpwNIAbHk2838A1x3u88PtxhIg3Sc0GMIHFEekg?=
 =?us-ascii?Q?4l4xCQm56LPzvIVhYtvSWArZGJZudwEjj1qtleLeFH0jYKtqKBmkwkbKGiGe?=
 =?us-ascii?Q?sT3DNjBSjwxBS08bOxYQBKLS0GbdwSTRvFwKDflnS6dvsqIG2JYMxeNL0OAB?=
 =?us-ascii?Q?RjEj13QYxVdzd4yyY/3dutMQnhpN8BvXP7I3J9ZDH+ernBDcOfChbM7GjQHB?=
 =?us-ascii?Q?n3z1Q0yOtP11mY+kUG4wgHE8qA219xqcYnHJJCk6EVKQ+ibTWLTiNAWUXwaO?=
 =?us-ascii?Q?2qKAoaesRz47fO2ZujrX4tN3s2vmMEairq4F0gIwys9s5qkKFkWq9LoIi+HT?=
 =?us-ascii?Q?kfYQ6c4OZwSW4MNK2VT84+/oP7zW6BRrsVtjUHosUWkaQIlGBytFMRxuRVaJ?=
 =?us-ascii?Q?ZVfK8FKaztuZ3fJORDmzn45nwmALmakg4/g8bsppCOtMceFKYWB59BaVg1/N?=
 =?us-ascii?Q?QdXYwpsBlaY/F0EVWi91Afj/yqmG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JD25MsncrX1FcpiTCj+YsHWEmJDg8N1G7zm6ZIGDYN6gmZc1EOdMwIFmkb/v?=
 =?us-ascii?Q?0TdjguoH/FQ8jdmRJSNKAX7hwXXU4aMDu5iYTxHNiqbVCw1n8eWtl+9N056y?=
 =?us-ascii?Q?6gDwy6+JMT6SfcarbGMlBEJY9ud1qZay+31COFHbBvQw2o2N5U98ukdLoCv+?=
 =?us-ascii?Q?TTnryZBFEHsMk7pZNLnXHmLJG7h9IYv3CfZJLlhFwg2Rdc6ZuyU6UQoesgYn?=
 =?us-ascii?Q?DpvQYXEE25anHPDj7ts3JJx4/0pGJrpkfYwIlZjAwSkggSiIxX256wEvh6T7?=
 =?us-ascii?Q?2bZ1fgG7BHftRqLRM5TMhBVYhazMWKo4Yt77RbmgZUnBF4KuhtNFo7OwK9+U?=
 =?us-ascii?Q?TrxCkkvhRfYpBPFvEesTuigNrUzFaTB9ZdXG1coBrR5yTQ9bxrEQDMdgJE16?=
 =?us-ascii?Q?lNDU1aNvt5Jy3u0H9RksUX9hJppqsAnNK/4vxspaRH+ZMSkFxkCFqtvFufgT?=
 =?us-ascii?Q?7eH7JjWgsDDYZD21bfmcjoKf7eUAxawjKvp4h3Dx4icigJiUwv3uWob+TEJL?=
 =?us-ascii?Q?uouqz8L8cNoJciTjYrGq6r2tty8rB1lmfSC0teUOCb9HfMrLHdAcXbeMNtF9?=
 =?us-ascii?Q?UoVODxHEjUF07tLLNI4XzHJeFWVEQIhGHyT3imNB5kaRe+VvxZ8PMZa9xYnl?=
 =?us-ascii?Q?t33QqLECtMsSOQMYY5kMMbYprf96xdIhErmKp7R1HgJVX7Ai4rJdKMK+0Rnv?=
 =?us-ascii?Q?nU6uxT3vRjvjLTN5RHMwJH5OkuJezLxNdC1WxLG7N1Lk41FIOhJZQ4Orb+8X?=
 =?us-ascii?Q?/2Y1n1w85eLNsi8SBytgv1hMLU2HTH6Zmq5TfSLkyK4UtGg/eC0yb1iXUQ5v?=
 =?us-ascii?Q?6TwZq2OfV90VfjNCuLJqxbnScPVdjIqqWTPIh+EB7/WdquVLLImOaNdewc2c?=
 =?us-ascii?Q?voCEbh8RbtNFoiWu2mkBodCjJyaur3+Koo+i1PKBaseoTAIYsqV/ljPsB++T?=
 =?us-ascii?Q?SKDQK8ybCnD2z07pB6kUK7dGKOdW0a1verD9AlErUjwhm6pBSwSYUK/a/yRU?=
 =?us-ascii?Q?bgGTedUF+wZz3jpThXf4Au+sKQH7WGqgxvC5e/8aZnaCEbj+5hV2wdC64uv7?=
 =?us-ascii?Q?C9jBQmBEdj7QEoqihgUXpfXZiS4Ot4pqc5wgilYwP6xL6LS3n5ykt7uFt7BV?=
 =?us-ascii?Q?ikQwl0uUNDh2BLD0/cGCz3VBbJRAKCXsOXKDy2OcM4QYFo+xzaDUGoKbn63f?=
 =?us-ascii?Q?EtEaWbV0exbjaDafCSbDvkvO1yQcMpyKryboPuYD4UVLllscRZQlv4h7Gf9+?=
 =?us-ascii?Q?6Vubio/8E8W28dINeI0v5udASvj/G6RPe3vaBLk7ZsgkqxXxo5cFc4Pa/bYE?=
 =?us-ascii?Q?qRPGsWGtyhrWPWR9FdBuvm/52uxxzQiILoZvpB9rkFoBc1TLFCbLw8INhrch?=
 =?us-ascii?Q?ND+xS3q2pakCzE/KaX5TEhi9OXLxxYUzRRqRHW9tH0u5pf7QmWMmE+jx8SJ2?=
 =?us-ascii?Q?gyIHOdHIT5VME7YAoSOKdnakYCeshyR3bJaHz88BIfELAxYIlfzuLhRUJ2pM?=
 =?us-ascii?Q?uen2h24STP6ym5xDXulR70RqHh+YVV5z3Y56QlyJhQ3rdv3hy4N1dBSCuQJv?=
 =?us-ascii?Q?JsRxhs+0WUi4F0z1ySIurGKTSt2pWGXuhqipr18ctII1OpTgXfJLctX+T6n2?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f52cd914-c145-4b49-175b-08dd6536095b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:28:12.0086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8LYSj/zDI1bC1+3Go0CKqVuAb4GOZne1JFnFjNALfYq8TGx0tjVX8Z2dNlAz5gpqQ0/OrzJG6GA1iMwwxNQ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10525
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Wei,

On Fri, Mar 14, 2025 at 03:48:21PM +0200, Wei Fang wrote:
> > I mean, I was just suggesting to group the macros with the macros, and
> > the struct fields with the struct fields. Mixing them together looks a
> > bit messy to me. Even worse in the definition of "union netc_cbd" which
> > IMO needs to be reconsidered a bit (a hint given below).
> 
> I think this is a matter of personal preference. I was inspired by some
> of Intel's structure definitions. I think this method allows me to quickly
> understand what fields the member consists of and what bits each field
> occupies.
(...)
> Thanks, but we have added fully NTMP support in downstream, it's a great
> challenge for me to convert it to the 'packing' method. I don't think I have
> too much time to do this conversion. And I also need some time to figure
> out how to use it and whether it is worth doing so.

Ok, I'm not forcing you to use pack_fields(), but given the fact that
bit field overlap is now something that has to be manually checked, and
a bug of this kind already exists in this set, you will have to wait for
me, or other reviewers, to go through the bit field definitions from the
entire set.

> > And I agree with you, I also don't want ntmp_private.h to be exposed to
> > the NTMP API consumers, and I wasn't suggesting that. I just want the
> > NTMP API to spare consumer drivers of the gory details, like for example
> > the buffer layout of a MAC filtering entry, reserved fields, things like
> > that. What I was saying is to keep the buffer layout private to
> > ntmp_private.h, and expose a more abstract data structure to API
> > consumers.
> 
> Sorry, I don't fully understand, for example, if we place the definition
> of "struct maft_keye_data" in ntmp_private.h, how does the debugfs
> get the information from "struct maft_keye_data"? Add a helper function
> in the NTMP driver and export it to enetc driver? And how does
> enetc4_pf_add_si_mac_exact_filter() to set the mac address to "struct
> maft_keye_data", add another helper? If so, I think it is more complicated.

Well, my complaint, which has to do with style and personal preference,
is that exposing packed data structures to NTMP API clients puts an
unnecessary burden on them. For example, NTMP users have to call cpu_to_le16()
to populate data.cfge.si_bitmap. A bug in the packed layout will
potentially have to be fixed in multiple places. The two options for a
more high-level NTMP API that I see are:
- You expose pointers to the packed data structures, but API functions
  provide getters and setters, and the exact buffer layout is only known
  to the NTMP layer.
- The API functions expose "unpacked" data structures, which are more
  abstract and don't contain reserved fields and are in CPU native
  endianness, and the NTMP layer packs them to buffers, either using
  pack_fields() or manually.

Claudiu, what do you think? I can withdraw the request to hide packed
MAFT (and other) struct definitions from include/linux/fsl/ntmp.h if you
think they're fine there.

> > Thank you for posting the downstream layout of struct ntmp_priv which I
> > was already aware of. What I was saying is that the word "private" means
> > an aspect of the implementation which is hidden from other code layers.
> > There's nothing "private" here if the NTMP layer has access to the
> > definition of this structure. I was asking whether you agree that it's
> > more adequate to name this structure "ntmp_client", since it represents
> > the data associated with a consumer of the NTMP API - a NETC SI or (in
> > the future) the switch. Or some other name. But the word "private" seems
> > misused.
> 
> Okay, it seems to make you feel confused, let me rename it later, how about
> "ntmp_user"?

"ntmp_user" works for me better than "ntmp_priv", thanks. Are you also
going to make the API functions from include/linux/fsl/ntmp.h take
"struct ntmp_user *" as first argument, rather than "struct netc_cbdrs *"?

