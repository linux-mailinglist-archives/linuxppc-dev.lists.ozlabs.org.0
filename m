Return-Path: <linuxppc-dev+bounces-15653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ADCD1A3EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 17:28:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drF6K4vh8z2yTH;
	Wed, 14 Jan 2026 03:28:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.125.101 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768321689;
	cv=pass; b=cNpidKs+SFBhLqQQPYEOGxWaVjfxyij84lJb+8nqTFQk08nbMBFJd2Ng6AEwRgtz+51H0g1Chftrh9YQeqyxIcnNudWSrOUh33ZI4dsgs2ARzBUeyPcG7cirWGZtZQ33O3hVwTO1fkZqfc6OgwO3nGjeUXoiwLtJxKpalQQLJWgs5jUBrpqqZhcFNK0w8Yk/DnWesenKc0XJyyTVphBeIeF/pI5blE4t8hf3CaVOld2hIzc2o8MihvJ00wn3Qe/2ejzZfABLvguYkqRdhMf7yAJKN9wfIhcxgYrW9jZdisgt+ctI9w7yRMGPV9DbNwSo+OOGUwXdMvxeanrvpUeGuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768321689; c=relaxed/relaxed;
	bh=sTyynGh1Jr/lcWlxWfiAsA1luaLBYZqla4tdVu8au8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AVauz0Tnud5rrJX3J/+lcDEOaA4DPfqR5QVV8FG/pA7RETc9aOCYQBGTh4ixwf3wauRTgsH/6LHHPLocc6SQJkxCSEfKHgIK8bZ6tihpWt+s6rNefAut+bu9Wgatv8evCfATMSzfvtjroEp7YU5W+zX7wC/9uupDABmSJJiRcovolu9qpaplEWN8iuN4jn7kvgUZcjas2RieVEHioOuCcry8Cl0WoEnXpiO6UllHMoe+d0HClRZaaLAIWdTRUnKzrsieKlrrHehphuROtGObYX7MIH7Ylr0RxJr0Ioc7dw3wyWtpMJoUjj9cx+HlDD1wn5sl2RdtkfSUgdDT0lxt2g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=u5BUNXfH; dkim-atps=neutral; spf=pass (client-ip=52.101.125.101; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=u5BUNXfH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.125.101; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021101.outbound.protection.outlook.com [52.101.125.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drF6J1fKYz2y8c
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:28:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weHl9ox+ai82BdggGcG5uiCSN4VRjvZTTqTRFYdQuPYQXqiu0WOTtlOwfU3BhtXpKUnTCXmOtijft7k4e5H1oupz5FseCSSjnG1Wn2gdPv2OSme8UJcoBAsQ2Z3hwCOBqqZDUvBRM+SwWJCuww7u1qCvOcTaeFLIEZakPd3i2anscudczoZwleP0tYcBT6qHieXU9FESQtdoTgYdNj9TIdaR4dYVeBimswUJP/PrcY3ItwyvZuWge/wLky5ol4eM9zqc6RvnOe8s08TzDdoqJKcXPT/Z0aaObK2GpDJoJiiFZi+/1gjsX5xg1t13lhQP50Ae+Ce6nqeu/KysAjTybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTyynGh1Jr/lcWlxWfiAsA1luaLBYZqla4tdVu8au8M=;
 b=YFHijVv+c7IPF17v7BbmVWZQw4I1dNtz9UfiQC4dw/6YBj3AIkuvq/9j5mZPCuUrCL/c1ImsaqTBJF1Z3v/m1KZ518STmpwoT3V+mjtWfE3xvgKxLOXlzPyExJBsqWNDTvW3Vp8C8J1FeNt+NlswMiDLfUplKjES39WqHe6py5OeSh6XW3f7GcOh3mw0sRLN9duMpGpJ72b5ASxDkr0dv9XitqUaQBqtBchx4fAHAPRLohfpyICdBOHb8II92/n9QEIUrjv1//n9F4fCwIKbk5WoNx1tHLzF4tnw0DsF2S7fE5Nmaylylx0HAm4HclkX23GRWb1lTdBjqPR1FkXIKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTyynGh1Jr/lcWlxWfiAsA1luaLBYZqla4tdVu8au8M=;
 b=u5BUNXfHC6V/zO16VnerQ8Pfa6lCRAtAGserC0z5DDEvY9ilTYMsm4COEQgn/H9yIhcKKoTtMtCa9TCEITujc6FqBAvIlCu9OS5lP0YN/7146qFoySYFu8cKahNnT8QzP4s9nHIR0YlO5Oc+bIY6vWM9HleqK6JUhF3ALPIQeLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB2282.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:13d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:27:29 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:27:28 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org
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
	Frank.Li@nxp.com,
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
	linux-tegra@vger.kernel.org
Subject: [PATCH v7 5/6] PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU
Date: Wed, 14 Jan 2026 01:27:18 +0900
Message-ID: <20260113162719.3710268-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113162719.3710268-1-den@valinux.co.jp>
References: <20260113162719.3710268-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0091.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: 034c962b-ab7d-4c8c-e428-08de52c0a507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/VkGC5UTVfzGdhdPdoKkLG5gP57LsepNUa0qRXMJPjjbupLdMplNrlFgfEs2?=
 =?us-ascii?Q?LUgfLGDcPcwEADYxB6IYBDXzT9heQIuD6kzw4IOttSUWnyOq/tIYjisTmX7W?=
 =?us-ascii?Q?vc9njq3ONTM+iPWlLgipAzTMYkxyzRXKhOQOW8Q/mpacXfVgXvBqlAwX2V+h?=
 =?us-ascii?Q?PqmEejQxF0nlrW7XPu2YIrsGX0tCDWxlIKhYCfcrrqMLaY0WGy6rLCk5adMq?=
 =?us-ascii?Q?qeYc79cTL64vVdnMWUzP8w27oeqthP/ru4a0pHAdpqeYfOj0pa3lKD+dsLzz?=
 =?us-ascii?Q?8dh9aPdKC2bTikCqnjIEaHxOCISby5cC+BiGgZJQNWHiNkJyfwzVfcY3QgCk?=
 =?us-ascii?Q?riDFCb+GSYFBMKy7D0CItxMTxQsRHzQiKkiPQnvnQWPJEaoz5z8CD7sTerl9?=
 =?us-ascii?Q?gnv8ImhObTrcp9WHKHh9HuQFc/HKPlm28yHNlpnLKFcHH3g7dKJoI3JauOir?=
 =?us-ascii?Q?iO/UvclfXKS8cJ/wThTGNf8VX7s2fpHNPrgyQQ52uAYSM/C0FbbcKp4WS0El?=
 =?us-ascii?Q?DZ3SFY+B9SDtqJhtX3Si7ZscWMyd+J/ujzwBUG+S/0gxgtZbKmVVyGcYTsDw?=
 =?us-ascii?Q?TcrVcC7nMCs0BdiyDvdB1Uqw/9I7aWJhu0gH3w0gP4kS2RVVvICvtP7OUlMj?=
 =?us-ascii?Q?bXqLhTFT94itmfYPJRAekLpPozexTN8w1LxyjbltS22JTOrZ3kcQQsyey5Co?=
 =?us-ascii?Q?lnOhjFsuEpRuZoq6Hlti7KRozs25FpUaImH3zhd4INzzfrSJshuw7nDhJ4eV?=
 =?us-ascii?Q?kuoAO9t53D5T7bfQZvJGLIf5wC0CjR6q1CIId6X1f0slpgL+8raP0/KLne+0?=
 =?us-ascii?Q?8oML2SVlXNuh857ex3AUalcS6P9mqTAC1uV3gX8Nj6FAV43gJq+WZZg0HcIz?=
 =?us-ascii?Q?8f0Spb+hdjckQbYgpNgL6nLTfFMfULcqoLF5YhDXWp0bgXQYmLBZvlOdGiQt?=
 =?us-ascii?Q?fl1JOODCcZ8thxLEOuoOlY0i1D+0fBYD0yEpj5ZfO4WU6i2pkLm8qVebnhIO?=
 =?us-ascii?Q?BzwiiQxq66cowrUu2d1kRTTIh4SlGeeEGUEizkgD5YlPfS1Ak4uCm9Dk1TnH?=
 =?us-ascii?Q?8vULXX7klHTCl65u7el4P+GwfhDRmdAzFbIL2E7FtBTrv6dCyZoHS1E+TMxF?=
 =?us-ascii?Q?nY45oxaNlJRaloRmPn0nmPc0WGepkI6n9hCupkkRw/Zxf9ZWyeK7l2S8pOYV?=
 =?us-ascii?Q?iThD9fgRZdBV93GVdXTdEPYWaFlY91c+LWAI8i0beHJ2sjL1RHrpg/bAO2a2?=
 =?us-ascii?Q?GdgiDfC8Wg9/ZmZ1z1HeD8ghs+eW83dkjhJQGwteYw7wX7hiy3Em0kf16iYM?=
 =?us-ascii?Q?vP/mZVP4isq2ffavDtIXxpXNqfHto3+Ob/j//AktiE0tuRM6GKiudtiMTLl9?=
 =?us-ascii?Q?onYDlQEjc6/4XFDH3rJ64FsYC+AYuBx9/24GkS3+jh5AuENL+m9l2Dsiaqn5?=
 =?us-ascii?Q?KNjPSLlRbd583HUrccpyJjCkZ+Wrg09e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DhuBKhc0Xg7pXXXmIdVMy3zLLSlDvM6W6OL5mHCgD3DwbjfBX9XhagYk9gu6?=
 =?us-ascii?Q?ib6Zmqbo05u8HmRBygHLV4NdNNlYif4gcaSsR2G9dK5adVHvQ9NdkXmDbjEf?=
 =?us-ascii?Q?WirDAdfiC8/aZ8aNAMoTN6O2sHMJ/+1lu9uOc/YsiygS0aPRQ2SrPPMblGTe?=
 =?us-ascii?Q?DtaMVKpA6AsycYnaGYuJONRmUvX+j3yFDIYIDJC/oHlsL0a/TXqrJpyb8VsV?=
 =?us-ascii?Q?BUzvMg9K+hHb34KBpgCUIxxckYAuoxs/aFs7rJnV23wklLmQcp2xJpvvVYf8?=
 =?us-ascii?Q?s1DXycReeX6pC0XvJ16cQqrKbEfbU1wQn4WkA2+uSh+1NBxc9fMzjpxiVQ13?=
 =?us-ascii?Q?dUFxkoNYJodDauPTmdavSeXqOF0QqhCnn273Y3Pxbyru6KUv/txb6v2SmXMU?=
 =?us-ascii?Q?oinDcKl+4EntFxVlJ19HmXv4FuPloL+sweunPI8IVT+5g9A641gZhmG/W5r9?=
 =?us-ascii?Q?GxVcjdDRE1SsRVsivWz2RCYpkzXqn+Y7q+U1jkNyoHKn5NHEewn5vYThZN//?=
 =?us-ascii?Q?6bgcEIE6UbzlrRmvqZmiMeYCPUoZrSRki6VoM3jS+I4Gq57iGhQEvRAVK4G3?=
 =?us-ascii?Q?N8qMNKzPVUcmV6mfDRtqjnT8eY2dbRwK610LGGst7pKCQ080XjTo+ej7B8Qv?=
 =?us-ascii?Q?vr6URv0YZMToSYh3KWUmxVlfx88YHbdJeEoOGssO/fZLzMwycobErj6GI067?=
 =?us-ascii?Q?hN8FcG2atC1vQPUOCZrp7TE/FNMpRWErLD9sEc4wQYZsVCfEKvCZVruojtky?=
 =?us-ascii?Q?Aq4hIs3c18XAUs+Q60G2zCcI6ZimmfHk3Fu5k59MWrAf/OCLstEd0aOaQQAA?=
 =?us-ascii?Q?10wCxCO91M9Vd/lxjaEiUc2IrzW6qAMez8kpCdCqtYMI9zpRxUy8C82CUBE3?=
 =?us-ascii?Q?xY8O0KMkFndaoD4tSKznO/PC5YzfJ98izIfmgiax0/mF5ew2j0aKn3I5DYd4?=
 =?us-ascii?Q?fuVmdB+HRixJ6iFF7WpRVzElOxGTI/gCSNG7nvGrSzeMZ5umKavvvE0Azw/C?=
 =?us-ascii?Q?eoBc45eToQfBoJlPGGyB/81ku29/koZy6z4XIlHB507WBhdKnm+U8hEyYxo4?=
 =?us-ascii?Q?PepAmBLUBQu3cNSTFJdIjBhKrtzDv05JJSwYYrpb0u3c3eyLM/L+HzT/CiUs?=
 =?us-ascii?Q?ZtK4vJcKqdH9+7ThIJgQ8fMZofCHUq0JWz9FuK+40DjTIMBFznCHdHkM3EBh?=
 =?us-ascii?Q?EQP5uz1AaU0mY9s1R2LBs/0Yg1SLEroCt0w8AfxY9vMIiTZCnpRLV/ViYdr9?=
 =?us-ascii?Q?kvSgvj/NuLbTmwhV/LaEPTYaBrO1pjW3Y0nRgBjryCCIKQtFfbG2N/MWZkul?=
 =?us-ascii?Q?xYkSBA9ZlSGKocz9WkKJg17HlZ4bP58z0ScAJco9uPStj3sLm59jbLxxz2Du?=
 =?us-ascii?Q?LztuurqLA/rnHnUL7rMZ5C8JpO9MxUTJ8ci8JD7KOy+KbvMpDGFGS63BylAz?=
 =?us-ascii?Q?4cVu6avdqLdIwhg63wzyGB5r3PE9Tfm3Dw43rUy+NVimXfCuI2e1U7SxOsQv?=
 =?us-ascii?Q?je9yNC+AatRZNvClXGDWCAZmHtzoGlCwIy00ZejU/DgUndurK9BSECRbfBTF?=
 =?us-ascii?Q?UmT+ZQPpiSf/hAVAQ8NpjW0Y2J+bFLxqpSMe/CNxG3iKD9n2RCjBwKng1qwb?=
 =?us-ascii?Q?j5qa6ys2ykO1aBHoPpT5fWKXFa22pdAOtHFJbWyxrb48ME8++kqZeR17Ndee?=
 =?us-ascii?Q?4x995EHFQ6g8hOjinlZ47pMTFoopOfXJkupC4gLPxZOAd/z4QnrNdqPl8bJ5?=
 =?us-ascii?Q?M/Z4fM7njDUhP+zZ4wOZjh4QZHT/mxEWsfes0isHJ0Cuy9KpKLsd?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 034c962b-ab7d-4c8c-e428-08de52c0a507
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:27:28.9612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76KQtxAcWkHSPeSGRcrkh5DwqAM/ULkvqTrcXroLEMd4Bv1xaqqNXHOzOyYSfIkHm0yElKo6ianNyWubM31/PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2282
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
subranges using Address Match Mode IB iATU.

Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
use_submap is set, read the assigned BAR base address and program one
inbound iATU window per subrange. Validate the submap array before
programming:
- each subrange is aligned to pci->region_align
- subranges cover the whole BAR (no gaps and no overlaps)
- subranges are sorted in ascending order by offset

Track Address Match Mode mappings and tear them down on clear_bar() and
on set_bar() error paths to avoid leaving half-programmed state or
untranslated BAR holes.

Advertise this capability by setting subrange_mapping in the EPC
features returned from dw_pcie_ep_get_features().

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 .../pci/controller/dwc/pcie-designware-ep.c   | 230 +++++++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h  |   2 +
 2 files changed, 222 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 0e5a8d200b00..b2ea2c2c986f 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -139,9 +139,10 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	return 0;
 }
 
-static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
-				  dma_addr_t parent_bus_addr, enum pci_barno bar,
-				  size_t size)
+/* BAR Match Mode inbound iATU mapping */
+static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
+				 dma_addr_t parent_bus_addr, enum pci_barno bar,
+				 size_t size)
 {
 	int ret;
 	u32 free_win;
@@ -174,6 +175,208 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
 	return 0;
 }
 
+/* Inbound mapping bookkeeping for Address Match Mode */
+struct dw_pcie_ib_map {
+	struct list_head	list;
+	enum pci_barno		bar;
+	u64			pci_addr;
+	u64			parent_bus_addr;
+	u64			size;
+	u32			index;
+};
+
+static void dw_pcie_ep_clear_ib_maps(struct dw_pcie_ep *ep, enum pci_barno bar)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct dw_pcie_ib_map *m, *tmp;
+	struct device *dev = pci->dev;
+	u32 atu_index;
+
+	/* Tear down the BAR Match Mode mapping, if any. */
+	if (ep->bar_to_atu[bar]) {
+		atu_index = ep->bar_to_atu[bar] - 1;
+		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
+		clear_bit(atu_index, ep->ib_window_map);
+		ep->bar_to_atu[bar] = 0;
+	}
+
+	/* Tear down all Address Match Mode mappings, if any. */
+	guard(spinlock_irqsave)(&ep->ib_map_lock);
+	list_for_each_entry_safe(m, tmp, &ep->ib_map_list, list) {
+		if (m->bar != bar)
+			continue;
+		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, m->index);
+		clear_bit(m->index, ep->ib_window_map);
+		list_del(&m->list);
+		devm_kfree(dev, m);
+	}
+}
+
+static u64 dw_pcie_ep_read_bar_assigned(struct dw_pcie_ep *ep, u8 func_no,
+					enum pci_barno bar, int flags)
+{
+	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
+	u32 lo, hi;
+	u64 addr;
+
+	lo = dw_pcie_ep_readl_dbi(ep, func_no, reg);
+
+	if (flags & PCI_BASE_ADDRESS_SPACE)
+		return lo & PCI_BASE_ADDRESS_IO_MASK;
+
+	addr = lo & PCI_BASE_ADDRESS_MEM_MASK;
+	if (!(flags & PCI_BASE_ADDRESS_MEM_TYPE_64))
+		return addr;
+
+	hi = dw_pcie_ep_readl_dbi(ep, func_no, reg + 4);
+	return addr | ((u64)hi << 32);
+}
+
+static int dw_pcie_ep_validate_submap(struct dw_pcie_ep *ep,
+				      const struct pci_epf_bar_submap *submap,
+				      unsigned int num_submap, size_t bar_size)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	u32 align = pci->region_align;
+	size_t expected = 0;
+	size_t size, off;
+	unsigned int i;
+
+	if (!align || !IS_ALIGNED(bar_size, align))
+		return -EINVAL;
+
+	/*
+	 * The array is expected to be sorted by offset before calling this
+	 * helper. With sorted entries, we can enforce a strict, gapless
+	 * decomposition of the BAR:
+	 *  - each entry has a non-zero size
+	 *  - offset/size/phys_addr are aligned to pci->region_align
+	 *  - each entry lies within the BAR range
+	 *  - entries are contiguous (no overlaps, no holes)
+	 *  - the entries exactly cover the whole BAR
+	 *
+	 * Note: dw_pcie_prog_inbound_atu() also checks alignment for
+	 * offset/phys_addr, but validating up-front avoids partially
+	 * programming iATU windows in vain.
+	 */
+	for (i = 0; i < num_submap; i++) {
+		off = submap[i].offset;
+		size = submap[i].size;
+
+		if (!size)
+			return -EINVAL;
+
+		if (!IS_ALIGNED(size, align) || !IS_ALIGNED(off, align))
+			return -EINVAL;
+
+		if (!IS_ALIGNED(submap[i].phys_addr, align))
+			return -EINVAL;
+
+		if (off > bar_size || size > bar_size - off)
+			return -EINVAL;
+
+		/* Enforce contiguity (no overlaps, no holes). */
+		if (off != expected)
+			return -EINVAL;
+
+		expected += size;
+	}
+	if (expected != bar_size)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Address Match Mode inbound iATU mapping */
+static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
+				  const struct pci_epf_bar *epf_bar)
+{
+	const struct pci_epf_bar_submap *submap = epf_bar->submap;
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	enum pci_barno bar = epf_bar->barno;
+	struct device *dev = pci->dev;
+	u64 pci_addr, parent_bus_addr;
+	struct dw_pcie_ib_map *new;
+	u64 size, off, base;
+	unsigned long flags;
+	int free_win, ret;
+	unsigned int i;
+
+	if (!epf_bar->num_submap || !submap || !epf_bar->size)
+		return -EINVAL;
+
+	ret = dw_pcie_ep_validate_submap(ep, submap, epf_bar->num_submap,
+					 epf_bar->size);
+	if (ret)
+		return ret;
+
+	base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
+	if (!base) {
+		dev_err(dev,
+			"BAR%u not assigned, cannot set up sub-range mappings\n",
+			bar);
+		return -EINVAL;
+	}
+
+	/* Tear down any existing mappings before (re)programming. */
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+
+	for (i = 0; i < epf_bar->num_submap; i++) {
+		off = submap[i].offset;
+		size = submap[i].size;
+		parent_bus_addr = submap[i].phys_addr;
+
+		if (off > (~0ULL) - base) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		pci_addr = base + off;
+
+		new = devm_kzalloc(dev, sizeof(*new), GFP_KERNEL);
+		if (!new) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		spin_lock_irqsave(&ep->ib_map_lock, flags);
+
+		free_win = find_first_zero_bit(ep->ib_window_map,
+					       pci->num_ib_windows);
+		if (free_win >= pci->num_ib_windows) {
+			spin_unlock_irqrestore(&ep->ib_map_lock, flags);
+			devm_kfree(dev, new);
+			ret = -ENOSPC;
+			goto err;
+		}
+		set_bit(free_win, ep->ib_window_map);
+
+		new->bar = bar;
+		new->index = free_win;
+		new->pci_addr = pci_addr;
+		new->parent_bus_addr = parent_bus_addr;
+		new->size = size;
+		list_add_tail(&new->list, &ep->ib_map_list);
+
+		spin_unlock_irqrestore(&ep->ib_map_lock, flags);
+
+		ret = dw_pcie_prog_inbound_atu(pci, free_win, type,
+					       parent_bus_addr, pci_addr, size);
+		if (ret) {
+			spin_lock_irqsave(&ep->ib_map_lock, flags);
+			list_del(&new->list);
+			clear_bit(free_win, ep->ib_window_map);
+			spin_unlock_irqrestore(&ep->ib_map_lock, flags);
+			devm_kfree(dev, new);
+			goto err;
+		}
+	}
+	return 0;
+err:
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+	return ret;
+}
+
 static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep,
 				   struct dw_pcie_ob_atu_cfg *atu)
 {
@@ -204,17 +407,15 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	enum pci_barno bar = epf_bar->barno;
-	u32 atu_index = ep->bar_to_atu[bar] - 1;
 
-	if (!ep->bar_to_atu[bar])
+	if (!ep->epf_bar[bar])
 		return;
 
 	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
 
-	dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
-	clear_bit(atu_index, ep->ib_window_map);
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+
 	ep->epf_bar[bar] = NULL;
-	ep->bar_to_atu[bar] = 0;
 }
 
 static unsigned int dw_pcie_ep_get_rebar_offset(struct dw_pcie *pci,
@@ -408,8 +609,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	else
 		type = PCIE_ATU_TYPE_IO;
 
-	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
-				     size);
+	if (epf_bar->use_submap)
+		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
+	else
+		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
+					    epf_bar->phys_addr, bar, size);
+
 	if (ret)
 		return ret;
 
@@ -638,6 +843,9 @@ dw_pcie_ep_get_features(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
 	/* All DWC-based glue drivers support dynamic inbound mapping */
 	features->dynamic_inbound_mapping = true;
 
+	/* All DWC-based glue drivers support inbound subrange mapping */
+	features->subrange_mapping = true;
+
 	return features;
 }
 
@@ -1128,6 +1336,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	struct device *dev = pci->dev;
 
 	INIT_LIST_HEAD(&ep->func_list);
+	INIT_LIST_HEAD(&ep->ib_map_list);
+	spin_lock_init(&ep->ib_map_lock);
 	ep->msi_iatu_mapped = false;
 	ep->msi_msg_addr = 0;
 	ep->msi_map_size = 0;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 4dda9a38d46b..969b1f32dddf 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -479,6 +479,8 @@ struct dw_pcie_ep {
 	phys_addr_t		*outbound_addr;
 	unsigned long		*ib_window_map;
 	unsigned long		*ob_window_map;
+	struct list_head	ib_map_list;
+	spinlock_t		ib_map_lock;
 	void __iomem		*msi_mem;
 	phys_addr_t		msi_mem_phys;
 	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
-- 
2.51.0


