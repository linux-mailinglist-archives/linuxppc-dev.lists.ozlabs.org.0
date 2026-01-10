Return-Path: <linuxppc-dev+bounces-15488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A644FD0D778
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jan 2026 15:30:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dpLdF4Dn7z2yFk;
	Sun, 11 Jan 2026 01:29:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.228.73 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768055393;
	cv=pass; b=LV2ZrQtboZg9DGSTL8IxJTUGYXRo4Gv/di1qk7m4hS7uQKiAkqofkSmoNLdS+U9/5itkoi8Rtivg5CDMlKYMw1E8Nd2mYMId3vzPuCiJsPnTpuKjd2FdUPogqN9t0kpAszSquRfTaOIerOidbU6Kb7D4zS/mX8LEKqVetaOacnniU+cEZBt18JplrVChNdb2rBdFczzMgx5CiniRD8AVyVCo07n7GSYFL9e0kZ62bUgFWYJZ8ibjMAg2pB0VoG3jHBhAvf6vTGu3SRC9Ap0gYEmAPnU0OAr3ft3bSY4tQPPpL4aEiT3IcOk3shJC9PxeJKsR/Xi6mKtuo0C/8j31Dg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768055393; c=relaxed/relaxed;
	bh=oEewp1sVgCNjI+9i/2Pnki3CvghtK/9axvfuDDuPUAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OCAkx0klVgeYkJ/n9dUUl+Myp+3dGfgMhogWQNPcBNVu03NaKpFQ+GdmwHwIjGGxJv3Bg6vx0dv08exdGfAKM2Gv6QAypY9sJwZk+TDpMer+poUg5NJNptymPr/qIH011s9PBGXyRJ/A9SPQjDjs9WpGLBC7Y/q2jrdhl15dQ540BpguT1cMKDOV8fycSbhubyiblpwlojCnBXzu74AqohvL4TzDskyrXV2MqdpRphTqAjYV0u6fWU9bCEB8ymLxKoFOAXmAigY3nlf5vWaWq4mUvLCgw2N/HBAXVZtlXUL4J8fvKnmFgfiA8XUjO/JYt12l/uAi0ForjC/dU3yBXw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=X9DupauA; dkim-atps=neutral; spf=pass (client-ip=52.101.228.73; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=X9DupauA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.228.73; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020073.outbound.protection.outlook.com [52.101.228.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dpLdB3yWLz2xRv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 01:29:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGq9nH6kLKlOYIIkcxDv2vMgIet7YnbDtFfdwOQMCvQO0OqQuBv7J8rZtEkOl1yy+5pS/K/tZiyZYOrq3cA/nvyiVfpO6bRIliymL8U1lFPUYckK246AALaYVsxju8/UdMiJKjZhanrzgpLfmTl01DPDzbis1v5m5T9vwZ7ZrEIHZGDEl4MUWIXfJdbMX7D6wcA5cOdogMkPzIuFWlogAOOYrLpJhJx39Q/uhIh0G01PtmFhoMsiKSBCrovK4f0W4ipOx+K3IwkeNg7Gb2MncO6HAWGunDC7bVaehY9wVHK2t1j5uMbTO67kdd3DwzFB2O6ZuaGLo8AoSWVIhkcJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEewp1sVgCNjI+9i/2Pnki3CvghtK/9axvfuDDuPUAE=;
 b=i01CjjJ7FeeNTxSDwWNfT0GMEvozax95UjMK3iXAhnYlezh8EhY9mV7h4WbW2818l9e6/PwXjbKB3ybkXyM1Mr1ZaIHZGqgBbGV539/cydkkhp4CrfrC2GYi7pfe/oV1S7PZko3OdNJAthEfz3x7t1yhSTxtRoiHGYJkHuCLckg7Ao7SH4K/puCjx+HCkHoOEbJJyCV3uiXJmL2/lBFmoirLKcHYcjatT3jzVxSk3JlrlxXluFljSVZam6h2AhwmMYHQ9lU8X5SIpvecDZKqYHvwo6o1EGObB+X1CBclY23RGyZdkdZA4NEiZpb/LkyAKN+NAlvgqqeG1wfHIEU90w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEewp1sVgCNjI+9i/2Pnki3CvghtK/9axvfuDDuPUAE=;
 b=X9DupauA2JK2Kc5C2oGgJ3HKbLFmr5mpORgtSul1pn0T99IitzCwrUrj0Os5M1446IVit2zgkRztlsUvw6X5aQHUuTpDY9p/yAG/2ht73xLncNDYwrpOwSap9RtU1VS/s7k2/ljIcG+laj2yR11Ascua6cgm2zbYFjH65ayogLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB4045.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Sat, 10 Jan
 2026 14:29:08 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 14:29:07 +0000
Date: Sat, 10 Jan 2026 23:29:06 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, vigneshr@ti.com, 
	s-vadapalli@ti.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, 
	jesper.nilsson@axis.com, heiko@sntech.de, srikanth.thokala@intel.com, 
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be, 
	magnus.damm@gmail.com, christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org, 
	rongqianfeng@vivo.com, 18255117159@163.com, shawn.lin@rock-chips.com, 
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com, vidyas@nvidia.com, Frank.Li@nxp.com, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 3/3] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <wvb42kyfcpyii3jql2gm75dd6hqpcd32yat2yb7cg7sl3raw4l@d4mfxk47l6md>
References: <20260108172403.2629671-1-den@valinux.co.jp>
 <20260108172403.2629671-4-den@valinux.co.jp>
 <aWAZv3ZwdUmo4_wc@ryzen>
 <nqpwi6ewen4kf7jqgon4ljerceqjeaule25dzb6ytas3wslqhp@ddkr3jum6eac>
 <aWC8jGTtKIzVuG-X@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWC8jGTtKIzVuG-X@ryzen>
X-ClientProxiedBy: TYCP301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB4045:EE_
X-MS-Office365-Filtering-Correlation-Id: 55fb5687-b86a-486a-afdc-08de50549d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2NkuIC3mjPBRSePFjjCDRX+JcpckD7TwIJCnWOxENi9wl4kBBVrS94np0DqN?=
 =?us-ascii?Q?WRdjspkbLc7/V+YHaMLN7miz9Nb5Y44N8xAIdtVmUk1hkExUhg1KSnExrTD/?=
 =?us-ascii?Q?fQZBeR5W9GPJfV0RLVolz499Mfv9jHXeYRyMiMQW6dK28/54g2jId/c9UbNH?=
 =?us-ascii?Q?0dfHz+noXPru9QpUyEsVnOGpUQs6NQshisZH3HCEJYeBvF1fEcJVXQdai716?=
 =?us-ascii?Q?qKn25UYAsszAB0IRpzJC2dURoyibGYdAyMAceQ+YZVQm1RIsbCQoh1UxvWtt?=
 =?us-ascii?Q?dUIOG5oQmc8hDRPAwiyVtzBNLVCDeBSLpZ6oVnGK5EczSSJgiSQrrZ/khPE0?=
 =?us-ascii?Q?zHc/mIOY4GPZE3KWoUGWg9y9eG0to3bCF/mzyAXHO24eXViwTZfy6LMba3DP?=
 =?us-ascii?Q?z/jaUHo/rhzFfQs+oDKWVd1ickKDM1gb5f+FkV0pvh+2Ruh1uX9HWDO1JahL?=
 =?us-ascii?Q?ReklImDM4jaNRAvOunOE0ZZjRF73K9IfUj97nx+ZBCR8WPMJt8Nj/0x8FmZG?=
 =?us-ascii?Q?p59FRKQTzKiHqig5rmUq63cxga+qYFFB8AYGrE9HxVZpM0nuAEzsJcjUS07O?=
 =?us-ascii?Q?sFBLOcFF/GGtvpw8fu9YiQ2WdMAOmkwOU/h83ZjkPKkYAchCc094x/is7a8o?=
 =?us-ascii?Q?q2lGp7KxdJZJHrvAguRQTTrY/gowBFsGMo2OjwSmqAheIIZjYN2rEqXh8nKe?=
 =?us-ascii?Q?fC1OtYsdcaN38r7izYuDwNCfhpbCGJ8gM0EOrOuRTHS5LUf0hxVYoGMd7U7x?=
 =?us-ascii?Q?QCzyHUQs2eGTcRlwSfHokRmQ5qneWtauqHn4/o7nrCpFWXuC8RvRqsSPxM1U?=
 =?us-ascii?Q?R0cgAVFC5iVVGv6GhHod9S2RaQzSVRK5kl7vY4Lpa+hgPCZjiomeUjESAAxG?=
 =?us-ascii?Q?x2P5TODi4cARcWnQinNerp12RwT0lKxtVTuIDZl3wFDk7Tjkx9NyqSNV4lnp?=
 =?us-ascii?Q?wNStmRBZHx4fZapv+XQqFBIKTkRoMfYXIv+7zEw8HQV1VNzB0ltoyUBUC2JI?=
 =?us-ascii?Q?WljYP+KqcHPmse1mrqFOO6BCG+XLm1WjIlQRxLNj9oz8eKXeTa3x0xTjCsaA?=
 =?us-ascii?Q?NxUW3etp2g9W54QI6uO30b1MMpQVaeyEhh/nceATnCP6Uobp7XQIQTaQKCOm?=
 =?us-ascii?Q?y3WQcOJf7u9HWhxNWa0eRJLgUdBMvRuLGhn24e7Md6TNDZT2riDP/RwM6IHo?=
 =?us-ascii?Q?8lZRSdjie3S+voI/Mn0SIab+IyQ4z1xLu8U0SyFuPOoolTT6FDcEinm/D3XZ?=
 =?us-ascii?Q?5GwjdZrN479gblDGbJTTEI8ueBiQfHITYHuE1QpFDCMSUXZQSAgb92nIQxUJ?=
 =?us-ascii?Q?2GOIVpAywI59R61dkdYssJwNS/fp9xwo+x7XA8GggeayQCeXAqL2flbNVYGC?=
 =?us-ascii?Q?JorIEl9JTcHAjQ44FlPixrSEEbc0qZmutS0Lnf7jZbaNdvpO4p0hCKuGmWHv?=
 =?us-ascii?Q?j3G/4PE7hh7uJlZOx2AI3PJ+xIv4kYt6z9JbBQCSuZRRrkPqjfanuA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NGYGn+WIGyzR/n6p7j1yRq1qJ/dlDPtF9xNpO1eBfJRgdD6XbMg6H6UPZGU0?=
 =?us-ascii?Q?iLaPzwK3ecSaYI2qWrcR4r+aErlWpC+XeAcIZhfKKI85jFQNFAhxECJPQQRB?=
 =?us-ascii?Q?AseW0kM4rlsqPKF5heWsg6nhsUSaIlJiidwS4zxFT1JsKPJdd+cbmeOJ0HgM?=
 =?us-ascii?Q?0w4/94NizQajpMc9QqTDZlBUq3G6KanpYyKmt/t6u0NBOQOqBcsN2ayRJXhh?=
 =?us-ascii?Q?FnSOd7Gr7azBiFNj+s7/2xDFN5Ze/0wzfztxj9uYw4jyTpDneNwtvrm2j2fh?=
 =?us-ascii?Q?m9ZWMwp0Gnq9fJxnZureC35CAtAnUeW5lNUWC//a9N+GbAIk8LP4zcCUA406?=
 =?us-ascii?Q?dMuhMoJi5UM519e2pGQhfMecX63IWsBbdNCi67c62ve003s2lGbp2SCnz2+z?=
 =?us-ascii?Q?09K0G2wqUKR1AJ1ySuRocn+8OZHIE7dAPVgnpUB3aslncrJ+trUfa8iXkDos?=
 =?us-ascii?Q?fJwajtmRuKJocpfCi72oTZZMu4XYfqbyp+tvkK3z2kXpnJ2I4/8iwAqWLtg6?=
 =?us-ascii?Q?n5f+GDzUV4D/32MHjwROT+X7+U79z5jN0mU1vsqof4cyCb5O5dpPBRxv5R8P?=
 =?us-ascii?Q?rMckaZHBGacHFdAbsc3/ztGeaNV700CDYUh6icncx+UInBVGJI6B45CJ6tS/?=
 =?us-ascii?Q?XRpZGyEf0yNOfPT235HlVjZlIa4EFe8jjsR6kE/UXanc5nYTtQdsMq39ywLJ?=
 =?us-ascii?Q?Skl5F2NhHhCfEiIOsAXsQdanHI3NvKS5rQajL9qIQzFXv3JJ0IgODMqpdFKp?=
 =?us-ascii?Q?icI3L16wHhKf9BBULyJJpbXzLz12r/XZRQIE2CeXULXKlcXjgrTWKnOxtbVI?=
 =?us-ascii?Q?ElAb2bm2ST3VB5bQnZOp/4MGS9zr6iCvAIAHPzkYxBz02kQ7SKtULRFEzCMk?=
 =?us-ascii?Q?ndbX9c+GtE+qE0HoNSTuY0em2B9w29kuQdY0xfLQzAX/ICaDKMLd7VlWvGx6?=
 =?us-ascii?Q?yOf0gD+qDYA3VwXrMQuG7Ma7sPFi0BOHOfnJHWDoTeIJFtUVnASXwM5NRHAc?=
 =?us-ascii?Q?n/VPJTmRGcd+NeV0axFBkH4uh7Gwz+qvy+iH3opRmLsJKZMCxF44QuJR0LIE?=
 =?us-ascii?Q?IlZjjyVZw1i63qsBcmTpExB+V83BLQ/x9aaKT+QS4sKgXxDiKcuZLJAi1SiK?=
 =?us-ascii?Q?oXUv9e81JmyzBzlzh0hB4QfK8u2EyKYtuJkG/b+DUKxPyjdDzzqeg3Z6datR?=
 =?us-ascii?Q?LldZDFtLgEMSOFWIgEpKVO/uJ1SW8BfJA29cNp3MElfsWpk8t8dQ5UaKThxh?=
 =?us-ascii?Q?p6uKpRRY2dWRUjjrhxCdVFwEDxOpM8dBfj3yvN6hnk1sm6Vk61Xrn9hAA3IA?=
 =?us-ascii?Q?U+uW8l33mBrza0HnN3OslwRhOJIkcdb6tQANgYfqhrL9/21wS24pdEdo3L6s?=
 =?us-ascii?Q?N2txVgY0E+Oc1HnT41DLj5Yt+tE/O32rejj8I/zj44ThydZTSbNZaU9NabAU?=
 =?us-ascii?Q?/ON953msueYuNDt6YG/s5U1V5UqsvrHPCHHjkBcqbNcJta3sYytLVWvN0Wtb?=
 =?us-ascii?Q?klld0HsI5d0cAQw8vsO7aoYEnfjtsqatOloZVa/poMymwbs1Z9om6b2cuBmV?=
 =?us-ascii?Q?DjPgm2RHcvV0rFMYubpa6huEVZkf0oHWRN6PSaJg8opOa3ToYH/MF1jEd6WA?=
 =?us-ascii?Q?WSo+n7FLvK2obNPOlOqo6L+yLMn6fH+89kTlfqv1vGAaG0wirMM0bpeEIhat?=
 =?us-ascii?Q?I1B01r567YlK4JRCc80cvzFMa6G7y1CoZ0SZNismGTerniT/SyAyG2pYbgSz?=
 =?us-ascii?Q?JcSa3qu35/pp6Kcfo5VEEuGLh0qAYErkgDgIiIFC6wcXVIvZKqdg?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fb5687-b86a-486a-afdc-08de50549d16
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 14:29:07.7389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tNl7bOkcfBH72j0ereURQzNiTX5SJvMWg28wHIpadj83wc+f9dexAhE6Dk6HtAzY28Biv2lra5QoHkDIr5EyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4045
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 09, 2026 at 09:30:04AM +0100, Niklas Cassel wrote:
> On Fri, Jan 09, 2026 at 04:29:14PM +0900, Koichiro Den wrote:
> > > Does that mean that the usage of this API will be something like:
> > > 
> > > 1) set_bar() ## using BAR match mode, since BAR match mode can write
> > >    the BAR mask to define a BAR size, so that the host can assign a
> > >    PCI address to the BAR.
> > 
> > BAR sizing is done by dw_pcie_ep_set_bar_{programmable,resizable}() before
> > iATU programming regardless of match mode. I keep BAR match mode here just
> > because Address match mode requires a valid base address. That's why I
> > added the `if (!base)` guard.
> > 
> > > 
> > > 2) start() ## start link
> > > 
> > > 3) link up
> > > 
> > > 4) wait for some special command, perhaps NTB_EPF_COMMAND
> > > CMD_CONFIGURE_DOORBELL or NTB_EPF_COMMAND CMD_CONFIGURE_MW
> > > 
> > > 5) set_bar() ## using Address match mode. Because address match mode
> > >    requires that the host has assigned a PCI address to the BAR, we
> > >    can only change the mapping for a BAR after the host has assigned
> > >    PCI addresses for all bars.
> > > 
> > 
> > The overall usage flow matches what I'm assuming.
> 
> Ok, perhaps document something that the submap feature requires that the
> BAR already has been assigned an address (and that it thus has to call
> set_bar() twice, without calling clear_bar() in-between.
> 
> This is a new feature, and since you provide a mapping for the whole BAR,
> I think it is logical for people to incorrectly assume that you could use
> this feature by just calling set_bar() once.
> 
> 
> > > Perhaps you should add some text to:
> > > Documentation/PCI/endpoint/pci-endpoint.rst
> > > 
> > > Because right now the documentation for pci_epc_set_bar() says:
> > > 
> > >    The PCI endpoint function driver should use pci_epc_set_bar() to configure
> > >    the Base Address Register in order for the host to assign PCI addr space.
> > >    Register space of the function driver is usually configured
> > >    using this API.
> > > 
> > > So it is obviously meant to be called *before* the host assigns a PCI
> > > address for the BAR. Now with submap ranges, it appears that it has to
> > > be called *after* the host assigned a PCI address for the BAR.
> > 
> > I agree. As I understand it, the current text seems not to reflect mainline
> > since commit 4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar()
> > update inbound map address"), but anyway I should add explicit
> > documentation for this subrange mapping use case.
> 
> Sure, 4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar() update
> inbound map address") modified so that set_bar() can be called twice,
> without calling clear_bar().
> 
> However, that patch was a mess because:
> 1) It got merged via the NTB tree, even though the PCI maintainer wanted a
>    different design:
>    https://lore.kernel.org/linux-pci/20220818060230.GA12008@thinkpad/T/#m411b3e9f6625da9dde747f624ed6870bef3e8823
> 2) It was buggy:
>    https://github.com/torvalds/linux/commit/c2a57ee0f2f1ad8c970ff58b78a43e85abbdeb7f
> 3) It lacked the proper conditional checks for the feature to work (and it
>    lacked any comments in the source explaining why it was skipping steps):
>    https://github.com/torvalds/linux/commit/3708acbd5f169ebafe1faa519cb28adc56295546
> 4) It failed to update the documentation.
> 5) It failed to add a new flag for this feature in epc_features.
>    I seriously doubt that any non-DWC based EP controller supports changing
>    the inbound address translations without first disabling the BAR.
>    (It probably should have added a epc_features->dynamic_inbound_mapping bit.)
> 

Thanks for pointing me to the context, that really helps.

> 
> So all in all 4284c88fff0e in not the best example :)
> 
> 
> Your new feature (epc_features->subrange_mapping) in epc_features appears
> to depend on epc_features->dynamic_inbound_mapping, so it is a shame that
> we don't have a epc_features->dynamic_inbound_mapping bit, so that this new
> feature could have depended on that bit.
> 
> 	if (epf_bar->use_submap &&
> 	    !(epc_features->dynamic_inbound_mapping &&
> 	      epc_features->subrange_mapping))
> 		return -EINVAL;
> 
> 
> I think adding some documentation is a good step.
> 
> Perhaps we should also introduce a epc_features->dynamic_inbound_mapping bit?
> Since you are making DWC glue drivers return a mutable EPC features, we could
> set this bit in the DWC driver after that commit. What do you think?

As you pointed out, support for dynamic_inbound_mapping is needed
independently of my series. Given that, it would make sense to handle it
either before this series, or to fold it into the next iteration (=v6) of
the series if that is preferred.

If you already have a patch for dynamic_inbound_mapping in mind, I'm happy
to wait for it and help test it.

> 
> I realize that we would not be able to add any actual verification for the
> epc_features->dynamic_inbound_mapping feature itself (in set_bar()), since
> there is no way for set_bar() to know if a BAR has already been configured
> (since struct pci_epc does not have an array of the currently configured BARs).
> 
> But at least it would allow an EPF driver (e.g. vNTB) to know if it can call
> set_bar() twice or not, and can error out if the EPF driver is being used on
> a EPC that doesn't support epc_features->dynamic_inbound_mapping.

That makes sense.

Thanks again,
Koichiro

> 
> 
> Kind regards,
> Niklas

