Return-Path: <linuxppc-dev+bounces-15669-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C728D1B4D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 21:54:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drM202z6bz2xWP;
	Wed, 14 Jan 2026 07:54:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.84.19 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768337688;
	cv=pass; b=V4kYwOvKA2bSsFqKJjcG5Va1h0Z2iJZOTa8lJtvnnI9gMm7zSjtVWKjEWmJ7/6OLzjr9ftAP+nv8tTt3r1We6mFQx+VaN3iTxhlkI9HJlBRvFSyzn0hJzJGGwiHJM8A2ZNyF7j9QsjCBzN4U00PD3JtYaNwCGny6UQf0v1vWvhMgUdfIfFnl7/hQ+9fCibK1GtWYDNucF6Oug7+tUbTUuSYhXAX4EdBM+8yRb2JX+wT9rkUzDGjYmdhPzXAKmsXIFUSGrLRIEFVlQoXd77dm4C8Y8epN9z6hGVw+LX3aEv7mWzyH+X7WUigCXJKOhpUBbTs6vne/1+V73UW9DDuucA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768337688; c=relaxed/relaxed;
	bh=HyqPZK6P9gHgkJNEkTxCM9Jg6nYT7jST1XBxgZgdPYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T1sFhwgNpfIblC7VHubuMYgLR45jcIt2h0N8vomao8mRlY5Jp37ZI6mhwB5Xz6HR8gGcrd4WstQ1HSbgqM/2K5WxzhuMfXgAL61GIuMXYe/CBId4+SMrraWzXvowDSyh7Q0tciQgitSNr28/gqZumNIzq8+tVvlK5WYI3Rnakw0gzcG/YtvMvlVLUhG5IePjSf6LoGeI8cpPlrScHYYjeWRIYOY/BA6VcKoeEjZwWuWS5RE6t5PxLjW3Mfm38o89ATnMHTLsrBJK/asx9Rh7ULttXofPvgO8ILN0vvcsmchqo0bj/j38oULreM8QdQBWsy75KYNNqKnea1AbesAOnA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=leIT60Wt; dkim-atps=neutral; spf=pass (client-ip=52.101.84.19; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=leIT60Wt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=52.101.84.19; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010019.outbound.protection.outlook.com [52.101.84.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drM1y6kJ9z2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 07:54:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRpWMd9g3VQqPAvPywlKtYBnU58v3Lw1zj7P9Cin/Q7WrDDaVeQBN2cBswXkaVACusI12jQGJKtwDgiHdnhAoqRs+DtmVs42COGxZACNxSLnAegfWtvyLMJKrzMesLQvVVvfC1zYgZWDHkrW0eOjCYiMj8LWkvrCa5i5hKgGhlG9zesmtj2SxsQkNRtg+6R6tjh5s2T16L73vr2XnIN/5v9apIOZLsk9oQxMj5RaS/gzT4eTSKJ0fWDLehVXBDTqQ3YbocZLPo3SRhD6eHaTQVwfcjGTXWymVtxuz/Mk9Q3lcMB6eM2N8Ob8Qg1L2UnCp0E9pHyZRQmBgc9adNKMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyqPZK6P9gHgkJNEkTxCM9Jg6nYT7jST1XBxgZgdPYE=;
 b=ygPFV1XXNJgo3oQIOkExSEJV1AX45v9MtXQenPLaX6pOP5LnMmijybWch3mqClfDF+Z4QGLSBVIYLEkFOilyCfVmjXBCDHdzx60qzRl/5orijN+/vCaX9E5HkL6HnlgbhkrLdE28QWy7zyqCuo5oJWVJ9P0CH6z+3ljbFVMzdd5Yb7pHUwEpP0Do3j9NYJNjjJth6f6yNIk3/uvvV/U2bkN+g1K9W1cBPYjg6ACCx5xtb+1GLwzITxR/eG7Kq5USf4zS1p2PVzGrIGQRttnAWlO3YoAOlpiZpHX5yGCGyX/FFNK5U/9i3SI1fIOJjKfvXsNqjQC4rSLsd6td4RY54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyqPZK6P9gHgkJNEkTxCM9Jg6nYT7jST1XBxgZgdPYE=;
 b=leIT60Wt/zmvkqIQ5KTkPlKhGwvrxf9OASpfuuupyLVTWRBHDFAH67iv2klpCTk57cFY+lqTLUvszonNJOPcFcXKhftkmPv3OpJOL2oLElh288uvFdNIANseseCP/0hIn6ZPtVvT1lMEyOshYS4bYTkeYB8j6P+TbhLPL9TLamIZgknJ0/vQjsrsuNETTcq5hJcVzlg9h5d57duNbsebdZRy4U83IGoIFAQVzI4jMeFTbpiUvzBhNg+IH16Brhi8xQ5XUKT+lFp0oCdhJUCk2EvHJdRG9bCowkkwqlfmR2CR+NYTgyx/SftNERmcDPHVexylZO01b72ozvp3N0uvvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB10340.eurprd04.prod.outlook.com (2603:10a6:10:564::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Tue, 13 Jan
 2026 20:54:05 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 13 Jan 2026
 20:54:05 +0000
Date: Tue, 13 Jan 2026 15:53:52 -0500
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
Subject: Re: [PATCH v7 5/6] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <aWaw4M6FGYWPo1ME@lizhi-Precision-Tower-5810>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-6-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113162719.3710268-6-den@valinux.co.jp>
X-ClientProxiedBy: PH8PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB10340:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a47e21-2056-40cf-7606-08de52e5e354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qPkHvyKjHuywf/b8zBZCUt2m6IsNRgzPHrV/oJ3w+U69rniUwK85nNmzhGOP?=
 =?us-ascii?Q?NkNA+McZr7AhSBb5Djt6c2ts8AuJyujXdcdWeJPSDNnez/PnyPNsUejasKsG?=
 =?us-ascii?Q?Wmfxk8gzwK6agmTjyJK++QdNJb0PWkqKO0uQkWHJELHduTxhg6qOZfa2RIUt?=
 =?us-ascii?Q?BjPQdQeKo+QFLp7FuHQQKqcryR2Ia6o5GJSyeKF9XnisnKIvhRRM6iIXQry1?=
 =?us-ascii?Q?nb1p8e5T7q+QeYurZQbHeFCT7w7b7c1KIz6ljK8lq19ilFFtUCP5IC+7msCu?=
 =?us-ascii?Q?ypre4TlWkSQiWj5dZK25VSL0FxT9fTkzvL+iHPgu7dTaM2PpxpBa7mWG0H77?=
 =?us-ascii?Q?zuwngGVYfnUSBnvzEC4Dl27pIzXGYHWR48pcxvF157e6DPvtlSpktinj1RWH?=
 =?us-ascii?Q?xQy0YHl0PYfudWJ7foMfkPBFPRQvPT2QasCWm+beCfUGiRM+xm+RJ4Wmonqu?=
 =?us-ascii?Q?d+DulopQW3UYZ0SrbH6pQLCf+48dpvJX6F1yhA0sujisFkdsndWg9h6Tcj+r?=
 =?us-ascii?Q?dXJU6umnCju06fCxe0qs22pAtO1wY7t+S70WBJlAQg/62igPPsqE+X0xFhw4?=
 =?us-ascii?Q?0yRbMIjSR1XZGvvy4tsPAeW2Zru1egDlcsMFSol/bH31MUSGXoHOl+ohMUr7?=
 =?us-ascii?Q?Wf1VavcGEEPb8IZDmi4eF8KyqGVpDrndW91MRhx44Ifw2JBcrMM7KXO4wV3U?=
 =?us-ascii?Q?l2KYxbNo0qefWLy3VCcc3TC0Z//O8bHL28Z0RgUVt1Jqhd9kyCbsAHWVtRTD?=
 =?us-ascii?Q?bdwSQx2cEmXzGNOMTqGu3uwFvfVxO09Far8k0xPaFcVR5s50ADxvb8PyUsbk?=
 =?us-ascii?Q?5VWs6iaDlC8h5WTNuQMDQJyDBPQfkacd4QZOOEMwDBwbmWikGkP/n26wINDj?=
 =?us-ascii?Q?kggcMbYdfmACoiVJHyfdjglBPxFdHvi9px6Ao+xvsxqr8DcgaxMxsa2tdT2P?=
 =?us-ascii?Q?A/G8oSXapIGj2FNbioBCXijOw0qMt3oszSs6ituXqnR0TWr+JFXOWLzAuKsX?=
 =?us-ascii?Q?7DY19vxwxFvy15kVlcLWkBkOgYKVX0Lf54nkQrIs1+3BinyEvAfN3ni77sSv?=
 =?us-ascii?Q?LVv9HdMBmoTdZ8BDBtMphVqraLSAc0oAM8YUJqHJruuMyvlVgNfA9wvxkAkc?=
 =?us-ascii?Q?W3OHUT+y7BeLIpM2wEq71RYSIUX9RAS2eEzn5gSJuDAWSfHFyBwBzysCOJ/v?=
 =?us-ascii?Q?eFyR7nGgSXZw3FqezeYzs6pt2tIPDG6qC+qSfGHUDeZwAjgakJdvzb+m+5Fe?=
 =?us-ascii?Q?g6pGe4TOOlb4LeMoriVlpDBAae4qwBJakem6vUFCnLp6kYJ1QtCoEp5rgxk8?=
 =?us-ascii?Q?JoQlEQF/WXcBqvgei5UGWpRcGH0cfYJruSf5vCXWAnaW/IyQCrQ4hFKIElgz?=
 =?us-ascii?Q?vLHTHHQHL0P6yriJAo7pdWJoIV9hLskvNsXFsE6hKPXa54bonu9UBizmgdAU?=
 =?us-ascii?Q?HTJfyaA4aXFJ4SFNGDUrpzVUcCEKuGqCd2i0cjdFxnm57tgFQfXjSfXjM9Z4?=
 =?us-ascii?Q?U7+SMAEyFKgtd2Wm2H/2H4aVhoj/ts/ZdC5Q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3XBzbJMF6d7FahYvj0wUgxBEHgCp51immyrQyAefDCxvy5uENk7NhvnL2egC?=
 =?us-ascii?Q?1iNNKUK2GoKJ5L/UeT/rVkIJNlFlsAifD8roZAImRUaSD50W0P9CwreX01KF?=
 =?us-ascii?Q?Z5dqIFAfFX9vZ07Ur7eqsKxgMekFqntLBrrGXajilBhhPcoak3HD1P5mfevb?=
 =?us-ascii?Q?hzxWsK1YBKVCWYSHoMHvUUCR4b13uaVaioBZGnRR+Q689s73UP9S/YdsuLcq?=
 =?us-ascii?Q?DACPIAbehdHePaWRgWMPW/nC3UV0asiBRiVY8LoSgsq58joCZIqDYlBpCkPy?=
 =?us-ascii?Q?qqgLpEY5redBE6vazjWBRcPAlNkMVTs8QtJ0hz1u7ZRXtVa3YyhBLfUSIDzY?=
 =?us-ascii?Q?GSSIj74RenlqvKbwE/Z28uoTzncqNRQ1hYFZBJuYMEVjeeLLUX7BVmCMcfNT?=
 =?us-ascii?Q?FJzaJmDOnScIexLFyQsUcphO5Ens1ag5YP4KQt+VVcSILTZU0IKfSdp/2O1B?=
 =?us-ascii?Q?wEXtc8FfBdS8pJq5xD5dB3LdK5l76ujaA6u7ZX7+rEyREEuqHxfrbtYrtG41?=
 =?us-ascii?Q?wHU9AEN5lJIlaXq14nQteT8spRvqG80g3u/jITqZkJzywXtEhR1aDiEYlmFQ?=
 =?us-ascii?Q?/qi7/d9TcPTgtKSQ8GXtS2qEkvHc5WBOGVc/dxm2ULxKCxcJ/eGVj/kEoJ4Q?=
 =?us-ascii?Q?pyoOnTQP8gWqTYfqBAjLChzs0XHxZ1FRbxISmi9lJDqW5HccJHdABydT3O4F?=
 =?us-ascii?Q?7MwFBNkF1HqTfvBOB3swtX8AcH/C1dO4C46N+yTVtLRWD1H81QVOkEHfooxi?=
 =?us-ascii?Q?7SdUiKXJGSrAqbDby/yDRae18FSpy7mcU7PS6rrzF5ODF/ept9KkTzei8aK+?=
 =?us-ascii?Q?2AvVd+Zhkxw+vRiAu5AGdEaNsDuP9Nk0Iewo6IgsN4dijf9gJOknySVVuwCs?=
 =?us-ascii?Q?LiQRvyXweyitwXEwpecbjvjJN/VxqCuLAE325So1JiaefgrQrmWoc7OjBnVy?=
 =?us-ascii?Q?Co5q5Yyv68pMoOUfvQvGkcR2HNnGrJCrVT8AWxX422tZGRC0iULkmkQ6s7k4?=
 =?us-ascii?Q?TNGZtTNNl1+gG3L8iNkSZwzYtTCgR3DF2FCE2X3iCLj5Wzf04UsiVGXdm6R2?=
 =?us-ascii?Q?idoAiCDKTIX1FmFSZgoYszFerD6lIpvmt49945minSW629Hx+kcfd6HdnDU7?=
 =?us-ascii?Q?Ib3FTjErK+H2ncPQZ2h/DJ4t7K7RtYKioU0wqyv/jBsbEGiBxLC7G50oYg8w?=
 =?us-ascii?Q?ueY3RTyS68ehWoT9yeNzjb4PMH6+pk54/tm/Y/aQ7qqINSKhjgLsa6RUJ9qs?=
 =?us-ascii?Q?AgLtNJGJnAIcToVfjrKokGTl6NVkeZaNVtPMo2M1IgER13pp3iUrSA/AnbXC?=
 =?us-ascii?Q?+wQV+j2eZgc9LZnsHKFqNO8HChL9vXCF6S7X53NhDL3UYeJWK2hfplZhCFkp?=
 =?us-ascii?Q?lHTwxprWeZYnetVzEcERD3TK7PEvo2eXJSX7CiLZmufzGLM8Ku1HS2ZYoaRC?=
 =?us-ascii?Q?qQBEdTxwNifPK+Sdm3vVwCJXmcqGlOOg0lVp5IOT81lT3nakoHam2w7/tZLY?=
 =?us-ascii?Q?DrL/mNENJpXdHQtqg1VJaXIOHxh0B+GXQCHVY0igyu9RN3+rmoE7T78xxyeB?=
 =?us-ascii?Q?S6oBlL/jt+6Ep8QCeyvcXf6j+DcKHOAWN1qx+ow5u20E69BRBX1Xp87y3YBV?=
 =?us-ascii?Q?707QDxcVLmAM18OQ8euG8ubBWqA+Ef+P2xvMVBbz4yfP55ty3MIXSg/AOkS6?=
 =?us-ascii?Q?Qs1fk7n0LlHgbi0f3VKsLuQlobZ8x1GPoRjVjtFteUJ2UOXpMVGKllmWtbg+?=
 =?us-ascii?Q?sD0uAFvhWw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a47e21-2056-40cf-7606-08de52e5e354
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 20:54:05.0503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuyHqMBVkfvvMo5HviOre+bxhdO2G/n/GRh0gOfu3/uSfydt2mnktaapVHJhcQRnAKDyZttasdmpx2Em66z4Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10340
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 01:27:18AM +0900, Koichiro Den wrote:
> Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
> subranges using Address Match Mode IB iATU.
>
> Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
> introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
> use_submap is set, read the assigned BAR base address and program one
> inbound iATU window per subrange. Validate the submap array before
> programming:
> - each subrange is aligned to pci->region_align
> - subranges cover the whole BAR (no gaps and no overlaps)
> - subranges are sorted in ascending order by offset
>
> Track Address Match Mode mappings and tear them down on clear_bar() and
> on set_bar() error paths to avoid leaving half-programmed state or
> untranslated BAR holes.
>
> Advertise this capability by setting subrange_mapping in the EPC
> features returned from dw_pcie_ep_get_features().
>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  .../pci/controller/dwc/pcie-designware-ep.c   | 230 +++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h  |   2 +
>  2 files changed, 222 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 0e5a8d200b00..b2ea2c2c986f 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -139,9 +139,10 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	return 0;
>  }
>
> -static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
> -				  dma_addr_t parent_bus_addr, enum pci_barno bar,
> -				  size_t size)
> +/* BAR Match Mode inbound iATU mapping */
> +static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
> +				 dma_addr_t parent_bus_addr, enum pci_barno bar,
> +				 size_t size)
>  {
>  	int ret;
>  	u32 free_win;
> @@ -174,6 +175,208 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
>  	return 0;
>  }
>
...
> +static int dw_pcie_ep_validate_submap(struct dw_pcie_ep *ep,
> +				      const struct pci_epf_bar_submap *submap,
> +				      unsigned int num_submap, size_t bar_size)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 align = pci->region_align;
> +	size_t expected = 0;
> +	size_t size, off;
> +	unsigned int i;
> +
> +	if (!align || !IS_ALIGNED(bar_size, align))
> +		return -EINVAL;
> +
> +	/*
> +	 * The array is expected to be sorted by offset before calling this
> +	 * helper. With sorted entries, we can enforce a strict, gapless
> +	 * decomposition of the BAR:
> +	 *  - each entry has a non-zero size
> +	 *  - offset/size/phys_addr are aligned to pci->region_align
> +	 *  - each entry lies within the BAR range
> +	 *  - entries are contiguous (no overlaps, no holes)
> +	 *  - the entries exactly cover the whole BAR
> +	 *
> +	 * Note: dw_pcie_prog_inbound_atu() also checks alignment for
> +	 * offset/phys_addr, but validating up-front avoids partially
> +	 * programming iATU windows in vain.
> +	 */
> +	for (i = 0; i < num_submap; i++) {
> +		off = submap[i].offset;
> +		size = submap[i].size;
> +
> +		if (!size)
> +			return -EINVAL;
> +
> +		if (!IS_ALIGNED(size, align) || !IS_ALIGNED(off, align))
> +			return -EINVAL;
> +
> +		if (!IS_ALIGNED(submap[i].phys_addr, align))
> +			return -EINVAL;
> +
> +		if (off > bar_size || size > bar_size - off)
> +			return -EINVAL;
> +
> +		/* Enforce contiguity (no overlaps, no holes). */
> +		if (off != expected)
> +			return -EINVAL;

submap[i].offset is unnecessary, you can use expected += size as off.
code logic will be simple.

Frank
> +
> +		expected += size;
> +	}
> +	if (expected != bar_size)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/* Address Match Mode inbound iATU mapping */
> +static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
> +				  const struct pci_epf_bar *epf_bar)
> +{
> +	const struct pci_epf_bar_submap *submap = epf_bar->submap;
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	enum pci_barno bar = epf_bar->barno;
> +	struct device *dev = pci->dev;
> +	u64 pci_addr, parent_bus_addr;
> +	struct dw_pcie_ib_map *new;
> +	u64 size, off, base;
> +	unsigned long flags;
> +	int free_win, ret;
> +	unsigned int i;
> +
> +	if (!epf_bar->num_submap || !submap || !epf_bar->size)
> +		return -EINVAL;
> +
> +	ret = dw_pcie_ep_validate_submap(ep, submap, epf_bar->num_submap,
> +					 epf_bar->size);
> +	if (ret)
> +		return ret;
> +
> +	base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
> +	if (!base) {
> +		dev_err(dev,
> +			"BAR%u not assigned, cannot set up sub-range mappings\n",
> +			bar);
> +		return -EINVAL;
> +	}
> +
> +	/* Tear down any existing mappings before (re)programming. */
> +	dw_pcie_ep_clear_ib_maps(ep, bar);
> +
> +	for (i = 0; i < epf_bar->num_submap; i++) {
> +		off = submap[i].offset;
> +		size = submap[i].size;
> +		parent_bus_addr = submap[i].phys_addr;
> +
> +		if (off > (~0ULL) - base) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		pci_addr = base + off;
> +
> +		new = devm_kzalloc(dev, sizeof(*new), GFP_KERNEL);
> +		if (!new) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}

Simple alloc an array struct dw_pcie_ib_map[num_submap] should be simpler
than link list and alloc some small news.

Frank
> +
> +		spin_lock_irqsave(&ep->ib_map_lock, flags);
> +
> +		free_win = find_first_zero_bit(ep->ib_window_map,
> +					       pci->num_ib_windows);
> +		if (free_win >= pci->num_ib_windows) {
> +			spin_unlock_irqrestore(&ep->ib_map_lock, flags);
> +			devm_kfree(dev, new);
> +			ret = -ENOSPC;
> +			goto err;
> +		}
> +		set_bit(free_win, ep->ib_window_map);
> +
> +		new->bar = bar;
> +		new->index = free_win;
> +		new->pci_addr = pci_addr;
> +		new->parent_bus_addr = parent_bus_addr;
> +		new->size = size;
> +		list_add_tail(&new->list, &ep->ib_map_list);
> +
> +		spin_unlock_irqrestore(&ep->ib_map_lock, flags);
> +
> +		ret = dw_pcie_prog_inbound_atu(pci, free_win, type,
> +					       parent_bus_addr, pci_addr, size);
> +		if (ret) {
> +			spin_lock_irqsave(&ep->ib_map_lock, flags);
> +			list_del(&new->list);
> +			clear_bit(free_win, ep->ib_window_map);
> +			spin_unlock_irqrestore(&ep->ib_map_lock, flags);
> +			devm_kfree(dev, new);
> +			goto err;
> +		}
> +	}
> +	return 0;
> +err:
> +	dw_pcie_ep_clear_ib_maps(ep, bar);
> +	return ret;
> +}
> +
>  static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep,
>  				   struct dw_pcie_ob_atu_cfg *atu)
>  {
> @@ -204,17 +407,15 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	enum pci_barno bar = epf_bar->barno;
> -	u32 atu_index = ep->bar_to_atu[bar] - 1;
>
> -	if (!ep->bar_to_atu[bar])
> +	if (!ep->epf_bar[bar])
>  		return;
>
>  	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
>
> -	dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
> -	clear_bit(atu_index, ep->ib_window_map);
> +	dw_pcie_ep_clear_ib_maps(ep, bar);
> +
>  	ep->epf_bar[bar] = NULL;
> -	ep->bar_to_atu[bar] = 0;
>  }
>
>  static unsigned int dw_pcie_ep_get_rebar_offset(struct dw_pcie *pci,
> @@ -408,8 +609,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	else
>  		type = PCIE_ATU_TYPE_IO;
>
> -	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
> -				     size);
> +	if (epf_bar->use_submap)
> +		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
> +	else
> +		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
> +					    epf_bar->phys_addr, bar, size);
> +
>  	if (ret)
>  		return ret;
>
> @@ -638,6 +843,9 @@ dw_pcie_ep_get_features(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
>  	/* All DWC-based glue drivers support dynamic inbound mapping */
>  	features->dynamic_inbound_mapping = true;
>
> +	/* All DWC-based glue drivers support inbound subrange mapping */
> +	features->subrange_mapping = true;
> +
>  	return features;
>  }
>
> @@ -1128,6 +1336,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct device *dev = pci->dev;
>
>  	INIT_LIST_HEAD(&ep->func_list);
> +	INIT_LIST_HEAD(&ep->ib_map_list);
> +	spin_lock_init(&ep->ib_map_lock);
>  	ep->msi_iatu_mapped = false;
>  	ep->msi_msg_addr = 0;
>  	ep->msi_map_size = 0;
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 4dda9a38d46b..969b1f32dddf 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -479,6 +479,8 @@ struct dw_pcie_ep {
>  	phys_addr_t		*outbound_addr;
>  	unsigned long		*ib_window_map;
>  	unsigned long		*ob_window_map;
> +	struct list_head	ib_map_list;
> +	spinlock_t		ib_map_lock;
>  	void __iomem		*msi_mem;
>  	phys_addr_t		msi_mem_phys;
>  	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
> --
> 2.51.0
>

