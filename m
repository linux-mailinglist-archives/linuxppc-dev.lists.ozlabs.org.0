Return-Path: <linuxppc-dev+bounces-7062-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E916A61303
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 14:48:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDm1C68Kwz3cYN;
	Sat, 15 Mar 2025 00:48:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::602" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741960127;
	cv=pass; b=YrCFbdWfw1Z/6DTUOJZvKbz9jtSG9zz9uhBCI0Ndzq8YvHGMKdDMvdH/+IaXlUHzMRtOgj1ysj8oUrLiG15PBdmk6jYBe0tjv06+9Hr1YJSlF2L78BWPFYcxFQwKYZjhIn46UAjb4RdK6St2MnjjsVAO34p8fdDJM5v4Z6scCVj7U8GJq+ZDfOYji8PUe2NzpPcebGcIbqWgmOngbr+nOOMMBC36DIZBp8AGR9eP4PMcRguMYA+kzl3tyvwGkPQajXjEPlsTZUXZuAkYd8pktbioElS8+aXvPIeKSKu0WslUgX17qaqrrYx9+1MxDFfV2QC3KvwmJHpO17c6G2Qy9w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741960127; c=relaxed/relaxed;
	bh=D+fS1eaTiK4IJOgjBgoyipqeDcE9ewiJV2MqfTBhqfc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bVxyRVkMUiODBAmDbfKxy2TegM8pQsGqZ6PNHcwLfhp3WopMo+u+p7Tk7cxcB8AVdvmhEai4tHAucaNwEqj8DHB+UMCS8DWBAuFo4NZF24nEB476NOsFwKQ93/7wVGQOQgJH17FcayQcYJi1b+F0CCTNLbMMc2p9C3Nef/DJLcTLeMcRbjcAKwYntAUKoTdx9GtO8ekxxljeHzgHgpe5EBJlbICiLemiZDc5cYc+KD4wNci1csTqcdW1GhjZLG931ZR9JYWnoDTyd5lAGE4HfUFYFlbDZEQBON1KqabgN6UusxsWDzT560Ukf24eL/xpd6rQ2OOEY8I/8yOn8R4V/g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZZIrSdoh; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::602; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZZIrSdoh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::602; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20602.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDm186rMcz3cXx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 00:48:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6AbEo9Qlbp2M9nNEIN5bMZxvQ8AvWB8NVWoK6BDk0QFgvuLPJub2n0Y0T69Jeyz+30Wb7AZfFfs7CrOTwfjpBwRGiJ07/BArANObjWBU+EcQQTD1zarNty5dTFcuJPDyoge/EnGAGMU9EvhShhz7OFwOiBCQVdUlhdtBjKtf1HqUwH7sRK9ZOFhnoH1Ch9pZwrd9RxCV0UEXivaV7z1brcCKsA3RPRRwM5ce3ArtqpQ14awMF1P9dg4xYWmRfResNEMFIGpF4eAo5vZ1oE+x5KjkaL0pfZGwrJw1EvIeY8qpO3yUAPMKsSS8ttIYPVd4gtQQam1ZN8jrwu3U1+VDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+fS1eaTiK4IJOgjBgoyipqeDcE9ewiJV2MqfTBhqfc=;
 b=kVLstXBrrONKValrf5B7+u1sv4vquyqc9XF5eG4N+IeRr1x+9gqB6mYhUvEwHdYG41uyJOVtsdlyHDs0hpwPWYrBeG6kWYN2/CUe98p97oiwlAhaKIC5XOU8ugAY3nhbsiW7OO74URAfznkUHQLJ73rbnoNQT9ikHFAlhEEmdpnp1PSRSs9ZAPqGqZM2Zsblm9NF+sDAFrBgYYLavetkovbvIgmurqTtDQb0KlRQiwEouj6omLxzr5gwWpISF97WgXuh84r2UMVPRyfLdM2J2rLFnTl0zHSsOYIbMRsS0xG045M6yhunFe3YD50L9q9RLvYzhbe0ESQ0XZo8hIyh0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+fS1eaTiK4IJOgjBgoyipqeDcE9ewiJV2MqfTBhqfc=;
 b=ZZIrSdohJd0s+2h438ZhcU5d/WL58ZOuQDpl74/q2nMarqgTMk8oKB5r4rutyQ1aAwiAIKs7VWXch30OYDAOpiZb4e6DrZsG+LiyBG78hAzA12pqAjm+muUOfgy4LtikawGDJd7UsFoprLVBmSTz7aI7ueQXN/Y7SFnbhOE53XB7cJXglhELiCX2DXC1Kpk5thtTi5uWkxLZ0jV2YRDIPLbwq9LPdAT5j/Y9TAG83VIdybPLXUhzppzfBU8h+1RLa2dJ/hcdx3yXXaWGGIoiNOI582NoifUcIG5A8uAhLp+V53Xp1uBebXemTaaypgq5p7VIxaxggT2WV6Red2t3JQ==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI2PR04MB10146.eurprd04.prod.outlook.com (2603:10a6:800:229::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 13:48:22 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 13:48:21 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib driver
 to support NTMP
Thread-Topic: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Thread-Index: AQHbkkpJSjcnE6eIUE+0uP7QMRa23rNxR0QAgACVlrCAALozgIAABn+A
Date: Fri, 14 Mar 2025 13:48:21 +0000
Message-ID:
 <PAXPR04MB851027E5F830F08F3395083888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-2-wei.fang@nxp.com>
 <20250313163526.pqwp2wsfvio7avs6@skbuf>
 <PAXPR04MB8510327277CFEAC750FE49F888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20250314123715.fivq2cbczd4khxkk@skbuf>
In-Reply-To: <20250314123715.fivq2cbczd4khxkk@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|VI2PR04MB10146:EE_
x-ms-office365-filtering-correlation-id: f50f06d7-6180-4680-d351-08dd62fee279
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fzck2hUWhM7AOSNraqzh6hfrv+ZR6CUe6vsq2X5vdzMQJDMIOzfva7xyVp2O?=
 =?us-ascii?Q?8KOpvD5D974b5ZVKdQucohKk5Vy41AM8wS+txOCrstD2eKyWoTjEviIn08HJ?=
 =?us-ascii?Q?G/6xSnFSib3Ua1piBGedifmUk9yj+OX1eCP1BIAcyXEu+id4LGEa9Kf3flnj?=
 =?us-ascii?Q?XwNteXMCXnQtUnGE6mRCI8m1APZoWp/STveS0NPiCwUI9tx5ZGW8IAMBRMzh?=
 =?us-ascii?Q?GPsYYsMneF2lbgivoN7xp7sGNovO5VAH3a3lsvi0rCS1I3SESgDSUhhq0q0l?=
 =?us-ascii?Q?Os6Blk4pR9LiJKDvdpPtVemLNB2dnQTFfjG7ihjZDK38akOeRIvbZZ2Y3ZLv?=
 =?us-ascii?Q?2qo9z07mKdhcwbCTjNiD2VFGL/H43NN7ob21I26r5MEYRQbYZCpir/7cGNsw?=
 =?us-ascii?Q?pF53/joPsDECAzGkCnimr5OmFXtLdv54vv1N/ipONyLQXA4QUkn+WJr5f3R4?=
 =?us-ascii?Q?VFDClz8uxxY+Ib33EjXcbeOIeZGKJM4pIC+TnP38ryBtXZROLGPYKRa9vMNg?=
 =?us-ascii?Q?wA+cdOPnGOYIBKdKCtplf8uqT1Ks/fsl0gduPrNokjC/CMeQ/g8P/cl2Lfz/?=
 =?us-ascii?Q?R0o82Q4v+vbIz1+2XNxe46PF2adjjk4aTkNB2kpaTeN/d81SR0cI78/7pt8n?=
 =?us-ascii?Q?HXiFL9zOCrM1AtWscR3R2UguyIbS7zq1nuade0O+e9CqscsbSeea56P1iu30?=
 =?us-ascii?Q?+tLwdhAFCkhextzg3GqgtS2Iok8i/HsknSQKlvetz+MGDnVAiMsjivkDsVuw?=
 =?us-ascii?Q?WFI81OY22V/HqlmUZ8z0tCkunwDTUUlKFRGuxUTSCpgHXVlPPyBZG/5gySEX?=
 =?us-ascii?Q?Assd7ZcIQOyJRC8UG14/PjZjSe6VzbBLzSR/YHhI/wPNxOo1KtKQ5MX5W1xZ?=
 =?us-ascii?Q?NI0emx+QFpT5CWmNMO9CJSWpVGTGqwU1KIDXROvOIfu2CPoFBp/9asimKLjj?=
 =?us-ascii?Q?YWmQl5j8Z8yNZSq9P9v8Rm3aGt1QKlPaFtDLYLEXdlr5/2Ftc3SRyC67voXk?=
 =?us-ascii?Q?8bPPn82g+/E9iqCgntK6N1nipuvqAvu6UyCkDjNJL1lyZVHSdXXTgv2WBquE?=
 =?us-ascii?Q?MzIJaRJXYKI4+I0nxZwbXcP8KL7RzNTwRYJCxvxDdxIQvrTj8Qc4uruvsJDr?=
 =?us-ascii?Q?dgxGYf3NcP+dCNiJRr3mk7XrLQAZMnZ3hfRL/V5hyf4AAxo/SePrQvFdGbVg?=
 =?us-ascii?Q?6x2Qu33xZvknQkLw0TfzAD49zRSNgdOI2mzVL7d3fo5EhtWP9n4AKx4GhIA/?=
 =?us-ascii?Q?i9tWJHqYWceNgkHSFsDRA15jvJ5nkabJS3ZEqiiwJgU8HtEDLtl4UAyfGF/7?=
 =?us-ascii?Q?Sm7T9hczghMtnGcP/iJKCyLZU6mhVaDh3cuanWou/KqmyAaxddZ/AE5zH1wB?=
 =?us-ascii?Q?Cruw0vokNi5/V9uQXVKx5j2hwmQMAM1oEtrJspQXOTiD6L0QpbSAOvLpl6px?=
 =?us-ascii?Q?2cPcjRHAJoHIIRkRbeoRdiEUGMGqbJPA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eDxErpmaiob3JVnTHNvj1V8qIA9anhyuMC+gEwKtkY+/Z14adeDGmAs9MUbi?=
 =?us-ascii?Q?m/D655AMT72V46MbTBjzXSLAdDEeXznWgYI034BukNyUcLeNGcN9EjTcyZ0K?=
 =?us-ascii?Q?1i2Kl6vKJt8HmLXEmrXnFyoKaqUH+6/UxkyXR6S29v0DdvOReHhemgUgDqPC?=
 =?us-ascii?Q?SyPc+62gZvxN0PQ5uROyUrkCRlDxPOsaNKbBeICLPvTUCDvSuvBwmIuZSxD4?=
 =?us-ascii?Q?ZP/37iMRhM6TEU2JsPQ/9APDoZLMV6yB4glztd46rQ28AXEs3Bkt8Iqk3UmM?=
 =?us-ascii?Q?rzXfn3OLFXMlDCNb5xFomH3Tqy2G/HpPyelhOLCUx+Bv0VDMduE/TprfHXq/?=
 =?us-ascii?Q?bcpScMGmpxzRt6Xa+sNTNmZ3HffXH4WNBDkXSnj+wZRhRgW9l44YcMYvMg6+?=
 =?us-ascii?Q?MhUX45Juvd7feq5dC8Y8ZG9I34jCAELM+ZskFPNqk2W4XudEE3EH2Bsv2fUw?=
 =?us-ascii?Q?6uBAH5tbtdTWczv1m5P3Zu/9jtFl8VGeD4YbLbqGy+BAJSvvJybDTTKsR+Ds?=
 =?us-ascii?Q?ZeqJq4XHNFiQyX+lYsLQyOolhyHQ33Z8yt30ntuhqR6mYZHaHwoECZLSWVI0?=
 =?us-ascii?Q?zxIFF4I1VU4fVNvDmph1R2gtzyS2dN/pKBGiY/Dh/wLWv55QE5u72XcWr8GF?=
 =?us-ascii?Q?CQhCdlRINI6zppTcXMRwTUOprrarQ6MDh6N3FxkP4NZ8AQG1XXATYtJpktZq?=
 =?us-ascii?Q?F85h0IX0TvC0WDpnX/iha6u4uMFcBCKQijXsiDuNrwAxbs5okECGXVaZEMjX?=
 =?us-ascii?Q?X1mD/UitF0dtaI6uZUXmByDBxDcw0fhhETjJjTJ46aPVpM9Y3XA2LJWgSrG0?=
 =?us-ascii?Q?KuCUiJURG4dT9ucS2SaczkbafEpJpNcQvMDSvznas8JLCMYQ5JpJgZa6GYzc?=
 =?us-ascii?Q?nBkStH2DTQnePdGgpJqnOfCAqXelmn2ha9/x5l00WfrHheVjULis6Jk6d+Fc?=
 =?us-ascii?Q?Gx0w7gQIg6LE/UKniSBgPHn+7xAnzA+YdGKOLTG0NvT+k+15aNGow3BPBQ1a?=
 =?us-ascii?Q?MSQAK4ZzuAxer6WbHiRqrdLFGCHnxLj10tjJcfWOuj7C0a6Pm5pWPb66Tx2X?=
 =?us-ascii?Q?08W8z+CGzTbClQyJIAeFIzIFAC/1neqDWPs/2L4Lg3WLi5up9ZSEtemqjfOr?=
 =?us-ascii?Q?YEdQK18D7DsZX8iJvejZ2U32hOxJMmzMZWs38WXqT9RshWyzUX2rqM5nIPru?=
 =?us-ascii?Q?AW8AVWTVOFa2lcWtZyF0mpz5yBAieBYq4hjUMg7F0c9M2vtAdyrT5iQJudFb?=
 =?us-ascii?Q?6nauiMLKm2jmPNYvDLTTRLG4n9E3GooOIPskm4uflWhOJi5y+jlvN4d8iBxN?=
 =?us-ascii?Q?ua2lPTXA5YKm3fYUlord8uCv8spN9ZdQbygT0qxVHFuyNeSXayNFbuBTbvHn?=
 =?us-ascii?Q?lWEmn9xBbBPMK3ih9YsKLLrJdvGuDaZcmztscLBx5jF6yba2zi5HKYqYRhvI?=
 =?us-ascii?Q?7d6O4/f5kiZXd/rKJqhw7b1VOv4NhERcmjrzKCP9PtbsqzzpZqZZ9QlJWmjs?=
 =?us-ascii?Q?Iv/Xq5XESg/wxYTrdUHVsJF5k3UkersYXueJquqSAZdUNthsiyAIiwwJT7Ga?=
 =?us-ascii?Q?nqnf5Lq/eO0CV93IvO0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f50f06d7-6180-4680-d351-08dd62fee279
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 13:48:21.6838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ak0i5VhURd8Ik12GkdA6Eop13FjWwjGyEPglIbf2XVohi8I1ktKn6hiZeKDVO/q790wECpY5I8K9wrcoZHxquQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10146
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Best Regards,
Wei Fang

> -----Original Message-----
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> On Fri, Mar 14, 2025 at 05:38:18AM +0200, Wei Fang wrote:
> > > > +	__le16 update_act;
> > > > +	u8 dbg_opt;
> > > > +	u8 tblv_qact;
> > > > +#define NTMP_QUERY_ACT		GENMASK(3, 0)
> > > > +#define NTMP_TBL_VER		GENMASK(7, 0)
> > > > +#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
> > > > +				 ((a) & NTMP_QUERY_ACT))
> > >
> > > Can you please move #define macros out of structure definitions?
> >
> > No, I think these macros in the structure can better reflect the specif=
ic
> > meaning of these members. We can intuitively see what the bits of
> > these members represent, rather than finding the definition of these
> > bits in RM or elsewhere.
>=20
> I mean, I was just suggesting to group the macros with the macros, and
> the struct fields with the struct fields. Mixing them together looks a
> bit messy to me. Even worse in the definition of "union netc_cbd" which
> IMO needs to be reconsidered a bit (a hint given below).

I think this is a matter of personal preference. I was inspired by some
of Intel's structure definitions. I think this method allows me to quickly
understand what fields the member consists of and what bits each field
occupies.

>=20
> But you mention "intuitive" definitions without having to go to the RM.
> If I look just at the definitions, I see that NTMP_QUERY_ACT and
> NTMP_TBL_VER
> overlap, and that NTMP_TBLV_QACT() just ORs them together. How does that
> work?
> Shouldn't NTMP_TBL_VER() have been GENMASK(7, 4)? If I do open the RM

I must admit that it is my fault, so yes, NTMP_TBL_VER should be GENMASK(7,=
 4).
I will fix it, thanks for pointing this.

> and go to the "Generic NTMP Request Data Buffer Format" section, that
> table does seem to agree with me.
>=20
> The "normal" way to give more meaning to struct fields is to define them
> as enum values. That doesn't work with "packed" field definitions as you
> have here, which I agree is a challenge. But it is one of the reasons
> why I tried to develop an API together with Jacob Keller which tries to
> address this, by allowing you to define the structures in an "unpacked"
> format, and have a separate data structure which informs the CPU how
> that structure maps over the buffer layout.
>=20
> Below is an example to illustrate this for the case of NTMP request buffe=
rs.
> Note that the example is incomplete and doesn't even compile, because I
> haven't even converted all ntmp_fill_crd_eid() callers - I don't want to
> waste too much time doing that in case you disagree, but it's still
> enough to show what I'm talking about. Disclaimer: I didn't even _try_
> to compile it - it may contain bugs.
>=20
> -- >8 --
> diff --git a/drivers/net/ethernet/freescale/enetc/Kconfig
> b/drivers/net/ethernet/freescale/enetc/Kconfig
> index c8efbb6f2055..35d5cf21f6f4 100644
> --- a/drivers/net/ethernet/freescale/enetc/Kconfig
> +++ b/drivers/net/ethernet/freescale/enetc/Kconfig
> @@ -17,6 +17,7 @@ config NXP_ENETC_PF_COMMON
>=20
>  config NXP_NETC_LIB
>  	tristate
> +	select PACKING
>  	help
>  	  This module provides common functionalities for both ENETC and NETC
>  	  Switch, such as NETC Table Management Protocol (NTMP) 2.0,
> common tc
> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c
> b/drivers/net/ethernet/freescale/enetc/ntmp.c
> index df10f2f310c1..f96cfca92a1c 100644
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
> @@ -180,7 +180,7 @@ static int netc_xmit_ntmp_cmd(struct netc_cbdrs
> *cbdrs, union netc_cbd *cbd)
>  	return err;
>  }
>=20
> -static int ntmp_alloc_data_mem(struct ntmp_dma_buf *data, void
> **buf_align)
> +static int ntmp_alloc_data_mem(struct ntmp_dma_buf *data,
> ntmp_common_req_msg_data_buf *buf_align)
>  {
>  	void *buf;
>=20
> @@ -221,18 +221,24 @@ static void ntmp_fill_request_headr(union netc_cbd
> *cbd, dma_addr_t dma,
>  	cbd->req_hdr.npf =3D cpu_to_le32(NTMP_NPF);
>  }
>=20
> -static void ntmp_fill_crd(struct common_req_data *crd,
> -			  u8 tblv, u8 qa, u16 ua)
> +static const struct packed_field_u8 ntmp_common_req_fields[] =3D {
> +	PACKED_FIELD(31, 28, struct ntmp_common_req_data, table_version),
> +	PACKED_FIELD(27, 24, struct ntmp_common_req_data, query_actions),
> +	PACKED_FIELD(15, 0, struct ntmp_common_req_data, update_actions),
> +};
> +
> +static void ntmp_fill_crd(ntmp_common_req_msg_data_buf *buf,
> +			  const struct common_req_data *crd)
>  {
> -	crd->update_act =3D cpu_to_le16(ua);
> -	crd->tblv_qact =3D NTMP_TBLV_QACT(tblv, qa);
> +	pack_fields(buf, sizeof(*buf), crd, ntmp_common_req_fields,
> +		    QUIRK_LITTLE_ENDIAN);
>  }
>=20
> -static void ntmp_fill_crd_eid(struct ntmp_req_by_eid *rbe, u8 tblv,
> -			      u8 qa, u16 ua, u32 entry_id)
> +static void ntmp_fill_crd_eid(struct ntmp_common_req_msg_data_buf *buf,
> +			      const struct ntmp_req_by_eid *rbe)
>  {
> -	ntmp_fill_crd(&rbe->crd, tblv, qa, ua);
> -	rbe->entry_id =3D cpu_to_le32(entry_id);
> +	ntmp_fill_crd(buf, &rbe->crd);
> +	pack(buf + 1, rbe->entry_id, 31, 0);
>  }
>=20
>  static int ntmp_delete_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
> @@ -240,7 +246,13 @@ static int ntmp_delete_entry_by_id(struct
> netc_cbdrs *cbdrs, int tbl_id,
>  				   u32 resp_len)
>  {
>  	struct ntmp_dma_buf data =3D {.dev =3D cbdrs->dma_dev};
> -	struct ntmp_req_by_eid *req;
> +	struct ntmp_req_by_eid req =3D {
> +		.crd =3D {
> +			.table_version =3D tbl_ver,
> +		},
> +		.entry_id =3D entry_id,
> +	};
> +	ntmp_common_req_msg_data_buf buf;
>  	union netc_cbd cbd;
>  	u32 len;
>  	int err;
> @@ -255,7 +267,7 @@ static int ntmp_delete_entry_by_id(struct netc_cbdrs
> *cbdrs, int tbl_id,
>  		req_len =3D sizeof(*req);
>=20
>  	data.size =3D req_len >=3D resp_len ? req_len : resp_len;
> -	err =3D ntmp_alloc_data_mem(&data, (void **)&req);
> +	err =3D ntmp_alloc_data_mem(&data, &buf);
>  	if (err)
>  		return err;
>=20
> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> index 45e4d083ab0a..e68b2a060176 100644
> --- a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> @@ -16,14 +16,14 @@ struct ntmp_dma_buf {
>  	dma_addr_t dma;
>  };
>=20
> -struct common_req_data {
> -	__le16 update_act;
> -	u8 dbg_opt;
> -	u8 tblv_qact;
> -#define NTMP_QUERY_ACT		GENMASK(3, 0)
> -#define NTMP_TBL_VER		GENMASK(7, 0)
> -#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
> -				 ((a) & NTMP_QUERY_ACT))
> +#define NTMP_COMMON_REQ_MSG_DATA_BUFSZ	4
> +
> +typedef struct __packed { u8
> buf[NTMP_COMMON_REQ_MSG_DATA_BUFSZ]; }
> ntmp_common_req_msg_data_buf;
> +
> +struct ntmp_common_req_data {
> +	u16 update_actions;
> +	u8 query_actions;
> +	u8 table_version;
>  };
>=20
>  struct common_resp_query {
> @@ -36,8 +36,8 @@ struct common_resp_nq {
>=20
>  /* Generic structure for request data by entry ID  */
>  struct ntmp_req_by_eid {
> -	struct common_req_data crd;
> -	__le32 entry_id;
> +	struct ntmp_common_req_data crd;
> +	u32 entry_id;
>  };
>=20
>  /* MAC Address Filter Table Request Data Buffer Format of Add action */
> -- >8 --
>=20
> Some remarks:
>  - The fact that struct ntmp_common_req_data is an unpacked structure
>    now means that the layout of fields is completely decoupled from the
>    layout of the data buffer. You can make each field an enum type if
>    you want, which I didn't do here.
>  - You don't have to access its fields with le32_to_cpu() and friends,
>    it's implicitly in CPU endianness.
>  - The API is tolerant of the case where the CPU is in a different
>    endianness from ENETC.
>  - The API protects you against overlapping PACKED_FIELD() definitions,
>    and gives a compile-time error if it detects an overlap.
>  - The API allows you to define buffers of any size you want, and the
>    bit field ranges vary according to the buffer size you chose. Notice
>    how you are grouping two fields within the "u8 tblv_qact" field, and
>    their offsets are 7-4 and 3-0, respectively, within that u8, but in
>    the PACKED_FIELD() definition you can make them 31-28 and 27-24, just
>    like in the RM.
>  - struct ntmp_req_by_eid and struct ntmp_common_req_data don't have to
>    be distinct structures. You can call pack_fields() and pack only a
>    subset of the fields of an unpacked structure. Then pack the rest
>    with explicit pack() calls, or not pack them at all.
>=20
> I just want to present this alternative because I believe it offers some
> distinct advantages which may be useful here. But note that just
> "QUIRK_LITTLE_ENDIAN" may be wrong for NTMP. You need to see whether
> you
> also need QUIRK_LSW32_IS_FIRST or not. For buffers up to 32 bits,
> QUIRK_LSW32_IS_FIRST makes no difference, only for buffers larger than th=
at.
>=20

Thanks, but we have added fully NTMP support in downstream, it's a great
challenge for me to convert it to the 'packing' method. I don't think I hav=
e
too much time to do this conversion. And I also need some time to figure
out how to use it and whether it is worth doing so.

> > > The question pertains to everything else that is exported to
> > > include/linux/fsl/ntmp.h - what the API consumer sees. Is there a rea=
l
> > > reason to export it? For many structures and macros, the answer seems=
 no.
> > >
> > > Even for cases like struct maft_keye_data which are only used by debu=
gfs,
> > > it still seems preferable to keep data encapsulation and offer a help=
er
> > > function to retrieve a pointer to the MAC address from the MAFT entry=
.
> > > Then, "struct maft_keye_data;" can simply be declared, without exposi=
ng
> > > its full definition.
> >
> > ntmp_private.h is only used for ntmp driver, I don't want it to be incl=
uded
> > by any enetc files. ntmp.h is used for both enetc and switch drivers, s=
o we
> > need to add full definitions of the table data.
>=20
> And I agree with you, I also don't want ntmp_private.h to be exposed to
> the NTMP API consumers, and I wasn't suggesting that. I just want the
> NTMP API to spare consumer drivers of the gory details, like for example
> the buffer layout of a MAC filtering entry, reserved fields, things like
> that. What I was saying is to keep the buffer layout private to
> ntmp_private.h, and expose a more abstract data structure to API
> consumers.
>=20

Sorry, I don't fully understand, for example, if we place the definition
of "struct maft_keye_data" in ntmp_private.h, how does the debugfs
get the information from "struct maft_keye_data"? Add a helper function
in the NTMP driver and export it to enetc driver? And how does
enetc4_pf_add_si_mac_exact_filter() to set the mac address to "struct
maft_keye_data", add another helper? If so, I think it is more complicated.

> > > > +struct ntmp_priv {
> > >
> > > Would it be better to name this "struct ntmp_client"? I don't really
> > > understand the way in which it is "private".
> >
> > It refers to some private data of NTMP of different devices (enetc or
> > switches). Since the current patch is only a small part of NTMP, many
> > members have not been added to the structure. The following is the
> > definition in our downstream.
> >
> > struct ntmp_priv {
> > 	enum netc_dev_type dev_type;
> > 	struct netc_cbdrs cbdrs;
> > 	u32 errata;
> >
> > 	struct ntmp_caps caps;
> > 	/* bitmap of table entry ID */
> > 	unsigned long *ist_eid_bitmap;
> > 	unsigned long *rpt_eid_bitmap;
> > 	unsigned long *sgit_eid_bitmap;
> > 	unsigned long *isct_eid_bitmap;
> > 	unsigned long *sgclt_word_bitmap;
> > 	unsigned long *ett_eid_bitmap;
> > 	unsigned long *ect_eid_bitmap;
> > 	u32 ett_bitmap_size;
> > 	u32 ect_bitmap_size;
> >
> > 	struct hlist_head flower_list;
> > 	struct mutex flower_lock; /* flower_list lock */
> >
> > 	u64 (*adjust_base_time)(struct ntmp_priv *priv, u64 bt, u32 ct);
> > 	u32 (*get_tgst_free_words)(struct ntmp_priv *priv);
> > };
>=20
> Thank you for posting the downstream layout of struct ntmp_priv which I
> was already aware of. What I was saying is that the word "private" means
> an aspect of the implementation which is hidden from other code layers.
> There's nothing "private" here if the NTMP layer has access to the
> definition of this structure. I was asking whether you agree that it's
> more adequate to name this structure "ntmp_client", since it represents
> the data associated with a consumer of the NTMP API - a NETC SI or (in
> the future) the switch. Or some other name. But the word "private" seems
> misused.
>=20

Okay, it seems to make you feel confused, let me rename it later, how about
"ntmp_user"?

> > > What's the idea with the null entry ID? Why special-case it?
> > >
> >
> > Some functions are configured by multiple tables. If a table is
> > not needed in the current configuration, we may set its entry
> > id to NTMP_NULL_ENTRY_ID, indicating that the table is bypassed.
> > For the current patch, this condition can be removed.
>=20
> Ok, thank you.
>=20
> > > > +	return &cbdrs->ring[smp_processor_id() % cbdrs->cbdr_num];
> > >
> > > I think you need to be in a "preemption disabled" / "migration disabl=
e"
> > > calling context for smp_processor_id() to be reliable. Otherwise, the
> > > task can migrate to another CPU as soon as this function returns.
> > >
> >
> > It does not matter, we just want to select a command BD ring when all
> > command BD rings are busy. So smp_processor_id() is just a parameter,
> > we can also use a random number.
>=20
> Ok.
>=20
> > > Can you place this dma_wmb() right next to the "*cur_cbd =3D *cbd" li=
ne,
> > > to make it obvious that updating the producer index has nothing to do
> > > with it? Or is there another reason for this ordering?
> > >
> >
> > No special reason for this ordering, I will move it after "*cur_cbd =3D=
 *cbd".
>=20
> Thanks, I appreciate it.

