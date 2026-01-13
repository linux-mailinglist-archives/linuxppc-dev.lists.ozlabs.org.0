Return-Path: <linuxppc-dev+bounces-15670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D26D1B507
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 21:57:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drM4h1KGhz2xWP;
	Wed, 14 Jan 2026 07:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.162.1 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768337828;
	cv=pass; b=JLyjDUbpA9MdyhoQR9zdU196B743NBcXbVejntr6ogewZUZ/E02mwDfxLTSMus/2wvwJuh0pIXeURrhVja23Lwk9zGaXifRlxd3BEoplt0XZyhIOqCMhASprslwNq1y3pXmRG5vW421bsRcoOEoUfsrpgvx7P47k7NsA9U1GY912WmDC50mwTwrCKNp+BD5rulyFosQwyLK82HUTkpp7nw2vVbxGZ06z5SQtiiywm2rknWTIK1MjZqb/pMz/sXn7TfMrdbnF+JF8uyNs7/3/L+YAcnTH9WiezoIcsr9nxRYt0VHIeKV5KCNN87lS2l8Zdtr8hFn0TBpv/08Cr+rsFA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768337828; c=relaxed/relaxed;
	bh=DVmSYEthlU7/aLflsiBoas+NWEIzmin6y7Rq+JT3wqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dmzhia+cg7KGjURVrhMC1eV6ENSjdR1psB2EMnh9WeSDoAbzWkukxVHvh5H5muyqlswKc6nEQZvwM9enCGt2G0YDG3YGejOVJ76lDLCLvDLMHcGspLQ3Vc9MV8sj4UsufSmj4vn+DwSgndqGDkN2xHeUX+OCbbHEMzOZEk8WuuRHojQubTI42+qwf+qAdtm5r8oudk3hSgAwIHCJmQJ4Q39YAxg7AXxG+ciVqpUpUJeIsSZ2KVnf3B1VSS0Xb8gtz6WGW59TsVg019Kyc0utISDFM2SSI508AMbU862IUR/2S9czGYUc8vfhqNXFJUprVfG0a9jb78OdwqN6OXikYg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=egbfdkxc; dkim-atps=neutral; spf=pass (client-ip=40.107.162.1; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=egbfdkxc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.162.1; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013001.outbound.protection.outlook.com [40.107.162.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drM4f71qxz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 07:57:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMkzS2wEY0UKQKRLXauvdLvOBhF3XKIilg6J+WAhfjlX3zsyXoA0T1og1MdGz0Be9gE4MnMmFYW50b85sqQJKi16dGtecf7MbkgSIWXIDrFMjY8FeiuRXq+egibwiVj45ngKrbUv3AuIx+N218XU4kVz0jDCJzVECvayqExvhjwpAIiVj6v/jQgLiLMUr8rtGUjvGlnH2do83RHDt8tE2L3M5a0ll9eVWZirQzauguxlBZmyLh6JC1EdetgFT9SwUX+8nWgrGkEw6WUQKJUKOgEyPzsSD8Y035bGVkrX/QsVsl8q02GtD0s/gBx2eohpIhFEQTPiLi2BnN+MwkuAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVmSYEthlU7/aLflsiBoas+NWEIzmin6y7Rq+JT3wqk=;
 b=xxqIrfWwhRUjSJtW5/RMVXPSmxV6IKTO4qqi5sohoDVKIJLqmuuGdxBWkb5dvhx8tFhEDWdtZtyIOF3Z0LEDJ/96Ce/1HWR9BKMVNQd4wPOJ0a5Wksm7mOT34zgucZt3c4kyzohY8G6gOH0+zTGv+PLyXuocJvQyal1M471ZLGvWP/OxtCdsneHZdZU9lVgZNFG7/t78Hr+lPKA4vTl7pBQotIealgbAA9cRDjGFXi6vIf7m7v6+oamH2bbIfDYKRIE5IhCGQjLGJt49yY8PpGs8kYQexyUk5ucHE4E6lFSe0xextwlS3QXZYoXrutkvxWz2M2QLp9wpqSSMTmF2/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVmSYEthlU7/aLflsiBoas+NWEIzmin6y7Rq+JT3wqk=;
 b=egbfdkxceYX7m549A9fvSM/YwUZkx/Hd5PPJuEZq3ZCddGo2J4j9gpgzGKVF4RLfU+RV9w8pkF0mZUzm/vd7I9Sk+tqVy5HDAJzwqAIySB9wlMkEA9gVoP40O+0cmlLqcMtnH7PRV1pZ2fzrvIhKeObTQPF0S4t7nQLhLmcj3BlAvdC1hxSxrwnQC/O1OQypdDWUoGIh+VWafNEmp59UpEPv+5N2jeMIYv8vM9BEvX5XAg42Jzoz1FGXb/3T2iBF49MdrEwPDa7SYJnyyGyXaWhPsO3Eh0JnnAykCO+V7CyInzwmNjCrANCWOczBipYAmGDALeTq1IZel6/aUcDtCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB10340.eurprd04.prod.outlook.com (2603:10a6:10:564::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Tue, 13 Jan
 2026 20:56:26 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 13 Jan 2026
 20:56:26 +0000
Date: Tue, 13 Jan 2026 15:56:09 -0500
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
Subject: Re: [PATCH v7 6/6] Documentation: PCI: endpoint: Clarify
 pci_epc_set_bar() usage
Message-ID: <aWaxaR5KWoPbN0Ju@lizhi-Precision-Tower-5810>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-7-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113162719.3710268-7-den@valinux.co.jp>
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To AS8PR04MB8948.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB10340:EE_
X-MS-Office365-Filtering-Correlation-Id: ae0c53fd-17b8-4081-1797-08de52e6372d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2Vd7xdhVs6g7kVpNx6ris04xoABTJAnpUE9AXuaDSeDjQmsxB1r/9tKGQGDT?=
 =?us-ascii?Q?mpQH3vcGuo/KjOA8UzgZQA+F8WzXGiTVWRrkgxpavM/kyk1+ixuWPkEOnKm2?=
 =?us-ascii?Q?1YbdfAiXUEssCfhszm6HVyMdQ0maljjR0exszBhrjRbgG8j4dplNLvrLPlwv?=
 =?us-ascii?Q?fNJJ7L9TaxfQDzm9mKivSJ6gk4KMZ3fkh/kC4XJ1KgF4kZgED7q279kSr5pA?=
 =?us-ascii?Q?Un7I9MjXr0dKHNuzC6r31tQA8dT3aE0lVOmLtBIgeDoMX/h/VWEfWMR8wjb/?=
 =?us-ascii?Q?Q23Rbm7zmB1tpm10h2ZKR0KJQMjkVqBnE00eDFUweFpvEYjJ7MQuUCj+x/Pd?=
 =?us-ascii?Q?Px83IycEIP6lNzZ9ior0YMvZp+D8xiFE+av7M0YAa4oZk5QNraew3yHEWWDg?=
 =?us-ascii?Q?iIuaZF5SM/CImhJS1pE9OGqZDUx2kfmVpvvXNvGhZV4AcXsObOLzIuLsSj+R?=
 =?us-ascii?Q?TvGllnRFURhtTUgMBhaeeF3phLpKspqVnWc1BZK1ESsWZ88vghClLxMRExXi?=
 =?us-ascii?Q?0fSor16amZBQeZxSS/+8sczMtmUR9x6mxcmq005L6DviEAM2SUzN5Aj7lDck?=
 =?us-ascii?Q?voxo1MNakw5QQrOMUeYleR33XE1p85NoWTLcslqdHMuxjen6b7WjZBVhE2/p?=
 =?us-ascii?Q?k2CDAVHF3Tgt9/Diju9I+hKrEM7SaT7Okl2y5u0MO1vtSlAb8hA0XaJzu0a8?=
 =?us-ascii?Q?E0WytW3iZ/dZcPba8HIwDgfpcS/qmjr5noYMnyNQ02+d+Yl5Oc9yAugpW1Dn?=
 =?us-ascii?Q?a83B8CE30s4M+7FXbwlo0pmvq+UuW6oGY40+xSAJ3pBLd1ZMBFTXiti6qX0O?=
 =?us-ascii?Q?kNAUfB/LmsbnjEosLlq1/aQ5xkpDN2nc5eHfcW3wEGoEh61s5IKT2Dg7HWNt?=
 =?us-ascii?Q?f4BkxMaaOaMStOVlRPQYFmtjAZJb2xqunQeZY9cU7fhowz43Ugawb8YqsZBq?=
 =?us-ascii?Q?DCDeVxUBZZDTBdf5N3gtu4fhh/3FBhj5+qDI/8u2vw8CuK5XooSar41vtcSR?=
 =?us-ascii?Q?JgghX6J7nhhtyWmv8wFGR7824KZcncIsuyssHAsSvFSQQPkrtUtrhezxSy71?=
 =?us-ascii?Q?nIlVreI/yZ/hVe3WkUozsV2lxK1CIAKk3Kh7V82ZV6oAUHkyzIAq2bbMFHzs?=
 =?us-ascii?Q?BkN2BuKGZpYwA9Wlwv8t4d4WsfsVDWaZWO5REwWkMBRc5QTgwSMq+rI3H+4H?=
 =?us-ascii?Q?IZecssqAZsbFdQIFhOBGRdMjlhVG/xCHUYXBWIZ5LPhlE4vnzKX/tN7aAP89?=
 =?us-ascii?Q?JouMv+rl92lrOQD1QdO1A+DQIFP4lySx5n5FcsiBxlJaWKnskSm6vHrIQuI5?=
 =?us-ascii?Q?5Kc51zR06wKYuUQww3AE67UbqdVQgccBnoGPZWLVfbNPQuJVvqH7Awd7oU5K?=
 =?us-ascii?Q?uoq4gR9f6QerI8n3I9UxHdxV3yeAVKhqJtsZUjaay6qz8vH/NI4/DmNX6FLl?=
 =?us-ascii?Q?EDGaYYcwSqEyaZD2Y2mHLKLd2i0rCVcD9nGIUv0nut4FZOtWzS8a1gJt68fD?=
 =?us-ascii?Q?iSeddHPgD8p+y4ktzQbUCmmk2dI2bftxq9UV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lEsE47wTJyC1MwQyTeCPyXIUiAGXBe7wzZ6neeLWfHDqcmEDBsT+Qs5fyMzO?=
 =?us-ascii?Q?lUhgSGWVcrdNY/ou3Ujo4oUiWYaPw7FobZTicCHd+khFHW5Kw9akRB2qX0fX?=
 =?us-ascii?Q?9Bk7p/BNAgMSfnRahNnBNrrL0csC91yBB5HNfYueDxFpPdMi9sdg5lFfDwLC?=
 =?us-ascii?Q?aOqTQrGJ2/T4GD9Hp4xgFrY1u1mB2OUfm5NjWm6KZRhgG56dxwcL/niv2yS8?=
 =?us-ascii?Q?ETPfNgfVqLA5K9mKfJtP2AhG32g1adrtxaJOFU4tcuvHeR/Qw8+qSZK3PBwV?=
 =?us-ascii?Q?g3E4hdVOSQ34aiRRD9MdA9s3FmU6ngvn1+n92kZtPuZT/Ybodem+gcNzM0v8?=
 =?us-ascii?Q?cQPTZAw/8tca/iAlwc5/O9eQKWyxejn32zR/g+p9b1xZQtka21oQy4rFNbMp?=
 =?us-ascii?Q?fnO9SYDGJgZSRI0KD5IlJqqlzgq/wgPmU4HVjh+RQkQA1EMCdoIPeNLwq5Hz?=
 =?us-ascii?Q?aPACo92r/N7G5PSZ/L2YQC9e2UOVf595uKeFMyWJ0V/CelvJLTQ1bXIqQ5qV?=
 =?us-ascii?Q?U11e9GiIcGkKzX2IDFdQHxGM+UMjyIVdEB6wnq68yWAY7dHwH3PrV83alUdN?=
 =?us-ascii?Q?I1/xvWXCY0TzOvzGYxUuIHfAHpReMDw3mohOd4nKOAuG0Jmdjd6E/ggnDY48?=
 =?us-ascii?Q?315nCgSkiaXPFs7GartE1QNvN7SkL6wZvq07d86mMA9uVZXtFeMjcI7mC36D?=
 =?us-ascii?Q?CXjx7aXW5rUPJ5Z59P/ZN7UkPEcwKmCbT3j0ueRUdJ3DJBBFRSzRsIzyfuzI?=
 =?us-ascii?Q?m/5JpzuP4i/nusgx96AawYE5NR3hEj5NSrfMoTfrYN7dij9KCFYansLVRoB7?=
 =?us-ascii?Q?qxxIvqYYt3JJlmzvpMmKx8eUJ+UTCCZy0Y/7l2K09EPBysoSqB5AbMxM1asd?=
 =?us-ascii?Q?EsI5ptuDYsz/ljlN3az+b80VjkBb/hpuK9GFoCrgAvXK8koVkca5uDSXzQce?=
 =?us-ascii?Q?LwjIejAiCgu4pmnZ13EH0TfP/IThpUM5MsipHqCYUBf0RXbzS5X6N8I4RPhC?=
 =?us-ascii?Q?jBoQslppDnwJSZQLVoHIU63OALEGl54OI7xjdgvjLG4rYXtS/6C4W4CN0g0c?=
 =?us-ascii?Q?u13z4TXSMP58VyhRMYkuhTfIe4yqNyTp/59ymPzzBS5QU7tizcbV6HVI1k6w?=
 =?us-ascii?Q?l58s7Xc2z3dzOs3W2UuE1Kfls+YIro9KRbmE0JmlS5qw8pAZAC3Bok1zAOTQ?=
 =?us-ascii?Q?3OXFVANMLpE2/rgrkOFyLlrTdq1RIdjWCnZ/qqEWEqhGXFIsXvoVEZa5Fjoy?=
 =?us-ascii?Q?HItEr7jxykj12A3VB0HrUsm+nkuVNK2mzyHm1PorlnDj9MkttTlbF8YSIBhw?=
 =?us-ascii?Q?5kyIwMkiZCiZdFp/m448CLER6b8KAvKgogUrpHzYzuoXSDxiFOeE4Pgda69Y?=
 =?us-ascii?Q?NysgKb6PxE5ImW/Wf5KXPVxzZaWEJaHRV6fWwwNboQuVV70lxhdUFYc/fwfj?=
 =?us-ascii?Q?TlzoLhuqPMtGaISFSWHfYiJZL4ECKppCvxvvpiKpkzzZFHZw/iChcevgwC4d?=
 =?us-ascii?Q?xKzkF88AG/pamvw5eI/R9pKdv1yPRfkAGGz7KA5g1uo3n+JSdkoPXaBtiM8k?=
 =?us-ascii?Q?NyEi6NE9ek0hKZN9lTzyX3HOypfdK6F2x6RIdIkbkU0W9nybh0K/yn+OaWu7?=
 =?us-ascii?Q?9Ob6budC2iT88NGREWxB77XsE2es/4R7zZCdlynrBDZy+dcwZwhDY53HnTA/?=
 =?us-ascii?Q?B+tYevKdG/lb2vXK2q5ezHQQKbzDqo3TADSQ1O8X6s31VK3K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0c53fd-17b8-4081-1797-08de52e6372d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 20:56:26.2036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEYFTCwW5mfwx4xVv2ssEXyN6cd86bZ8/sV4dWqUjOtIGT65u9McB+kFnBWCR1FAvdg2E/zpN7pcjs9nY2um3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10340
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 01:27:19AM +0900, Koichiro Den wrote:
> The current documentation implies that pci_epc_set_bar() is only used
> before the host enumerates the endpoint.
>
> In practice, some Endpoint Controllers support calling pci_epc_set_bar()
> multiple times for the same BAR (without clearing it) in order to update
> inbound address translations after the host has programmed the BAR base
> address, which some Endpoint Functions such as vNTB already relies on.
> Add document text for that.
>
> Also document the expected call flow for BAR subrange mapping
> (pci_epf_bar.use_submap / pci_epf_bar.submap), which may require
> a second pci_epc_set_bar() call after the host has programmed the BAR base
> address.
>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  Documentation/PCI/endpoint/pci-endpoint.rst | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
> index 0741c8cbd74e..09b892de9280 100644
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
> +   When pci_epf_bar.use_submap is set, the endpoint function driver is
> +   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
> +   the EPC to advertise support via the subrange_mapping EPC feature bit.
> +
> +   When an EPF driver wants to make use of the inbound subrange mapping
> +   feature, it requires that the BAR base address has been programmed by
> +   the host during enumeration. Thus, it needs to call pci_epc_set_bar()
> +   twice for the same BAR (requires dynamic_inbound_mapping): first with
> +   use_submap cleared to configure the BAR size, then after the PCIe link
> +   is up and the host enumerates the endpoint and programs the BAR base
> +   address, again with use_submap set.
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

