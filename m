Return-Path: <linuxppc-dev+bounces-15747-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6A0D21142
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 20:44:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drxQv4xHfz2xT6;
	Thu, 15 Jan 2026 06:44:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768419895;
	cv=pass; b=TYYJZijrP9UlKyH2HDQxCrREfXZGzeMnv3GK3pQ33Vk26v/k5ph3wO00v4LQ5YiPTvbe/Nj5cu/cFeW+YvkwaOpjqam753xGiKZNsRYxYlJkhGKaWQDMkL8fEwdaJjaONYyDs2hOKsgasPj/8LGFJMKMIqxjHslsAFo3oaZg7GCLbhjpg3NHKOUGJ16iaQcLvO+3hXyOct7M6HOoVwYRQTspAYAfF1kLXFAfwLtwakfZaV61Kgh+cH1JiypSWtwJJb/IMk8d9yTsT6nfhgtZNkxqqU5tdWdUojqJ6hhWrnjUZcMnpWnj8Y9PsWiytDappWlDajf9AU3PZm63uyafmg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768419895; c=relaxed/relaxed;
	bh=E6H0C9rBH96ccfflCBwqR1X9JT4LF0rbIn+41cJYB0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A2Bl1JX+Hf5maVbNlKTj1T9qoN8OtJj4tEKj3Rmmw3cm3IV+zRINiBkPz3RwaprWG/Zi2Lw66kXjDt+oVsX1XKLAVfnL7+ykfg/6C5oCuW7lEFGjT2suqNBJTMFW6q8qTCiI9zOPlz7JOXGYNSkfwxrOGUkRAXVq2ydUlfsC0VgRCqFEpWAzDVQ73HKWzyjGzkKzYs4RVuSRAH3sY0W3duAaGnSzzvkZ1dPcpcJPWdWZF31DRnJq/EK1sdwwWsq0hiYMYNpYcxKuwf3p/V+qrBkQEyYILo687MlLKsbCoJYShyv7n97A0BQwEXiuFK4JOXnEJu/OiwWRgyW97O5QcA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XZm8LVrF; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XZm8LVrF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drxQs5sb1z2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 06:44:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3eTpvAUCZZxP1uKT8aUzMfy48zUN25teM2c5XK89n7qnc6xAoC/M8oVhcsLavfikWa0QPEcU+7TyWf8ZUZYcH4gRpGJvsIunwM7ueQu+Xz/HJ/ej8t62TiAjD9w99jqp+LyA6iH71kDxwAXt5gCx/yD1wVb0W1BhrWvEUot8ArHk3St2WVUz7sKOuw1eViFldV73EflSgEU2QzqzQjBqCCpXxS0OdRhTOSOS/S6VxqZHMV++HIbq1TdLe9sUbqvUdPYd8MuCrwXuiPlfut/U+X6dWVPrMDBXCeUwmKhn8kdN5smEZdo9u4nQqeQnxlrdgQU1MHSOhmDA6myB5Wt7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6H0C9rBH96ccfflCBwqR1X9JT4LF0rbIn+41cJYB0Q=;
 b=Bvc08wn/CVMeJrcowaanMyVMaHnQ4jK23DBi6l4gu6jtRoLLE23oUMS0+/66R0ndYbSfCTRVhyCrgIVvqxZuA+RzdPhDEGM0Q4Ns4GpHcT1LRAHQwzxk+8EJD7ShTCB2pme9xryRe0/xvy8mOylsPwXQJbUO+a6Ar/xE3m4ddcMuIUdBrzk/OJtQWWS/ISwO/hKcYBq3DFGRJBS+IVCsl0cJ3MuG28ycm72cJeyjfCeKqoP1khrBkP4BiqFLkbURQ6DhFt/a5rcAyPFQINbYVh8CCb8z5Kit3ghVqDmEy6r0qABtxdt304M2e5I4JIc36fkzSDflxcSuGzW0aNcgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6H0C9rBH96ccfflCBwqR1X9JT4LF0rbIn+41cJYB0Q=;
 b=XZm8LVrFM115ArU1ePuiYsgecqyL4LCwPWt+4WkSKseFXKwhCpACI/5pAHlz1L5vNTnajGo3g0WygbCHzzvgc57mbYBTblQxSj6u8I+2ejNGVrSu/c+BCRw7GamTiPc2AN9IOSmumFUyv+BvTMWYYVFub9HzkC+4C+PV8hBiYxIKeE41Gux4hTdtSzHdmbPeYYMIWt4fgAg2woZiQKpofEjHStQPTEItxG3uIEk+uAPqq1vD9yPzvJKvBq3kkn2NLEr14N4GcRYslif0l/hS42TKu1L2up7iTJVgVhSmDGkggnfE5T/tvDkWzcsktGp1eo96whbbebDMp6yCdQT7Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by AM9PR04MB7649.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 19:44:28 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Wed, 14 Jan 2026
 19:44:28 +0000
Date: Wed, 14 Jan 2026 14:44:12 -0500
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
Message-ID: <aWfyDHZCoh1t6/vP@lizhi-Precision-Tower-5810>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-4-den@valinux.co.jp>
 <aWatVUFdyYz+JaMI@lizhi-Precision-Tower-5810>
 <mz3ahnech7yn66hcv7hqllir6rz6qpjd6m2aj3feh2gqfsvpwk@oobwtkb6o2jx>
 <aWe0KJnZNHqSUAKg@lizhi-Precision-Tower-5810>
 <m47oybaq4u2noqqd77czzgwwnmmquhvarjnxgijlhb5neulznt@dts3icronu6u>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m47oybaq4u2noqqd77czzgwwnmmquhvarjnxgijlhb5neulznt@dts3icronu6u>
X-ClientProxiedBy: PH8P221CA0066.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::6) To AS8PR04MB8948.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|AM9PR04MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a3fcca-e443-4868-5f96-08de53a55448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OUl0vs6YsqYs1ps50eSC1SKcgrFsbkoIvjeGSZ9+NPvo9KVBRnAkwwp7wRfh?=
 =?us-ascii?Q?bXjGgI2pxbUVdEymqqUSM6JzvJxBPWDYz+iZDzFcS8dL44npIP6Is4ZJZb9u?=
 =?us-ascii?Q?fwAXdcztEFp20qVDjWr35gIEowTzPmn0gEb4jyNRTxnmK3l8dRG/nunGg5cH?=
 =?us-ascii?Q?JSiwcvrMs/de76stZ28XeD/AZ0GQa9G70IeljGWDOpOOouJsrG1Fda9G80HN?=
 =?us-ascii?Q?pLox50CvcH5i91gQb2fQAlTWsrND6LPMt9Om67+FDqq64N0VnhQzqBGCzoRz?=
 =?us-ascii?Q?n9C5FpFykvSdcle9/VYCRv218GmqPHDk1g868yq5DtO+kCHWi7nwGgRRFbVt?=
 =?us-ascii?Q?aEAbNglzf8WbPGXMDiZwqte/BUJ4YHextguv+ElKDZ1FpwGcJflT3N/rXQ77?=
 =?us-ascii?Q?mxLlIybtxZxa+HvKhHyKqQy7pZuNWthG2mV3dVivkCYp+o1OYUrbwkR1IVpY?=
 =?us-ascii?Q?3QtqPIZ5sR7u5CM3eoSdMzHbDOpPVGY09nYhlVvtqNNAzDa5xrBtV8HHYiQh?=
 =?us-ascii?Q?d55ZuMS0ucPaavPcDOQ08ykxD7902WbrNLyYtlpAECXO3dmjKVqLlGNS229V?=
 =?us-ascii?Q?cvxMNYWepnjAjM83HSsN5SCxe8o9klbYMSdwg7ImoZuYzEPRIUoP0E038Fm1?=
 =?us-ascii?Q?9J+doszYNN6c+pNfh2ekkhbUTPYRHw/enjuftOIOwW4RXlQCzu6ixqCPVIac?=
 =?us-ascii?Q?/ndHlC1xRdticnvJeYRmzIkkAxypx/AmeIoLV27OWz1lQUePqqplhBksmpSr?=
 =?us-ascii?Q?MWOFWCKln7SoQ6eGueET5YolgNbPy9PPkHbE2YTQwKK8GNSvt1ddbDoIJHjP?=
 =?us-ascii?Q?lX+t/n8rPYR3ru53Qu+pQsZMIUkbSD1vnQg1vSuRa899uxlwwbR8GJw6O0Pq?=
 =?us-ascii?Q?nrbyKVN0X8AbDXhoGU1itNv+RXe+14xSmv3ole0VSnGsXiAB87iLfBzwHdRh?=
 =?us-ascii?Q?LDO8z4swg8RSr7YNQXsvj1GbvGkn+VPORFHMeqmYkrDPydpjGHOZrJma/I3d?=
 =?us-ascii?Q?vuZna+qkfzb8Hc6e8bBMwjrs8NFFMKWvp8osx+A1w14chQmc40xPkUUKvF5O?=
 =?us-ascii?Q?BPbU2adjmq9LqsX5qFcXXZS3PmJh152eCORdATNW6RafVGm4+IvPr/OnWFmA?=
 =?us-ascii?Q?3JcgV7azWNVHCtPIeg8KoIKz3XOgofcP4bY8VxS3L68hcZVK5gREzpZkWy+6?=
 =?us-ascii?Q?whCbh0vZRTPRoOM1RTsIiGSN+Xxb0gha3TT3Je3KObsR+HGIFITLY+rKWUzo?=
 =?us-ascii?Q?rTfS/Z/V3BIblttJmnyJ/4ww8ZTGRZzsLQrnfjijpe81yeZpMbpkhsEpMzxI?=
 =?us-ascii?Q?CBNSKW5kEYvAgiEvUJG+Lnl2c28jtVEBFlR2CpzIcLLFaE0fUrLkSKQkLG0k?=
 =?us-ascii?Q?kxJW5t4udvOwwygVuHAUI5lslWVjpL6X+I+8QBBLA7xynmmz0aCohWSFUDh2?=
 =?us-ascii?Q?/c1lubZ+kEUSMGrXp0igowvdSj1JgQzchT4aUWHjrUrSzL8vK5R5Z9TG6TAi?=
 =?us-ascii?Q?l0kaOt8Hn0e8q7bF7snWLixnqk5aFTmg0eJo30wzF28DJAmVdsrZVQv/x/4K?=
 =?us-ascii?Q?DDxXzQw014rNdGFT2RPlk2byduMN+un6s7WztCPAf5dDjQKmdNsmVLURYugK?=
 =?us-ascii?Q?LhpTuaPpyF6mlQRoreMQjBA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hW82qFlGyOnvfHZYJT7jW0zB0VYIXEmx/ALt/wzzcgdAkMHlTLyPR4lD/H/E?=
 =?us-ascii?Q?uf6BPQ8ldPqBom/mRHGj4G7S5tYppjdCIYF3OhWIA75ix+afzmOcGUWGvhw8?=
 =?us-ascii?Q?KOE+4iFrcgsuPMN6OwW1fdsTGK/Ke/Y4UEmZxCKI3eAohrtubhBksWdaWpns?=
 =?us-ascii?Q?Nb5YaKBJMh/LvVTipEz3K9eisCa3urjG9dDuI5uzrw69ra0d/kFRN8FiLkgV?=
 =?us-ascii?Q?IsPKFKn1qHLSu7lNU6VSzknp+hRFZWX8mSD454ub/iKca1AHB6dUpb5d1Sg4?=
 =?us-ascii?Q?/UhxwJoTg5yPIJ1pWIlG+uNU6DJqjdzK5aEWhRSjRxaj3D1hzCdqFAl4uxFz?=
 =?us-ascii?Q?gUvtAPdvunCXsgu/zuRtoPBB++Tnmv8fovr2XLeMHzyxHeDfC5rpv9QK69za?=
 =?us-ascii?Q?koZljUop110bqxXzDnU1slQLDyxN7zi26BCr3z2Et0z/ZMwL4YhP2Zyib0bt?=
 =?us-ascii?Q?7fHCDmjxPowIFH6D5DPRmFGgxVNj/tQ/X2FEk/DVpOVN+I4b8++rXWOOXpq5?=
 =?us-ascii?Q?erpFn33RyEIgNOK00IOdeXkc9DiOpt+DkvArRsD57EqdEoKKlmRiVWWvmNUk?=
 =?us-ascii?Q?D3u9RhLJHB+VtPIkNw3AycbpiPmIS2TH8qJIHGngPbx8dYSdQEYauQcAGQGE?=
 =?us-ascii?Q?8VMpDYAJ6j5I0Ey9izJ3sitPkyQiniSeIBdhAhWwiHovg7QEvh9srAII5PhG?=
 =?us-ascii?Q?cKBwJEYxfxacZqM7wgHzQe2Qk8czMCOrB/onQ/8lqi4clIsghm4p4dZ7lCbQ?=
 =?us-ascii?Q?h2+ttov1JhDM+UleVlbGK4i53bkFGK1Xr4PocZ+XLk5IaLE0/JsBnzKnM1qu?=
 =?us-ascii?Q?4Cp62+HTvoM3tej9CiM6527QgQjEP7yWE67UtjIVdYsH+8Xcul2JkRSv6cav?=
 =?us-ascii?Q?75cYBTDLh3vmcImiBbz/uR9xgrLeJr19PXAUn4yayXMXayAFfCCkFplQevFF?=
 =?us-ascii?Q?TyIAFM9RH90sC/tHcfGw6TRCo7ZoK2eQmbmzP+BDuAszwUXPMUeTrbd4GcQT?=
 =?us-ascii?Q?uOKjLQNVmAEMCsEqBYp5+4HFfqEdA3+kJXY86zasF43hX7d64Eq16RQgI8YY?=
 =?us-ascii?Q?hFokdQi0d4Z17SyhS52B2KCi7ZcdE1DqnzN0/ZacpCjRz6dlBmYS8IT6vbiv?=
 =?us-ascii?Q?GgJ+sWTk6ScIAzsRXExokJv/XCMDXcv8ZX014n7EOcOuUULWy2YPTBT1IXfc?=
 =?us-ascii?Q?x10sfCFPmu4R6rhp9dutTRVf4Uxgi/rcbi5eIsf6hIUiaEpW21vHZBqesu6k?=
 =?us-ascii?Q?o6FwbmEi17S5H98CZL9u/SFforZdV595rUWs4U7pPJ73jiTlJzGhMTtFCCQa?=
 =?us-ascii?Q?U0zrefiHYEuh1ljPg5CQEqmdVHO5fCOY9QZlCAx3K9a3mHo+W2gaJ/qzA4Lu?=
 =?us-ascii?Q?1NG21t33bZtmwDXj160X+86QEl0ieMHrmwhCtQuaWZaYlSJM7VJliZUV07PO?=
 =?us-ascii?Q?Kp9owz+zu4wpWtDjoBWMoqzrV2wjw+q6hUlduZpy5i4fgo/PDgtDQXE65tLt?=
 =?us-ascii?Q?oE2ApfxN5uTryO8G07DHGwnEAOMTlhN6m/g+4CH6MQGXSy6I6Dy2+wz4hUPH?=
 =?us-ascii?Q?U7FNulSheCDvTX8p8ivqTcO3vOIzNR9v+3lH8016wA4d5NiCDb7SJVXLUUG4?=
 =?us-ascii?Q?C7GQ40mElWPAUhobzLU6vA1ELZojrpItTTMtMBWNh8FqJId6qvzE/1E00SRG?=
 =?us-ascii?Q?nDTXVBTU5GNdAie6JOLTkroEQQ3X0D80+LfVV1zAuyAG+0Be?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a3fcca-e443-4868-5f96-08de53a55448
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:44:28.6515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Q8/E8l+8/AjMje6mCZdYTd9xaTYez6J5COCNlTdoKuslBEWSEzXMa0UM5e7EtrXNhlUHQ70K2hvyexnsmWTOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7649
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 02:17:07AM +0900, Koichiro Den wrote:
> On Wed, Jan 14, 2026 at 10:20:08AM -0500, Frank Li wrote:
> > On Wed, Jan 14, 2026 at 12:29:00PM +0900, Koichiro Den wrote:
> > > On Tue, Jan 13, 2026 at 03:38:45PM -0500, Frank Li wrote:
> > > > On Wed, Jan 14, 2026 at 01:27:16AM +0900, Koichiro Den wrote:
> > > > > The DesignWare EP midlayer needs to advertise additional capabilities at
> > > > > the DWC layer (e.g. subrange_mapping) without duplicating the same bit
> > > > > in every DWC-based glue driver and without copying feature structures.
> > > > >
> > > > > Change dw_pcie_ep_ops.get_features() to return a mutable
> > > > > struct pci_epc_features * and update all DWC-based glue drivers
> > > > > accordingly. The DWC midlayer can then adjust/augment the returned
> > > > > features while still exposing a const struct pci_epc_features * to the
> > > > > PCI EPC core.
> > > > >
> > > > > No functional change on its own.
> > > > >
> > > > > Suggested-by: Niklas Cassel <cassel@kernel.org>
> > > > > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> > > > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > > > ---
> > > > >  drivers/pci/controller/dwc/pci-dra7xx.c       |  4 +-
> > > > >  drivers/pci/controller/dwc/pci-imx6.c         | 10 ++--
> > > > >  drivers/pci/controller/dwc/pci-keystone.c     |  4 +-
> > > > >  .../pci/controller/dwc/pci-layerscape-ep.c    |  2 +-
> > > > >  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 +-
> > > > >  .../pci/controller/dwc/pcie-designware-plat.c |  4 +-
> > > > >  drivers/pci/controller/dwc/pcie-designware.h  |  2 +-
> > > > >  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 +--
> > > > >  drivers/pci/controller/dwc/pcie-keembay.c     |  4 +-
> > > > >  drivers/pci/controller/dwc/pcie-qcom-ep.c     |  4 +-
> > > > >  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
> > > > >  drivers/pci/controller/dwc/pcie-stm32-ep.c    |  4 +-
> > > > >  drivers/pci/controller/dwc/pcie-tegra194.c    |  4 +-
> > > > >  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 58 ++++++++++---------
> > > > >  14 files changed, 60 insertions(+), 56 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> > > > > index 01cfd9aeb0b8..e67f8b7b56cb 100644
> > > > > --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> > > > > +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> > > > > @@ -423,12 +423,12 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features dra7xx_pcie_epc_features = {
> > > > > +static struct pci_epc_features dra7xx_pcie_epc_features = {
> > > > >  	.linkup_notifier = true,
> > > > >  	.msi_capable = true,
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features*
> > > > > +static struct pci_epc_features*
> > > > >  dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	return &dra7xx_pcie_epc_features;
> > > > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > > > > index 4668fc9648bf..fe1de30b3df6 100644
> > > > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > > > @@ -131,7 +131,7 @@ struct imx_pcie_drvdata {
> > > > >  	const u32 ltssm_mask;
> > > > >  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
> > > > >  	const u32 mode_mask[IMX_PCIE_MAX_INSTANCES];
> > > > > -	const struct pci_epc_features *epc_features;
> > > > > +	struct pci_epc_features *epc_features;
> > > > >  	int (*init_phy)(struct imx_pcie *pcie);
> > > > >  	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
> > > > >  	int (*core_reset)(struct imx_pcie *pcie, bool assert);
> > > > > @@ -1386,7 +1386,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features imx8m_pcie_epc_features = {
> > > > > +static struct pci_epc_features imx8m_pcie_epc_features = {
> > > > >  	.msi_capable = true,
> > > > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > > @@ -1395,7 +1395,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
> > > > >  	.align = SZ_64K,
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features imx8q_pcie_epc_features = {
> > > > > +static struct pci_epc_features imx8q_pcie_epc_features = {
> > > >
> > > > Is it more simple if
> > > > #define DWC_EPC_DEFAULT	.dynamtic_map = true
> > > >
> > > > Add
> > > > 	DWC_EPC_DEFAULT, into every epc_features.
> > >
> > > One corner case is that pci-layerscape-ep.c builds the pci_epc_features
> >
> > It is our old platform. I checked code, it should be wrong. features should
> > report EPC hardware capibility.
>
> I'm not really sure whether commit cc255eb0bfbe ("PCI: layerscape: Modify
> the way of getting capability with different PEX") was wrong.
> Do you have a patch in mind?

I think it's wrong. And it doesn't impact your patch. Just leave it as it.
we can add submap support later if need.

Frank

>
> >
> > > dynamically in ls_pcie_ep_init(), rather than providing a static definition
> > > with an initializer. I think setting (ie. overriding) the bit centrally in
> > > dw_pcie_ep_get_features() keeps things simpler.
> >
> > In case one of chip have bugs, which need remove .dynamtic_map.
>
> This is a good point.
>
> Thanks,
> Koichiro
>
> > DWC_EPC_DEFAULT will be simple.
> >
> > Frank
> > >
> > > Thanks,
> > > Koichiro
> > >
> > > >
> > > >
> > > > Frank
> > > >
> > > > >  	.msi_capable = true,
> > > > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > > @@ -1415,13 +1415,13 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
> > > > >   * BAR4	| Enable   | 32-bit  |  1 MB   | Programmable Size
> > > > >   * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
> > > > >   */
> > > > > -static const struct pci_epc_features imx95_pcie_epc_features = {
> > > > > +static struct pci_epc_features imx95_pcie_epc_features = {
> > > > >  	.msi_capable = true,
> > > > >  	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
> > > > >  	.align = SZ_4K,
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features*
> > > > > +static struct pci_epc_features*
> > > > >  imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > > > > index f86d9111f863..4292007a9b3a 100644
> > > > > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > > > > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > > > > @@ -929,7 +929,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features ks_pcie_am654_epc_features = {
> > > > > +static struct pci_epc_features ks_pcie_am654_epc_features = {
> > > > >  	.msi_capable = true,
> > > > >  	.msix_capable = true,
> > > > >  	.bar[BAR_0] = { .type = BAR_RESERVED, },
> > > > > @@ -941,7 +941,7 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
> > > > >  	.align = SZ_64K,
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features*
> > > > > +static struct pci_epc_features*
> > > > >  ks_pcie_am654_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	return &ks_pcie_am654_epc_features;
> > > > > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > > index a4a800699f89..8d48413050ef 100644
> > > > > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > > @@ -138,7 +138,7 @@ static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features*
> > > > > +static struct pci_epc_features*
> > > > >  ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> > > > > index f4a136ee2daf..84111d8257f2 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> > > > > @@ -369,11 +369,11 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features artpec6_pcie_epc_features = {
> > > > > +static struct pci_epc_features artpec6_pcie_epc_features = {
> > > > >  	.msi_capable = true,
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features *
> > > > > +static struct pci_epc_features *
> > > > >  artpec6_pcie_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	return &artpec6_pcie_epc_features;
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > > > > index 12f41886c65d..60ada0eb838e 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > > > > @@ -60,12 +60,12 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features dw_plat_pcie_epc_features = {
> > > > > +static struct pci_epc_features dw_plat_pcie_epc_features = {
> > > > >  	.msi_capable = true,
> > > > >  	.msix_capable = true,
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features*
> > > > > +static struct pci_epc_features*
> > > > >  dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	return &dw_plat_pcie_epc_features;
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > > > > index f87c67a7a482..4dda9a38d46b 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > > > @@ -449,7 +449,7 @@ struct dw_pcie_ep_ops {
> > > > >  	void	(*init)(struct dw_pcie_ep *ep);
> > > > >  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  			     unsigned int type, u16 interrupt_num);
> > > > > -	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> > > > > +	struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> > > > >  	/*
> > > > >  	 * Provide a method to implement the different func config space
> > > > >  	 * access for different platform, if different func have different
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > > > index 352f513ebf03..1f3c91368dc3 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > > > @@ -100,7 +100,7 @@ struct rockchip_pcie {
> > > > >
> > > > >  struct rockchip_pcie_of_data {
> > > > >  	enum dw_pcie_device_mode mode;
> > > > > -	const struct pci_epc_features *epc_features;
> > > > > +	struct pci_epc_features *epc_features;
> > > > >  };
> > > > >
> > > > >  static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
> > > > > @@ -383,7 +383,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> > > > > +static struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> > > > >  	.linkup_notifier = true,
> > > > >  	.msi_capable = true,
> > > > >  	.msix_capable = true,
> > > > > @@ -403,7 +403,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> > > > >   * default.) If the host could write to BAR4, the iATU settings (for all other
> > > > >   * BARs) would be overwritten, resulting in (all other BARs) no longer working.
> > > > >   */
> > > > > -static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> > > > > +static struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> > > > >  	.linkup_notifier = true,
> > > > >  	.msi_capable = true,
> > > > >  	.msix_capable = true,
> > > > > @@ -416,7 +416,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> > > > >  	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features *
> > > > > +static struct pci_epc_features *
> > > > >  rockchip_pcie_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> > > > > index 60e74ac782af..e6de5289329f 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-keembay.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> > > > > @@ -308,7 +308,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	}
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features keembay_pcie_epc_features = {
> > > > > +static struct pci_epc_features keembay_pcie_epc_features = {
> > > > >  	.msi_capable		= true,
> > > > >  	.msix_capable		= true,
> > > > >  	.bar[BAR_0]		= { .only_64bit = true, },
> > > > > @@ -320,7 +320,7 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
> > > > >  	.align			= SZ_16K,
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features *
> > > > > +static struct pci_epc_features *
> > > > >  keembay_pcie_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	return &keembay_pcie_epc_features;
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > > index f1bc0ac81a92..6ad033301909 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > > @@ -819,7 +819,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
> > > > >  				    qcom_pcie_ep_link_transition_count);
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features qcom_pcie_epc_features = {
> > > > > +static struct pci_epc_features qcom_pcie_epc_features = {
> > > > >  	.linkup_notifier = true,
> > > > >  	.msi_capable = true,
> > > > >  	.align = SZ_4K,
> > > > > @@ -829,7 +829,7 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
> > > > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features *
> > > > > +static struct pci_epc_features *
> > > > >  qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
> > > > >  {
> > > > >  	return &qcom_pcie_epc_features;
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > > > index 80778917d2dd..ff0c4af90eff 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > > > @@ -419,7 +419,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > > > > +static struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > > > >  	.msi_capable = true,
> > > > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > > @@ -428,7 +428,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > > > >  	.align = SZ_1M,
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features*
> > > > > +static struct pci_epc_features*
> > > > >  rcar_gen4_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	return &rcar_gen4_pcie_epc_features;
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > > > index 2cecf32d2b0f..8a892def54f5 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > > > @@ -69,12 +69,12 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	}
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features stm32_pcie_epc_features = {
> > > > > +static struct pci_epc_features stm32_pcie_epc_features = {
> > > > >  	.msi_capable = true,
> > > > >  	.align = SZ_64K,
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features*
> > > > > +static struct pci_epc_features*
> > > > >  stm32_pcie_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	return &stm32_pcie_epc_features;
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> > > > > index 0ddeef70726d..06f45a17e52c 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> > > > > @@ -1987,7 +1987,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features tegra_pcie_epc_features = {
> > > > > +static struct pci_epc_features tegra_pcie_epc_features = {
> > > > >  	.linkup_notifier = true,
> > > > >  	.msi_capable = true,
> > > > >  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
> > > > > @@ -2000,7 +2000,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
> > > > >  	.align = SZ_64K,
> > > > >  };
> > > > >
> > > > > -static const struct pci_epc_features*
> > > > > +static struct pci_epc_features*
> > > > >  tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	return &tegra_pcie_epc_features;
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > > > > index d6e73811216e..ddb5ff70340c 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > > > > @@ -82,7 +82,7 @@ struct uniphier_pcie_ep_soc_data {
> > > > >  	bool has_gio;
> > > > >  	void (*init)(struct uniphier_pcie_ep_priv *priv);
> > > > >  	int (*wait)(struct uniphier_pcie_ep_priv *priv);
> > > > > -	const struct pci_epc_features features;
> > > > > +	struct pci_epc_features *features;
> > > > >  };
> > > > >
> > > > >  #define to_uniphier_pcie(x)	dev_get_drvdata((x)->dev)
> > > > > @@ -273,13 +273,13 @@ static int uniphier_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static const struct pci_epc_features*
> > > > > +static struct pci_epc_features*
> > > > >  uniphier_pcie_get_features(struct dw_pcie_ep *ep)
> > > > >  {
> > > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > >  	struct uniphier_pcie_ep_priv *priv = to_uniphier_pcie(pci);
> > > > >
> > > > > -	return &priv->data->features;
> > > > > +	return priv->data->features;
> > > > >  }
> > > > >
> > > > >  static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
> > > > > @@ -415,40 +415,44 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > +static struct pci_epc_features uniphier_pro5_features = {
> > > > > +	.linkup_notifier = false,
> > > > > +	.msi_capable = true,
> > > > > +	.msix_capable = false,
> > > > > +	.align = 1 << 16,
> > > > > +	.bar[BAR_0] = { .only_64bit = true, },
> > > > > +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > > +	.bar[BAR_2] = { .only_64bit = true, },
> > > > > +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > > +	.bar[BAR_4] = { .type = BAR_RESERVED, },
> > > > > +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > > > +};
> > > > > +
> > > > > +static struct pci_epc_features uniphier_nx1_features = {
> > > > > +	.linkup_notifier = false,
> > > > > +	.msi_capable = true,
> > > > > +	.msix_capable = false,
> > > > > +	.align = 1 << 12,
> > > > > +	.bar[BAR_0] = { .only_64bit = true, },
> > > > > +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > > +	.bar[BAR_2] = { .only_64bit = true, },
> > > > > +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > > +	.bar[BAR_4] = { .only_64bit = true, },
> > > > > +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > > > +};
> > > > > +
> > > > >  static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
> > > > >  	.has_gio = true,
> > > > >  	.init = uniphier_pcie_pro5_init_ep,
> > > > >  	.wait = NULL,
> > > > > -	.features = {
> > > > > -		.linkup_notifier = false,
> > > > > -		.msi_capable = true,
> > > > > -		.msix_capable = false,
> > > > > -		.align = 1 << 16,
> > > > > -		.bar[BAR_0] = { .only_64bit = true, },
> > > > > -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > > -		.bar[BAR_2] = { .only_64bit = true, },
> > > > > -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > > -		.bar[BAR_4] = { .type = BAR_RESERVED, },
> > > > > -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > > > -	},
> > > > > +	.features = &uniphier_pro5_features,
> > > > >  };
> > > > >
> > > > >  static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
> > > > >  	.has_gio = false,
> > > > >  	.init = uniphier_pcie_nx1_init_ep,
> > > > >  	.wait = uniphier_pcie_nx1_wait_ep,
> > > > > -	.features = {
> > > > > -		.linkup_notifier = false,
> > > > > -		.msi_capable = true,
> > > > > -		.msix_capable = false,
> > > > > -		.align = 1 << 12,
> > > > > -		.bar[BAR_0] = { .only_64bit = true, },
> > > > > -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > > -		.bar[BAR_2] = { .only_64bit = true, },
> > > > > -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > > > -		.bar[BAR_4] = { .only_64bit = true, },
> > > > > -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > > > -	},
> > > > > +	.features = &uniphier_nx1_features,
> > > > >  };
> > > > >
> > > > >  static const struct of_device_id uniphier_pcie_ep_match[] = {
> > > > > --
> > > > > 2.51.0
> > > > >

