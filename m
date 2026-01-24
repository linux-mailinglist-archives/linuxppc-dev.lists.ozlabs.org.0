Return-Path: <linuxppc-dev+bounces-16276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGzXOEncdGko+gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:50:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA17DDE6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:50:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyyQp18kjz30M6;
	Sun, 25 Jan 2026 01:50:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c407::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769266241;
	cv=pass; b=KeMv9C1tSXe+HT9wP0X0tWeHMsB9LcHHf0/VSs5h/7kb6fCcqAoic3+YyNpXrWK2zgCLp7d36Q7cM0R6PRgzOZbSSa67Jddl9pXZqiETULM7P9hLKmo0z4OYUfo0+ceE8+yrFlUx6n4XoLpBxI7RfDOOASDtqqaxRuWp4ZaYTH1RXFTXqpOXT9iCMn0HMzSWafuS4evjwcmscGH8CsI7kQZk9C3PP8rsaxKa4Cm5HaGZhUgyQfI3Ze0c7LMsgUjiMhmZMNtaVPEBuEs5ut0nEZnN9M6u8wnw0GRStTVfY98YvNWcZ90vG83RErL768LTM3quDt3QCbyAAffKtLKgKA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769266241; c=relaxed/relaxed;
	bh=vEzHc0VI8bGBMWQhyZjB/BDURylEtL2z6TI3n+xTPXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fyJU9oQeG43nL73sNw5s6lKp4LucNkqY6xvulmQUcZxfo7AvUMVZ+rSKFzX93pI4FcvrSttLKjEUf/83gcqE4XawncA/zcuWMk6t1Z4td4oQoR9ZEXxdY7Fd+zrrg4Aa3f++X45tvstjRoGN8f40cA7dJ7DFzgNF65QM8OS4VxPuVq5Y9IcB09YJId24zboQUv0y4xgxA2lDUl4HBUyEI+iQaddssiGzHzLXfwrRsyiy7z/tniMRMdTnH8q+X1Z2JQTIlSGbAuH1oFErcsy/nhZ+9uj46PrOSZBA5Nz3pJfXWiF932mKaaDippmumo485kuYOYmkXrekvHLL0WaBVQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=kdFmp401; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=kdFmp401;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyyQn2sCpz2yql
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jan 2026 01:50:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuhKgPZOjBIa5D1O/W5kZVt8YTpYOmlYBHewjZRInzDv3T2Mt0zGJE8nV0MBOaj6wUDMK6kLYxwlAW2vE5Ta8ZeX4MBQ3xUjIzVe8SzgVNLwbSuzltLJSq11Ut8Pe+r/D1ykFceNc65AlIW9R8OtCiz70Fw5NDUMHzEtsvQJjoJSC83ENK0wvC7ttYz4uZh63tFskRP8G7ezbkroFhBezXDy40lQmWBi90ThbOIjVC5g0uAJd7szJUMjSkj5mTVd1gzDMTNfIXtKmvCJTqxrN32qWW/3LREbLytAVEUO84C6Hn+MXbB08w6PctwKF0uqPlEVyoZ8xStWjZX7E4iXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEzHc0VI8bGBMWQhyZjB/BDURylEtL2z6TI3n+xTPXA=;
 b=TEbyZS9rJe7n7sCrix+e76ULOj+GqosoWmWLq0ljFCAqhJTEe+p2pltIW/FhYSTfzcDHXdGb2X2nZsx+zZKb5AKGki3nw4v6FM2833J2cLvgH1iXOy0OOAQwuz7hKW1SQgZ2Eo8rYweJPTdp//DhGDqbGAbiptWNi+KFG7FipxE0r2SxiL87FYq7mmTMW/kd5OdMmGYggplRKVHQWg9GT3WlJVeMXNOQ100dE1HZ/Q6D27B2DxU5D3TZdgMTVxpRbQqNBGzX+LQ7Tc2/lPS5oE8NfjgHWT3/KogILlB+w/ATUsnPoz1tnlwKWnshJlN1g1GxQeQvnhs8jmPzgDhlCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEzHc0VI8bGBMWQhyZjB/BDURylEtL2z6TI3n+xTPXA=;
 b=kdFmp401mCSOfv5puq9FC+2GBtrouoDieUB2ic8ST6w8CFRXQakpFHu2aTc451HDsJ2qhfWYHXkf/sf/49Cq0cGPlJjCZO74Ed/r4n3vafIxQVGDWabFGRONwmw5Lksd9SsaIw/VjmSVgMTgiUcmRTQ1Cz9gpNkqmJZpUYdqDY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:18 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org,
	Frank.Li@nxp.com
Cc: vigneshr@ti.com,
	s-vadapalli@ti.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	jesper.nilsson@axis.com,
	heiko@sntech.de,
	srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	kishon@kernel.org,
	jirislaby@kernel.org,
	rongqianfeng@vivo.com,
	18255117159@163.com,
	shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com,
	vidyas@nvidia.com,
	shuah@kernel.org,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v10 2/8] PCI: endpoint: Add BAR subrange mapping support
Date: Sat, 24 Jan 2026 23:50:06 +0900
Message-ID: <20260124145012.2794108-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd2b301-b911-4b62-7284-08de5b57e40e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+5GoItwcbscs9wuAdv2EuSabtLmArrII/fvY7vSGkC384nx/OkqGe2ExJWGq?=
 =?us-ascii?Q?fcLD9UCUuzVAXtDUlnZNJlVSe2fpYbigYkjxODB5gAsjUhLNKEvD4/i/Z/Kw?=
 =?us-ascii?Q?QImYOdIpErOTbTvxRF/jlgwOaAvyBG6q6Crv0dd9yUtyqYLxuQ7Pca0Ja5jF?=
 =?us-ascii?Q?6gXBVUuYKuqCrPQL3oMdK/lrV1b0peJt6c3u+Odv6X5RlQwA+Q531NEXUd1z?=
 =?us-ascii?Q?CuG+QpCpGryDd9yFQqPArKHQDGR2bZmlkebQ2Lgkp/N1K9Ri2vayENyMIZWb?=
 =?us-ascii?Q?g8R+8ephY6QBJZ+Qy+I2UHUkg7SrRPZHNnIU8SbH50vHTw3VYPNzjnFn34ZN?=
 =?us-ascii?Q?psCfHCR74WnCWzCQcTAymjkA7vp13PnBSeo5UkU707zwNI1f/1K03sgIcwZg?=
 =?us-ascii?Q?Vbv/eS1mNQ1rFKf2QD6xb4g+CyYL6y/LCidcanAlvSE57iYyVvP1XUK/lUaK?=
 =?us-ascii?Q?yb54veFKH9tS+HE1brIvJO1EpIvkj2m1H4aQv4lh4vd387apP5yYkDEDRQjQ?=
 =?us-ascii?Q?x3MWypBAHr/aIRX7mq6Ebzqbf3QYgUoWo/0okdCn9YIUHxc8qZRhJasGZcFv?=
 =?us-ascii?Q?lmvHtMbLhSoX6q3uGX7c+l1w9N8p9Ko1XfXQMt6SLzJpI0+NGhNLmXvlDU95?=
 =?us-ascii?Q?S+DyJSTauLOfbR1wtgN87dJE6bPl688KjQ3kRtEUCdLrPngprBRLrL7aDKki?=
 =?us-ascii?Q?wlQ+ccfX1bJQiGZaUVvws1gzUIib/8bxDi3Bmi2RoRbDKqPJJqppciGNyuw7?=
 =?us-ascii?Q?VIbjoEi2FL2GZbilkjiClfxHFrMGxky7VxlgTdPZxeh/6D2SZfsLtuEFQoIT?=
 =?us-ascii?Q?c1Z61XR+kB8/UrO0zsapFAUZgoYl3/a9am2IDMFRhwmj7lO8Fyz1I3rMhSFZ?=
 =?us-ascii?Q?oqHvapy2tlNy0JbtygyY9kKZZ6bPCKmnAXhTsatDhxtNKy8UooYMDx3Fo52d?=
 =?us-ascii?Q?/nL30gDMBAe7ErYCS1SVRPZggXC4yTIurbFBYiJZ9IVoCybsFHcEvN5HfMEy?=
 =?us-ascii?Q?/I39NRV9mNoH8GJI3TTQeeCt+kezrK+9MrTGZa3Vypp2CQ7IMwdYAn73Ko8E?=
 =?us-ascii?Q?XgWPQ/qewSQTHTZoI+/bR30j6TgIh9xEEQppSzKKgtaQKOYxIkBRmGGMZWRE?=
 =?us-ascii?Q?OPIzKJwpkV3viCd7BGdsvRzerjj6ANZOeyaDer8r6S8Z9/96U5QSXSUUHibG?=
 =?us-ascii?Q?UNbfkZXfD9SQIuiIXQtK3vsHNHTFY7GmShJt1vQ2/Of0NZunMLpQCk5Oushn?=
 =?us-ascii?Q?3RjZjXjhKODGw6ow2pvUhw5Giga2+HNdyXEelPmwmQEHSP3zfhS+5eWxhl4D?=
 =?us-ascii?Q?zBL/3G14toXcDatg5/8iuVC5FqJB5mCRUZ+J8EQ0celWGCigQYwfWR5drzb+?=
 =?us-ascii?Q?LMDAy0szNQORH4k8o8sepg99rf3Gj9XhMc7qRXPdCKJW4N8zZpvTtPbpiX0K?=
 =?us-ascii?Q?8O0VMtQXnoRTJI7hwL0DLlcEfqJ3Ncy4mW3VFjg6qLQ75SrXcArIDjuzeY98?=
 =?us-ascii?Q?Wm2P8sLEFmTMwLdNMSV6mn8xujOa8rG9LHzlkM4jwC5cFgRgiRJsLPrTw1+O?=
 =?us-ascii?Q?Z5ipPBMEZYR6E4q5m30=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1xtyP7rUBqsC5vo2pMhS6FLP359o9zrB9ymETcIYifUlvQ8J2pJFDuKX5XvZ?=
 =?us-ascii?Q?jJ83J1IvsXEqANYHclG0bJkQ3n7l56UfrFSDg0vViXqKetL1Q1BAlmNEbSzv?=
 =?us-ascii?Q?zKTtaC92Q6R57Rb/SJDlDOv0viVrxuuW3b90LPyVPdfPiYR7hJ42+WacgBMb?=
 =?us-ascii?Q?LK7VCammAqybA5FOASMYjZ7o2DELSNibzP7UBq0HUMnbQOJVEG5WE3+mHmVb?=
 =?us-ascii?Q?QcjUOMoPxORiq6ILMDqlzA2cskSzOSJSgGklOzNvwQ3uu8D7FDUdoyByK1CJ?=
 =?us-ascii?Q?JWJlpt+Oi5/5CJT4ddFS8LbXBBS6wAl6FR5StUvNIHCGRM/ecR31gLV6LQTA?=
 =?us-ascii?Q?Q9VjA3fflB6icOkAG0nZcQqFjFldgzoFV/NZa4Fd7CvCpj9MYyoT5+AyEZRs?=
 =?us-ascii?Q?8r5bkDTQSLN0f2Ivu5MvdIZYzyFALwlYEIVEsh4vBsQy45F9S93qvzLnVj3o?=
 =?us-ascii?Q?KSg+rtv6ymhvkFlqdqx57ZrSmebO8fSUD1GFS9p7PaPiJIImdL+6dFOvP8r3?=
 =?us-ascii?Q?wBQH1CKE7z/ans+MafgLscLS8SUW3cGxUQyqJkHARnJPUp+8iQJ3rX7XJcU5?=
 =?us-ascii?Q?f/h3eP9UpPtfcXHDgOJZUfLXn9v04z6GtJnMaYydu4P8faxsBvK3cbUVivZ8?=
 =?us-ascii?Q?/9mx4MxJ/dBTqphDbRv92vmk0Ob6D14Y5n0fo8/y40b/i/BY82jonJwVNe5D?=
 =?us-ascii?Q?5p7LrWPxeeFg/HRxd4Z8MIhzvf6INKHPDaKZejE9FmryiQKoWPHpwP6Rx+Fq?=
 =?us-ascii?Q?4LMf6uYBv9IEFljTxAcqLgzSY+gnIadYXim8NRs67PGlBdIuSSchaAXWkZno?=
 =?us-ascii?Q?CbvhkNGgzmQSZ2u0aJIF7n1x8huKuaqzNCU49fOSXp70f8YYEWRw3frzOdUj?=
 =?us-ascii?Q?vboJUgCl5QEvJYiWRGcYU+awf6duHkj/Sy/9YIlx3xlVwxG+olSsXK+p3v+w?=
 =?us-ascii?Q?yypDbvG6xg6ie+gHguqAgl0en8LeJleBadFC3ALbdqW+G9nsvrEjNEKqTZiq?=
 =?us-ascii?Q?RY/jrRUJgdxFf6I7zqqkfq5XM9QfV+5hau3SmcQ51zn6HBtyJnHDigOu9sSf?=
 =?us-ascii?Q?W5DZVCJUFdWLlZE47c7EpSVZEmyqGoy5+pC0fosLLjUXvXKGqureFUvPbecf?=
 =?us-ascii?Q?R1iZYTmoMjlQG5CIZTeAGKyPYWrEq0hL6F6RAEiTOi5u6n4P/pvGIjv3SCpp?=
 =?us-ascii?Q?jTWWYmeojtZIxpiRYPzcF+FishO5tgKDksOaMsIlGmmvgOHKHLVv+52z1QbV?=
 =?us-ascii?Q?nrMZZsf0yyn8IirGQ2oZIlKD2xxRTFD/31Ef/te7Z3NPj5frcoqT0cj6UbZz?=
 =?us-ascii?Q?gSKX5C4dP6ECaCSBWHwf/6AR7NjYTbVapPMS7lGHqj4rx+6PinAW9jMGQnB2?=
 =?us-ascii?Q?R9N9Fh5QI9OGDCy351pCDvVx6EWM+c7Qv6LVtYlJ+PmSa7QDhbMOs+95j9pf?=
 =?us-ascii?Q?WYa1z6xfknwMm1cuCOr3mJpK5SE3frvKPb/3hzc+yyEAH3OP9m8BGVb+4roH?=
 =?us-ascii?Q?GJpBvJjMBvIoNp2JpQCLRMOFzAbct7yE3um04sq1FP1Zvw5Fatg21kITcSdj?=
 =?us-ascii?Q?qawf0b++kG0IzhDkQHvRlEuAF2iYS0SQZKgO3ijcR7YMsJKRQkP50PEU2Jvz?=
 =?us-ascii?Q?tJIZXHY1B/c4vaohN5RA3avd2qh8AtBHj7EufbPt4+5zCFUkJz5NHKWUbbj/?=
 =?us-ascii?Q?L/bUbrj3y3ViHST6bzR7t0FoS3h+M4E41IxlMKn9DITE5l0fk45/wd6RiDhS?=
 =?us-ascii?Q?VLJ4EmXZnLdgBg+Iyqte1XuKdzEVME3jiGVPpauQDZ9s4UiW2vvt?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd2b301-b911-4b62-7284-08de5b57e40e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:18.0075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3k6kijG2ifnFL61Bnz7HQnsv6Lc8B1zgkrt3mvTVLjR3zR2x2JKD29G0j7tTRWmPxizpNVuZ9CWoi7t1G6Ic+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4692
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16276-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:Frank.Li@nxp.com,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:heiko@sntech.de,m:srikanth.thokala@intel.com,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:kishon@kernel.org,m:jirislaby@kernel.org,m:rongqianfeng@vivo.com,m:18255117159@163.com,m:shawn.lin@rock-chips.com,m:nicolas.frattaroli@collabora.com,m:linux.amoon@gmail.com,m:
 vidyas@nvidia.com,m:shuah@kernel.org,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@axis.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_GT_50(0.00)[55];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:dkim,valinux.co.jp:mid]
X-Rspamd-Queue-Id: 4FAA17DDE6
X-Rspamd-Action: no action

Some endpoint platforms have only a small number of usable BARs. At the
same time, EPF drivers (e.g. vNTB) may need multiple independent inbound
regions (control/scratchpad, one or more memory windows, and optionally
MSI or other feature-related regions). Subrange mapping allows these to
share a single BAR without consuming additional BARs that may not be
available, or forcing a fragile layout by aggressively packing into a
single contiguous memory range.

Extend the PCI endpoint core to support mapping subranges within a BAR.
Add an optional 'submap' field in struct pci_epf_bar so an endpoint
function driver can request inbound mappings that fully cover the BAR.

Introduce a new EPC feature bit, subrange_mapping, and reject submap
requests from pci_epc_set_bar() unless the controller advertises both
subrange_mapping and dynamic_inbound_mapping features.

The submap array describes the complete BAR layout (no overlaps and no
gaps are allowed to avoid exposing untranslated address ranges). This
provides the generic infrastructure needed to map multiple logical
regions into a single BAR at different offsets, without assuming a
controller-specific inbound address translation mechanism.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/endpoint/pci-epc-core.c |  8 ++++++++
 include/linux/pci-epc.h             |  4 ++++
 include/linux/pci-epf.h             | 23 +++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index ca7f19cc973a..068155819c57 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -596,6 +596,14 @@ int pci_epc_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	if (!epc_features)
 		return -EINVAL;
 
+	if (epf_bar->num_submap && !epf_bar->submap)
+		return -EINVAL;
+
+	if (epf_bar->num_submap &&
+	    !(epc_features->dynamic_inbound_mapping &&
+	      epc_features->subrange_mapping))
+		return -EINVAL;
+
 	if (epc_features->bar[bar].type == BAR_RESIZABLE &&
 	    (epf_bar->size < SZ_1M || (u64)epf_bar->size > (SZ_128G * 1024)))
 		return -EINVAL;
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 4c8516756c56..c021c7af175f 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -227,6 +227,9 @@ struct pci_epc_bar_desc {
  *                           inbound mappings for an already configured BAR
  *                           (i.e. allow calling pci_epc_set_bar() again
  *                           without first calling pci_epc_clear_bar())
+ * @subrange_mapping: indicate if the EPC device can map inbound subranges for a
+ *                    BAR. This feature depends on @dynamic_inbound_mapping
+ *                    feature.
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
@@ -236,6 +239,7 @@ struct pci_epc_bar_desc {
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
 	unsigned int	dynamic_inbound_mapping : 1;
+	unsigned int	subrange_mapping : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	unsigned int	intx_capable : 1;
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index 48f68c4dcfa5..7737a7c03260 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -110,6 +110,22 @@ struct pci_epf_driver {
 
 #define to_pci_epf_driver(drv) container_of_const((drv), struct pci_epf_driver, driver)
 
+/**
+ * struct pci_epf_bar_submap - BAR subrange for inbound mapping
+ * @phys_addr: target physical/DMA address for this subrange
+ * @size: the size of the subrange to be mapped
+ *
+ * When pci_epf_bar.num_submap is >0, pci_epf_bar.submap describes the
+ * complete BAR layout. This allows an EPC driver to program multiple
+ * inbound translation windows for a single BAR when supported by the
+ * controller. The array order defines the BAR layout (submap[0] at offset
+ * 0, and each immediately follows the previous one).
+ */
+struct pci_epf_bar_submap {
+	dma_addr_t	phys_addr;
+	size_t		size;
+};
+
 /**
  * struct pci_epf_bar - represents the BAR of EPF device
  * @phys_addr: physical address that should be mapped to the BAR
@@ -119,6 +135,9 @@ struct pci_epf_driver {
  *            requirement
  * @barno: BAR number
  * @flags: flags that are set for the BAR
+ * @num_submap: number of entries in @submap
+ * @submap: array of subrange descriptors allocated by the caller. See
+ *          struct pci_epf_bar_submap for the semantics in detail.
  */
 struct pci_epf_bar {
 	dma_addr_t	phys_addr;
@@ -127,6 +146,10 @@ struct pci_epf_bar {
 	size_t		mem_size;
 	enum pci_barno	barno;
 	int		flags;
+
+	/* Optional sub-range mapping */
+	unsigned int	num_submap;
+	struct pci_epf_bar_submap	*submap;
 };
 
 /**
-- 
2.51.0


