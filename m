Return-Path: <linuxppc-dev+bounces-7117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B0EA64896
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 11:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGVqG4VmWz2yhV;
	Mon, 17 Mar 2025 21:01:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742205674;
	cv=pass; b=naijGJSPcYT41blTQVgvDUtMNCyv9bW20q4dBCbwdI5v0gr2LJkxajoaIUmUXLy/tCkEqhHE6Yt+UtBegZKhnYKQUepaTQ6M2relHlRV72VXWK0Slk3t1mea/JD0m3jt6Ye7GKLXo5TZdKgFsA2r67YCkPMFwIzTHAUXU6JLQIP4xLZCgXVza3SbzSg8YpamP3Z1HI9aquxx9PWkFOc72QmKiFTelOYFR93nBaF12QTqlvYnL8YVQiTZfSTk17v1lxmldnblk8KP1bdiQMeKttP/CZkByinI9giIb09QfH+Xl0k3op2sycvNmYuq8+PpCMIEXsg/VSKghgE2gVBiSg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742205674; c=relaxed/relaxed;
	bh=+mNHCjfb/DtDw4J4SakbzoCjCysgITVRQ/YBjTaifNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aTzK1wvKt3YRwAyrMDk21RUAcGcsRkEiPnlbd0qWs4bNQImkEw7H6XF2LMCpEeucICqnh4wIrzO9eqMMEmjEp889f2o8B9z/iKQWkIxCwbvadbm1z1bu0ZIDwifKPdghN9otTmmU7oOFk+fuyVUsBFLTCANv5LNBBImGtydVHrcZKvoX8mb256a4bC5D911Vk8pUBT3G501zFRE6/htF8rrpjKpPwpFCL1QFHheMClefkQoha6tuDEncbR3jftfUzpVtJp3vg/JBUdsYmhz2q2qA37niRny4B04C6ys6gpeoKVhqCuIWQYVie77OJPuSh5lLIOQCz+DUR+Ix0pbDpA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kq0Ifo9H; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::627; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kq0Ifo9H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::627; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGVqF6X5Tz2ygg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 21:01:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NS5stbffiZy/5onXF2Ot205YgTNJtVXeE71qPqQUIR2zT1DwRuQCdBhI+qU8qGkSyLeLg2DmO16Vl/EVW97+N198Zg4twjMpi4i2mHKfM0L45TyRU7rtrv97uVFqm0qGi5uCjd/ySbd+0NMvMa8JMPFZBYoXF74S2KgTnEW7aSdMQIkMUMurmM2YV5IyjA8jGtVeAnRrTllXl+zDf2P8wvBV/255tA5zNEhqQOWLcy+RO8FO7nafY2MT6Rpf1BNr7dRY+dIoQGt1o2IBTtFrZiNvaKD/5laulWtsbrlXvugkEg5M5hopGpBNqGYBxVMlZ5HUrF+jpJSM3LzQesmHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mNHCjfb/DtDw4J4SakbzoCjCysgITVRQ/YBjTaifNk=;
 b=h9UpVyPvfyypV2AN/mg+TwqC9jzrLHPdUjxcnfcIo6x0Myf2AURvMWSaZ7b2NEcRb9GyfP9fjKZ/cXYZeZnTCg/urLEe7/U3fyz2+v1yXc5BztxVMYm6jTb40Lx+qF5PPN6aSZm/6FEKtCsf36jQdC0SiESGBUhU4PYN6D2mxU9zuU20RjCXCYWvbuv+Hp9qmBV33eL5gHoA7ZTC1/C2La8YoU7Ji9U1Vj4WSbW2iEfPL+mnAmyBoAkgWhoEl0YFZAJz00WyqEsauFcx4TbkCP6JLlDimUHRGFO7y3IcbBlcuZA/ptdJgAOzOwhlOzzIT6uyqqvXQz10+AjM274jzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mNHCjfb/DtDw4J4SakbzoCjCysgITVRQ/YBjTaifNk=;
 b=kq0Ifo9Hqcc9q0h/2dE+3jkOJ5aKxCtYhwhm0bDLzcPCPv9zMnlwxOfzXfYqQj16iZhnNzMhKHDOVz7KWMvhCYATztF4yX+96Gz+Fi5aaS+Iq2/4d29+E5BVnhG72gDyccttPV+6QSfPvZ45DK3YdWj7zttfp2OliNgfHSWkQe2x2yixO4pSS57gIQG8iMskwhaiLx78crjyazh1mJJ9Q6GDO38NtnyCbynIufCHdZvs5X+2CfsWQX/tkxBbqTS2/SdAsTH5lDmxA62YsXPBU8wGuGHZNsLE0fJ27CqVsmIS242M3XUuOxZ4WCJxa8sKUHwxQJoIDHvc8uBin1bldw==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA4PR04MB7760.eurprd04.prod.outlook.com (2603:10a6:102:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 10:00:56 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 10:00:56 +0000
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
Subject: RE: [PATCH v4 net-next 03/14] net: enetc: move generic MAC filterng
 interfaces to enetc-core
Thread-Topic: [PATCH v4 net-next 03/14] net: enetc: move generic MAC filterng
 interfaces to enetc-core
Thread-Index: AQHbkkpOrze484r8D0W5Y5Kfclxt2rN3HWEQgAAD5vA=
Date: Mon, 17 Mar 2025 10:00:56 +0000
Message-ID:
 <PAXPR04MB85106C0A4AB17B67A5A4982F88DF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-4-wei.fang@nxp.com>
 <20250311053830.1516523-4-wei.fang@nxp.com>
 <20250317094259.b6mwygvr75lxgkwh@skbuf>
In-Reply-To: <20250317094259.b6mwygvr75lxgkwh@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|PA4PR04MB7760:EE_
x-ms-office365-filtering-correlation-id: fefc91fb-ee1d-4bc5-1e20-08dd653a9c83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?lhPl9hBgydR9JJJHA6Nxzk/U0BsqHRoM6Cb/IibbySEvdbbJJPB6/uhrk9v+?=
 =?us-ascii?Q?l4Nc9DHI/BV4+LzXEzOTWiu8n1JMVXA+X4NwF4A1NApnwZUue6sgO+DZqr7N?=
 =?us-ascii?Q?Zlv00HKYqHi1O5jrsFjaB/8+kGZr26lBIUDshMC2EsMlWM/yqSgesr+BL/rS?=
 =?us-ascii?Q?T6F2iBlIGuqxB/MY1td+lkTktL9rINUUASWQq6claEAvzKlr92z0uv1A5fRK?=
 =?us-ascii?Q?tdLOmQNZLe15yl4k1dCpkBSd2fUIfwXJDFju/Ah1C0TbOVxAo3j6F71ViMHv?=
 =?us-ascii?Q?gJSOL2RCtHA35N9DAt0HnZ+H/m4j17cJqGREINQnI9GCpsUHI4mHx+0N+zGj?=
 =?us-ascii?Q?Wt7UKNWlP0ZrMAdYb5IFnuYALMpuavqPq4yKPivuhhQCH9loNtnfMJaCakOl?=
 =?us-ascii?Q?3yZ6ef8g4BDuhrIpHZIR/Go8a67uvugK9zX8SQFtDRayDGVcBcVWeGw+FLl3?=
 =?us-ascii?Q?e5wtOp/fzIymRSNOgLLYNFSxs+7Ihwt2YhxCYZbv4Bh7tTc8cbk0F9frgBha?=
 =?us-ascii?Q?ygsOnWxooTOhTVfKwD2GNPKnAnhk4DJTX/QZFDGbuLUY1B901p/gI2qsFZyH?=
 =?us-ascii?Q?N8XirvTIjMdVpuxq32a+qLSbClHFVL/1PWhfco8ri1xRw4yvY1/YQpqXwfiY?=
 =?us-ascii?Q?ts4PSXCZW4TDAU0R2JaPnkDFCij+uotvIZrMHSF2CZgrFyXNfEMKkm3BJZZ8?=
 =?us-ascii?Q?IizPm2p7WdGez1tkjEPWXLyXLqbVCfmspAPF84DSJSNeFV+/aWgSQO8JF4K6?=
 =?us-ascii?Q?92/AlNLZoW8NcdAXAdFchTsnvnTXTcpDvpiq7kSPUOc1mJl6lbrp1dk7b8jx?=
 =?us-ascii?Q?fxEy/yFw6PrVJdrJA9JlnOIH726Y3YMjldGOES2crLtpT0GakhxdGffC+n1y?=
 =?us-ascii?Q?F7UxxBKEg3dx7WZRPXum/t3n525usgvHG3ebKD4oMap44RlNnIEWgiOk9+lX?=
 =?us-ascii?Q?fupwS3PfI9gKlpwJFZr2Pj0nBjVyvxrjqw0z3vgwrVNwQO9zabupkvEjEuts?=
 =?us-ascii?Q?k3Ahb6zis5lhq+AaGltpxgHrmkJ8jrkbm2iaDHIhE+GSzchh2DpQMFoZ1GBt?=
 =?us-ascii?Q?VhB0oP/0quo4IATVyMMqORtesWDNgQfEO9YIcRpXwr9v49hU90YiH0X48HDm?=
 =?us-ascii?Q?ewHhLAFOvjcL61N+uoQKJG6ugdZAhT7V7m4QjqJmZPKHqV5JnWE/kRhwWAAl?=
 =?us-ascii?Q?XrVR7z1J4QuSa1r1xiVKn06fVVfyH5Dg4pAtsMY6yfXcZyty5UFbyycvP3oS?=
 =?us-ascii?Q?A04mOqlT1Bgyn63927oybRP0SeIw+IAOqnug4YaSP6LNk6OjYQ1I09LKDdZj?=
 =?us-ascii?Q?aW2A1Z5Qjyijy0oE0N7pLWXvemGvAuQ+rW454EOvSt0fAA72E+oCmz7aydII?=
 =?us-ascii?Q?TOqXEJWyAp/1nw+HPOS2Uv28nRyCglRW1t1djS+ION1Xri6KzsmCtIhmAZ5W?=
 =?us-ascii?Q?4oyfu9F2du3Z2R3GLapYzhXmxSsjUuDP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KVK4V5/pnIO2dqxQFwYbpu7AdmMy1+3ni+cgcpGLR/ASmF7G8qQZqPeEqckv?=
 =?us-ascii?Q?hY0U6iQ4fXbf7WyNyhJlwSVzu/ATOXi/Ne77xp0lSne0B46qlC10jqTJLIxX?=
 =?us-ascii?Q?zmgJ3X4LwtrIibpiKfknSxgMR0Idt7sTEgDyH7vJe5hbhCWkOBfeam5XzqG8?=
 =?us-ascii?Q?Qq5vTiZr4JSJ/RR04xZxT7ct6uOZv/VhWEdQOusqDG4YqK6XxDKjF4bVle8+?=
 =?us-ascii?Q?OrJajVDfOnmw47AZDDY1Zi8J6B0fm16MGIw25i/l15cfKx04q+Io2aKtIwAl?=
 =?us-ascii?Q?hgwTrjRvA7rgZBELSGlc0z3Zgxwtq3/b54z+9UYGSHrobUXEphIWOyPXYv5J?=
 =?us-ascii?Q?mUyNuuhy8qUNtZszFwV82vr0DO6tS95d7apln1lww3gXAvJk8/6Eo2GB1LJW?=
 =?us-ascii?Q?tNxdvUIqMoeGSAqgXhrJpfJfT2HFDk3NULrts8T3Pq7UxmOgH0jNB9v1Olrq?=
 =?us-ascii?Q?IyYknXOEOlUu2QQI+emEI+2GN5c0OjqgAqrwzbpMxycc1evjXy0s/9xMrtdY?=
 =?us-ascii?Q?SuohftfOvVQYl319O7xzb5F4rDbehr0wVyPDGBZ7OwE63F4xoSlXEC+hGawK?=
 =?us-ascii?Q?Kqp8b4kARxcfrg/Bjw6Jd1nkEGbHrthFyZFBXUmME9xSo34k0sB9M0bYaahb?=
 =?us-ascii?Q?awW5QUOK1pEmGkBLjlsSuMlWVnz9XM8iEvWTUgs11iMgPbfWffwuatSglLW0?=
 =?us-ascii?Q?N4ytH3dhLfCWTwH294vFV4hqqlpFjuh7HM88emWygn4pY1QpHH748Y+qjNMw?=
 =?us-ascii?Q?LuU97uu5GrvON1KEnaRYhnG+3yss3ZFO/OQE4qBsgm/pj1BNyZS2g8t2MVEE?=
 =?us-ascii?Q?w4ugu1hq4WPToqDPhRsxRciJtSSPcjroAAACdz3Pr4FoyxshJ46RLUI1qdbz?=
 =?us-ascii?Q?0fdZydZdkxzi3fHlW0N/YWYoo4Bba2e9NFqZaPXri6tOT4XMy+C2yhB9RBHV?=
 =?us-ascii?Q?QQQJf6+hQs18x045uoN0+uL9Z/CZgu6r31XPvahVE3Rs2j86HwsfrvJmGoAO?=
 =?us-ascii?Q?r5UVRRGW/KUGjL1qB6mfwRyF5VOL6ldC8LZw/Fq0XjY9uD5xSCu5K2odGF8G?=
 =?us-ascii?Q?/e400Y8z0OcTPLBhc34pQNp+jKiIQ3saOuC0BoBz8PaBNLzeMGMgtj+LIAlP?=
 =?us-ascii?Q?VxMzRy/9X0y/wApWpDg/ql0PCmtMJOsfnzXRxKJOGw1k3YMoISApBXY4v8pi?=
 =?us-ascii?Q?d0B80ta5rOoFcTf43oEGAZpHCPDOhZ7jh2Vl3CkNoHTUALzWIZFH9UNUUB66?=
 =?us-ascii?Q?VGvJKXBiLwzfjGLkrnY3J/ut26yH1rq9gipSVHOv+6sGansMi9z1ZkuFIwh6?=
 =?us-ascii?Q?qxt4MeqJmzt8D+zvpO6k/yawxXkfKBVIzhtQw9rfvXq45rNZu3huJW0JFr6T?=
 =?us-ascii?Q?aQRPr6uhgF1i+TZBA9X2EzynpeG1ikv4GSX8a0sAUScKGz7K48tA1yu8Hunn?=
 =?us-ascii?Q?9Hw9z7TIanwn1j06JPCUAhzzxt9ET8ss7KxXDQtyWGgC3+Q4yHyssY1pKAZk?=
 =?us-ascii?Q?8JeUx5G2dxcaZeRgbqoqN7r/4+gwpFDbmshtvcwksyJRF6iRAHJbXJQC1fpu?=
 =?us-ascii?Q?1IKKbECGBQEnnKSa+FQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fefc91fb-ee1d-4bc5-1e20-08dd653a9c83
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 10:00:56.4408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h500DtXXxvmRJXrlaTbMUyaNJgQS2P4xJZ0j/AL9GFbix/WXbgPW92wok7FL/MFYl+1FW7ZqWHlwgTAWaKm5+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7760
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> title: s/filterng/filtering/
>=20
> On Tue, Mar 11, 2025 at 01:38:19PM +0800, Wei Fang wrote:
> > Although only ENETC PF can access the MAC address filter table, the tab=
le
> > entries can specify MAC address filtering for one or more SIs based on
> > SI_BITMAP, which means that the table also supports MAC address filteri=
ng
> > for VFs.
> >
> > Currently, only the ENETC v1 PF driver supports MAC address filtering. =
In
> > order to add the MAC address filtering support for the ENETC v4 PF driv=
er
> > and VF driver in the future, the relevant generic interfaces are moved =
to
> > the enetc-core driver. At the same time, the struct enetc_mac_filter is
> > moved from enetc_pf to enetc_si, because enetc_si is a structure shared=
 by
> > PF and VFs. This lays the basis for i.MX95 ENETC PF and VFs to support
> > MAC address filtering.
> >
> > Signed-off-by: Wei Fang <wei.fang@nxp.com>
> > ---
>=20
> For this series I don't see any VF implementation of ndo_set_rx_mode().
> I don't think you have to move struct enetc_mac_filter from struct enetc_=
pf
> to struct enetc_si, so please don't do that until there is a justificatio=
n
> for it that is contained in the same patch set, and the two can be
> evaluated together.

Okay, I will keep them in "struct enetc_pf". :)
>=20
> Moving enetc_add_mac_addr_ht_filter() and enetc_reset_mac_addr_filter()
> to enetc.c seems fine.


