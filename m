Return-Path: <linuxppc-dev+bounces-8089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 887FCA9EEBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:17:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmLVn27Pqz305v;
	Mon, 28 Apr 2025 21:16:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745838993;
	cv=pass; b=ZoVrK/GgTZ8sPRh5InYSVjDaDSbWPIaSJ15eJ2T/arWCgmidC8Fmpb4dOQhAbQR815SZshKWYEsjO+ynp6NlJYRgTt8VfZuNxeV6CkoKq+cbCu06mnzZKufycz0Lj6nrmbFjMXamqPxW7M8jZd5GcDFXT5QKmrosIj/yDsX0Crt8mKz7/pCktfpfjFmJXPLPyXT18lJvD3J0jcH3HemHqFllRZMeZInGBmEH2UPa+aR77BlJfgdNmTLa4st7swkaWZAEkNQbbBp5mFLoJbPVjpClE97T3PI6fHHnZIb1KF3Lo002VWyknCOeUdSdUhxNuOFicgko4CTxD7lykeX4OA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745838993; c=relaxed/relaxed;
	bh=qHvTpoyCoCCWeCB6NDfQOnADKDamDFUw9OxNu9wvs10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d94kuXHHTBfK8Yj6Sa0ljXYew9qt2Lx0+Ohx5UlsEqUzt8RLoF/4/Qz4bbidinxquPInPtbiApYScyzlZ5ZGSO2bUTvEY1EWjeIUy5Eo5YOZS1TvQzQon3vRP8MaWuvJPGCSf7Tm+BDVQkDEiQShdY8HcAc9OPcJhGPlrFp+9pyPDogQv1C5H7XMWlDbp061nHwUhzC6NbPTHiCOrGVVGJ8uXXm/UyTHEkSrlGn4/MtWcD2F29Q4aJf6R0USnno8qYAXl9AM8EA7hPTwT3LZGisPh7fxDepSB12mg17BG/xIrMHfopYYF3efM1w/E9IiVgw1f/wGNvUpngx+1mKfkA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HJKN7XlU; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HJKN7XlU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmLVm4n3jz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:16:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBOkqV3N+kA4AcYI/oG5YkLtgqdtCisoEdsrUAKpcKVwoIKZy0ZrLq+UaCRhU4ZtjEgRwE/9I/hM0RHoAvb22Yy1qzD2Or0CHeDyobPwBN1cILIbVDS+PJBmcmf9gMlyMz506w6EgTorib0j1ORRbh7ElPkDHEdxquolU6vDuFaX/H/CQ43dUsCISOKLudzeJSWalTh1ABcpHOMyOw/gzbkrv5gy4q85rp2vFuT7hZHqodW+46Z0aNYoQd69jbZBVTo8P/+FsNWEdZYtYfJtYwBDaKA8RxSQMVRPgEUfF7XVBT7Qkx5+i1GexfqqrENZn+9EbESoy29EQ7hwTH5FvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHvTpoyCoCCWeCB6NDfQOnADKDamDFUw9OxNu9wvs10=;
 b=kYZLc3E0X6eXLTBbjIXSPv7YirwsGBTL/CvI+Vu06cCPTWcS8548lwTJeXm/sDxlakrPH7hIe+yapA3VSOkCIVUceV4RwDfxcfka+7fcMrMgXLqOTGUVdHKticQTUFMzB8IVllHQg3zTO/9ql2MwX8hdghgzNoPWyuCtkMS0NFYGtDjFneNRSpWpmTfm5obpA7qNtPED10QUJb+ddzebIz4LyJzik1pQPYvdJ+p1yCOxRQlHHtFBUQIH5EiGeK/B+/h8iweAdxCZTUdAs1vBHXVzNov3FdtDe8V4ZBhqBVmoeyawUdtll6wBrdECEiCkvB/SLqQA1KfXzqrCdbNWOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHvTpoyCoCCWeCB6NDfQOnADKDamDFUw9OxNu9wvs10=;
 b=HJKN7XlUP9F+TE2+TOR/Wo4Rz6wzCQJAzRGqRokj2JnSi40fZX/dPfCpzCNggu/6ROyGEoKsUMnzV3zbQHAHVAf3sl2SHKCWKZdndTee3gU5uKL3KOs25loIzNQDKTdveX91QBaYsJJp3PXOwLAktq6WeZUYpUw5gFdBMpr9ozwNaTWBgkE7vStNV/ty/6dOjJoLOpzj1vDtrYfxP5Tlt3G6J7cqujJqKVPA1bOndfgXMYjCkfktR3NDLw+x9VDoMaNXzx+eN1IojFEOUPSpVDXaRE7TGR2yh+pjUGhysw76pHULr/DsgY4J6F4YLoaZz3TkEWYl3RLVHSOQ0aM6Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:25 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:25 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 net-next 06/14] net: enetc: add set/get_rss_table() hooks to enetc_si_ops
Date: Mon, 28 Apr 2025 18:56:49 +0800
Message-Id: <20250428105657.3283130-7-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428105657.3283130-1-wei.fang@nxp.com>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3a4104-347f-4db1-566d-08dd86461ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?emvwE+ZWUJkT0ACq36aVpi95RbEYok6TfvE6n7V2WXo8VHLZhzeyxXFW+0Cn?=
 =?us-ascii?Q?ZNCmL/Wo++fb1FXBvEa2WwMN/iD7BGHGciN+8/XjfKZVr5xE+4UAwFCm7/Nv?=
 =?us-ascii?Q?YYooq1kBmbT0cr3LybOY5fZS1yaVHYWJuPGZbBBd1yeENpdhRHOGmkr1mJ9e?=
 =?us-ascii?Q?VtKWyHob4HkFGUqG1PxUdU8hli+PijBygkiJpA+PTYmZPppeDZcsCw1RPK1b?=
 =?us-ascii?Q?KfVeL/upy0WzvxjGpmto0RghwWzZD5akvYt8bKRnqhrMuWU4SC8ULOI6S7/K?=
 =?us-ascii?Q?d3H5CtHpwDyZfx11clhkisUL1o3CVWO6J7lTgm+iaeE9olFjel9VX3R6KoVI?=
 =?us-ascii?Q?X+ahXNQPgbLwXYYWOwjEizK96PnD7j4CgMtMHpKEBjvgivnZb+iP71pNKWxA?=
 =?us-ascii?Q?voB799yZzJFwCg1qiElo3vAjKmN4kCpo0syVX1UN/mb3rx/6OuojKklSlxgF?=
 =?us-ascii?Q?5/CwDGAuDY+pherEnh9tNjVGuf/7Fmi5T/VEbPId8jjGJ0pPumlJE8/u3B0i?=
 =?us-ascii?Q?9TXVNL9Ueek9oC/Zefn1pC589Ft7JmAAKa4G3ftlgK4Uzlplo5bMbmgS8iZ3?=
 =?us-ascii?Q?V2RpF2v+SNnqMjRR31VQNVvomUYVnfEtfYMknCXpnpOPLEiXie7r6HhdsXaA?=
 =?us-ascii?Q?8w2dCaD9pFiC/udbd+V/I1vgZM7uGaZk7IBT0dUhi5zOqQynm+FQSZ2BNII+?=
 =?us-ascii?Q?j0FW3pfTWJIWmErdJMYl+GDy1YW6ncC+lqERJ/keji0IKk3oSbiFrDT5A/9z?=
 =?us-ascii?Q?wWLBdLDPQz/winIl8mS6r4tSyMhhhJS0Fd7KwHbryIatcJye3MUzd7oTVve3?=
 =?us-ascii?Q?rqL7C+DzA0fkou5bMwLoyC/nZ3cKAUpJ5LKbUARAQBVxS4NNZQN/utNTK7lC?=
 =?us-ascii?Q?Jh6SX7I+/marBapUPNvDrQR4j9SW+k19b765qZchp4shgEp8n1wAPBpEPK9I?=
 =?us-ascii?Q?LRke4enHEWHHt/HBLrFQ1abIrsv+vfjHMXSArl4EW3D9l0k0A9MbkBhHZV3W?=
 =?us-ascii?Q?oEfG7jpK4YzWJ8dbl/hLbqLX6qQQh73gD3Rb0AoLLhJoql3pRN4UuwokcbvJ?=
 =?us-ascii?Q?6TjEbsXTs4O5UYHXzEPbh7IOU/N8GFpSNtpkOGrrHXmWEb1BaPgzv7cPeIP4?=
 =?us-ascii?Q?UkGmID4fPDni8xkCiTyJyhjZcnp8tlfaL9+vRLe54oQm5fLsqCr4n4oM8tHp?=
 =?us-ascii?Q?QGL5NNYfX9R4AT/oXey7hIZsmC4tHm//hoHmDlbZp/NKsSVxZxwpNuaVVCDw?=
 =?us-ascii?Q?FDNXWmVnmo5ASmnSIeoEGC1y2flVM0opWYbNPRHYtPYVSYtgvzl/tsBF2oY8?=
 =?us-ascii?Q?IYUy4VxIXSca17cM+8YtJKensVYkJQjRTMo8Iq0vH7yWRY4XgCrh2yqtIa70?=
 =?us-ascii?Q?2TL9E3MWKkmmzwVqwxoJ+1bkcyYXbkxa7RxLzxG0t/vc9AKBH3dLTabAeVhd?=
 =?us-ascii?Q?Ixs7FxFUoPQcIJxiPJ4834CBrUej0RB58oyeyXL48XzB/HshX7CNlw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9vKcEWqCXs0gGlMm5s5J9WXcdbT3N69gxRNklih83vKLqyszgxf31++7fiVs?=
 =?us-ascii?Q?Gfp1s5okwKNr2sFvnreWV8SnYwvoUGFOyCr79l/soQB3tSTp0DhDSlODKy+i?=
 =?us-ascii?Q?mnAENba0P1U3eiFTowbkKXgjWAFnCrGlhJPSwqf5elw3P2tnXmdQ6Ai4JCN2?=
 =?us-ascii?Q?8QAhZApNC20EvJtdm8NGwkRTZwzi4CkAQy0+aakG7CxgkjvHOUlaZjoBzbD+?=
 =?us-ascii?Q?htls+dl6jTq+iuHn+b96ZRnRqrNYqk6JutP9I6zY3NGKTjP7UHvvuOh5JqAR?=
 =?us-ascii?Q?eimy+N7SRZRmsibKqMD0CsFGX5mptHdMiFhazEtKBRiyok/5z6TNyINC76BM?=
 =?us-ascii?Q?4hpQ/KOjMTqInQYczN5inxNzmRwoUl8Tju+vWnKdsgJG923AYNuuMy7SbDz+?=
 =?us-ascii?Q?jBcC3WJGusxkHyJiPrbQ2Uz00BrLAxiztqd5d/qabhqtsUpDpSdr8Iv9tZJJ?=
 =?us-ascii?Q?2cbOAc3V9Iz632Cz6lEpanrtmfqgr8BnZupOclEDDd1gbOo/ANPIrAIYxAUP?=
 =?us-ascii?Q?/76BxVRBxbTlyNGpsnYdO48mSwFAVvjRCOATXsL9JYX7QklENWae7eYSUwU4?=
 =?us-ascii?Q?MuOUmM21lw8nd7ulBJBnqaZsaiyWsihFNzCpamcaQjYPGNu2mdnjn5e/TT+R?=
 =?us-ascii?Q?UDyE60EEq26S378BTYjtc4AkDp0uGFUx6kzjrVfQPaOJ60VsO2rpB6nTgjKp?=
 =?us-ascii?Q?jN0a2v4bxjhE0cGmYU0H6Q4jwA8F2MN10Y8wdhALT6LzCpet2Uc25wmt6GLx?=
 =?us-ascii?Q?ScYBugNx7w5kZd3jZV4EoL4ZqU9a8Ku8o/KAAu2rvQ4qvBqFrE4+dvuecDd3?=
 =?us-ascii?Q?AwWxElAp+/EMJ0nPwhDtwltwlKgPa9N5NkaZ/J1VcDYIZzeRdp06BcdAquU4?=
 =?us-ascii?Q?NTwtOTtan+ZdElpsyNS0ow687VzNedUF5XqguCL30cLOqilmU2qgewIUwRyA?=
 =?us-ascii?Q?OqKObFjGR3n0LoNalDtCGUnduRLrAZ4A80xiRTZVv9y1pqOU6p4boRzTXRNy?=
 =?us-ascii?Q?HLeMgNVj8J70q5ZBqLOi4LsF083hITS373d1eBa3j8FzkKqCMKprv99NOMTi?=
 =?us-ascii?Q?ynvxMjUd3+qNNU4TgL4eTTgXZwOupdJ9AwN7AONKe+cX8wRVWADLaFcGmgnO?=
 =?us-ascii?Q?cjXznBoN8C40uBqyDfhgDTVRXJxpsYAfZUR6R1dt7FlG5ZZeo/MHo1QX8zLW?=
 =?us-ascii?Q?JFz+WOA6UNLkynJXEuCj0unGPA/musCcy3Jm5hECGlcB+pvJh2+fcIsP82Sx?=
 =?us-ascii?Q?FhqydGrutG6WmV+PaZucM0wp+AR9SAKdY/vfOGDVIR8npPwLPHwL8Tc4jh0T?=
 =?us-ascii?Q?6DtU840ORlPDdWMZk6lY8T5Ype3IToeuSHNqOhotrwug39o1B4uJcxUpetxs?=
 =?us-ascii?Q?J95ikatIkoug5OlK+EiSu+J7cnb/8h89WGFn8Cn/SDs89JTnvyp4i3xmW6RC?=
 =?us-ascii?Q?WIy5w2no934nO22DILwzx5J0xgSnqph2LNpFmT0MCYAu6UALt4lMAuGyejdW?=
 =?us-ascii?Q?wuuZAb9MIb0dZZ5IpqboxnJcPbHQtDzn3E5AHJBlMtHEB6tTSEIhIsV7FyCE?=
 =?us-ascii?Q?TURhqScXJEPuxzTeb+qRPZ3gpBmCe3AmdbfkmLjP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3a4104-347f-4db1-566d-08dd86461ccd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:25.3395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwyqJ2XbCxHofA6Bt1LJwfsu0CacWv+an+jIbw4bXSddVV7RHTwFzv5b/M8RZIxW4DNDbU5e+c9ttnWqFXiGsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since i.MX95 ENETC (v4) uses NTMP 2.0 to manage the RSS table, which is
different from LS1028A ENETC (v1). In order to reuse some functions
related to the RSS table, so add .get_rss_table() and .set_rss_table()
hooks to enetc_si_ops.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5, v6: no changes
---
 drivers/net/ethernet/freescale/enetc/enetc.c        |  2 +-
 drivers/net/ethernet/freescale/enetc/enetc.h        | 13 +++++++++++++
 .../net/ethernet/freescale/enetc/enetc_ethtool.c    | 12 ++++++------
 drivers/net/ethernet/freescale/enetc/enetc_pf.c     |  6 ++++++
 drivers/net/ethernet/freescale/enetc/enetc_vf.c     |  6 ++++++
 5 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 5a7af44e4594..494f8f77bf4c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2415,7 +2415,7 @@ static int enetc_setup_default_rss_table(struct enetc_si *si, int num_groups)
 	for (i = 0; i < si->num_rss; i++)
 		rss_table[i] = i % num_groups;
 
-	enetc_set_rss_table(si, rss_table, si->num_rss);
+	si->ops->set_rss_table(si, rss_table, si->num_rss);
 
 	kfree(rss_table);
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index b53ecc882a90..786042029b1e 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -279,6 +279,19 @@ struct enetc_platform_info {
 	const struct enetc_drvdata *data;
 };
 
+struct enetc_si;
+
+/*
+ * This structure defines the some common hooks for ENETC PSI and VSI.
+ * In addition, since VSI only uses the struct enetc_si as its private
+ * driver data, so this structure also define some hooks specifically
+ * for VSI. For VSI-specific hooks, the format is ‘vf_*()’.
+ */
+struct enetc_si_ops {
+	int (*get_rss_table)(struct enetc_si *si, u32 *table, int count);
+	int (*set_rss_table)(struct enetc_si *si, const u32 *table, int count);
+};
+
 /* PCI IEP device data */
 struct enetc_si {
 	struct pci_dev *pdev;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index f47c8b6cc511..5c51cf7ea439 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -681,7 +681,8 @@ static int enetc_get_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	int err = 0, i;
 
 	/* return hash function */
@@ -695,8 +696,7 @@ static int enetc_get_rxfh(struct net_device *ndev,
 
 	/* return RSS table */
 	if (rxfh->indir)
-		err = enetc_get_rss_table(priv->si, rxfh->indir,
-					  priv->si->num_rss);
+		err = si->ops->get_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
@@ -715,7 +715,8 @@ static int enetc_set_rxfh(struct net_device *ndev,
 			  struct netlink_ext_ack *extack)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	int err = 0;
 
 	/* set hash key, if PF */
@@ -724,8 +725,7 @@ static int enetc_set_rxfh(struct net_device *ndev,
 
 	/* set RSS table */
 	if (rxfh->indir)
-		err = enetc_set_rss_table(priv->si, rxfh->indir,
-					  priv->si->num_rss);
+		err = si->ops->set_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index f76403f7aee8..8dabb80ec04c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -905,6 +905,11 @@ static int enetc_pf_register_with_ierb(struct pci_dev *pdev)
 	return enetc_ierb_register_pf(ierb_pdev, pdev);
 }
 
+static const struct enetc_si_ops enetc_psi_ops = {
+	.get_rss_table = enetc_get_rss_table,
+	.set_rss_table = enetc_set_rss_table,
+};
+
 static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 {
 	struct enetc_si *si;
@@ -924,6 +929,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 	}
 
 	si->revision = enetc_get_ip_revision(&si->hw);
+	si->ops = &enetc_psi_ops;
 	err = enetc_get_driver_data(si);
 	if (err) {
 		dev_err(&pdev->dev, "Could not get PF driver data\n");
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index 3768752b6008..4fafe4e18a37 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -162,6 +162,11 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	enetc_load_primary_mac_addr(&si->hw, ndev);
 }
 
+static const struct enetc_si_ops enetc_vsi_ops = {
+	.get_rss_table = enetc_get_rss_table,
+	.set_rss_table = enetc_set_rss_table,
+};
+
 static int enetc_vf_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *ent)
 {
@@ -176,6 +181,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 
 	si = pci_get_drvdata(pdev);
 	si->revision = ENETC_REV_1_0;
+	si->ops = &enetc_vsi_ops;
 	err = enetc_get_driver_data(si);
 	if (err) {
 		dev_err_probe(&pdev->dev, err,
-- 
2.34.1


