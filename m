Return-Path: <linuxppc-dev+bounces-11739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AB9B43D5B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 15:35:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHgTh07bMz2xd6;
	Thu,  4 Sep 2025 23:35:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756992935;
	cv=pass; b=Kz7g6zSfxTp3BgsDaNLKi35yRfMXjXx7ZIkLFbSQojsE9YlZqe59iLEr5Pcr2pzk2zxp7hzhQfg4aXiluLRqTWkqJeP7RLVQ9msiOdf3FB6oODG49NmpT8EvkKpZSdtV7GzfKFUm6HbCWhbK5MwI7iT0/RgaPsVARge9lzUn3LpTsPqJUHadTULWoWZtbqIZ8cSJ3A0L0o7oI8V74tXWVxIYLU3ENqy2I/lhLfvAMhRDPPojSJrcypRLxTuXQsRQI+72yhOi7BjZVanmNi/s+CcACedinP0LOorfHgSFO1OmvdTT4gBgIT4VSkf3WGsa9nJIEggcx+OMgsS8Fit21Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756992935; c=relaxed/relaxed;
	bh=7C4806exYRY3N7qN/+Z4pwjrdu0wMop5tNsxD9FWvYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aW86jfhxXnwnb6wRL86Zfnk50QOvegiVuf6TCXMAdkd2AeMY8A7C9a29sRdArtYHG1/bJsExAGGccbly4v5iQgP4JQxF0kb9wP/MA4XUGymL8jIvq/m35OcJ/uh9UU0hAF4sm2g29EPT8mlFUHL7jla6yYDUmZFlTsYqA/QZvnf0cb3Slm5pmodRaxLaSZfQap5BFhPJTwFXDBP9SNnyfdy3KyHP9u5dGcA6e8UcummN+rJpkCJ4QyRMG1aIoPgBOTadMyUSl123QRjuNx60rUcWrOZnez4vzJWJ1wYeckOHumWCXHpQO9xb+pkjROK59DQxfNQb1lok8hRWoH5OVA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ws0Zkilc; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ws0Zkilc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHgTg1072z2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 23:35:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3J1Q622mzWFEnEU3adedxJuLsQjA3tG7NXLBllGP+qgAYvJNciCmaSESl2Ff/teeQY/MPVYIZ4exv1pYNH9bTmNVmOLba6oT4R1HtSzxOSua1pXKyMEO4IBLIDYd14LJJa0p+lKc+XFvk1p9k8uhJajuWigRAaqgx+lJOsFNtJXAMKForcRQfIMp25s/BcBCZT81PzISJYUzwqqlqYONfrf/oFUnOCNdmXxaCSirSXvtJHcMv64m4pyiH72YmsbUpGcwU29zflqaLVV4kXgfwt4MoUjY6z1VjzPxpMUgKcaPtpC+TjmCY22MP5Nt0x1UOPh0iJ4r6bOdwxeWzsWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7C4806exYRY3N7qN/+Z4pwjrdu0wMop5tNsxD9FWvYA=;
 b=ApFfRkKRrtNPcYR5lBUDo7vjWHkxzjfbVVg12LElggZF4QEZDcEOegq0VU1fmWA6wD1h4La4UvIzd2zFLjj1Tg9I34tPNl+bKw2IKtpuZaj11uw8vTnnkR5TMDExRgalYcKJoEyYitNr7NtZE1sdsndSHLA38S4yVQCFIw37CMGb/3LabS37siwwHqcxCx2trhxbhD4Ohe0rWJOK7HwEAvroZn5btYWIuCV4hlWtRj3sFNYGcbDCVCw/mH/LrnONxq9gMq0WhKAH5NwdL7PD7kr7aQlvlg2npAkNmcM0R7ESbcpANAok3IcW9g5083/vZjnKkkdZogWE5isXKYHr4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7C4806exYRY3N7qN/+Z4pwjrdu0wMop5tNsxD9FWvYA=;
 b=Ws0ZkilcuRDYR57+Cs+4dCmcVoFTA4VGHyjMAJq/bZA8dEIRJmYZ1h7Y154+Ic8nrRbio+ZC2UapRzoJ7o1FRdxx+HYppxC4InEPIyFPLKa4eGuNtrO9Q3qyGGwcp6OY7QU+BT6w0OTic34Xvn85GNHMLd+xDI23Qufdwqngvkf+V4jQzIEPy5qZ/Gn3bGgPOcEZU1A/8fn7N3VxySHTiCUzG9rL/sQvH4C8YIBjKSMXYTyQ3LH0jd3jsREo/GEvoDIrylh8ZVnGO0KW/b90B7KmmMfzXg32zcmqDiqhpG4TKjwNKagEiYQ3GMqcztty4jrgDpBd5pj5puhdDb+2vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA1PR04MB10296.eurprd04.prod.outlook.com (2603:10a6:102:44a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 13:35:12 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 13:35:12 +0000
Date: Thu, 4 Sep 2025 16:35:09 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: richardcochran@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	xiaoning.wang@nxp.com, Frank.Li@nxp.com, yangbo.lu@nxp.com,
	christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH net-next 3/3] ptp: qoriq: covert to use generic
 interfaces to set loopback mode
Message-ID: <20250904133509.cnhihr4x6vgehv5p@skbuf>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
 <20250903083749.1388583-1-wei.fang@nxp.com>
 <20250903083749.1388583-4-wei.fang@nxp.com>
 <20250903083749.1388583-4-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903083749.1388583-4-wei.fang@nxp.com>
 <20250903083749.1388583-4-wei.fang@nxp.com>
X-ClientProxiedBy: BE1P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::20) To AM8PR04MB7779.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA1PR04MB10296:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a94547-c299-4df4-d66a-08ddebb7dfb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ksYtqAyGWKTnH39iVJY3bu41p3UzW34+kV76XsJuqMHRdNu2w+4pBn3Bsxbe?=
 =?us-ascii?Q?QtZUeA6kOectlnoMhk5kPpXF9zH1dvhftmu94+Bi0M2sfHQQqJm4IsvFTcgI?=
 =?us-ascii?Q?eKQqS5fOudmZdpqPHCzN1k1axGDp70M3J9v76odYHjiF1Qf+7tY31bf1Q9Gs?=
 =?us-ascii?Q?JyLHbFuNmm52IdjRTQepJrenRL/eLsbB8azLkhFOlE903w3JyeAzpjTDWnDa?=
 =?us-ascii?Q?MCKzkYMbjqiRSUTn+bwLHLDmfGFLjXLcluZRl8Je5gkWuWi5E/tfkkAX53Rz?=
 =?us-ascii?Q?uz35h5NcH4AssUT3P0GpHREEOl8ONdR8Z1sg0hA7BA7P0+CQpgtd3+LZ1WSS?=
 =?us-ascii?Q?dsCWqNcoonflC2yNe11cZwhaaWkfq719MCtixF2r1fUTuiolNMfujxtrMyHF?=
 =?us-ascii?Q?CUGzAQ+LnaMb8XiMtqvGAbS/bQ44eDTVDGI2bxx19O/Mn5XiGZFmBV9J3NG5?=
 =?us-ascii?Q?13JlSE7cmVIxQ5/PIRq1VrO34PUBUjPXz3xltnmwG6Oijabt9uDoCs0Db7Jx?=
 =?us-ascii?Q?Yt1z3bBx5bu2gud1qDBoflhk/uNGjMSHo9ykbJeOzkUPNc5alZNqSZ9+Dmx8?=
 =?us-ascii?Q?p5hV5XvyDwAkPnWovTAgV1efPcWvzrjPfpFsrIIg9K6fc076vgSufu0PRn3l?=
 =?us-ascii?Q?+zlnJf93Za/+M8q2omXxeflLYiPZUl4t288WnJnpaMZ7JpgKt+Yy6VAjBpje?=
 =?us-ascii?Q?nzdBPjP+uSfzFW9s5U65nAMiaHvt2S0lHYhUl1QcWk3p0Zcpy6AEYNkpZetJ?=
 =?us-ascii?Q?tROz7ZkcSzHve2EtbVpKXTamG+2+UgMk6CY7/tTNTBNPj2sQEv00pUgzec9E?=
 =?us-ascii?Q?beYjfH6skBoXMsB63SNZVwWls04nXwFubQiOQojYBsYXGP5Soq9XTTiYhsUk?=
 =?us-ascii?Q?tGqQaARLCpqEa1eN+7PlerQgB+j9Wp8dVBmBRutFPr7kEuWHRd4Xwmc/W8Vh?=
 =?us-ascii?Q?UMV42BUdb25cQ04stNoL1xpeiojP2GaRNLddmhqWQapz8m2BRsdXO+A/ZT+D?=
 =?us-ascii?Q?KXctYlVc0yHm+gaPOI4Moxv39HTcY1+rComuLBCc+a+7cheOVU6b7NJB1DSM?=
 =?us-ascii?Q?ZRznixpXxeuewAdIJPhGlsbss84d+OJKVPcZ822O96JA1t6WlOQ0bXkLoqRf?=
 =?us-ascii?Q?9sjFqDe8RTLBZfv+VnqNowoC4q9tjOj85KW8U5Z5MO7M3SnE2MADBMRIoZgW?=
 =?us-ascii?Q?vuxmi/SePK9y6z+dDChmt4A2zUYB3G+yQq4ZFuDgBWsPr42KScRHl/QBzl1e?=
 =?us-ascii?Q?djDqx5/qmGiqRzQ7HpKglosWkHCdwx6i76hAMreSOQ1akxzx8Saiz0xvmIYj?=
 =?us-ascii?Q?OiuMAf8Ahh4Hjb94EgtJQNzqiXyab9RkO2x2/WtGFsljLEI7MaN+12OIPKhz?=
 =?us-ascii?Q?g4xeG5VMeSwDKPT8NoDk+yCRg5VXIYy+tfHReZfshEIEw7PDOVWeZtWVE52u?=
 =?us-ascii?Q?J8lcjJhWnj4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eACENHuCWew6MoyM0fTma7NoyJIRil/MO3S6+cW98MkmZCBCX6WQjN3qhn0X?=
 =?us-ascii?Q?HxrMAGzXWK9ZWMhrItr8bD/nqCrhyGzY36w+LvEGLnMKGJVXNEBkNg33WwE7?=
 =?us-ascii?Q?68j0YWhxyzQLIifiegu7RpaU9/Ia5WnlFBMkonCTPgd1aElBcjM12FqOau1k?=
 =?us-ascii?Q?AgnJw/UyEVKK0NGTgZ00WHVYd1yqu03XO4nnVnPJIKmP5FGlUwbPwUEFnEEN?=
 =?us-ascii?Q?+bG6gE9qyzUPUU3PJ4NSa8obaFykJ56JcOmblzybz+MWiopOIzrflwM40OR1?=
 =?us-ascii?Q?GhWLF7tRiU4bWgr+s2nxssNzbO49wFqwQAnMSWRC9T9p8Kxy9Htir9hKX6yR?=
 =?us-ascii?Q?gGB9Z2ot1gSUBbVzeNgoVaCofwCEyyai5RCLytu4y/llTS4YbJwGwBZ7Wcho?=
 =?us-ascii?Q?9POIgtC0VfdzAJum3YNtzKZEDi6RaJJKRH1GVR6RJk2A7MUSiL4yDzc9e2l2?=
 =?us-ascii?Q?xUjf+l8RuJMO5NF6/iQYmH6Xk4iDqf+5eU1kcaXPi5/TlvdjfW0PTF+rvwx4?=
 =?us-ascii?Q?K0KvnDsll327iZRt75zkrEwsRjfA5GXCbbMZpB1qOD4tqEPRW4/Ztvx11ZLz?=
 =?us-ascii?Q?ry5tFcSqRWroyjq7K/P+x55bhXfmSR7A+h7VD6GUAQHxYbv48xBQOaZHM1up?=
 =?us-ascii?Q?rEFnl4d7CVXFXA27pbXZWMHAJd3mqonJeY5dwUAcjiE9Jl7U6/yZlZzbLA74?=
 =?us-ascii?Q?09fq5TYfIoos1mgCJMsYKoYywJg+KltZ9v8he7FFtobbzHBF67lc7b4s1fu0?=
 =?us-ascii?Q?TR2oEyjFmYp4SqpUgxzyPH3YfDHtlUfA/yFETmpTwKFSeKNSeawat1D2l6gv?=
 =?us-ascii?Q?Fx960vGVCaJKOWxJH9UYliTo+TRleJoLu6lAuGnhCfFE/7V/zWr/eZ9zoIbE?=
 =?us-ascii?Q?AAFUBt09j+R6/lancGsDqNKvL22WX3Etnz2JwEg5mdE8tosFl1AKlcaCs5bO?=
 =?us-ascii?Q?X7urGxoEnpO86E/krCRJN1HYgY5A8j/gm1FAyLXlotMa5lKyfq9SbIsRO9RW?=
 =?us-ascii?Q?qvtA0ueGjvPCiUHIb/O9OB4shhB7H+RL82uK81+8TV5jstf9AvPGE3j3vsdF?=
 =?us-ascii?Q?l74NWieEQU1A8fumHtCwROk2ZcSTRguaMhHmmiLHqLaVX3x/7eBGc6qPNexS?=
 =?us-ascii?Q?eULaKcLi3kf3uIJGKILZ+RKgFhcmu2uTuKI3lBJp/CVzOh6KUb4DSmsHsfV9?=
 =?us-ascii?Q?XOkUZdEV8UDScokn/sbYM0O1t1TbTNSiDbjDhhyeKKzMJWva/wCCTCL36oJp?=
 =?us-ascii?Q?lhSup+UqcjWlzYce4fOOmo0CmZCQfiLz10wi8NlwArtkX77RSP+H4+1nav0D?=
 =?us-ascii?Q?p6buQilZl18vvOvj6jz1u3qs9WBGuQPorhMGObgMZqEV3pfk7j6HauPVylGy?=
 =?us-ascii?Q?nrIkfQ3IKYfAhYW88j71+oj9xyGkDDLAXoGJCDwusMxTuUIc9QVP9cVTScF9?=
 =?us-ascii?Q?dz8e1a0Z5w0Rw7AAESIHe44NjThCjZLmXst1CLQpllHFBOPrzp5YByksFOnh?=
 =?us-ascii?Q?ltfAD4Z6BipuoqTSsgqwZaL2bN22IPFLo6RetzXK7LLQkPqWXjzGtZPXI6gC?=
 =?us-ascii?Q?+HpsVLobJnmpgXn7FJr0StmFsCuDvpdL99MNBH5AN/F9N5x3Jey8inSetE1e?=
 =?us-ascii?Q?x7YMI5HeYFDA/0zThVntZ3tPNelsZ/xym19c7xiDYo85SlsY+cQp3jiBhljW?=
 =?us-ascii?Q?itlC4w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a94547-c299-4df4-d66a-08ddebb7dfb6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 13:35:12.3017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Bx2HiQJCvo8H+YYfMuZpjVMvnH41zC0zkZCkk4dhT/HIMHygoZrNi9tQm+5IbI9vj8m0YAR0y5Ladc+9oI23Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10296
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 03, 2025 at 04:37:49PM +0800, Wei Fang wrote:
> Since the generic debugfs interfaces for setting the periodic pulse
> signal loopback have been added to the ptp_clock driver, so covert the

s/covert/convert/

Also, 'since' doesn't go along with 'so'. You can remove either word.

> vendor-defined debugfs interfaces to the generic interfaces.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>

