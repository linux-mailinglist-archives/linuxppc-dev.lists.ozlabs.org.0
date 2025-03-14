Return-Path: <linuxppc-dev+bounces-7053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AE8A60FB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 12:18:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDhgl1PPdz3cZ0;
	Fri, 14 Mar 2025 22:18:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741951107;
	cv=pass; b=YlWN+z50qK14YgDrxLh+SbQCxSqwzm2oBId42bnKHUdkRkLk4UGUnoY/5W+E6Qg+MAywmYBNWtTTeVvRdODA2FOjAmUhxAxD5m20R9JUB2qL+cxvX5wbVvCFs+egeo+0TGTSxSFpLWDrgbb9Y6ZLjO+JYEmyYMrNzOdftPRkiHtEpiaU3eYy2WLmvpxqvopvFtDIPX5ADkrwi/Ub2pr3CImFhx+BGpblA5dKi2z5pv9LA/BHiQUDeWwPhZ86PjlSDhenqL4R8ojd+d/sjw8veiVDljZz7NcIZDvogmWhxCSi8YWye/OaF0IAnl659WN02jxj3m4QyPImlG/QAXPonQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741951107; c=relaxed/relaxed;
	bh=/UAqKFN0Yt/8KwUezRj1zqIF/TLu94cif+zYPYLnYz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J0C/CreR5sQOhN3lej/QvlKzNGhPSYHrQXbU9/wmZNuWX00QvEiZ2OCGUELQRHLqtQo5pyYV936qr3BjQipSNi4rcjrJBf9EwbFkP+LiluumNyoqtZK7wP11weDCbDPaT+e6g0ZciVY+feDaYdgQKvzDJLmiG5rSHLNzxEqt991efsmJfFlHXPv9+Gm7mGOJ2t6kBnwPERirqy+EhSsijmwPV8kBQoAHf6n52Gx6UY7ts4xM3ahIVwymXYARfBlyRWNuAWCo2Y7EZYtX+/+GYsptnzDXlZX7FNDAQ2S1sJlfiPuJvVskq0B4WkCo+8x0sVAJovp4TTbPN1cw854T5Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=c7wHGWvX; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::610; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=c7wHGWvX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::610; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDhgj5tnpz3cYN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 22:18:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxcSf2eKDIQsVSCtVkejvl3gbcg7CjRWrimc/fqGwUGBJw69jaYRwP5Pr19mXPGZxbE0b4u6scElHq4svsF5vuBCUsGo+lRHWsef3pr5tEVCHRkxg+B3sJT+ttJRGD1dj9SU6Q3VIxSHXp6dyubuhLqTdFgsr1WTNAbCk+zbC4NgHq8Qp5SzNm3A+d2O5qsZxjlzMeReyxu4kvF8p4XLjw3edxDnIRnnsoh99HVWsqi+HAbmfqaDMY8hQReCRGTrqCt2YhvCyDv/Hxq3OTt2jL68nLRD2vvRjSnIac4Z4HbMbjZN9Y54iwetVZ1j5fsp/5MpwPHZqOyL+U5eNKquIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UAqKFN0Yt/8KwUezRj1zqIF/TLu94cif+zYPYLnYz0=;
 b=jlOOXsPFE68/OtBkELiTGFN9lyLIZQDcXcLkGYR8vQwZkHVdd+TBpc5F4zGJsxgMJGh2APMGJbFSkIW+q208h3e3SkYJQs9cUxU4GKmyTcjCUGd9tpLx9NA+37lPILrU4mkWzMF0ZdVlyBXZjnycXxCMR33A8PbqEAdRQ3hfC5yqV7AzuKAx6Bjcp634hUFlRq0Su2rueK4+lW+XcRKYLK3V7977qYmF81Zb0eEaIviAkUBpCYXVbXRTgE2VP5FCKLxS4Ukd+qkHPHQ3ppNd6zz2DEd67cOCb+HtVxq1c7/bOf0fcGcZdCwsPqeEFqpB6c2cIHzW6UpHnd2pE5+r6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UAqKFN0Yt/8KwUezRj1zqIF/TLu94cif+zYPYLnYz0=;
 b=c7wHGWvXxLjf/riAJAMfMOQ1lEqQXWT6XXtH5ZFah+z8+DIK5mdyWfo9jiOrEEqnb7eKRhtlBpjyxKJsI+9LH5SEypd+ruJxqPrd2MGLrgbWJvkz54ExuvL0/QuS594yhutCOu92iQ2npCWcPCrdDlk4c4E7fwiQo4xa+rU86qIvrWp/orcJRoeQdQTxVTvAjM39x3y0I/61+dov64PcnBZumsWJsJsF0MMfv/MYWf1VZEZg5GbNOqLWpbz8Nt+cykjfHm/6EIVZVrRRgtIaRd7103HPeYht32WZxJY7hYgD4CFJeOZEpV6GSVwktOiGWquIS8D0vfd74o4eMlNESg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by VI1PR04MB7118.eurprd04.prod.outlook.com (2603:10a6:800:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 11:18:04 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 11:18:04 +0000
Date: Fri, 14 Mar 2025 13:18:01 +0200
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
Subject: Re: [PATCH v4 net-next 02/14] net: enetc: add command BD ring
 support for i.MX95 ENETC
Message-ID: <20250314111801.2oela3qoi5qrl6el@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-3-wei.fang@nxp.com>
 <20250311053830.1516523-3-wei.fang@nxp.com>
 <20250313164908.rdy3y77xno3fza3l@skbuf>
 <PAXPR04MB8510D3A2F2A792A89941A7FD88D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510D3A2F2A792A89941A7FD88D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-ClientProxiedBy: VI1PR09CA0144.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::28) To AM8PR04MB7779.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|VI1PR04MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: 355cf849-911d-48d3-cc66-08dd62e9e392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MpvJuSXo74YZgkKisew70DXJChGqkZjg7PQpjuF0xEbQ/eqkcZps2+7Jl1ov?=
 =?us-ascii?Q?eSBLYqKoFOdaGIiEZamX2Im3Lp2v5vUhqiNMtR1C9omMDIIR9p56CeOHqfrU?=
 =?us-ascii?Q?e4LgZT+kjs8UpHYhAG1/tNX6POH7GGsXs20ZOJonEAjdxMqvbEOKuR5oqc0M?=
 =?us-ascii?Q?lywvBEIiffZrB3tY0xZufhin4V0oDmQux63iDsOn0cRPxBvTL23ARnqSg3+b?=
 =?us-ascii?Q?Sj/gmJu4Szpr/2f1cvaZyy4jSrJ9O0wV9e4LCMIxdp2z57y1wWhcXJyu5rqy?=
 =?us-ascii?Q?TpggucR7ydPx49zqP6U+2NuLH2GOIp4/LpdmQ08xkL0agpJdh0yEkUjsvxne?=
 =?us-ascii?Q?ZbPRQptTE9/+T/Gy/D+/vI1Tzqk4Zwd6IeISH48LtoaKPkioX1/5dkpCJW9w?=
 =?us-ascii?Q?8YHUZGeMd9E7t8sV5Y750vsUQTq59+OPzy+S1CqWkmls5E6C/H6TgvwZffVp?=
 =?us-ascii?Q?+7jl3GNdWHcgqSoAv/ktckjgwAPZuq/VGrHE/UrAQ11DVSmUPqN1RXQoxM6t?=
 =?us-ascii?Q?fxoPtoVg/tWctB1O/mLZuZb8NLlKvaiIHui2+zOM8tDDwaYTFy2Ev7ak03Vn?=
 =?us-ascii?Q?RphvcFqxDtno/07uPtIZt0rQefL0xkE0gSY+tEr40kM5f7mVsJaVGc9NYZqh?=
 =?us-ascii?Q?fvVn1Wuw2iIFmD7kFiKVoVHVhkH0UI8JzhJOwJW6MbuLMMAeJysj3FyzQBWC?=
 =?us-ascii?Q?d+OaWDRwQNulbg/mopCHF6vqxzc9/S+6Lv32UnCq923hscKDl7Pfjl37rdSZ?=
 =?us-ascii?Q?dHR3Iegz1AbOz7tyeqIxrdStJFNDFUCY7hjRJ7Sq+MLgf6MrqlU+Ypo5Uiaz?=
 =?us-ascii?Q?s7djzpzuk/vUNsoNE3HpiRbomFngJUEMDDTHw2+iygfS4aYhbqfHW5ZwLsMn?=
 =?us-ascii?Q?qfffR+r0G24hXxBJ7jbMnCvWt+T4L4T35uJkA9Mjijce1D5lcc8M3tyT8CiQ?=
 =?us-ascii?Q?sm/Ac0Wdu7DJhnhmOcmHhqbv/qO2A3lW+Z7OOTzE/dvwrRdxfco7tXstdRF7?=
 =?us-ascii?Q?stzMrYFYqR8WEWQvZYRWmXfeb+oddyFo5fjSUeTfFGn1wYAprjcRAxshFfSq?=
 =?us-ascii?Q?geN22IJx9ftGvJsIp+ZCorg2w42M+/cGGiV3zW/Z9K2e/EyJJYwt7FtjQPEU?=
 =?us-ascii?Q?PaNhx9B+lSdSoIvZt1ZRSYhpSxJHmkgNw6nF87KoTAgASuBlYhl8n5/lh6+l?=
 =?us-ascii?Q?lr3DFAxGsZbIQueWk7V2CrFO0iBqxjG4756JwcYPQi22X4wFilc+p1v1pc81?=
 =?us-ascii?Q?p7p1AVAK/dHhOtwRnLbznBFDx3k68hZQqk+Sg9gQMPe8aU9VeNZPwNd45hW/?=
 =?us-ascii?Q?6NjNnXHkmkUQh61mfxAaoKyipL54CeVU+DQtXIcwfyEiJKFmz+9aTYXf11pO?=
 =?us-ascii?Q?7UoTh3L6uS255z2P4Uoqy+t8P6u0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PH6ICkVH8X8Xnov3ivSMnfDEZtUiGnnYN3JD0eAdOiOfiR/xM8tJ2FcwGvAz?=
 =?us-ascii?Q?ZHgHC2rU+7r7rtX1ByKMhRl3RI7J8yi/U3IDTXhGXMVCsw+iMAnnAJwps1kh?=
 =?us-ascii?Q?qJajEEi5xjdmfICZ7qF96l5CZxXmQidLKtKAiZ+giG/dJlkJQvFZdBCP91+n?=
 =?us-ascii?Q?/OxKuEzbGn6fDk45fm9qcBaPIZz8koMjkTZvN504xCyFQSK1KC1OtXqRy9zL?=
 =?us-ascii?Q?FnoKviloF9WaJN8kWGVOziwuI1ctYoyDi41kLyXHHmO8FPZ+BR7QvwvM77l5?=
 =?us-ascii?Q?0sPWzkyGQWU7PG8t8nXfIk51eU0ImxoCAWCLT8yuw06nvwcJmOnh8yuaVzGd?=
 =?us-ascii?Q?QUh1qDMHYayAGEOz0chG7YGLywvKIt+c4yTkaPR3s7/OFQRhbO2oQnEGBQfC?=
 =?us-ascii?Q?urKAtNT9xs5PT1l9V0MDMhE5qKKFWmk2SAiauZeukP78zVd5Jn+MDIpaSU+M?=
 =?us-ascii?Q?T+OSHQnxuFGsiNNYi96Scy9IQ5lbUCz/oVp9wZrqdxEA4tDCMaHkfbKWlj9H?=
 =?us-ascii?Q?moErstMsOPfeJLNuFc5cC/4yilpmmXTRyWxGjKoekQ59GRPmep/cK0Xcq54t?=
 =?us-ascii?Q?AAdYL02nHa1ez0BkV/OkwWDybt1jz2dlH0lEnABE5XjZvZiq/mvtWnOexIKh?=
 =?us-ascii?Q?mqDJaGKetgGfQkuNljLkCpX+ZXedZUg6XpALXBbArpx5wgyF/TyEhpwqUc0C?=
 =?us-ascii?Q?W5nlevFnu2C6aM7T5ceO8YBzwx/uX2ob95s54IQLpVKH+fGgvLJBloX66+Zf?=
 =?us-ascii?Q?/wvcUSY9AxWoa8YvJ4xjNRxPynk3+bbTeXczI1f/5TgroiojWlL9OoLlqPVT?=
 =?us-ascii?Q?uHVukJDJYyX4JbTN18MPwSRWn2uwpwiaF9WJt3qNsTnBMTSOBKJsRwB3BUSK?=
 =?us-ascii?Q?eVbzHXUlqOhHcTrIj8DmPRDEZrfmwpJo2H29s2wFJDRMUlYpKgx5VjiHJW54?=
 =?us-ascii?Q?TWRd2y5f8zjVbt9x/VP2tpeCJs7PD7+6o1y/y366tFyGEsn8dLttlRrjai4Z?=
 =?us-ascii?Q?dgmpqF33l7pGm8pLcggzCw/rMHO8N+EUUv//+XcCyGiAPpJBYizwRQqtRGMI?=
 =?us-ascii?Q?/tZzQMPWW4TJJhypdE7rNRtAYNggHe/gFmc6hO7HHGJOoGgs6vITBYk8I5d1?=
 =?us-ascii?Q?XKpSZP5ycLl2/LnqgiguFiT+t6bSbTpE8YKXuL0RGqy6wCq3OjAHO9ko05PJ?=
 =?us-ascii?Q?uRiTxJETsDTDiT5txdbl8xyt2HSGUMKAZRHN8oBsQE6NOs2mE+FeQs4Yl8X3?=
 =?us-ascii?Q?r6HGHP2BYiq1Rd8G/RP7Q4otCPOrrvPfYyECl/sBM0QMFpdB3re70hEneq6U?=
 =?us-ascii?Q?nJDcvTSbaJ2Vkn4y52e+K4Id2Fi+TAFv9d41/nBbn656KaCCffCuhiJcHn6q?=
 =?us-ascii?Q?agnt3Bdhc6o+hXd+gJ5iFHcttDD7mxXhYhlci8H4g3VzdzdIJdK9LN41AQdf?=
 =?us-ascii?Q?a4yjDN8Pq+k+YL8z9kK267KugCzE9Z4GYdhe5x6sUjH3KaPi2Y5REBRJMY7k?=
 =?us-ascii?Q?zhNwLRk+gc8O0qG0QKG2a28kIb+jJHK5Q5UgdWWqlF9I6gTVTShGWalv0q9L?=
 =?us-ascii?Q?8PgCev7b7d9mCfqKCu7rGg8//nJSbhpvff5YHKcY8b6a2UEtWANnLw8L0nu/?=
 =?us-ascii?Q?Ng=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355cf849-911d-48d3-cc66-08dd62e9e392
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 11:18:04.3824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYpeA7snpwyO+SM3szNwGJUJmxdho/gZk0BUc22M4usddLQl3AQYJu5fyk23Km7imlo5KRjNwvTunFToumcL8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7118
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 14, 2025 at 06:51:06AM +0200, Wei Fang wrote:
> > I don't understand the need for si->ops->setup_cbdr() and
> > si->ops->teardown_cbdr()?
> > Doesn't every call site know which kind of SI it is dealing with, and thus it can
> > appropriately call the direct symbol?
> > - the v1 PSI and the VSI call enetc_setup_cbdr() and enetc_teardown_cbdr()
> > - the v4 PSI calls enetc4_setup_cbdr() and enetc4_teardown_cbdr()
> 
> Yes, for PSI we can use directly call these functions because they are different
> drivers, but for VSI, v1 and v4 will use the same driver. I just want the PSI and
> VSI to be consistent. If you don't like this, I can remove these interfaces from
> the patch set, and add vf_setup_cbdr and vf_teardown_cbdr in the future when
> I add the VF support for ENETC v4.

It's not that I don't like them, the point is rather simple: as far as
this patch set is concerned, converting direct function calls to
indirect ones is an unfinished idea. It needs to be evaluated in full
context, which is not present here - as you say, v4 VSIs need to be
further modified to call a different set of operations - but right now,
they call a single set of CBDR functions. Changes which require
subsequent patch sets in order to make any sense at all are discouraged.

Given the fact that the PSI code paths still don't benefit from an
indirect function call in any way, I would in principle recommend to
keep calling their CBDR methods directly. For VSIs I don't know which is
preferable (if-else vs function pointer), I need to see that code first.

