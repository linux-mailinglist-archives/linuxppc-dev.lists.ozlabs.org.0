Return-Path: <linuxppc-dev+bounces-15667-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C83D1B3F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 21:39:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drLhf5fpJz2xWP;
	Wed, 14 Jan 2026 07:39:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.83.14 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768336786;
	cv=pass; b=Ftocj/Ocfsi2gbnqVomhKWroTnOVk19WFixCLIeDAgsnxS8hfaY6I2rgLV3lf5dDvcNotmZuvBezHQrjNawCnOxPRsH6nFtE933ATOLdUrckLwWTy2+8QhtYHKzFqj5QnPA3JCx7b4hANRh3Uz1McSlCOdP0ERsXv0Pl/43gIqL/uqnCaW4jDgfakf7kIm8igHDfxloVymGDu6GcjLil4HnPDJj9agb6ghOo1Qh9/W9W6g7KWYx/jXzvh4i9tuwI3M9Hw7VvlGVBEvIJIvRDjyOAjTdzd8xht9CQL+RCsBzauOvNOQhiPouRYNZFem0D3RC7bqsZk+vAXfV+BWq7tQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768336786; c=relaxed/relaxed;
	bh=cfH4OShB4JG8m6MaJouGNf2tIbTk2m6gERwASo/tB/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eOwk9N8n/Y3lwn8C/oCe3NHWy4s7qAVZepcsP0F3Z1aap67KJqcB/G6/9RvW4O32lqpmAPA94KAbzesC69NhGXXDTsPjE9E5XfU4Nnq0D4oFN5sq1zOXjzIReG01DEQw9s5OqjqD1eTPotGrUXCbJ1285+X8Vgj6n+0R+BnZMom5kN0qQvWzjvbkl3dULa0X7QKM5HQNx77frYxwBf2b7lGGbaVzjl7xDY9bmFPLchIKrUOHBrw0yUUtw0tNkxWeMm+R7AFXuEvqUbc1/TFP+1jgQHLajq9r3nDOQhaFOewSK2Vw/OCk5W0AydqMHHTXJRYo+t+FVA5Iy1s0sVEOdg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=M5yk+sZv; dkim-atps=neutral; spf=pass (client-ip=52.101.83.14; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=M5yk+sZv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=52.101.83.14; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013014.outbound.protection.outlook.com [52.101.83.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drLhd3sB5z2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 07:39:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sR8tCH9jKZ1JFvmwuhC+bosWU+hOYWNhepwTkJUduG1Vs7qkx0Krpp875j3Xiwio2ad+1nNZJz4uQTaywfmtV6uDap27VQcyT2Kjy30z2VbQJi1rhIE/CPqBdzwVUh8ujo52b1OMXb0FObn46FOJa04Ld+85RZT74aQBwzqli2V0DNQlYHsWYV6p0foYtFhbLgI0D7c8bQEyFN7UaOsI2nQWT1BTFc6JWU2KoRUPWv0GlW33QUKCP0EJHID52Nxh0pz01lJ+d+oYdaHk/cdKr/KePL94bctM8RUgrV0CoamYY9bOlAnu6bzP+LfkjNzcnKM/HyqkHULV8awnsEf1Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfH4OShB4JG8m6MaJouGNf2tIbTk2m6gERwASo/tB/w=;
 b=TenLAIgRtNOBSwlmIOJtRmiGnrclNpF0vx0lfWurpgeN3KCScHmfvb8XlpKlwCF3AeYyRtyN8nsPjIhVOF5xwHVqhN/uS+0fiVmnnPl0S5TXYTAvJipHWRXMKn+oNIw3BeEiaWtN+QYtUvMI4kDWsNhoig+MJF1eEG0TcHhpFNmjsyHrADzM7Exe4+uIsouzBwAsQ1l+rbn7Q+yMZb6HnxFtvaVyjdkG6lLJdiT0WPt1Wgk0F9759lHNhR77hMAV04cqJFpchpbgFUQ8N/UJMGLwDupCkTuqr1b1hq+IOC/YvJ4aiyPmEompS6I1IQlXhR9D45vqroz8G/Xjit53HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfH4OShB4JG8m6MaJouGNf2tIbTk2m6gERwASo/tB/w=;
 b=M5yk+sZvdYUGa2B38MBsQcFfXavzEdfdaCm+2o5E/ViggRmTrIlsYGwNc9TA145M4JbqsbuF6m6KlgUoo3oy3LcTbbhrwMKuB/YL7rZEmR668nzdHd6qp0rSDR1ncBcZ7+/huQ2Ci2IGUnRXgH4Z/ELrJ0WSteUwJKqqRwGcFOSm/FYA7OMW4Zhd9bX3/1sXuWfBViveiJ2NNIljJqXZZf6gqIeQu/v5OJ8zIf7qxjKYH2RHOzcEOwd9IJrRS02Mm1J7JkQFdPm9QvUkYLAsMlHQ1uzknaUhkH4TW4s4UYPCK6+EP1WVYjFTBA6i5uXMHci1HaYISslpSZCHq4a0YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS1PR04MB9240.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 20:39:02 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 13 Jan 2026
 20:39:02 +0000
Date: Tue, 13 Jan 2026 15:38:45 -0500
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
Subject: Re: [PATCH v7 3/6] PCI: dwc: Allow glue drivers to return mutable
 EPC features
Message-ID: <aWatVUFdyYz+JaMI@lizhi-Precision-Tower-5810>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-4-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113162719.3710268-4-den@valinux.co.jp>
X-ClientProxiedBy: BY5PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:180::36) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS1PR04MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: fba9e2c1-491c-4929-7666-08de52e3c92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2hMNfRm2aODEE76yn2H0jdesiM2Gd1T70/ZP9mHPo8E32n++hpn+pTvCoo49?=
 =?us-ascii?Q?NMCYgfjr1NnZg5MEhOdCBv7Zs2UYVY0Ge2VKdHv0tIbeopKCimiZA6tDVAuh?=
 =?us-ascii?Q?R2UZuJ/STLWY8/D85JaFbLLI51ZPrmbNZKeVtE+dARpZcA3Q9tHMVuu+H7F3?=
 =?us-ascii?Q?k2edQzLdeaUu64wXWeSaoQkIS0cBQSWyDEtQo/jjdw7IdF1COdCzOuHtqHbY?=
 =?us-ascii?Q?bxsqMkGZWGdeaE5D7tFHeGr0/woQCx/8gM+ogu1WN1XdIXznwN9a2qA/gxWF?=
 =?us-ascii?Q?ISxySCL65tYF9NiZIIz1cNENsx7jvp/Kl5XtncXq9wWInxlUMWhFjRm9Lidi?=
 =?us-ascii?Q?GCru/wPa217S8TExgc4ByEObm7AnWtv/5fYXJf9RXPkLZM9Aj6mkPFlW2hf/?=
 =?us-ascii?Q?4S8cbxdxPe1T1xRYE2EePcdL3sIWfjFccD3wEYRuj6z+MVkaw3z8E87lNR76?=
 =?us-ascii?Q?2+c/0x8ub8RynI5SbhOpMmyQM79/yZoP52w/j0wMRg1Bdyd9vRerv5K98man?=
 =?us-ascii?Q?gdJzycNXeRd4zzmjd5jrBdEDnoiMRFgeZgqvOIdukk9u5H165OR07kn/yTfO?=
 =?us-ascii?Q?Hq0LncyUhWW05YrVbP3Xy9oOjkag7Kb5ZdFmrZgP22WXD1adOsqwDyy/qZCO?=
 =?us-ascii?Q?byJYn4+b+y4D7H0lQ5ceOk4ss5t5KQUiWWJ3Ix8m6I6UucKAF66cKBu+zZpb?=
 =?us-ascii?Q?4Hx9dZPEQa1Ydn3IHK1/wSvRRAKvESikgPyQfJDSqV02pPbExJNCzBVBz2fh?=
 =?us-ascii?Q?chIQBtxU95/anwQxn8HitnDFzmFGgWMLHgQlQoncka7igyc3AHrG3G8v5zop?=
 =?us-ascii?Q?Fuj2CCLJAZ8mzASGCHFjf4RBGIRXlBQo24V5Bhb9qqYRhpyrw4LHRfX3aMpG?=
 =?us-ascii?Q?Tbqsaf+KjBDgZVa6jUoQ4dBOh+q6NQU8nx2IaH3dWvVHHGqYeQrejIVzlsXp?=
 =?us-ascii?Q?87CHbO3CyCojMdOWsk6xuG6MvVWVh4zWed1WUoTMhenx/3MTZZ5li8bwCVyQ?=
 =?us-ascii?Q?g0sqA5LVitUsVkGh0sY+okZC4W1qMJ9UgDUzMvUm8Qv9kx9zV8XbrLSrarzJ?=
 =?us-ascii?Q?WjAGfVkIAKPFoUl1jDtyubL3q79p/SmeJAGdBQXMQkBOWIVtapEEbE7YdVsy?=
 =?us-ascii?Q?3IrqRMDBAf0LrZW3dBCzqE8l2Jm8dquPcfsnmfx+N8XqtN9SdGt71EDPvRyX?=
 =?us-ascii?Q?dH9f93n87a2kXPwyBIi0ni8RKCVUhS45eyoNKg6Dv3tze28jp+UHg8CGGAW0?=
 =?us-ascii?Q?WhchYFaBJAasaW9f6LhJhyKskmv+ZlpPjD0n5yMNykfFomGEoQutWjcQ8hO+?=
 =?us-ascii?Q?SM6PuUjB/kDpebHWaWi9rK8jsR0T0ZFkwwI/QBeUdFRJYGE6d4OaECyVNufb?=
 =?us-ascii?Q?8edYMFoTTwpaxb2i5Py84rIT3rFFtJEqEGnWLe84dhZ2V7eb0W+sB9q2M4rL?=
 =?us-ascii?Q?9SKnfW0qmpxkrdUtZm18F7UXnJd5t4nkutzz+AfsVilRajF1F3UyX/KKXKf8?=
 =?us-ascii?Q?puTBuNTiY23y48xyRM+/onjMNH1YE5NkTsN4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uRSllbe33hiulVTBCb1SwGO7KgSv7P9UvmeSP/oZzWnznpGfq/Dfx+JKRd5P?=
 =?us-ascii?Q?oJAG/OQwgG2QYKa2mQByYT+EyWxO+mA4F39GP5+HdsZLgmFjcJOWtVgcdfN5?=
 =?us-ascii?Q?M5Z8OmlIxjaaNW+xMR/TTOq8ln2KQ124kMfofvRHxyVQULlhGnurp4EgQ2KK?=
 =?us-ascii?Q?KHdHepE9hDfWAatgZyK9NYJPE0Xu9fYh1z/8TS0nbzI+sjngTLH4JJegpPUJ?=
 =?us-ascii?Q?6SACLypixGudVxj2Z50/1t/Si5lLZibu9WOm9s1SaTKtZQCkaLuvXkvbKv7x?=
 =?us-ascii?Q?BqJQ28654JEyEgaRsaNI5VBBKCMqIwBnPfPn8IyvFTiyWwEs8MsbZrVEs30I?=
 =?us-ascii?Q?c3ZO8dNJ2lSk9pa4vZJZAPbXZdDjl1ohETFYGycZcpCNnAYTnDiP1Ft2zU8i?=
 =?us-ascii?Q?D+L6WveBaJc1LczCmD7VH1ADK4QOiPgzSd+c0uH4ZCcqaYGy7QEd5VzdKad5?=
 =?us-ascii?Q?86sxft39a0AFOvsyb2ryIbePFsQZ++6YFyk8/wmxQu70Ls/YPMVi/DQGLQB9?=
 =?us-ascii?Q?H8YVLKdoqmagW1jTdWj5wkbQ5rrZTTTsPG96FWLbrHMMcn5jsrNFAI4vxeg7?=
 =?us-ascii?Q?oXrsL+uVecwJVQNmpWQ2lbxdRc3ocvOWLvZSIzIRL0zVSonBhOdd28z4iCsA?=
 =?us-ascii?Q?YWvzq62makqNjwNzCODOkRyxN0H64UnCv/+1d/sMYC6zj7vCEFOZ6hrxzK/4?=
 =?us-ascii?Q?DBgY9eZvbZkjClEUhDwz+doDXP4f80Q6ssRj1zU3NnNjRemMDo2C9/h54GkT?=
 =?us-ascii?Q?DaaGBWUnw+Qh4z9/RiFbPkg4OtEcHaJhNPygyddCwRV8GIR9FGqIrj7HLhTy?=
 =?us-ascii?Q?Sb3rJOXNcWiRLF8O3YqDlbkkCO03vMCM0tgylm+UthzIU2dFqITtd7vFi5Bg?=
 =?us-ascii?Q?FJxp/Vq8Xx0nF8JgL3LgbkbV2YiQSZa4zOzFm9+MbMn+BkxogDwwcbIInbwA?=
 =?us-ascii?Q?fCKSTPfaKJG7dEg2W/n8pvLlFFIhy9F9Q+c75xRAhgBgiDuccfMJEUHHYsRU?=
 =?us-ascii?Q?TKvAQQhy2K1e225j57HtKxVigl43Js0tLzzXrIuDmjmb8Tkg221hHqD9yvEF?=
 =?us-ascii?Q?D3plDXVlOlc+D3qArK0YeOF6ffuFdfdWhemN2JrnmMFjTl6gNzSHuJOeYmUy?=
 =?us-ascii?Q?Zx3NhKHacvesDUEX83Va91kXUD3UcGIitDlt86lAGHsrjjx7mQGWj9AK9HZA?=
 =?us-ascii?Q?jI1+ABho7l1rWvwtsRjPf3clZ1RejV+GWdRmkXByZqdfnftXojSdd8IFyp2m?=
 =?us-ascii?Q?Aje7VcTnYgjGvV5YrNx4pmCdWsNxMP/mqI4QpHuX1zs0LXPnGatKz9fuJrwo?=
 =?us-ascii?Q?G9Woz3qbaKOWBEzh7XdY3crQ4jllFDY9C+PtYcxWHMoL8/r5pk6WG6i6OZMP?=
 =?us-ascii?Q?D6ZbW82YY+Ba80+rIN8OxIBvWxGmw4lyb9yQrrlbiMQxO44owEmMM//GLZyE?=
 =?us-ascii?Q?gMRGaav12w1f4n5wO17XX5HT+Zv5gg8BVhtzkSCOMzJ+1UNfLmUg1flvDzot?=
 =?us-ascii?Q?CZZTvPwPq4QW/08vyftWfJtjKJXt7OgtCHLJvqAlvB3VYWZm49bN7GEByKS+?=
 =?us-ascii?Q?pTePWqXiQ+29KuQhXQD1O1rix3sXfhL/GB0O3pXQp5aRN8w4xP0qnC8LCu9L?=
 =?us-ascii?Q?97CDT4RBhZdOiD4cWubHLAZOwtC1sActQWLPexEq+aZlihnYHobUbAoQDPV0?=
 =?us-ascii?Q?7mDnCVUu8J5i9T5Rb7XZStaTlmQIXxSci2tOb4IS4PlLVcLI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba9e2c1-491c-4929-7666-08de52e3c92b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 20:39:02.0694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpxXeLHnbqKZ2eXKaowjnAhVYXmT7Oxj+E+big8fZgS1OnoB0k+lZvDu7n8ERv/dGVAGN0qTq8R0kScIES13GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9240
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 01:27:16AM +0900, Koichiro Den wrote:
> The DesignWare EP midlayer needs to advertise additional capabilities at
> the DWC layer (e.g. subrange_mapping) without duplicating the same bit
> in every DWC-based glue driver and without copying feature structures.
>
> Change dw_pcie_ep_ops.get_features() to return a mutable
> struct pci_epc_features * and update all DWC-based glue drivers
> accordingly. The DWC midlayer can then adjust/augment the returned
> features while still exposing a const struct pci_epc_features * to the
> PCI EPC core.
>
> No functional change on its own.
>
> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  4 +-
>  drivers/pci/controller/dwc/pci-imx6.c         | 10 ++--
>  drivers/pci/controller/dwc/pci-keystone.c     |  4 +-
>  .../pci/controller/dwc/pci-layerscape-ep.c    |  2 +-
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 +-
>  .../pci/controller/dwc/pcie-designware-plat.c |  4 +-
>  drivers/pci/controller/dwc/pcie-designware.h  |  2 +-
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 +--
>  drivers/pci/controller/dwc/pcie-keembay.c     |  4 +-
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     |  4 +-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
>  drivers/pci/controller/dwc/pcie-stm32-ep.c    |  4 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  4 +-
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 58 ++++++++++---------
>  14 files changed, 60 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index 01cfd9aeb0b8..e67f8b7b56cb 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -423,12 +423,12 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>
> -static const struct pci_epc_features dra7xx_pcie_epc_features = {
> +static struct pci_epc_features dra7xx_pcie_epc_features = {
>  	.linkup_notifier = true,
>  	.msi_capable = true,
>  };
>
> -static const struct pci_epc_features*
> +static struct pci_epc_features*
>  dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
>  {
>  	return &dra7xx_pcie_epc_features;
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 4668fc9648bf..fe1de30b3df6 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -131,7 +131,7 @@ struct imx_pcie_drvdata {
>  	const u32 ltssm_mask;
>  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
>  	const u32 mode_mask[IMX_PCIE_MAX_INSTANCES];
> -	const struct pci_epc_features *epc_features;
> +	struct pci_epc_features *epc_features;
>  	int (*init_phy)(struct imx_pcie *pcie);
>  	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
>  	int (*core_reset)(struct imx_pcie *pcie, bool assert);
> @@ -1386,7 +1386,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>
> -static const struct pci_epc_features imx8m_pcie_epc_features = {
> +static struct pci_epc_features imx8m_pcie_epc_features = {
>  	.msi_capable = true,
>  	.bar[BAR_1] = { .type = BAR_RESERVED, },
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> @@ -1395,7 +1395,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
>  	.align = SZ_64K,
>  };
>
> -static const struct pci_epc_features imx8q_pcie_epc_features = {
> +static struct pci_epc_features imx8q_pcie_epc_features = {

Is it more simple if
#define DWC_EPC_DEFAULT	.dynamtic_map = true

Add
	DWC_EPC_DEFAULT, into every epc_features.


Frank

>  	.msi_capable = true,
>  	.bar[BAR_1] = { .type = BAR_RESERVED, },
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> @@ -1415,13 +1415,13 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
>   * BAR4	| Enable   | 32-bit  |  1 MB   | Programmable Size
>   * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
>   */
> -static const struct pci_epc_features imx95_pcie_epc_features = {
> +static struct pci_epc_features imx95_pcie_epc_features = {
>  	.msi_capable = true,
>  	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
>  	.align = SZ_4K,
>  };
>
> -static const struct pci_epc_features*
> +static struct pci_epc_features*
>  imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index f86d9111f863..4292007a9b3a 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -929,7 +929,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>
> -static const struct pci_epc_features ks_pcie_am654_epc_features = {
> +static struct pci_epc_features ks_pcie_am654_epc_features = {
>  	.msi_capable = true,
>  	.msix_capable = true,
>  	.bar[BAR_0] = { .type = BAR_RESERVED, },
> @@ -941,7 +941,7 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
>  	.align = SZ_64K,
>  };
>
> -static const struct pci_epc_features*
> +static struct pci_epc_features*
>  ks_pcie_am654_get_features(struct dw_pcie_ep *ep)
>  {
>  	return &ks_pcie_am654_epc_features;
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index a4a800699f89..8d48413050ef 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -138,7 +138,7 @@ static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
>  	return 0;
>  }
>
> -static const struct pci_epc_features*
> +static struct pci_epc_features*
>  ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> index f4a136ee2daf..84111d8257f2 100644
> --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> @@ -369,11 +369,11 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>
> -static const struct pci_epc_features artpec6_pcie_epc_features = {
> +static struct pci_epc_features artpec6_pcie_epc_features = {
>  	.msi_capable = true,
>  };
>
> -static const struct pci_epc_features *
> +static struct pci_epc_features *
>  artpec6_pcie_get_features(struct dw_pcie_ep *ep)
>  {
>  	return &artpec6_pcie_epc_features;
> diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> index 12f41886c65d..60ada0eb838e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> @@ -60,12 +60,12 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>
> -static const struct pci_epc_features dw_plat_pcie_epc_features = {
> +static struct pci_epc_features dw_plat_pcie_epc_features = {
>  	.msi_capable = true,
>  	.msix_capable = true,
>  };
>
> -static const struct pci_epc_features*
> +static struct pci_epc_features*
>  dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
>  {
>  	return &dw_plat_pcie_epc_features;
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index f87c67a7a482..4dda9a38d46b 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -449,7 +449,7 @@ struct dw_pcie_ep_ops {
>  	void	(*init)(struct dw_pcie_ep *ep);
>  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
>  			     unsigned int type, u16 interrupt_num);
> -	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> +	struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
>  	/*
>  	 * Provide a method to implement the different func config space
>  	 * access for different platform, if different func have different
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 352f513ebf03..1f3c91368dc3 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -100,7 +100,7 @@ struct rockchip_pcie {
>
>  struct rockchip_pcie_of_data {
>  	enum dw_pcie_device_mode mode;
> -	const struct pci_epc_features *epc_features;
> +	struct pci_epc_features *epc_features;
>  };
>
>  static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
> @@ -383,7 +383,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>
> -static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> +static struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
>  	.linkup_notifier = true,
>  	.msi_capable = true,
>  	.msix_capable = true,
> @@ -403,7 +403,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
>   * default.) If the host could write to BAR4, the iATU settings (for all other
>   * BARs) would be overwritten, resulting in (all other BARs) no longer working.
>   */
> -static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> +static struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
>  	.linkup_notifier = true,
>  	.msi_capable = true,
>  	.msix_capable = true,
> @@ -416,7 +416,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
>  	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
>  };
>
> -static const struct pci_epc_features *
> +static struct pci_epc_features *
>  rockchip_pcie_get_features(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> index 60e74ac782af..e6de5289329f 100644
> --- a/drivers/pci/controller/dwc/pcie-keembay.c
> +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> @@ -308,7 +308,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	}
>  }
>
> -static const struct pci_epc_features keembay_pcie_epc_features = {
> +static struct pci_epc_features keembay_pcie_epc_features = {
>  	.msi_capable		= true,
>  	.msix_capable		= true,
>  	.bar[BAR_0]		= { .only_64bit = true, },
> @@ -320,7 +320,7 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
>  	.align			= SZ_16K,
>  };
>
> -static const struct pci_epc_features *
> +static struct pci_epc_features *
>  keembay_pcie_get_features(struct dw_pcie_ep *ep)
>  {
>  	return &keembay_pcie_epc_features;
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index f1bc0ac81a92..6ad033301909 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -819,7 +819,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
>  				    qcom_pcie_ep_link_transition_count);
>  }
>
> -static const struct pci_epc_features qcom_pcie_epc_features = {
> +static struct pci_epc_features qcom_pcie_epc_features = {
>  	.linkup_notifier = true,
>  	.msi_capable = true,
>  	.align = SZ_4K,
> @@ -829,7 +829,7 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
>  };
>
> -static const struct pci_epc_features *
> +static struct pci_epc_features *
>  qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
>  {
>  	return &qcom_pcie_epc_features;
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 80778917d2dd..ff0c4af90eff 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -419,7 +419,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>
> -static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> +static struct pci_epc_features rcar_gen4_pcie_epc_features = {
>  	.msi_capable = true,
>  	.bar[BAR_1] = { .type = BAR_RESERVED, },
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> @@ -428,7 +428,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
>  	.align = SZ_1M,
>  };
>
> -static const struct pci_epc_features*
> +static struct pci_epc_features*
>  rcar_gen4_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  {
>  	return &rcar_gen4_pcie_epc_features;
> diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> index 2cecf32d2b0f..8a892def54f5 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> @@ -69,12 +69,12 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	}
>  }
>
> -static const struct pci_epc_features stm32_pcie_epc_features = {
> +static struct pci_epc_features stm32_pcie_epc_features = {
>  	.msi_capable = true,
>  	.align = SZ_64K,
>  };
>
> -static const struct pci_epc_features*
> +static struct pci_epc_features*
>  stm32_pcie_get_features(struct dw_pcie_ep *ep)
>  {
>  	return &stm32_pcie_epc_features;
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 0ddeef70726d..06f45a17e52c 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1987,7 +1987,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>
> -static const struct pci_epc_features tegra_pcie_epc_features = {
> +static struct pci_epc_features tegra_pcie_epc_features = {
>  	.linkup_notifier = true,
>  	.msi_capable = true,
>  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
> @@ -2000,7 +2000,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
>  	.align = SZ_64K,
>  };
>
> -static const struct pci_epc_features*
> +static struct pci_epc_features*
>  tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  {
>  	return &tegra_pcie_epc_features;
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index d6e73811216e..ddb5ff70340c 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -82,7 +82,7 @@ struct uniphier_pcie_ep_soc_data {
>  	bool has_gio;
>  	void (*init)(struct uniphier_pcie_ep_priv *priv);
>  	int (*wait)(struct uniphier_pcie_ep_priv *priv);
> -	const struct pci_epc_features features;
> +	struct pci_epc_features *features;
>  };
>
>  #define to_uniphier_pcie(x)	dev_get_drvdata((x)->dev)
> @@ -273,13 +273,13 @@ static int uniphier_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>
> -static const struct pci_epc_features*
> +static struct pci_epc_features*
>  uniphier_pcie_get_features(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct uniphier_pcie_ep_priv *priv = to_uniphier_pcie(pci);
>
> -	return &priv->data->features;
> +	return priv->data->features;
>  }
>
>  static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
> @@ -415,40 +415,44 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
>  	return 0;
>  }
>
> +static struct pci_epc_features uniphier_pro5_features = {
> +	.linkup_notifier = false,
> +	.msi_capable = true,
> +	.msix_capable = false,
> +	.align = 1 << 16,
> +	.bar[BAR_0] = { .only_64bit = true, },
> +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_2] = { .only_64bit = true, },
> +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_4] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +};
> +
> +static struct pci_epc_features uniphier_nx1_features = {
> +	.linkup_notifier = false,
> +	.msi_capable = true,
> +	.msix_capable = false,
> +	.align = 1 << 12,
> +	.bar[BAR_0] = { .only_64bit = true, },
> +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_2] = { .only_64bit = true, },
> +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_4] = { .only_64bit = true, },
> +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +};
> +
>  static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
>  	.has_gio = true,
>  	.init = uniphier_pcie_pro5_init_ep,
>  	.wait = NULL,
> -	.features = {
> -		.linkup_notifier = false,
> -		.msi_capable = true,
> -		.msix_capable = false,
> -		.align = 1 << 16,
> -		.bar[BAR_0] = { .only_64bit = true, },
> -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> -		.bar[BAR_2] = { .only_64bit = true, },
> -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> -		.bar[BAR_4] = { .type = BAR_RESERVED, },
> -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> -	},
> +	.features = &uniphier_pro5_features,
>  };
>
>  static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
>  	.has_gio = false,
>  	.init = uniphier_pcie_nx1_init_ep,
>  	.wait = uniphier_pcie_nx1_wait_ep,
> -	.features = {
> -		.linkup_notifier = false,
> -		.msi_capable = true,
> -		.msix_capable = false,
> -		.align = 1 << 12,
> -		.bar[BAR_0] = { .only_64bit = true, },
> -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> -		.bar[BAR_2] = { .only_64bit = true, },
> -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> -		.bar[BAR_4] = { .only_64bit = true, },
> -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> -	},
> +	.features = &uniphier_nx1_features,
>  };
>
>  static const struct of_device_id uniphier_pcie_ep_match[] = {
> --
> 2.51.0
>

