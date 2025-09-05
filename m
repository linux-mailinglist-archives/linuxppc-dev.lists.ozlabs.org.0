Return-Path: <linuxppc-dev+bounces-11758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEBAB44C56
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 05:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ1zn1ZQRz30TG;
	Fri,  5 Sep 2025 13:29:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757042965;
	cv=pass; b=mdeIh3Q2MVyjYAfbiEpMV4bob+MIbGNy+X3rgAk5LRUTzdHrh29J5vw+8UafJQOajrFymfBaG0NFNcH7o6Gnyw1hxDzvT6LQeS8t0k/FNIUvAXbjZGD/rZDkpSoop2lQo5jqulGEEwLmxbUIXQeDw+hwwQXHE3bWurSGbkFRal/tmtp9lvyQxvnBh24l1R11/AcOaADuv0r8Dv6k7N1g9uxINkqwonxwcCJtMt8ZZovo9t1Iku1F1nAx+d+y3YmO+kzbY5fjXk1fVRHRoK8+Y1B6Ik9hindbOvic9ITLo482C77da6pZcFzA2uOPIfi2tKqM09WRb0KUvjoObTmN6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757042965; c=relaxed/relaxed;
	bh=p9OiJBiy790D/rJ21a008xH+e4Hyalr3y5o/i8ZvLEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fs3eR3yBVS5ZQJBM8riZ7DqBjVyc+Hi83MxSKH1xiJzpi0ouH9Ar+0kIwcK8BNFl59RjlI98hquz/MKk97D0xdyDbViFOLNufJABvZD/OS13NjyG7z+bKMxROA7nA2Z79z5AY5fmnKw09epbk4LRQIB9rs5qn7U4ufFBOHWDzP/A9Xpr4rvkf4n6mHs9g6Qb7DRDVDVOlZ8LUYTZnbopDeggq0mL/46I5zUvM2fpqdyn37/G+h15Cm+mhNzPMuS6vQekJWA+77qDLaO5gQz0DzUOMGZ3N2dQO3Bnh3uZZu/JJMlw2AFt3RA/wlICIPoTHUuVFFLoyANOak+lztaMKA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SJw8QxXw; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SJw8QxXw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ1zm1FG4z30T8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 13:29:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHb14BI52+2U9MxxHVNk5dG+M1AwVwKRGWCaC9jfbJTYyi/RzJAU+ocdzO8ZVnC1KaQBdo6yduqIdczu2cChVh4h7cUKFO8SS/fUsmxhxQrsgvKKbidB2EZ4oZY+TOMi5yp9oLi6A1kAQMFG8rQWA0/0Z3XmUSvdjn0I5gdIApOGkCm9HEkEnh0FufxTvQsJtKfXYyBoHXNYFRX/jx27j5f8xslC1xBt+gxWDe5zRLAeX8khqljxWj3eKpfJWyYaaJez7BE2IsWW2LitAld95ULmc3hSA/NG3eEGAAJekAtXbaRZ6CLWU1Jk7qD2BxRPKITa0NtuG1X02POk6Orr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9OiJBiy790D/rJ21a008xH+e4Hyalr3y5o/i8ZvLEA=;
 b=dqZ9GZsrWsT5ydND3XX/9kCl9hBEg2xRtBLrSJj6sXJfKgNA4qcVWKsgZ4ygvZwXql6HTfo/N4NC9ehUZCm3cDHPjzObqrnMoxIyBkw8IGtEu2o3GfGl7GcSCrzVSnQ+LrfWUDfiLSWqb/PXBC0Hy/R8FBp6UlkIoYyCPoXBrbuZjDeZ8R2sLWtTAqCFL7oZI4zyIdpj5DJmqSkuE5DggWWupn8fTUw0SDbFa+l59R77ncRQVbmX82VAERGP+qO43faR/eI11lUiRE04cEoX5U6A7dKsm/hVQ3pr90AhO9dG+xx/4ZzjKwno14eYTNdltkahZncb6754D+fyA0uZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9OiJBiy790D/rJ21a008xH+e4Hyalr3y5o/i8ZvLEA=;
 b=SJw8QxXwjHS2yebkrwWDqvU3HXGqi9rh5VwY//SOJNFyXiJIAjNE5ZmkEU7/BVAEc0R/JZ0eRcvlNmGKRr2Bbe8r2tS9FQ3WnCr+BMQRb9rntuMxkOazm4FqgN0A5VTY8YG61yEwRxZHylX97yE720eRelHxbBSiH91KfkacQ7R90WDxcPvbgu6lHLXOS4HdOWMbTATzpTkvBAdV722xRigmDDr2pRBq5MY7qOlXdqge53fDk5qxiuWmgDZUpFdP02JoTkYuRIzcbos6v2ENPvq3i8pR3Mrw9s25xyHIlDH/OLipRtKVCRzoJedoSXcvFDyLt8pN2HA3ZQn0HlwHXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DUZPR04MB10013.eurprd04.prod.outlook.com (2603:10a6:10:4d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 03:29:01 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 03:29:01 +0000
From: Wei Fang <wei.fang@nxp.com>
To: richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	Frank.Li@nxp.com,
	yangbo.lu@nxp.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v2 net-next 3/3] ptp: qoriq: convert to use generic interfaces to set loopback mode
Date: Fri,  5 Sep 2025 11:07:11 +0800
Message-Id: <20250905030711.1509648-4-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905030711.1509648-1-wei.fang@nxp.com>
References: <20250905030711.1509648-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DUZPR04MB10013:EE_
X-MS-Office365-Filtering-Correlation-Id: ed40a9c3-7059-4a10-3c04-08ddec2c59c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EnkVasmrWga+65G/u9F57/fAiNhSkJMsWsJwV4UWUhO1e20e5j2QB5Au3otG?=
 =?us-ascii?Q?mAz96exRtt0gZkM46DHPE4/Fvneup3S0oAw/rFsGOgovB69IIzIEY3oMGtVD?=
 =?us-ascii?Q?YyRXoDRU7+8RvdF+wcV0UGkybaXDB5bWvBMFFjevM4EVBpV9M1CyFUa19kyL?=
 =?us-ascii?Q?DSxNx9dFIMdgWRaUT8T4npchLhNHmvHLH9aixIgR4VGBF6DsZbM6vCl1T7w3?=
 =?us-ascii?Q?3qJQyvVWUK/oQHm7UmtOfurKf9CGgTp9MXcIF94Ov4g6Pz9mc6n4jqweGpSU?=
 =?us-ascii?Q?efJ3GtjJlkxTtpE6j2EdHZNRLj/JDlrp/D/vPmb24bloJjPtqhmTIy8is1JY?=
 =?us-ascii?Q?kuXWuPuPCx3oeBpWckeuAD9TA1JHnw1zgLaKYBifed1XeclKyl72SrXBElmX?=
 =?us-ascii?Q?7eQ43MnhYsQxp1X35f3q5KVvc7K4S6+I1PutjKy4RCqLqfKZY4EPGpOZEORo?=
 =?us-ascii?Q?8qNDaOh7+CnEEhfwij5jFd3b8YsEXvXaNnb2ZfY1fpd5t2EE1qRHvYjWdDCg?=
 =?us-ascii?Q?lhHK1O7hFjau2IDVp4c8KYwgjFIg/P9Z14N8z/I7yEV9DivPrdbLOQO+dMgo?=
 =?us-ascii?Q?wvNJuFKFi3ZqW8lk3TbolGZrX9h3y3S8w1DnaWRmLcFHdesldxO0tMKQKQ2n?=
 =?us-ascii?Q?SndV9USMsTmTKHPA2gCmEAzmXu6WNEjC/J+pGK/Lmc40yALi0dCS+olFrx5j?=
 =?us-ascii?Q?8juB7snKi3qoQJPRI0HzBnq9bI26wXPindSsAFEukGaHAfxlEe1qFuSHaWB5?=
 =?us-ascii?Q?0DcxvR/pgQ+iQfMl/yeJ02KDyYzUhSX90ruTdatigxgSZnH+MoHKsjCx85Tb?=
 =?us-ascii?Q?PTOCx6y4qpt6iBOeDz8hz/ocWiBuNejrltCtCjYk/X+w3v8Hp9TE5jhK3xDg?=
 =?us-ascii?Q?Swsx2k5kuurwJWHKezpHmeqgehJApdJLYcMjZHmh+cGbqD4uaGYSXkdyYVpg?=
 =?us-ascii?Q?7CktasXU7yqBWcF65fm0VQehMs9itcgOLr/Vnu6YNIMI3fk+y2xlVN9Ox/MY?=
 =?us-ascii?Q?h1G2CivwmnYdKBcoXyFdjqay1kOrLxR0umizh2TI8NCBPuEHAYhb2B7LYczW?=
 =?us-ascii?Q?IanAEhO2ALIObBSQM3YjrHsyHf4ECTqfUqFuoabg6orP0LWu0/DeDZsTh1aJ?=
 =?us-ascii?Q?w+YSlCbsDhd9Dkzc1fnVZgqly0GdmhNuFo8t02DxcGaV0YOpndUVbO8wCK74?=
 =?us-ascii?Q?nRMzPafcjyvXpOqc1iUbEo/YKQsiDaw709aZqXo44k5WXgLFKq/mXz7MfAw2?=
 =?us-ascii?Q?TSd473MbjC/KRKxChmdoNvImfhX2Yk/PhE9cOki2zmc8PD82kA4hRdBPfrIA?=
 =?us-ascii?Q?fdp+TH6WfIzyNfZzRd8m7ESi/IlLPf0wDwrWoXdkFZnPYvGqmeOhYPC8CXpZ?=
 =?us-ascii?Q?5B3EV9JsKXb2CvGMXxQl8R7eGMocm+rn5AkaBJohO2U7XarqVifcPPBlN2FR?=
 =?us-ascii?Q?+U4XfX458r1uJIWweKMbZ+8GetMR3VgvAcV+PuXKetRgh1cz61f/quErP3OX?=
 =?us-ascii?Q?GOhbynPgZbermN4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kODs3GSyvB+g4WFIYv/d4swUGg6XVVrcw4/TjlJTFZfUUVYzdvZcYQLMshYu?=
 =?us-ascii?Q?7TiGpZQFdDt+UwvdSv4PNrV6gJw8/NV3Vzb1qkNuKtMTQ+7eftCPyyShclo/?=
 =?us-ascii?Q?P7b7Y6fHXz+9/4NjBTeTLBnhzfPgbOqXuaZ38n9PrP5XMBHKUbhz6l8jL8uB?=
 =?us-ascii?Q?vkIz2rb+ws+DIea2PHNOEoxyESiq3uAoyjgjSAakxaPHVd9rPBXVys6Dsq9Q?=
 =?us-ascii?Q?HrYJtc3fzlq5nSMhC8ailBDNhBH+dOeNDSNixpzmVaSbxCZdWBED+cfgi64f?=
 =?us-ascii?Q?exA8n3R7wnLcE6TLZVofQ/rR680j0heIghRmBLSz8V4nKxWONqzU4gLnQyGN?=
 =?us-ascii?Q?yxs2h9QYaPoYCrXxFndF5+WhIUpv6BdnmD7VOyail81ju2s1BvPt6k990RXN?=
 =?us-ascii?Q?dDTBpf3clAS0t62NI0ERxOMr3WvEyaWk8DVuckvaidniCryvogoXPM6dLXt2?=
 =?us-ascii?Q?+z4FmJAetlhDmxC+qDdOkZ59XxE8nTaVyFhghGToFeSSWISgt22vVt0vUcwm?=
 =?us-ascii?Q?eHPS5QQbMZaSms5/JULkagPC6wC9DcSLUQsZGd9ZXQI+yAiAsG2bzjE858to?=
 =?us-ascii?Q?m1lVVenU0haCxgvjtsBWWE85kLENn2mTEKDuQmh0cNQLF8N+jPtWh5RHwBw3?=
 =?us-ascii?Q?XDpMj3SKpIf9Jofqy046vq2k5t6JoFIKwnT6KqVII/EKYEpvShTzkT7I1t2U?=
 =?us-ascii?Q?rCqV4/HjEB5ZrPBMCtoWcyFKEf1/2gxJPmp8vQrDDP6a15Mi44WqrAbaOrMu?=
 =?us-ascii?Q?ZwtRCSWMy8c7ESO5zoufAHMPgAZayLjONqjuMEGwYC+OrEL1RmS8QuzfP8+v?=
 =?us-ascii?Q?Hep6xyQXloPFBlsykjxnGB0Y/pc0ewJSCMuFt0yQ01LSLn9Aaig5hRHpSlfP?=
 =?us-ascii?Q?V0XA0UzgerAP9eTDDPrQAjV7pTuWELdqGuo8MaqMidxr5JMvLIyBJ5VZ0Ix7?=
 =?us-ascii?Q?hy2tBp8x+paVsDUpbC3roO5GKvSPQsbGxgLn3ArhZm1H2ViiqU6AsGqjDbFX?=
 =?us-ascii?Q?79VqpGgrC2mgEaj0/CHMD9/S6Zb4SBzRcnMcLUp2nnKX+YUV2Ek7fBxgizRA?=
 =?us-ascii?Q?KFoz5YLLTQcT822DPpvf2KkiJaTHZPW5/EE8QBJqJfkvYP1ztnQ3o1WrgX5y?=
 =?us-ascii?Q?Sdc2k0fCiBKeV8YOcLori/sRKDXe0qFYjQKzm5PRGJvi1XJDKmPIZqBXbf+l?=
 =?us-ascii?Q?B2+dQ7A/h9mkjgJ2Apaeqj6uFr0Kgy9VuSXfraFwm+/Ze6NIS4X7h96V7Fgo?=
 =?us-ascii?Q?kRBvrE8kMaRdx7TPkz51Aj70OgiZNuj53aR7thWKnurBGhWsV7R0twdSceTk?=
 =?us-ascii?Q?etlmZvDyHU5e9mus7+DMmVx0R+s90Us33uoEdfl9L6VXJvFQ2rSfxL5kMe6M?=
 =?us-ascii?Q?kNagqjLaBHWBTkwaJbC+HTQ5MQmTY4CBwvxGit7DpqbddHYSM0AcwdCPC4Lc?=
 =?us-ascii?Q?Nwj5QB24a2gA+bYAPv3NAnluGiaFFx/XTHbQKLZqppOWk9DeT6VBSaatIN1p?=
 =?us-ascii?Q?MrOyyj7PFpa8u+nH3rmnHbp2H3od/WglOvlTi8qeEFxa2t+ENgDBZ2J3y2SS?=
 =?us-ascii?Q?sq0EFs1xU3n7DxxIAe+3rIcLfZzeCrpNKB3knuYS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed40a9c3-7059-4a10-3c04-08ddec2c59c6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 03:29:01.6362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBbtZe95ZFtFhoiMro6JVZdtIwp1S7nHQoxIH6DeNsKvgT3XwnEZQARRX+adVwVyovBqze8646IDadSsGUHSow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10013
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since the generic debugfs interfaces for setting the periodic pulse
signal loopback have been added to the ptp_clock driver, so convert
the vendor-defined debugfs interfaces to the generic interfaces.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 MAINTAINERS                     |   1 -
 drivers/ptp/Kconfig             |   2 +-
 drivers/ptp/Makefile            |   4 +-
 drivers/ptp/ptp_qoriq.c         |  24 +++++++-
 drivers/ptp/ptp_qoriq_debugfs.c | 101 --------------------------------
 include/linux/fsl/ptp_qoriq.h   |  10 ----
 6 files changed, 24 insertions(+), 118 deletions(-)
 delete mode 100644 drivers/ptp/ptp_qoriq_debugfs.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6cad6225381a..4140fdd6ccf3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9816,7 +9816,6 @@ F:	drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp*
 F:	drivers/net/ethernet/freescale/dpaa2/dprtc*
 F:	drivers/net/ethernet/freescale/enetc/enetc_ptp.c
 F:	drivers/ptp/ptp_qoriq.c
-F:	drivers/ptp/ptp_qoriq_debugfs.c
 F:	include/linux/fsl/ptp_qoriq.h
 
 FREESCALE QUAD SPI DRIVER
diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index 9256bf2e8ad4..5f8ea34d11d6 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -67,7 +67,7 @@ config PTP_1588_CLOCK_QORIQ
 	  packets using the SO_TIMESTAMPING API.
 
 	  To compile this driver as a module, choose M here: the module
-	  will be called ptp-qoriq.
+	  will be called ptp_qoriq.
 
 comment "Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks."
 	depends on PHYLIB=n || NETWORK_PHY_TIMESTAMPING=n
diff --git a/drivers/ptp/Makefile b/drivers/ptp/Makefile
index 8985d723d29c..bdc47e284f14 100644
--- a/drivers/ptp/Makefile
+++ b/drivers/ptp/Makefile
@@ -12,9 +12,7 @@ obj-$(CONFIG_PTP_1588_CLOCK_INES)	+= ptp_ines.o
 obj-$(CONFIG_PTP_1588_CLOCK_PCH)	+= ptp_pch.o
 obj-$(CONFIG_PTP_1588_CLOCK_KVM)	+= ptp_kvm.o
 obj-$(CONFIG_PTP_1588_CLOCK_VMCLOCK)	+= ptp_vmclock.o
-obj-$(CONFIG_PTP_1588_CLOCK_QORIQ)	+= ptp-qoriq.o
-ptp-qoriq-y				+= ptp_qoriq.o
-ptp-qoriq-$(CONFIG_DEBUG_FS)		+= ptp_qoriq_debugfs.o
+obj-$(CONFIG_PTP_1588_CLOCK_QORIQ)	+= ptp_qoriq.o
 obj-$(CONFIG_PTP_1588_CLOCK_IDTCM)	+= ptp_clockmatrix.o
 obj-$(CONFIG_PTP_1588_CLOCK_FC3W)	+= ptp_fc3.o
 obj-$(CONFIG_PTP_1588_CLOCK_IDT82P33)	+= ptp_idt82p33.o
diff --git a/drivers/ptp/ptp_qoriq.c b/drivers/ptp/ptp_qoriq.c
index 4d488c1f1941..8da995e36aeb 100644
--- a/drivers/ptp/ptp_qoriq.c
+++ b/drivers/ptp/ptp_qoriq.c
@@ -465,6 +465,25 @@ static int ptp_qoriq_auto_config(struct ptp_qoriq *ptp_qoriq,
 	return 0;
 }
 
+static int ptp_qoriq_perout_loopback(struct ptp_clock_info *ptp,
+				     unsigned int index, int on)
+{
+	struct ptp_qoriq *ptp_qoriq = container_of(ptp, struct ptp_qoriq, caps);
+	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
+	u32 loopback_bit = index ? PP2L : PP1L;
+	u32 tmr_ctrl;
+
+	tmr_ctrl = ptp_qoriq->read(&regs->ctrl_regs->tmr_ctrl);
+	if (on)
+		tmr_ctrl |= loopback_bit;
+	else
+		tmr_ctrl &= ~loopback_bit;
+
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_ctrl, tmr_ctrl);
+
+	return 0;
+}
+
 int ptp_qoriq_init(struct ptp_qoriq *ptp_qoriq, void __iomem *base,
 		   const struct ptp_clock_info *caps)
 {
@@ -479,6 +498,8 @@ int ptp_qoriq_init(struct ptp_qoriq *ptp_qoriq, void __iomem *base,
 
 	ptp_qoriq->base = base;
 	ptp_qoriq->caps = *caps;
+	ptp_qoriq->caps.n_per_lp = 2;
+	ptp_qoriq->caps.perout_loopback = ptp_qoriq_perout_loopback;
 
 	if (of_property_read_u32(node, "fsl,cksel", &ptp_qoriq->cksel))
 		ptp_qoriq->cksel = DEFAULT_CKSEL;
@@ -568,7 +589,7 @@ int ptp_qoriq_init(struct ptp_qoriq *ptp_qoriq, void __iomem *base,
 		return PTR_ERR(ptp_qoriq->clock);
 
 	ptp_qoriq->phc_index = ptp_clock_index(ptp_qoriq->clock);
-	ptp_qoriq_create_debugfs(ptp_qoriq);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ptp_qoriq_init);
@@ -580,7 +601,6 @@ void ptp_qoriq_free(struct ptp_qoriq *ptp_qoriq)
 	ptp_qoriq->write(&regs->ctrl_regs->tmr_temask, 0);
 	ptp_qoriq->write(&regs->ctrl_regs->tmr_ctrl,   0);
 
-	ptp_qoriq_remove_debugfs(ptp_qoriq);
 	ptp_clock_unregister(ptp_qoriq->clock);
 	iounmap(ptp_qoriq->base);
 	free_irq(ptp_qoriq->irq, ptp_qoriq);
diff --git a/drivers/ptp/ptp_qoriq_debugfs.c b/drivers/ptp/ptp_qoriq_debugfs.c
deleted file mode 100644
index e8dddcedf288..000000000000
--- a/drivers/ptp/ptp_qoriq_debugfs.c
+++ /dev/null
@@ -1,101 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/* Copyright 2019 NXP
- */
-#include <linux/device.h>
-#include <linux/debugfs.h>
-#include <linux/fsl/ptp_qoriq.h>
-
-static int ptp_qoriq_fiper1_lpbk_get(void *data, u64 *val)
-{
-	struct ptp_qoriq *ptp_qoriq = data;
-	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
-	u32 ctrl;
-
-	ctrl = ptp_qoriq->read(&regs->ctrl_regs->tmr_ctrl);
-	*val = ctrl & PP1L ? 1 : 0;
-
-	return 0;
-}
-
-static int ptp_qoriq_fiper1_lpbk_set(void *data, u64 val)
-{
-	struct ptp_qoriq *ptp_qoriq = data;
-	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
-	u32 ctrl;
-
-	ctrl = ptp_qoriq->read(&regs->ctrl_regs->tmr_ctrl);
-	if (val == 0)
-		ctrl &= ~PP1L;
-	else
-		ctrl |= PP1L;
-
-	ptp_qoriq->write(&regs->ctrl_regs->tmr_ctrl, ctrl);
-	return 0;
-}
-
-DEFINE_DEBUGFS_ATTRIBUTE(ptp_qoriq_fiper1_fops, ptp_qoriq_fiper1_lpbk_get,
-			 ptp_qoriq_fiper1_lpbk_set, "%llu\n");
-
-static int ptp_qoriq_fiper2_lpbk_get(void *data, u64 *val)
-{
-	struct ptp_qoriq *ptp_qoriq = data;
-	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
-	u32 ctrl;
-
-	ctrl = ptp_qoriq->read(&regs->ctrl_regs->tmr_ctrl);
-	*val = ctrl & PP2L ? 1 : 0;
-
-	return 0;
-}
-
-static int ptp_qoriq_fiper2_lpbk_set(void *data, u64 val)
-{
-	struct ptp_qoriq *ptp_qoriq = data;
-	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
-	u32 ctrl;
-
-	ctrl = ptp_qoriq->read(&regs->ctrl_regs->tmr_ctrl);
-	if (val == 0)
-		ctrl &= ~PP2L;
-	else
-		ctrl |= PP2L;
-
-	ptp_qoriq->write(&regs->ctrl_regs->tmr_ctrl, ctrl);
-	return 0;
-}
-
-DEFINE_DEBUGFS_ATTRIBUTE(ptp_qoriq_fiper2_fops, ptp_qoriq_fiper2_lpbk_get,
-			 ptp_qoriq_fiper2_lpbk_set, "%llu\n");
-
-void ptp_qoriq_create_debugfs(struct ptp_qoriq *ptp_qoriq)
-{
-	struct dentry *root;
-
-	root = debugfs_create_dir(dev_name(ptp_qoriq->dev), NULL);
-	if (IS_ERR(root))
-		return;
-	if (!root)
-		goto err_root;
-
-	ptp_qoriq->debugfs_root = root;
-
-	if (!debugfs_create_file_unsafe("fiper1-loopback", 0600, root,
-					ptp_qoriq, &ptp_qoriq_fiper1_fops))
-		goto err_node;
-	if (!debugfs_create_file_unsafe("fiper2-loopback", 0600, root,
-					ptp_qoriq, &ptp_qoriq_fiper2_fops))
-		goto err_node;
-	return;
-
-err_node:
-	debugfs_remove_recursive(root);
-	ptp_qoriq->debugfs_root = NULL;
-err_root:
-	dev_err(ptp_qoriq->dev, "failed to initialize debugfs\n");
-}
-
-void ptp_qoriq_remove_debugfs(struct ptp_qoriq *ptp_qoriq)
-{
-	debugfs_remove_recursive(ptp_qoriq->debugfs_root);
-	ptp_qoriq->debugfs_root = NULL;
-}
diff --git a/include/linux/fsl/ptp_qoriq.h b/include/linux/fsl/ptp_qoriq.h
index b301bf7199d3..3601e25779ba 100644
--- a/include/linux/fsl/ptp_qoriq.h
+++ b/include/linux/fsl/ptp_qoriq.h
@@ -145,7 +145,6 @@ struct ptp_qoriq {
 	struct ptp_clock *clock;
 	struct ptp_clock_info caps;
 	struct resource *rsrc;
-	struct dentry *debugfs_root;
 	struct device *dev;
 	bool extts_fifo_support;
 	bool fiper3_support;
@@ -195,14 +194,5 @@ int ptp_qoriq_settime(struct ptp_clock_info *ptp,
 int ptp_qoriq_enable(struct ptp_clock_info *ptp,
 		     struct ptp_clock_request *rq, int on);
 int extts_clean_up(struct ptp_qoriq *ptp_qoriq, int index, bool update_event);
-#ifdef CONFIG_DEBUG_FS
-void ptp_qoriq_create_debugfs(struct ptp_qoriq *ptp_qoriq);
-void ptp_qoriq_remove_debugfs(struct ptp_qoriq *ptp_qoriq);
-#else
-static inline void ptp_qoriq_create_debugfs(struct ptp_qoriq *ptp_qoriq)
-{ }
-static inline void ptp_qoriq_remove_debugfs(struct ptp_qoriq *ptp_qoriq)
-{ }
-#endif
 
 #endif
-- 
2.34.1


