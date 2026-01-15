Return-Path: <linuxppc-dev+bounces-15855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF58D254C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 16:24:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsRc13LJgz309H;
	Fri, 16 Jan 2026 02:24:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768490673;
	cv=pass; b=XGMAxIgL/7HPp08/Fz1kLRSUwNcstj0RgBRMLmKTCceDRaSFo9BfFNPvZ+hlivJ9Rqxrw84bFvbWSsdJgezUHCDqqU/Oy1vxL87BKdrUtIR6K3K3rIrZSwLhv0WFU/C1z6TbMu2xtQSDOgDxTHpsEQrVNXdyyi11FxiLFjBehNLa+PuOVoDMTNHWTtMy8FJYVKCwxEwCzE8I6YRy7V1kBebDSz43nqlesM29ED++wXas3bBlQn1fXBPYrZUrLkGw/3bJdtHrYHeLKDx+oNgKPlEznougQvBC/gq3CuijTDJzZq7ItuO1jweEGTmmptmeDs+/0sSqDrRc+mt808xAeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768490673; c=relaxed/relaxed;
	bh=+hUgYjH7OCHSFJB6K819F9UmTPlFrHa18xEmMODxPk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EYb6zaqp6LgwWr0VA7Lj0IXUwKybgvFb80kSLAq6uVKC8/nYzbwNHVeTcZVKdfqaU3bpGwrYmBbS270bRT2TEDewiFyb8ZMkHLTwaWgT+4etaB889x28QlvDJrS3s50vrR0xRvBQ0gWdKq0gMSNFBSl3S37uThJNSMxGG/Kb2f2+9id+BlS7tdbpMQGCRKVKHCvum1HoYNRz85PX7YlegyFksTX5DUdf8qdU6DHNUSYh5ayTTP3vp9FrCGwlYA/Z13uTbWrxs04jNBPSViicRxN7M727EcfGCDro6xcm6alnTaah3ADrU3MbjE9sP9pwI1bTy9Zjf9d4et407AeSeA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eJQqDVLN; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eJQqDVLN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsRc03QQvz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 02:24:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmIMQ/gFliVjMFiRBq1mbQr0xraGi72ISGKI7wHBeRSgjSdIfJzyaot29N4V+tGbeH3ejwnRGD5RKoRvZQhvtMDTXzXA1vduZR2yOZhyJ1un9n9R+ghQI2nc8dfDt3lzERpgPzOMrIN1UCJ2sBsfbVD5jyYxLmIYto7DFS3KfaUITIGdqTbeYSdDFzMeKvegtCf7jIdCTHga+VbgPxDwXJT4HTTort9Ugpe54b6MgG2F/Hpxlnjd3w37owZt9TdStkwpZJbNuKBbrx/2ORPbFpMLSW2Lt5S44G61qzbIoe+yzJqrvzk2PXD3m3NwKOZ66LeDzKN+WIqb9xxXxfHprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hUgYjH7OCHSFJB6K819F9UmTPlFrHa18xEmMODxPk8=;
 b=hL/ZvTRHO2QA8WdLQW8ZVGlvsFUpEhCFyP01ns4a1nZBwNKKDWdNRdyjuCE72cAaqMaCxP/2ZptAcUyhHHhb79vU9KF6ngbuvSe+36MXCPQjrgcYlisCybiLko9EvDPEYQ3O/PRFw6KaPnTyaYyLLPulnCXPteV+h2f4MlelLMC+VT4aj3Kxw3Oytn8rfw5c6lyA02QHGCBsmr1aXWpt5h+Lz2QOYp9o1Ap+q6ckAr45O8xjT85evo6Ox5gRN9PV1Gl+WgN6Pnyv+udDiR3YLZSNKIc9XXp4eOBn8Vk5ETD53q4v8KKYX0KJ4JC5QcFrjiSmLo06KOLZjR+3HH7Qnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hUgYjH7OCHSFJB6K819F9UmTPlFrHa18xEmMODxPk8=;
 b=eJQqDVLNBkQShyy8zz6kfd/nE/KI9To2cYfQJxnV99IdUdlIzOqQq1ja9G5mVq3LlvNPO6zXJYhzvDdZiYNqEkoPLr6JTEjy5F0R5EBHBe7STB4nb9vvvo2MEJgKjCJMK5TlD7iuDfYWFzoedtk4Lf0QwPHkDuyBPDQDZVJ15LEG/y1WTb56P66NVBktJFVsfaCFnSt/Xsju1y3oAw9Evdu8zJypL1ny92CyLEtGgrM0UDZSk3B9xFku19T0bUfA47rjxJkyzXAvrROA9y+mSZTRI+sqnVe4OlWrFcoXq6t82fqEr/g28Q4UE/89+12w8pjwtpeU+YzjKoqTFdNPtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by DU2PR04MB8662.eurprd04.prod.outlook.com (2603:10a6:10:2dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:24:05 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 15:24:05 +0000
Date: Thu, 15 Jan 2026 10:23:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	cassel@kernel.org, vigneshr@ti.com, s-vadapalli@ti.com,
	hongxing.zhu@nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com,
	jesper.nilsson@axis.com, heiko@sntech.de,
	srikanth.thokala@intel.com, marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	kishon@kernel.org, jirislaby@kernel.org, rongqianfeng@vivo.com,
	18255117159@163.com, shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com,
	vidyas@nvidia.com, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v8 5/5] Documentation: PCI: endpoint: Clarify
 pci_epc_set_bar() usage
Message-ID: <aWkGhPM3WRK+Xq+C@lizhi-Precision-Tower-5810>
References: <20260115084928.55701-1-den@valinux.co.jp>
 <20260115084928.55701-6-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115084928.55701-6-den@valinux.co.jp>
X-ClientProxiedBy: BY3PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:217::22) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|DU2PR04MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd74b9c-e802-427a-b22e-08de544a1e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c6ENE8n5Hc1Xjx+7u7TsVLXN/UPBYFdpjh9LoCzxNjH8mmH+QrYj7NgVgVKt?=
 =?us-ascii?Q?XRzFdRWqWZcBWw8rEWgHzj/EioXCb92fWL12p4XgwCLM6qRZPJLG5QPNwJJu?=
 =?us-ascii?Q?ugFABMUdI4MqcXRmXTu3jpVE6V/uOhmr1N2BKjFkxJ8Hmak4TaJSd5gjKg+y?=
 =?us-ascii?Q?SdOESSL1uGv7W2tcEKMDXCrFvYvGWfdxFNA2C1U1bHmS4NE1zjrofg3jcm0T?=
 =?us-ascii?Q?uKjgdwhVHHlWeW3j/2+wIXq169U53LC3DKx7LfbzIGjyUDhCboIeAzp4nOmx?=
 =?us-ascii?Q?efkwPRo1wNRmWeuVGLJV/5uPoX/SL4ImZ8DGv8qhyBpQdAJleMfU6W7kDRVU?=
 =?us-ascii?Q?7t7SKyhtlyVH8JrmyhscWbaSl+aezSnMZPzxmt1BBhw4eL8glZ9V60n2oEQN?=
 =?us-ascii?Q?GG9OnEMmdB9ekWkObk4P06QOHlnNHS2V8L4xQVnaRjV1S6k/2R7KgSS+XQEK?=
 =?us-ascii?Q?Q2GroyvXa/08X64Vwksieaz+EXDZWMsQtFzhi/TB/nb0WQ5MXPRUlKHXbteF?=
 =?us-ascii?Q?owm9q3r+J3w/NyRT6pvNWIoPAYFj6A2iOKFihfz/AafKC6GjBs1+lmXIZbbK?=
 =?us-ascii?Q?pvKo7MQl9EDah/9McpvN4KZR4hk6RpwxD1lDH0BpOj4jQgp6ZHlRnb6oKfu3?=
 =?us-ascii?Q?NWss+5KZhpeJBTsRrxCjUghhGwCZmP1wulAWquDliS9rg3ziQ05qDhlK3kLT?=
 =?us-ascii?Q?R6nQ/XLYt09KC7xGOJVdlU8jPb3bmtLC3EHgDqGQJo106WHt1rvHcUb1sz4Y?=
 =?us-ascii?Q?/bD47xjfDx7ypC05tWopCxbZgbS0nVMEBWuiiA3WVOAD0OhIQAROWZdO1ico?=
 =?us-ascii?Q?Ipj3TJh/eSRJVmyfflL4quusCjedcrJmy7tqKBm4UYyH+seI50AF/zzQFg5z?=
 =?us-ascii?Q?t7sy3/Ey4bzqm+8Jma4iTmRDF0tTOa2B42WXr4MvKkJHl7vNVck++7Zcnfkd?=
 =?us-ascii?Q?diZWw/hx7B0rKT92c3j3PIeMGP5vMCbWJ3DuFE6NPAZO3lZz4V1XviPTxI/m?=
 =?us-ascii?Q?ZAfJNJ0StIlsh34l2aaaEZLd34UOzVZ9LDpHr//cGStFT3XAqa2M8ldxktPi?=
 =?us-ascii?Q?4W6LzYnrl5CsWfn79ZHUaXT08V/grAihyPZUmpaNavemTIDvhuYIv9qML4Yf?=
 =?us-ascii?Q?B48gtSqvYgwPyfKnUKhMLDTF4cap/tvJhK4utlD4LseJqZdKZSg81FIGnFf3?=
 =?us-ascii?Q?qf8ILoGOJqf00DJt8u1pOOIr3ciDBEWlF3fZGxGTPTlz4O8XFApJSw4yX3f8?=
 =?us-ascii?Q?x3df+X0kmuLixScHCCWx0RQNB3g54VsLPjVRvQwuss3X1Ad35Ki+jHQkOTM4?=
 =?us-ascii?Q?5SrNkmbrM2ZDi+Z18Dxtlh7z8n50S0HdnqffSAB5dCV1HuOCGOWxnmH0WuP1?=
 =?us-ascii?Q?dt7VMQNybRxaZxMT7SeJQCe16nb1VCk564fjHL9OA0BEbVioFvECpVx4FssH?=
 =?us-ascii?Q?lupq8u0cGgfctt59us4jJr4YnivRoIlG1OehG3YvIwYVXlZ/YNP6FtfLyKir?=
 =?us-ascii?Q?SbDJFZpbT4yg7SWNTZ1yaXvdM7Bl906GtRhuvX/OHsimis/6qjLSPCSzqZLg?=
 =?us-ascii?Q?iskHDDP0xLQ7jxY1dx/z0h3irwyfZaKpzDrO/bpD2Wc54sBD7NkIHbdCmwCI?=
 =?us-ascii?Q?KpFHqZa2Rg9Aju1Jo1A3DyE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?peQqdrQshvJ00g7WAL6fV6PkTTZgWJAJWrxoMpjB9Hyt2ezUOIkD4uf6s20l?=
 =?us-ascii?Q?2Dg+8y/ptpu1riis2V/AqCZwuhtnQcQLoDnpr0QzPGtNcNySWwu1qhnKn2/5?=
 =?us-ascii?Q?VSk4g1yzYs0kb6rmtDMMAPW20I6kFwKJ/1vMpY0NR5kz1UxZMvnRnxJTweuy?=
 =?us-ascii?Q?SSxL7yFYevtIKRLvBzDHnFKmWAhX9tPUO8b/ItsSHOuB0iCJechigPXvM+PL?=
 =?us-ascii?Q?9zO4I7G3GjaMm/juGXIHeYNbZdw+wYvTV+6JMtLEMV707B3fQ0uB9SMuLfTf?=
 =?us-ascii?Q?IUhU7/zN5FRrXhRb2gyidZc3DUCcBeXbTIoRrX+8HFrkPJ/NpxLfizvbPd/j?=
 =?us-ascii?Q?y4ZociiDEolrtE2j4Kf/2rO72c8U96Emkp3D+Y48kHUoOnqfJz6grLO5cAOr?=
 =?us-ascii?Q?87weAN5cT3k042Y3wAIBvBIP5rUOg/p9dnGHDGs39B/65cPJ/4o4c0QvsV0k?=
 =?us-ascii?Q?z3M0oSbenjM1hBoBrzH0ucNNle42gK+zjKcjLwS3fSMQ7LTIyjJyuDRvsvUr?=
 =?us-ascii?Q?uUy3vKodcUpQYe8PvMJpwmPMqqJC/DtaLlxCgKj5LbREMRJ/IfBG+ndJOx4c?=
 =?us-ascii?Q?I6oBWR5GQgBZiCTvNyPJsQA6i+WgaocMzX7bqziXnrVsmpgPAduNQmorfB3r?=
 =?us-ascii?Q?E9n5nZbcropwUfHawmzH/ZL6UnhGaNrcImespSqZu2ZIZSASfGNu3/RKBW6/?=
 =?us-ascii?Q?cZAfEaXKjf2fuUJyY0Qpp2NwKShKSRK7qUDUOSilFZRk1spb5s/YGFetpiMd?=
 =?us-ascii?Q?diWzaCbKCyD/nAnUriyN9Nz24S/Yv7fm0XxDt+oiY5vyDH6TZeXjc0cZ4JfQ?=
 =?us-ascii?Q?ma/KIxFHoklso6czAnLHkNQKgAmeUuQuEQaFiXr5d3lAcpxSRaZlcKvu6Bkl?=
 =?us-ascii?Q?CQyX68w/IBlCikFXhQNIqb25Kb/TcKmPvLlnlHYINOaYKbvHBWZYMvOU8K/p?=
 =?us-ascii?Q?v+u6FA6H2Pil5wsj4dHLA12UngQxn7H7JHJCQ1Kq0LWWOYVuiCGGlG4BZeRZ?=
 =?us-ascii?Q?8Kglz+tqb/2BZiL59Ov/jvC4rFe+PCzuX/aO/I7hDqnxWSsfCARshZnWnfLy?=
 =?us-ascii?Q?VjEgo9Px0lLrQ7d2hBYSz1Mb1wApORY8p2suV9JzPXsvUNKtv/AVDOgAbyE6?=
 =?us-ascii?Q?p8a5VrGck3O6y3xuSigjJ0BNLtCsmLTOG54W173znRIQ5CU7A2r+LY9BC/gm?=
 =?us-ascii?Q?mqMzjJXSCu+yDkBUtQoNvlyrfeaxTaCtKmMLnEfiVhGheDl6F2mzlB+ACDxj?=
 =?us-ascii?Q?xs6z8NcmheEYvny+6KyYULL8Wta7WDjGjTv2o3sb0L9ER3bW3GLieBRXiBzU?=
 =?us-ascii?Q?oN2ObEFQMHPNkF8fpoK+wbIJahuushybfJ3df+X+hf7jS1hQk7AMynglL+97?=
 =?us-ascii?Q?nhhBWUQWBtXwC9VZYpJYTYV6iA8fopAWbuH4PxaUmkxX0OZWBIcJ8o7NfprD?=
 =?us-ascii?Q?IBKXLVmoDn3ZTo/ZlmkaMXYd0x3jcigK4CYUUv+eV9nBIzZnYtRu8wodxKX7?=
 =?us-ascii?Q?dMCfusuN2W8TpGTXnPdjJxackAzZ0ym7NbrN0IygHHPAtoL8d/R+ypEPrczv?=
 =?us-ascii?Q?19wL6eaRCAl1HBfmcvUms6EPe8thqfPA3dlA1toM6Wj+VJGiPxEVE3bWbfzy?=
 =?us-ascii?Q?wj9OAnSHZ/+MDItOJVA1NXNZcTU9mFzYQ4LDdR++tiTjfxNa2ao31M8Metob?=
 =?us-ascii?Q?5NUxh12rRuSavywwtamT83d1POqhfNvCjr4EVlRMiTrhl3h3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd74b9c-e802-427a-b22e-08de544a1e8f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:24:05.1535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l790yAvTGYjBbFSUiagVmk9SsGvkT7IH2EyPpi2QYd39Q0BAyKc2UAmTxsQDZY+VttrAAcyLNstI8Uq7hvjh0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8662
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 05:49:28PM +0900, Koichiro Den wrote:
> The current documentation implies that pci_epc_set_bar() is only used
> before the host enumerates the endpoint.
>
> In practice, some Endpoint Controllers support calling pci_epc_set_bar()
> multiple times for the same BAR (without clearing it) in order to update
> inbound address translations after the host has programmed the BAR base
> address, which some Endpoint Functions such as vNTB already rely on.
> Add document text for that.
>
> Also document the expected call flow for BAR subrange mapping
> (pci_epf_bar.num_submap / pci_epf_bar.submap), which may require a
> second pci_epc_set_bar() call after the host has programmed the BAR base
> address.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  Documentation/PCI/endpoint/pci-endpoint.rst | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
> index 0741c8cbd74e..4697377adeae 100644
> --- a/Documentation/PCI/endpoint/pci-endpoint.rst
> +++ b/Documentation/PCI/endpoint/pci-endpoint.rst
> @@ -95,6 +95,30 @@ by the PCI endpoint function driver.
>     Register space of the function driver is usually configured
>     using this API.
>
> +   Some endpoint controllers also support calling pci_epc_set_bar() again
> +   for the same BAR (without calling pci_epc_clear_bar()) to update inbound
> +   address translations after the host has programmed the BAR base address.
> +   Endpoint function drivers can check this capability via the
> +   dynamic_inbound_mapping EPC feature bit.
> +
> +   When pci_epf_bar.num_submap is non-zero, the endpoint function driver is
> +   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
> +   the EPC to advertise support via the subrange_mapping EPC feature bit.
> +
> +   When an EPF driver wants to make use of the inbound subrange mapping
> +   feature, it requires that the BAR base address has been programmed by
> +   the host during enumeration. Thus, it needs to call pci_epc_set_bar()
> +   twice for the same BAR (requires dynamic_inbound_mapping): first with
> +   num_submap set to zero and configuring the BAR size, then after the PCIe
> +   link is up and the host enumerates the endpoint and programs the BAR
> +   base address, again with num_submap set to non-zero value.
> +
> +   Note that when making use of the inbound subrange mapping feature, the
> +   EPF driver must not call pci_epc_clear_bar() between the two
> +   pci_epc_set_bar() calls, because clearing the BAR can clear/disable the
> +   BAR register or BAR decode on the endpoint while the host still expects
> +   the assigned BAR address to remain valid.
> +
>  * pci_epc_clear_bar()
>
>     The PCI endpoint function driver should use pci_epc_clear_bar() to reset
> --
> 2.51.0
>

