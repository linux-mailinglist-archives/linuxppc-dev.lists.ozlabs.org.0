Return-Path: <linuxppc-dev+bounces-17882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN1gKS2GrmnKFgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 09:34:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BCA235873
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 09:34:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTr0h1RFrz3cBd;
	Mon, 09 Mar 2026 19:34:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773045284;
	cv=pass; b=B0ZE+kRXM5lhbfex1do4EkMhN8ap0iV6Fxy1wccQP8QGUfwX5EGtf0VYZKvi8TZTeSWhgpXdw6BfCZFAmLvwBVPrev6+bGfovSheE/u5Yk/LQqS9iR5LZTbAwcAgeCSHLWWYWdYbuEg5n+o26KcnNbd9AF5X56jmNovdyg6K/+pMwtcSeWL631Npbwwtcqta+UNb+0f90xYpxO+XvEVutWaEzHR8KbeH0nsJ7PHw9V4SOVaLKPwvOSdtLT4+zr5x+a47KUfYj0G9M1hYTc28r73CiuYRf/ImgKd0ykUlJAEeN4teoGBLZssdp17FnilIB1WTa1vmoUsReF4DZTxY3w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773045284; c=relaxed/relaxed;
	bh=tU/5sNaAP0pR36UAeYOgAr5YvA8qTwurDFZ/J3uXdO8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R0oCzaHg7B7cefL151pK5tYoBhRmt6E/MdIzPjLuQ0gqZq7uzTbjTOdEd1bf9LB7TedWjvWzpBgC3HosW68O8LASHsibtSkLP2jJwjYmsEKZLQTOEo/XgN6eeXW8kKTbmuYZOIT9zvs15YY2fx/oqNtFal3svFJdcLJ1DMhKeQoal58jCeAtypIUZPnX1T2kPhpXkXOaM55YipHJ2CHrouXcBA/Q87VSlf6w/M+iZRhYyoe6bDeRWywxc0KifsytpF3hsb292ReM1wi68Cp12arKRvnPZnYapU14LWKZGbXqMHWu/EXnKBFdMqVRDLG63tOY8ZdvO9TwpeeXV2UdGw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cTafBwpX; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cTafBwpX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTr0g0SbHz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 19:34:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOzzYRewJ81KlOW9HA5TWsWMoGlVKXgXjQzrbqjaCxZVBDqKE5KmWlq4s3AORdQhbNTcJDGsCmg0INP6xtBe0q6MlEFOva6A4Wq+9jRYaFWad8TZgsz0G/geCPWfby8dYTnU+rrJdrM1kHZPuLWCaMIIh8Z+tsqJXbDb5ymZEiZALZDsZCC1YmRKeDw+bAThAx1cW0e1oTvt8ot0BDMEXks088FrGedmcbo3r8huAz/5RUuZwEIg+/DKjcZ3ssG+9w+LiLCCdOP0X9+CZH3fKRTDoVR9w/5yAwHgELbno7Ty1c3OnDBdSQvDzfDAQZwIWXA9augQVUFQVstaT/5XOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tU/5sNaAP0pR36UAeYOgAr5YvA8qTwurDFZ/J3uXdO8=;
 b=q54MuVaGpMRv5qc5PbMfZlXpIk5fClcyR1x4ZJ1eK66IoSebKw0NocxxZ1xUjH0AGmappM/H9WrLHaoC2T6TZj5K1Q5PrTGGYzE6cNzci255bXg5e71R+UPkcrxkrXp2xvbSg526ZNnfQY2BbOSlQNhcVrL4UIwvaoBHQ0A0ly/hjFpQHNRXocoRsB9MzuE9hmYIfgV2s3B+d31SLsQbHwz+lthM/L8cHUNcGe9CZP2lgn67CkiO1ypmSDN7bGRvaEHDFYGKAiFmlQMi8eOy4C9jP3Ww9396wAhFJOyUFQSlIBmZTrfY6Ap60aHWm0ijCaEIPKalOjRC71YDK4pvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tU/5sNaAP0pR36UAeYOgAr5YvA8qTwurDFZ/J3uXdO8=;
 b=cTafBwpX5BiNOJOOLgjUCOQqLrD2/5MpEre8kndG4R1re6ADfp2W1pXtdAWd7JKaxlaDXiKW9ry6WQM6dWcTQwRw2EeTghixKHTPcx4mstyCTOEP5mqd07v0mlV38lpRr0Mf8272zphEVj83h0q0nL0fNyFajJh1cRWO1pnT706fu1ranLaY4pT1GRO3Cd+m2MxnhClZ/gSTtsC+fFyiJvtYZnQvX5fshVIXP8aaGaK0qB96fJhm15kSa4G17OQhEHa5x+DnhJtRzDh4Joq9+TZ3S2hdGsut0OddGdTXERygx+5RMfZrz3IwG+5FIlc8kwe46niSBUubGMZfUPttjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB12235.eurprd04.prod.outlook.com (2603:10a6:800:333::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 08:34:18 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 08:34:18 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] ASoC: fsl_utils: Add snd_kcontrol functions for specific cases
Date: Mon,  9 Mar 2026 16:35:28 +0800
Message-Id: <20260309083530.2977163-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
References: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB12235:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad2a816-0a74-4e2c-c8e6-08de7db6a7ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	cJkgNqF/iejpFjdc/51qcAaYVVnGsOjfiE7mIvQMn+EKl23apMXisuigvILyjEc6Fi9WDxzNGbcDrJlhW09CD2jCQUQj+Ey1DgulDufBsxz32trotXWRsr0ret39Qo3EgtA8hVBq1A+c8BnZydf6iMg1QS4ExJXbOlV87KVZ6YS7XRM+H/JLNkevHVJHrIY/dcNh8+22ikomXNoKlKbpxt0VWeIbT5qfEUeDwQ9dVc7Nx+yqiP5ZlZKnmiDgpaI7gH5+qn4G03yqTzNW9Ws2NYT3mvjP9hhvZ3Nwh7FXHqS9sHZ5VSImMgjD40jeU1MNmfj42SLnwDchkek8PGHp8Ck1DyzB93EeHTgQkvToW8WcIMqAuhhuJ559NmDWNn5XKlsbMbax2Wq7HLWz0KqemRQ313fkN9Iq4yamM9j+zhAU8H1coZbVYIF8KCM9noSQD/vPPdnjQ01xwd41I0HU44doPpFnfOxDV16YY+kiX+VSrPedlRi1rUcTk5PTbut+Ok4cMK55SIZCCRT3J8GgSqeYiT2TFQZPeT0HPx/u2wDh4O9RPMLh8bI6/YW0dmN7b+ozNeEcdHWvMOUSJmWSY0ljvrkBca7E5k+FTFKWAJg8XPKMj7kkpgOersWHk523dzUYmt7OxEfY0f9w2noKdhdq6/R/ir92tUqvdF9C1rGrOx2AmFLeZcAflXLhNSPQ/f1nDKUfZl9g941jY/WXRitCDDKPe7iEJZ5nMvz+vSawH7icx2/hb+QhUQABkM+v7GCIbiTt4Zr/CBfzpJ16/ByxB1KWyBPu9v6MrpFnkHxdpm1FLzBIqUaMzrvg2vlc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p1koXTLpxS0cDe55n3imWghca4WrzLrjvCS/CVQ/MDBtEFcxesp4vU4npF1h?=
 =?us-ascii?Q?s3cOoMvnkC9TDxb4YTLz3LiyeSH7iBuXc5LDV+eZna39hO/uCQm+00NExTP5?=
 =?us-ascii?Q?4MdhLY8Zi6CW6b7mK8ZbWIUg3PP00qxLe1nff4ZLTGETL2qhW+67dU4XGJ7y?=
 =?us-ascii?Q?JbD7dIP6DsIMOQey0ipcuAHjy3S1QomWuERAHnp+MzH1NoZlWnJV5A/v1e9M?=
 =?us-ascii?Q?gZYiAacjxe/PTJG0GZnDORQKVJ42eip86pgMD29pAfTAJ/3Q7ZXcpRpYgbwh?=
 =?us-ascii?Q?8IfE8TNdIwF+UGXpLUqVsJFYMANfIK9rG9Up41A3/VZomS+pScczYTvM2qia?=
 =?us-ascii?Q?Uc6KQuhn6YiN3OzeCvl9tdLmXZpm4YZ3isRJXeUitZrQMacvP/Hyx3WzRJDX?=
 =?us-ascii?Q?rEJvNScI67J+vR/r7bJivati2ONYOM/1V8PoRw+WS3F/mrX3ocTzbBu6rIck?=
 =?us-ascii?Q?iuw5j2tXzoIgW0OUndL5ASUtpg2eXmll/wTkPBk0UAycWDpIEqlwRzQ3iwFx?=
 =?us-ascii?Q?Fn7L/z1jHYGKA9t0Al7Alv1oiK+Po/fTjwiIDRtwLg0S05Tc9nVcULvGTq4/?=
 =?us-ascii?Q?Ihkh9vf4tBTxeggSh7uDvznds/b2ddkSKvyUM2dzyUUtETWBq0hYmeKGiJiD?=
 =?us-ascii?Q?OVtUVdt0aQSkw3NksVFmIwUuCTBXkaN9qkapkQywjHw7h+VFAWzhk4N3DFyj?=
 =?us-ascii?Q?Ai2fdR7+hOPkDTbPy9ZMvcUhzi2P40pnekCKaFh6GKvIG0H5zPlL89kWSx/N?=
 =?us-ascii?Q?34+aU0O1Py4OS25Kz9199AjxgbKh0rDXlMND4Hw/3uAL850NCNtv2mT86Cxo?=
 =?us-ascii?Q?7d4syFiXpYoiuzWgyzOhJ0CCUyLxLbh+YyXVFNnBjAKekmmCPrSNMhhXN8Az?=
 =?us-ascii?Q?prXPgLreVpMXUOrAL9Lri38xixT8DeMtSSNBo75LXLfHgu6wXl2mfyZ2rOG1?=
 =?us-ascii?Q?Y5wPAWsHgS5Sn9OrC/5hzOBg4FiivlsJLZG3t9huxuwRjOhZJCsi8XNnkqYH?=
 =?us-ascii?Q?aZt6PFwaqbmYLGSNGd1EuQgae83bEZoWdAAYoaSPpTrXbCCISVNE5T8u+olN?=
 =?us-ascii?Q?d9hglIK+DJx8PS1uLNgGg1xlCcvnToN4lPnx6iQKGElYRtIa3GCE+/Y36nat?=
 =?us-ascii?Q?WLsyUCtS69xH89VbPPmiMcCJ3pLtjmyyeZ77r4OfEggVvPykwQGXWXgXawu9?=
 =?us-ascii?Q?1yWnb1WlLCJaf3Lt23jlmigpxcVFY45R3iO6ic2cELQejT50/vGr/jZ3dh0k?=
 =?us-ascii?Q?O45vjz4LlSLuO5i6Fj8s2XDlbNIDGakKvLT8cEduLYhayNj4zae+1R1namPH?=
 =?us-ascii?Q?xkpYpZsg+Y4ACWckb57RQNAnLxStar9t3j46UJjsT1zMv28n/5N5KFR0AeK/?=
 =?us-ascii?Q?1u5sziirBy0C/PHXF6n1otq4bo8eXbksGUAiRIu0xjRsElbP3oG/lEbTlouv?=
 =?us-ascii?Q?em56c9lMRy/M8L0OCD0ChAulg+IjXjK5iiamvwQl1UmOU2glxZy6lZfSQri7?=
 =?us-ascii?Q?1VBp2WuNUwCwRA8cjJSuJWM8J113JIjkgktwo14y2SND63usHMrUX4lLb5FK?=
 =?us-ascii?Q?Ma74Pv4G2KUlCrXFS8IxFuA/rnZ52zUOAEqE4X98Mmu8LMV6krzYoa7v+Ct1?=
 =?us-ascii?Q?IaidEYcmCY10SKDxvTbdQHMPjZmtbgs2X/53gAFL2J2NmGVewyOP39ZDb5ag?=
 =?us-ascii?Q?Y4rucdGxpT4Q8jEDyb/N92OzMQgfZcGJkbjxhb1t4CRCRpz/8bSQWGrbCUFm?=
 =?us-ascii?Q?9Orl03NQjw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad2a816-0a74-4e2c-c8e6-08de7db6a7ac
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 08:34:18.6292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ic9pMkBxApxYbLSwVU45HKRa/rbiPElCzp1m4NJZNtTE0Mcaz06mHXChMEbRxgLUB0TOmHg7kFpM+s8xFLLTBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12235
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 04BCA235873
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17882-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,freescale.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

There are some registers which are volatile, at pm runtime suspend state,
the regmap cache only is enabled, regmap will return -EBUSY when trying to
access these registers.

static int _regmap_read(struct regmap *map, unsigned int reg,
                        unsigned int *val)
{
        int ret;
        void *context = _regmap_map_get_context(map);

        if (!map->cache_bypass) {
                ret = regcache_read(map, reg, val);
                if (ret == 0)
                        return 0;
        }

        if (map->cache_only)
                return -EBUSY;

        if (!regmap_readable(map, reg))
                return -EIO;

When exporting these registers by amixer interface to user space, there
will be -EBUSY errors in mixer-test when the cpu dai is in idle. In order
to avoid such error, needs to define FSL own functions to take a pm
runtime reference before calling snd_soc_get_xr_sx(),
snd_soc_get_enum_double(), snd_soc_get_volsw(), and so on.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_utils.c | 113 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_utils.h |  30 ++++++++++
 2 files changed, 143 insertions(+)

diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c
index d69a6b9795bf..1c9a22551396 100644
--- a/sound/soc/fsl/fsl_utils.c
+++ b/sound/soc/fsl/fsl_utils.c
@@ -10,6 +10,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/pm_runtime.h>
 #include <sound/soc.h>
 
 #include "fsl_utils.h"
@@ -197,6 +198,118 @@ void fsl_asoc_constrain_rates(struct snd_pcm_hw_constraint_list *target_constr,
 }
 EXPORT_SYMBOL(fsl_asoc_constrain_rates);
 
+/*
+ * Below functions are used by mixer interface to avoid accessing registers
+ * which are volatile at pm runtime suspend state (cache_only is enabled).
+ */
+int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_get_xr_sx(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(fsl_asoc_get_xr_sx);
+
+int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_put_xr_sx(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(fsl_asoc_put_xr_sx);
+
+int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(fsl_asoc_get_enum_double);
+
+int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(fsl_asoc_put_enum_double);
+
+int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_get_volsw(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(fsl_asoc_get_volsw);
+
+int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_put_volsw(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(fsl_asoc_put_volsw);
+
 MODULE_AUTHOR("Timur Tabi <timur@freescale.com>");
 MODULE_DESCRIPTION("Freescale ASoC utility code");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/fsl/fsl_utils.h b/sound/soc/fsl/fsl_utils.h
index 21b25a11ecda..0cf9d1e7fb14 100644
--- a/sound/soc/fsl/fsl_utils.h
+++ b/sound/soc/fsl/fsl_utils.h
@@ -31,4 +31,34 @@ void fsl_asoc_constrain_rates(struct snd_pcm_hw_constraint_list *target_constr,
 			      const struct snd_pcm_hw_constraint_list *original_constr,
 			      struct clk *pll8k_clk, struct clk *pll11k_clk,
 			      struct clk *ext_clk, int *target_rates);
+
+/* Similar to SOC_SINGLE_XR_SX, but it is for read only registers. */
+#define FSL_ASOC_SINGLE_XR_SX_EXT_RO(xname, xregbase, xregcount, xnbits, \
+				xmin, xmax, xinvert, xhandler_get) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_READ |		\
+		SNDRV_CTL_ELEM_ACCESS_VOLATILE,		\
+	.info = snd_soc_info_xr_sx, .get = xhandler_get, \
+	.private_value = (unsigned long)&(struct soc_mreg_control) \
+		{.regbase = xregbase, .regcount = xregcount, .nbits = xnbits, \
+		.invert = xinvert, .min = xmin, .max = xmax} }
+
+int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+
+int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+
+int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol);
+
+int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol);
+
+int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+
+int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+
 #endif /* _FSL_UTILS_H */
-- 
2.34.1


