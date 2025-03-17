Return-Path: <linuxppc-dev+bounces-7149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C71A656AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 16:55:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGfh462y9z2yqj;
	Tue, 18 Mar 2025 02:55:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742226931;
	cv=pass; b=dGXY2JWjWbe0szTzRJPKTyHIQ23ORDS38pKjp4ExeFmQQQAKRLOiY0qz2SyPk0HAbasxKTr0lMyXrLF16G/qMu9P4pczS2BjGN6HGCWfujoePYT28zecGz7WJ5xOfHn5wkCYmTilcf3oe/jvhFAkwK3+g80maryyIXgH0LAQObRrLbGDSP3M+pu7xUP79TFmGtSKXjssiBqSkTWfJBXCRo+ZQhLdE/szXioG3r1khmTyjr2KHWm0zrRoz07pPtXRBPTzfODlkd+SoRvP+N0yM5O/fvMb3qodfVeA5UhcmhJekLMzAzxZvV/wlDARQR2hlgCXf5BhuD9l6Gxd6ku1hw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742226931; c=relaxed/relaxed;
	bh=UiIEsYNxlG1fxPhrS4N852N2ZiB4pU++mVj7GjMFmGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JpfB1rTLKHPT3oIK9W06b3GvEyRoiBoJj5ZLjrDBFjzVQa9Ibfq+Qj5sD6WgZ8/KhrIwvYsfJVhJKvgIS2frKFhbcBU6srW1ljT4aFPjTu/N2j36SwJcTeByZkLPkcAauVr6b5XH+gKOciTGACfJxOxCtbXk1DBptoMcVrd0ln90y9d7NBHiuZ7Zx2mOAyJJzuKEtsbz4zXH9X6SlmUFssAO4zNxp2k3Zh0lojdXPbuZcRl+Bbxy3jmIISmJJTARsFXE6LSa3vCYevzUuIrARKPTlKSg7cVoku0TQZ1ECa0OusfH56pKcnk84Tu/GJIEhjwRK0kCUG0fa/BrvYm1Nw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ukudm1j6; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ukudm1j6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGfh12svMz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 02:55:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tX3PXBZdks2rW38dehRKNZoCQsdWhSnd12swlPZ8pa3ylT6FLtbghPYp0mTWpWRmQ2FksLvlPmawPpbkkJVGlgvW2HZAX2aoTHbNiwaPSlQiTRPavy0kCdzhoVN8kLs3WzLSqqNU7o+MvgS4o6aMdpUo3B9/qWUEJGZ7x/yVJJFznaLUH18aKqAAahi6nq1DgSvJO8AWDUjlw/EZjKGu4UFT2SYqc9oKItfLQS29pjH/CF3GGbBMKnlJBWS9TdsCjUQ1sJSX3xE+ckcDiFR3F++cNS3hx90+V/JRGSS/XK8W0EkmCDRvlZXn4js6yMzokMoWx5toudsyrAPpC2KU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiIEsYNxlG1fxPhrS4N852N2ZiB4pU++mVj7GjMFmGo=;
 b=KlXhY0DZRy+5NfGaKzG5TmDUH6CtOV+6ljC017JBnUmQz2uixsehgeObGCdd8GQkl9ZCPllOcGCg7L7WfWuL/23JL6TkZaat3RuUs+cokS2wkV1Ybfw1qYL++feoc53GbtAvBBQe2b+rDG4+r3edNlo4ZNK2jVydCImmJvEgH+Z0Bsrjxo0OThthhQwJr8QcvaJLmJzWBrPioGufQSRzv5QWr03R8cUftZmjJ8RdtXl0GGlqSunb8xhHinRkK35z28pE6fKn2az5wnUmWeqSHaVc371o4EZsOMMhX8KI+UhYkwcHPwChKuJvzwpqFakfCJOJhCr5qwTs6L/r0DQoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiIEsYNxlG1fxPhrS4N852N2ZiB4pU++mVj7GjMFmGo=;
 b=Ukudm1j6iAHleuEzZs6KzmpR7VBxTb2/gQvU6xJ+EdaE/BsU4sEU/rEOcpbl+LwNRQR1IhDLu0lHCH0YeM8KTim8KSlY6Z2070l8f2k6XeHiAmtDHZFunKayueinWCZteofENo6meTTRT990+mdDQOHTP4CJuyVkh7r88Ef7XsnVm30FFhlILbpRi4zGfchOqSrF83JQAkJjpvqHNfIAqIJtrbay/L7ihx3xqyD8CQdCk/MkINAzzvIM+iMI1f44T+IKxPCH1qpwjx8xrzj3mwP9CieeDXwVI0Gr1xaElMQjOGpme4IShPOM2jv2hS2oSXRGeNH9dYLNxBtBh3uhuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AM9PR04MB8956.eurprd04.prod.outlook.com (2603:10a6:20b:40b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 15:55:05 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 15:55:04 +0000
Date: Mon, 17 Mar 2025 17:55:01 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 08/14] net: enetc: add RSS support for i.MX95
 ENETC PF
Message-ID: <20250317155501.4haweyhlrfozg7zr@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-9-wei.fang@nxp.com>
 <20250311053830.1516523-9-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-9-wei.fang@nxp.com>
 <20250311053830.1516523-9-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR07CA0215.eurprd07.prod.outlook.com
 (2603:10a6:802:58::18) To AM8PR04MB7779.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AM9PR04MB8956:EE_
X-MS-Office365-Filtering-Correlation-Id: 9133ceee-6b7a-4a96-2dc2-08dd656c155e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h6lWlKM/TgZO+1yh28lqnmZ9kIbHK8HZZcXDwLmXUvbE9fQYlzLhse0XAwLV?=
 =?us-ascii?Q?pGjh+2pmsVSlH24ggeheVW8wvCZWQDjRWDehFTA0EumJwRwjuhNQKA1Fg7dp?=
 =?us-ascii?Q?nNDo/RWuh6+rLoZFyav7m7d2gbOAmrqggr+HlOp6viLkygaqnejn9oELanGL?=
 =?us-ascii?Q?GYsFCCvN06v+U8mTz1qyfh+bQ/pmk8FKeprsRr21BAZJXJMQzThzCC0NQzKS?=
 =?us-ascii?Q?KEL9s32iBu5Lg+gSVQolB3PlIYww8rrLL2UHckP1LVvLE6CT4ptnfGVbIeAw?=
 =?us-ascii?Q?/hYkY+rWy6OwmrcPYgYJth5ZgoTi0yb7tve13Tv+9tuwIzNC2JHmh7a+QIUm?=
 =?us-ascii?Q?UEqTQ0n8o8h4LabaI1iUPQCsaaDxf5NvE6jZo+hOsRvoqaXMe8aOYsMfgvnW?=
 =?us-ascii?Q?7yBYxf+sghlFFesJuksXWvKmXIrcvKqsuVxa7ibFkLFGSW71ojf2IcY/CajD?=
 =?us-ascii?Q?OytaFbw57fGlip+MLua33Ga5Xd0RflS7qMuCUQtxv8GD+TeSfaBsPlUGcqWP?=
 =?us-ascii?Q?99gb6WerpWiF6MuztcnTqC+QntC/lBvqCkxUaJdgrjtVa4OV3kkb1fOabtyj?=
 =?us-ascii?Q?aVkd3q1i/e+/kJTwWJhzoRawSfysYFitPzS9Gr2zXZhmtohMsPZzDA4pzP/+?=
 =?us-ascii?Q?jHRqfm5cffQwJEnWbltz6DHQ1j9xiZoOVBXLkrCd0ORX8fbuvPwEVzsyzp2S?=
 =?us-ascii?Q?0c8gTHtZH5tI6SuavidYd2X1qzMnH5m0Vn9liiiBkBdBJXAb0DIOUqeQ7rWv?=
 =?us-ascii?Q?UfQZCVK2BxD6NIPimBbQ4g7NRX/e3X/wIPHP51R4i7A5Ahu+jiyiJTkrMU4N?=
 =?us-ascii?Q?ID1qOgoYpW2iv9L0P5Bam9Y84vq/a5d7vwnML9KgPs7C6Diy4LksUtvWtHUz?=
 =?us-ascii?Q?GnMkSrelfCl/Ye4XdgPxVMLO/fzdH+DmpBT+IpdCv6VEwsq9UZRzTZ0R5a/8?=
 =?us-ascii?Q?v9Um8+2EOBcy62QNfB45FmYaD3JnsOg2Zy2u4SVPX1mwbO58lLI2+gb1y61v?=
 =?us-ascii?Q?KhB6cFQDaD3jw/oHoHN4PI0ZhlDsK1hL/UbZukVqGMUGbdVCaq4zYlveF26h?=
 =?us-ascii?Q?vM/CUaY7hBcb/J2vvrMlFeFW/sKjbhW+k2qhMS6iwkHjZqar8YRZp8iBgBCA?=
 =?us-ascii?Q?zsfK4l/shDgRS+RqKKmXq0aQXOVEhXFAUVyNrWD2f79hDjq5+0QkQ9UDuJmV?=
 =?us-ascii?Q?Pl2posxjMJs2Tk6TB7hwP6wcjajydXkyr7003/6uIYn8xNelvEl74AeqcwOD?=
 =?us-ascii?Q?L4/i8Gv7RSC7ydMZSKk9x3Fi+GnvucTT29ZZa65J/yEtnyGax38Kfs8GBhBF?=
 =?us-ascii?Q?Tu9bynbeOHP32YL8RPWByHQOAxxHzYrMZSU33SrdsYgfoHCqIRLN+NAU6jmZ?=
 =?us-ascii?Q?aPuIN23RDX/v4Zql14pUBqsx07ya?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zLenjKgGX9uVsCgVLCTuX1yxpWY3IOtj2AlfSONyIazCTnJfTcTcx9MOH2EW?=
 =?us-ascii?Q?b59bf3i42z9AflWSap4qVdIilX/Ast6kw1r0T/WqKKkU/DUhnwZ89wFqHJ5S?=
 =?us-ascii?Q?ZKV4OAY8OIuDOSlGPMyoTcsq72GOwp7VmwD2CcvauaXMKqh6UDVfjYYJooXF?=
 =?us-ascii?Q?vCCIMuDCOnCxiVC50DE1QXf90aBLteoBWMXTM6nZuiTVNc2gZYBIMydj2Daw?=
 =?us-ascii?Q?YLXCFpidJcqXf+nGG09KJL5n/KikVuBCo8xSX4vs5JRX3eV0HLTFzqnPf6wE?=
 =?us-ascii?Q?lGbkvmUAh298hCNP7nk1dU/vyjtRC1S4Tjz38++ijT/0iFNSrYYhWZvKkMg1?=
 =?us-ascii?Q?BVQ0slO2EHWaSYqvL0Nwa0WjJ4rHZhQu61IKl2nGk3rU8ZwCYbPEvoSWgAmS?=
 =?us-ascii?Q?EAAG4gqE/QyOISYLW7GMSGjwJ8siQYsfvkDvGXM2GpwuWiry3JshhhWDKIu+?=
 =?us-ascii?Q?8YN6MAHZClTWJ0fZbv2xEbZJqN4ReMhZwnLI8KLtv8Vm9TD/LIQi+0Vl7yVy?=
 =?us-ascii?Q?uvGb3ty/3L8+3CIBgTsT4/oIhwWM7y1arz7wOh765HP9cpPyGwMVDB4ujaJd?=
 =?us-ascii?Q?fT6AYKOWdL12fpr7qjZMX5GbjHGU44d0EBMpkqyTGMLzB/2Fr2WXZ8ZYwGK9?=
 =?us-ascii?Q?T3r5pRgzmBX4v6ggAWreziK3kUV6T4Ehk+bS6c0dXn04rvLkdrdCO5VT45s4?=
 =?us-ascii?Q?DVuXp6KWndaihE6fWhceKQjhJydMPvFzgJtXIdVCPAuCq1tQ0IE/qBRexpn/?=
 =?us-ascii?Q?1gG2qPXnLDaAvmBTtzOwUQudYOh48TC8uCxqgVCUFBEFjrj/CxJ7vz/Y0uWL?=
 =?us-ascii?Q?jgtgiXIFqX0L2l97f60DB07MAXsXJYwr0eUxhM4NeEgJlNuky+MltSBUHpdq?=
 =?us-ascii?Q?D/SgxnUjgxM4xEvbm1R1D4Hh+uNxSejgZ1n171oNj/fq+eTNXR7jK0Kncnze?=
 =?us-ascii?Q?4gY+n/Pzak3oYOUGBdRlchgI5UgXZ543c66w+hI6IrO97vcvSQgm7+84xbev?=
 =?us-ascii?Q?yzKm7GZ63MgA5zemFP58P4/7ZD21826Is+G9cDL8BzTL3vFLkzot4LOi6j5m?=
 =?us-ascii?Q?9gZcG6x0I66dH7uFSvGzvA43wABXX73Oj4rYZ3gMjL3v4cgSnHvttXE+vjLD?=
 =?us-ascii?Q?EU/+mK5rl7MHbnrcoKp5UrZqYcTYeXP/ahZgT+QcezR6G7GI0inCIshdJwN8?=
 =?us-ascii?Q?cVxVT9XULDD6nMw2lBcHj0WaA5x3rb+qzBX2aOw1t3LLnYyBedmKMsScOcyD?=
 =?us-ascii?Q?P6KDHXqkzZzjcNpnMarMO7ahX4QzeyD+5Nvv5ZROKH3J7AJmlnA/p9RZCVo3?=
 =?us-ascii?Q?uUZfD9vptP5Ez3MXeFy0VIfAHKJ5gagh+8Y81isgra9x8qhDOG7Fv7VG/ghp?=
 =?us-ascii?Q?E8BhWmVa68QZsbiYbaXb8FMYOegr7PEP0RdEg7tEIwIFM0g1h/xWWx8L1J+C?=
 =?us-ascii?Q?e3rCGim7Ppvby//jqEeKTUfWV0smPATlfjxV9jwE0Mwp6WQrAxCxnL4LtdEK?=
 =?us-ascii?Q?Ey8EXVj7t5VjfRYJ3BLGe6VXGIfE0WhIycqDRT2fozdfi0whiWTHJYb44Oz0?=
 =?us-ascii?Q?wU7YRkWKtcXeYpsTKD+vOtD7rEhyZ7tEl8eJwL04yYuCyVB/VwLBUD9AecJa?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9133ceee-6b7a-4a96-2dc2-08dd656c155e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 15:55:04.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWtGQg6SLfX6UdlVlvLHMXee92CoLHO3JeW/wYZ2A7B2hy4F016KrMyIgPVEb8mq5MKp8UFvxMeqaEshdRJgfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8956
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 01:38:24PM +0800, Wei Fang wrote:
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
> index a3ce324c716c..ecf79338cd79 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.h
> @@ -543,6 +543,8 @@ void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes);
>  int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
>  int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
>  int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
> +int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count);
> +int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count);
>  
>  static inline void *enetc_cbd_alloc_data_mem(struct enetc_si *si,
>  					     struct enetc_cbd *cbd,
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> index f991e1aae85c..53dbd5d71859 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -693,6 +693,14 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
>  	queue_work(si->workqueue, &si->rx_mode_task);
>  }
>  
> +static int enetc4_pf_set_features(struct net_device *ndev,
> +				  netdev_features_t features)
> +{
> +	enetc_set_features(ndev, features);
> +
> +	return 0;
> +}
> +
>  static const struct net_device_ops enetc4_ndev_ops = {
>  	.ndo_open		= enetc_open,
>  	.ndo_stop		= enetc_close,
> @@ -700,6 +708,7 @@ static const struct net_device_ops enetc4_ndev_ops = {
>  	.ndo_get_stats		= enetc_get_stats,
>  	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
>  	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
> +	.ndo_set_features	= enetc4_pf_set_features,
>  };
>  
>  static struct phylink_pcs *
> @@ -1108,6 +1117,8 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
>  static const struct enetc_si_ops enetc4_psi_ops = {
>  	.setup_cbdr = enetc4_setup_cbdr,
>  	.teardown_cbdr = enetc4_teardown_cbdr,
> +	.get_rss_table = enetc4_get_rss_table,
> +	.set_rss_table = enetc4_set_rss_table,
>  };
>  
>  static int enetc4_pf_wq_task_init(struct enetc_si *si)
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> index 4e5125331d7b..1a74b93f1fd3 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> @@ -299,3 +299,17 @@ int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count)
>  	return enetc_cmd_rss_table(si, (u32 *)table, count, false);
>  }
>  EXPORT_SYMBOL_GPL(enetc_set_rss_table);
> +
> +int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count)
> +{
> +	return ntmp_rsst_query_or_update_entry(&si->ntmp.cbdrs,
> +					       table, count, true);
> +}
> +EXPORT_SYMBOL_GPL(enetc4_get_rss_table);
> +
> +int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count)
> +{
> +	return ntmp_rsst_query_or_update_entry(&si->ntmp.cbdrs,
> +					       (u32 *)table, count, false);
> +}
> +EXPORT_SYMBOL_GPL(enetc4_set_rss_table);

I don't understand the logic for placing enetc4_get_rss_table() and
enetc4_set_rss_table() in enetc_cbdr.c (built as part of fsl-enetc-core-y)?
It's not core code, it's used only by NETC v4.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> index 1a8fae3c406b..bc65135925b8 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> @@ -625,6 +625,24 @@ static int enetc_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
>  	return 0;
>  }
>  
> +static int enetc4_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
> +			    u32 *rule_locs)
> +{
> +	struct enetc_ndev_priv *priv = netdev_priv(ndev);
> +
> +	switch (rxnfc->cmd) {
> +	case ETHTOOL_GRXRINGS:
> +		rxnfc->data = priv->num_rx_rings;
> +		break;
> +	case ETHTOOL_GRXFH:
> +		return enetc_get_rsshash(rxnfc);

These rxnfc commands seem implemented identically to the corresponding
subset from enetc_get_rxnfc(). Rather than duplicating those, could you
rather return -EOPNOTSUPP for the unsupported ones on NETC v4, and reuse
enetc_get_rxnfc()?

> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
>  static int enetc_set_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc)
>  {
>  	struct enetc_ndev_priv *priv = netdev_priv(ndev);
> @@ -685,22 +703,29 @@ static int enetc_get_rss_key_base(struct enetc_si *si)
>  	return ENETC4_PRSSKR(0);
>  }
>  
> +static void enetc_get_rss_key(struct enetc_si *si, const u8 *key)
> +{
> +	int base = enetc_get_rss_key_base(si);
> +	struct enetc_hw *hw = &si->hw;
> +	int i;
> +
> +	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
> +		((u32 *)key)[i] = enetc_port_rd(hw, base + i * 4);
> +}

I would have expected that this refactoring of code into
enetc_get_rss_key() would be done as part of the previous change:
"net: enetc: make enetc_set_rss_key() reusable".

> +
>  static int enetc_get_rxfh(struct net_device *ndev,
>  			  struct ethtool_rxfh_param *rxfh)
>  {
>  	struct enetc_ndev_priv *priv = netdev_priv(ndev);
>  	struct enetc_si *si = priv->si;
> -	struct enetc_hw *hw = &si->hw;
> -	int err = 0, i;
> +	int err = 0;
>  
>  	/* return hash function */
>  	rxfh->hfunc = ETH_RSS_HASH_TOP;
>  
>  	/* return hash key */
> -	if (rxfh->key && hw->port)
> -		for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
> -			((u32 *)rxfh->key)[i] = enetc_port_rd(hw,
> -							      ENETC_PRSSK(i));
> +	if (rxfh->key && enetc_si_is_pf(si))
> +		enetc_get_rss_key(si, rxfh->key);
>  
>  	/* return RSS table */
>  	if (rxfh->indir)
> @@ -1249,6 +1274,11 @@ const struct ethtool_ops enetc4_pf_ethtool_ops = {
>  	.set_wol = enetc_set_wol,
>  	.get_pauseparam = enetc_get_pauseparam,
>  	.set_pauseparam = enetc_set_pauseparam,
> +	.get_rxnfc = enetc4_get_rxnfc,
> +	.get_rxfh_key_size = enetc_get_rxfh_key_size,
> +	.get_rxfh_indir_size = enetc_get_rxfh_indir_size,
> +	.get_rxfh = enetc_get_rxfh,
> +	.set_rxfh = enetc_set_rxfh,
>  };
>  
>  void enetc_set_ethtool_ops(struct net_device *ndev)

