Return-Path: <linuxppc-dev+bounces-5327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15199A13157
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 03:24:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYRX1421xz2ym2;
	Thu, 16 Jan 2025 13:24:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::603" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736994273;
	cv=pass; b=UvoEJheAOajDLToqR2X/69Si5CjokakIqO2NDpk2VzIxox/OtYDpBCHMRFOzHQbSZf64F5Tjql0zvoaZ8rcdHPJNat22LR9FZ3LE0vfalnvpzzRe1upePEwVYVZqdF2rooe4fX2l4NeXL2zE03PGVjdgz8APEFnzVuOu4QkfkuFYpBAXecoWpKVNg9xhJXwG2HYa8cbOsMW0MUy4qgnS89no8j3YSsXy8gFtJU4TechZ1zfoHpLXO+5HJVY7G2Qnk1ljLybe+/6Jx8grbM1xYU/Yn0n8F/GgqsSMa666N085i1x6eHuiyK3imJH26NOVJidSYB+RlffE/lUA7WNHzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736994273; c=relaxed/relaxed;
	bh=sjjHGTvYFDV855jPZVnN0QeYf+EeBSnY7kfiHApDg0w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=luuv++WB6c+OPoknaFpy3Y0fuKx8x3Hcj6HcaNN727fo8mX2xD01+KPzgfvNisswf4cYuHR7dcCJzPcs6CwGtBE8gARFe3wwYIaE+2XD7j2UC2t8YJwn1iOqBlVSumsNPwtp+fswzFFYb7YpvDZdcaDAy6OllowaMoOaOEtG6A8ScjSIKHWlBH3djDrvVLi5oakKwxNHFou+8yCwy14sFl3JClKVxNQQKutNpXbRz0CbQ0dMIiShnYn0NJHAX8QcpHJY29HzO2EVb7b1EqltPa5xqJaUjANgXa3hNsYZeafgSbY4npNLWKLjL/YFLluXIcgKjGCQZR1CQUwyAqF28w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HNcAgt4m; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::603; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HNcAgt4m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::603; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20603.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYRWz4R39z2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 13:24:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwaxklU+XbKw7ir8Bngdw6VpXpdS6AZBVAHVHMKw59FuzmQyFBnCeYPNRtK3sZMxWFbRkpvKkBBsMtbYXRjeIlLFvBrevXBoAQ4bNgPOFZs3EpS8tUfM/Lss3iJQ0FkRCGsvN5xtHaqdc7gfcyOgQmFz7C2ovViJkswrXLCO25p6SptJWHoEoerw27BsfpkvqlNaoefsfHafv/DpZ/RCsIKDdg5VvIQz3043y1eMvukxE8MpgwUA2spiFqB9J4EnEodb7tR0qUw3JGONSfvHWbA5iA5IUQLDhCcPqIuVh2ok1pJqJMJOyS6B4yvUD2SEc6s1Vlbt/UG7Q17xCoy8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjjHGTvYFDV855jPZVnN0QeYf+EeBSnY7kfiHApDg0w=;
 b=NlIC+nYMATIN3VvJ1JuO347acWvp/GihprH2rDtg4+36Cpc4DXw4ZiTgk8OWoqpSUIdg4gm5mlsWc/E+LB1QSf4WWVv50LtVXsQTig9Lyr410skLAIQ7idGoxZrbGrh+/UIUC5aNyQ7Wlz9hXJBA/z+EIWgbUbMEBQwOdUXzdxgzZyX5s2cr+tIk8NZsnlLbA7V424Ivgmiwocp0V8XcRMMigN6Wcvs+tgvUkEWvtDYJ+3DwxRqvD0FJN1PeKbAFgq9qIi9qgVV+8k6jBCU5RByEK30/+z03zZoUkdwu8/iLYGkaG8g0qI5p5lSd9sNDp8GaG+uCeT/h+Ayl6gFhlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjjHGTvYFDV855jPZVnN0QeYf+EeBSnY7kfiHApDg0w=;
 b=HNcAgt4mpxlbIpzURunlBrfuLqkmUy+x0rvc6zDUYDLfydaL+6CpZEtVrwuXNS7yOUE3nrR/MYb9Q0Ppcw87HYQuqhZxJTYRCIpoJKv83d3Ofo0CPVzxIbGN36wKz1dO5hQoQ5T1wyx05Be7UyK4fTmfPK5sEeZjjAkmpshWaSPjOXndy7NDKzDU7IKaWpTqzLSqkf1tVhPLI+tqvP0sEJpiaWd2tlPEUZv6X1zDvM2JHzcVKYKRaz4ORMh0Bm3/vYt0KNTpuRXIH5brJQuKCKgUtCloGz5Vz3chPhrJyveSUIC23NSzJsTwG1T/8G0FEfk9BMm6IRgfky2ezWrllw==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DU2PR04MB8837.eurprd04.prod.outlook.com (2603:10a6:10:2e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 02:24:10 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Thu, 16 Jan 2025
 02:24:10 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v2 net-next 07/13] net: enetc: add RSS support for i.MX95
 ENETC PF
Thread-Topic: [PATCH v2 net-next 07/13] net: enetc: add RSS support for i.MX95
 ENETC PF
Thread-Index: AQHbZZbFHVAXua2Zbk+OQT+Myj+77LMYZqkAgAA+4eA=
Date: Thu, 16 Jan 2025 02:24:10 +0000
Message-ID:
 <PAXPR04MB8510B52B7D27640C557680B4881A2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
	<20250113082245.2332775-8-wei.fang@nxp.com>
 <20250115140042.63b99c4f@kernel.org>
In-Reply-To: <20250115140042.63b99c4f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|DU2PR04MB8837:EE_
x-ms-office365-filtering-correlation-id: 83c4ccd4-228d-4e90-ead2-08dd35d4dc4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qmhTH6we1KZu//dhmyVYXbXDYSdD3GngHO10p9gl/q5J+iN4oe1uo5IvQcMd?=
 =?us-ascii?Q?di/g/e6HJSD6s4jeWLDBMSJ0JtsJqGEzCaL08rR03+rVba+a5zLd0WXa0K17?=
 =?us-ascii?Q?MqpzshxsISQORBP1NUZ4CJNLW3tR21hugJPfOx331wWywe2Ta+6PwatzHB2O?=
 =?us-ascii?Q?jbN7ryFucvwizMubs2C1R8XpuDmzvPVLcvosl0N6IOo1tyYRW8PuptBuYTn8?=
 =?us-ascii?Q?jZinWhr79s/3jd77INlJ5eKsJEJ8cogqX0SMnKymZobQyrdN4hxfW0kr/bw8?=
 =?us-ascii?Q?nfJvgsCON29iguv8gQmGjjhc9w6fJKHuUqSOETzzygy9h+7jCP0YqXNh7DP8?=
 =?us-ascii?Q?cw1Etz+cwDFz9CogTrc50cfvhpyNqMdXNQxDERt/lsALCGAe9jumrWwj+8bl?=
 =?us-ascii?Q?Ee9H6f3sZL8+7wTpA09y+20xD/wnLRna4XGaApBCMOLymdg9nFLlFlBa9EFj?=
 =?us-ascii?Q?IGKBrOCfswL1NrZZymef+PqTnyssSD/aiFz5ka7gjrc2/bt0Nu12+1gfk9UR?=
 =?us-ascii?Q?e2KUbmhWVu7dewd180AO2FXRS3bOzRh6XGke7wc0+ARCIvy2oY0xVNAEZTYU?=
 =?us-ascii?Q?/EmC2rKNxqJGGi0Bi4gBh1lhw2Qdj0g/5HTxR0GXSzv5HrdM/dg/UosgpZQF?=
 =?us-ascii?Q?SrGJ1+V79Ibfp5/Is2paRZsUh7d7UR6lZx21rdX+GnosRBzcsEdczwYKhLBK?=
 =?us-ascii?Q?9ArH5t9AmyNEzkRm5oAF5V8/078gnI2yXTTGruTiJyE3hvl7Zhp3EXySTLNG?=
 =?us-ascii?Q?piWurAVSX3Bv6L7urutsssTf//ZR2wjOLlCGjTY3hRoq2txhZNEiLdtbMbSQ?=
 =?us-ascii?Q?a3eZ3qn8mRpSfDEwuYBg8A0A02Dr8Xv7q68PztDeIZ62YLLvvcQ/nX3lYdhf?=
 =?us-ascii?Q?nn9sTOjfY5nFhOID7Kno3FFFsJvJJn0RHcA+EgsdM1lIWCwsCEpJeskzmqCa?=
 =?us-ascii?Q?cjtLW9hRLS0LSQmRRf45GKQicXjpMi1zQC3xUDBDDk8M9zxW9qLOYBIUlAFS?=
 =?us-ascii?Q?edCWjN90p4PE/Q56gTveH6NGlIzuBVPt7KxxSqBPtDIfMjbGyvkdrD9zDCx/?=
 =?us-ascii?Q?lFKXK99MGh9UwfYkWIrEUIHjspdCIEy1BvLwLqbRjiQL1GkoF31fr90jfi0N?=
 =?us-ascii?Q?tXY0KNDAR3hVPnrHlFYGvKOM0HGXFF35iBuhRlvN6f4uBN+lAW4LD6Jpq69H?=
 =?us-ascii?Q?wExvnv5/UgPNu7Zl8iuP7l0lIPTI6pBC3jOvfy3VKmousnfwtjsVvS1yc8bo?=
 =?us-ascii?Q?Yt7idms+hn2ILUqUmUtp29jVt8SnDZVWm28GpQHiUSViW2NT43kboRjwK6vI?=
 =?us-ascii?Q?ZgziDsY84WNAFabLPZW51UAoGlufaTXNIHNB7hFjGuIiG+F9VL2aD4c+LRBe?=
 =?us-ascii?Q?hTPQIX6AwIjYQSm63JCkL6qeEOqhaEX/yoAdhzDIQmFelfFd9CjQsoO8Lhyz?=
 =?us-ascii?Q?5qKg/UtzCgWihFVohNbpv7Qyo4yIiEoi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IJ8EOx13iuxuY0c2r30eLZH2li3K5iFRHVJ7UzIH/UX47docaIhxALKKsKT0?=
 =?us-ascii?Q?aGEbZZlkKf/BCzqZ0ylVoI9iWexZ8UPLdNvn1tPirrAWflrMn3tsq2UiYOeO?=
 =?us-ascii?Q?Ape+GbHKsfMh/zQutXEftaYEjnfkAhaeCJCCAFs+ubXOrWg8pgPOL5S8Wizp?=
 =?us-ascii?Q?JYdbxBkcbTIeFrh8rV6sWAIlE8AYSjKyF2gEO6ksjzmNoNn/clVxEdZKzELo?=
 =?us-ascii?Q?4mn1AiicwIYuq/pEKrvCm8I612/d+rz1fdvQnMt7XzVHAkAGkDCi0aA7RAaT?=
 =?us-ascii?Q?sTs5D6IQEZ9OkpNixwMFeJBwkkIXpq/AFdjBEJz+ZIygPlWLgwRmL5/YIKil?=
 =?us-ascii?Q?c4w0FZcaGKVj2dpjzLO+hj8v87h3g2kAR6783SYcZN/wKzYUwDAvCvlvVVAU?=
 =?us-ascii?Q?BYYcfqcyeG8IFlKBuZt5DJYqlSPp+Mrr3zYgvdGhel/jxr4LNJGu7Q/E2Ndl?=
 =?us-ascii?Q?uGQ9I2qDLkyYF/oJNcEyOMDNHSNZ4INKWCvmiKwYNvJYyfU4X4dHGiHjM8be?=
 =?us-ascii?Q?dyNzdc8Y/QpjEljgfl0lOSBaIpB5dCF36MNPpZgJSZ6TaJXXFJHStnZVqtlT?=
 =?us-ascii?Q?pAykqPYnDCdLz8/aA2AxCHVAM++xGf0NfbcgUEXhswXWYxtm8TfILGh4yLzs?=
 =?us-ascii?Q?g0i0p9t5/7HRGl+KaNNlp/mV4HtZbKLTgsMH1U9U632k79dIuOYwR/MWerQZ?=
 =?us-ascii?Q?InGqOKU2dHYokDLgH3Txbst3VOJF0NARyTExkjDwsIFX9AyaC21mPh55ZafR?=
 =?us-ascii?Q?TbL9mupNJvXVMCuLfGGQfkH/5XseTIz7hKMl9nIuOpUpZ60XqVj2Gv4oszBa?=
 =?us-ascii?Q?PzPM/kYqCBXUN6Zws1s8XI4l9jS9V98TMp5UHxBJqMLatKJ6pq9sBvWCiWf7?=
 =?us-ascii?Q?6zZJqve4sBftYGeWptGz+WvFagXhV83qXCeAagBf8oNKMPVGifi2h0r6kjIE?=
 =?us-ascii?Q?+6UQOQ82XbM4gO8QAXA5zHVeGnEPEeWKGAyvUYAZbxxTacsjD50d5K1pI/CL?=
 =?us-ascii?Q?Mtd1hb9n09p/Cc78ZB2ndHjD5BYJFDi2ztCHGnWWPuPFIiXt9uYiQkWwOXVG?=
 =?us-ascii?Q?a5epEWmqoQl39fJ5pJyttVRQ+c4O6A5g8db6/aHyoOUdV/cII6Y9+7RPSr+J?=
 =?us-ascii?Q?JD9IeyXWFv9CD1uypAA1QB6F5KPo9wYXyHO0JbmxqjC7aRGhYkd+D74DOAkI?=
 =?us-ascii?Q?2cnbdyMMmuOE0Qb1cK/qyyysImTONdZzLrJb50aJFi4l4WGsjyae9fIdwZQx?=
 =?us-ascii?Q?xuXsLns6qLXrY4msgLKTIa3RtKqHGrvl8kVYhCp6beAsqkmbR28pbKKVByGn?=
 =?us-ascii?Q?2Oc3GTawqTFXlKeqLdSS0TeZVTRSlmg/CUrKu5i4EqZMTFLlApm9knWn1/7d?=
 =?us-ascii?Q?8VZ/s85s8d6hV69xk6oEwAZYRIsaSMyz4M7WLil1TevqFV8dp7b+aLCAWuMs?=
 =?us-ascii?Q?3B14PqiI52nk5L0arNO8ts9DjhyGRLbuCjHHqywE09kIOHHW0rqF/UTVw6t2?=
 =?us-ascii?Q?3Py6MOKCyMHmJgAxJ6r5Q3w+X4aNpzOfT9VkI1z+KcE4Y1qfJgJzz5GRWQna?=
 =?us-ascii?Q?n4ATaAJ8+bT3nBCX3kQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c4ccd4-228d-4e90-ead2-08dd35d4dc4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 02:24:10.1554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z3zyv67INj8CcCgnK+dE+C+N0SxaIyDgSFDMuOdFdJAXoH0RqdLQe4Uc+PCEHdW1siLes3ZIvCVHNg0nPSSDZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8837
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> On Mon, 13 Jan 2025 16:22:39 +0800 Wei Fang wrote:
> > Add Receive side scaling (RSS) support for i.MX95 ENETC PF to improve t=
he
> > network performance and balance the CPU loading. In addition, since bot=
h
> > ENETC v1 and ENETC v4 only support the toeplitz algorithm, so a check f=
or
> > hfunc was added.
>=20
> This and previous commits are a bi hard to follow. You plumb some
> stuff thru in the previous commit. In this one you reshuffle things,
> again. Try to separate code movement / restructuring in one commit.
> And new additions more clearly in the next.

Okay, I will.

>=20
> > +static void enetc4_set_rss_key(struct enetc_hw *hw, const u8 *key)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
> > +		enetc_port_wr(hw, ENETC4_PRSSKR(i), ((u32 *)key)[i]);
> > +}
> > +
> > +static void enetc4_get_rss_key(struct enetc_hw *hw, u8 *key)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
> > +		((u32 *)key)[i] =3D enetc_port_rd(hw, ENETC4_PRSSKR(i));
> > +}
>=20
> Isn't the only difference between the chips the register offset?
Yes.

> Why create full ops for something this trivial?

We add enetc_pf_hw_ops to implement different hardware ops
for different chips. So that they can be called in common functions.
Although the change is minor, it is consistent with the original
intention of adding enetc_pf_hw_ops.

>=20
> > +static int enetc4_get_rxnfc(struct net_device *ndev, struct ethtool_rx=
nfc
> *rxnfc,
> > +			    u32 *rule_locs)
> > +{
> > +	struct enetc_ndev_priv *priv =3D netdev_priv(ndev);
> > +
> > +	switch (rxnfc->cmd) {
> > +	case ETHTOOL_GRXRINGS:
> > +		rxnfc->data =3D priv->num_rx_rings;
> > +		break;
> > +	case ETHTOOL_GRXFH:
> > +		return enetc_get_rsshash(rxnfc);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> Why add a new function instead of returning EOPNOTSUPP for new chips
> in the existing one?

We will add ETHTOOL_G/SRXCLSXXX in the future, but both the hardware and
software implementation of ENETC4 are different from ENETC1, and we don't
want to mix them in one function, which would look a bit messy.

>=20
> > @@ -712,6 +730,12 @@ static int enetc_set_rxfh(struct net_device *ndev,
> >  	struct enetc_hw *hw =3D &si->hw;
> >  	int err =3D 0;
> >
> > +	if (rxfh->hfunc !=3D ETH_RSS_HASH_NO_CHANGE &&
> > +	    rxfh->hfunc !=3D ETH_RSS_HASH_TOP) {
> > +		netdev_err(ndev, "Only toeplitz hash function is supported\n");
> > +		return -EOPNOTSUPP;
>=20
> Should be a separate commit.
> --
> pw-bot: cr

