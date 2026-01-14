Return-Path: <linuxppc-dev+bounces-15679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5EED1C4FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 04:55:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drXMF73WXz2yFq;
	Wed, 14 Jan 2026 14:55:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.125.124 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768362921;
	cv=pass; b=Bwn66BwobFHfVet3wk/XYK+CVx+1ozopNa8UhO0J9nmNebA9P8xt1SqrUFLrH5TQD3APtiIk69aKIwUpSiRRIi7pJLlXdpWXF4sjRugUuUwNXB0Cu/8zGagmNfgDIzesrkYNkugoMYCPFeUbJtA9XIGrRm5r/ShxfzjUWFQAsXZn/aBKNzbYnLUZxUmahIGXLW9gkCn4IGwgPi4Lvg4thyO8z4EJHLR3uDre05OLafrY1e9XP9excZtxPLH/tBs0g1e+cKD/sekuoVkf8GNAUYn/qHLvYyWiuChByWINQz/lMrPLwxmIlrBfaGxxDJbYZ8t5dWZfjReAYz6vQImz8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768362921; c=relaxed/relaxed;
	bh=nLsOGASULBKZugL+TOc9f56m3Dek4vQ+8mSmmUZapt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l1B5UVMbH/yc7ziJ1C4MRwY6ynCaMMEEkWoyRUBdC8Q6pWlp9x2IY66fjWbReMB5jlERW2SXwKcec/+f5noAPXEJwo8AwNZw+ScXeu61HvmFxjw3lhpYB6gMPOS+cVr2ktu98uBsE4smuGqYRlqDew49Q53Iroy11c0+ji0M1eGuhTqMq9VnpEhW3kLbr5CeTyqRdjg/J8e0ZssvQIiCHvEJX0e7sIYMx/PMih3LywHZCz7hWRL79NXyO+C9Yi+pp57A23kO64llxP/wCBXgZJX6dwIcscM8x3PUOgAW9SY9TGdUXCMC7ZrKm1pAzeFE24hymtIwpIRChAIj/7qevg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=K7qsVFNr; dkim-atps=neutral; spf=pass (client-ip=52.101.125.124; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=K7qsVFNr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.125.124; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021124.outbound.protection.outlook.com [52.101.125.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drXMD2CnHz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 14:55:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Obfx+MXwnBQ4K/MckBdSZc+v1iIAad3rAj0+KFaSz5vdt3ft1Rz8oIi1ck+eV75N4y532XkQLRckzcYEolm3uQK0uybKSLFb7P9iu0pHTOxCpjWkLJcYihdJLcgG95yfJvIbFIDVtHctVHHTPLswsZH9M2sPWIuTdekvrFWa/jWZjJWKppj6b6JSiMszjC6FeydiVlKOUXjRBtlqumDK+Qedb1EmQD9AAt1jvvVCO0S9nV4oGHtMqTzPCZvS3apykqieU02xEYfHkOkGt0GHbp0XEvr27KuLb+2GGgOyrCYe88p+w6qBA15d4izVUXYkRkkFCSqp+YwqgAToZc2y6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLsOGASULBKZugL+TOc9f56m3Dek4vQ+8mSmmUZapt0=;
 b=oBcZHMpEGLpulDZ1VQnaLrPSMmjiD4DA8q98bmNsbBsuUlBfhd8xxY97VptVEfpM2QOWEglXRKVG0BAIMaDyWVbplS8F40mSxh5iybd9iFWVPTV+WHzlWi9LPWjd6Jcn+pM1Y9lzG05B2Jc/lqHm8Gya0BA9FOCU+lUxacp/QEAI8wZUMuCyYMzYN9q2iRepm524q4G/veVG2h5ppUbDJRJ4imJOdD3mL0guEtDDxdfs9Eym67ljTSAtXqW1QxMkEqVsB1H4Yc/kU620rQJIGRoegTX+DqinUwOgje0jlTKtJrnOclxQirEj0MoFjQkXsvD31gKoEU89SEMVvUsZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLsOGASULBKZugL+TOc9f56m3Dek4vQ+8mSmmUZapt0=;
 b=K7qsVFNrPXLVBy8kLiSUQHUhV/3h7tX+RXVDAIMCOR5irCJGZ9GuHXIuahstaRSmwLYUTJnDR5PpMM4t3cUN5IC97E8cCPL23LLIEuH/LsbsIrVMWmeb/rWJH0jHKS02Retf/gq2PcrJOlj4l+kA4VahzT53cc8aCXf9ZqpF/yY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1476.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 03:54:39 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 03:54:39 +0000
Date: Wed, 14 Jan 2026 12:54:37 +0900
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, cassel@kernel.org
Cc: vigneshr@ti.com, s-vadapalli@ti.com, hongxing.zhu@nxp.com, 
	l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, 
	roy.zang@nxp.com, jesper.nilsson@axis.com, heiko@sntech.de, 
	srikanth.thokala@intel.com, marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, 
	geert+renesas@glider.be, magnus.damm@gmail.com, christian.bruel@foss.st.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
	kishon@kernel.org, jirislaby@kernel.org, rongqianfeng@vivo.com, 18255117159@163.com, 
	shawn.lin@rock-chips.com, nicolas.frattaroli@collabora.com, linux.amoon@gmail.com, 
	vidyas@nvidia.com, Frank.Li@nxp.com, linux-omap@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 5/6] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <5kexuvze2a4m6bd3yhv2cd7yrzo4r6ubbbouktdsurv7n22v7o@7s3pgf6ftgur>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-6-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113162719.3710268-6-den@valinux.co.jp>
X-ClientProxiedBy: TYCP286CA0328.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1476:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9b88e2-a232-4d65-703e-08de5320a427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XXAWGEOUAU0B92aZ8pwGyLC4hxis1ZFrg1AkeWmLRwGWu1dCiOAwPXTyAB1d?=
 =?us-ascii?Q?ucSLennAbD7gQcDO83Bxeamib3ac/e5f41+aChhOmAkzTdrTm0ZBWedPpxdr?=
 =?us-ascii?Q?yo53AMtpuV/28hup/azuaUZERiLjU+P1IMNk+MWHioc5l6nHkAESnAXFudrA?=
 =?us-ascii?Q?29rX13v6BxfW38wsOPOVqxDt0CbobXSQSK7pbFTcxHxx2u+SmJZNeM86xECG?=
 =?us-ascii?Q?IiuFAllNA/cZHwPh+fLwowUmN6Qothf/MCdlm2EE3pZgwVYSOJznfQERKtBb?=
 =?us-ascii?Q?LatIMEqJSGikhwHmUZ6GuU8GmvTJobsy8bX6raZ57vBYxtbedRwuxy2yFNZB?=
 =?us-ascii?Q?K4EO2BUw61ncRRF9FQRrP53In255OWcK1n5pKfVYSFPOI2+Bu7bNTsD8l0pc?=
 =?us-ascii?Q?U1LxUv9wOvZNmuc0JApo8FTvtE7VIgrE/a8pGTC1PysNuwqAvgctodHRKw/g?=
 =?us-ascii?Q?Ajp3Wo/MNbv1iyGEjA83OPLwk8vpp1Q5Ij0Q4PVTTpJMMVJhGNcc4aeNXm61?=
 =?us-ascii?Q?ZUVVp7waM0YmHxJCn1vidIdnZXn4D5X3QGR3rKEGSS+xqqw/8ltrBxPKQNen?=
 =?us-ascii?Q?qDWO8DGpNQTh0qJSfAAgD01DqzRKIijSBddlxOFKaC+PQ8gS0bG6MApoCg2f?=
 =?us-ascii?Q?AJ59UQNk7FTT/gZWPqztEt2BW9Nm17mcgqb1D3MOFK2aB1YNigRgj/Q8a00m?=
 =?us-ascii?Q?PLb5M8nFsyDRxr2AMKOLeWrrdm7DvVyJCT4amYRsCxbwZpM6p9vsYeIKVT3y?=
 =?us-ascii?Q?gpXZubsqcKzY55wrIpFaxxqybPwEnVgOxLnXftpq73u2Y4TLHd5JSnBGbPG1?=
 =?us-ascii?Q?WPMc0tmO7nGSmQB3BI0tpSeZyLN6lYGQ+pSg1bpdQFQXR/3AjndTCbVc4qU3?=
 =?us-ascii?Q?Q+R1cIA+T7IbICHueTvXRbk94V5EVg7ta8+EiZIKUcO4O2M/+0RiBug6Cd1z?=
 =?us-ascii?Q?VywajoWozPGOiL8YXXjFU8B7yfv6b944t2lNiQXGvMmUijrROqfQq2eONw9Q?=
 =?us-ascii?Q?h/kyk7U6Py+9jsSFSGyoJlgPW5g4HrC81B/bEezOr7+0MA9A2FOPS4HnYdTA?=
 =?us-ascii?Q?wddzo+tBFM9d5qVCIMk3KjvhTdo2Qg5JgN94ZebpPS+RK6Q4wVo6jTARc938?=
 =?us-ascii?Q?XB5K967TOZYsKoZTl0937nfg3szsBrqmfaB0tW4PedjtR3pd6FNuIa4sQXDU?=
 =?us-ascii?Q?/2YFtDddTxAED55oOfLL086kmkyj9xNGBSqNC+VHWmaK0A5Ln66LWtolwYy3?=
 =?us-ascii?Q?+aGuMKcOoCdBMrJQLK60CW9DmXsf/apVACdAjXngDCaEUfsIovSR5tGBUYZb?=
 =?us-ascii?Q?qyJ2FPOKrv/8FMs07Uj3wU38K+e2vwfW+2j9npkhVOw31vp/JDXAhYSlNdG8?=
 =?us-ascii?Q?WNjB00Uv3GqNzLtjV+oC2MbYO0BlaV0hIOX0Qp7XEVTaGYDYOIALn/5Tpawm?=
 =?us-ascii?Q?EEmqN17LW5FAubzU96+ahlaWOX4dgna3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ng2D6eJuL7LxOVZPssPwSvl8MZ3Aj5HvLSoA0g60kK2QoSuNenVFtAB+n8Wr?=
 =?us-ascii?Q?EGmMm6dg0x1Wsq++5urOHnHlQ6Ntv0Ay4AEuF5jQx71x4nX5EJInwwHqccQY?=
 =?us-ascii?Q?n7ZQaqr7SOYAO0n7Nvo7ApaJg4uim5sW+RDaSFk2IlyJfSrTgpOArpP+8KdF?=
 =?us-ascii?Q?zFJ0kXHdOmFdKKLhTZBMIVut1lSAfAO2Jyr22Olx+092QwLAG9ZyVqfOZhJu?=
 =?us-ascii?Q?WgoBspq1n7fFl4bIx0ZEfPRQPSLuejyRgIBhAJIg5cWvoEmHfh0TaDp2J4gw?=
 =?us-ascii?Q?k4URqmRDuJNazELI9abvpyEHP65UkIUqrU4xVBFLR9LHUDpE5z0NtJOVsCM+?=
 =?us-ascii?Q?bFJ4w/PjMDxkbY4UsBG+i6U+04G9mx/wnZrSZru1YBX+c0YamxQunRRlgz4S?=
 =?us-ascii?Q?LbgY2tZpJLUVqNqzCRsvT2CTFcPY6hk/xMhqmMpKvxyrmF2BMuPbJmc1qA7N?=
 =?us-ascii?Q?Oz2q+249fd0QLGxymcFL7K7+asPxAMfYlawD9tOMAwaqmshBQhd+6qNY3B4I?=
 =?us-ascii?Q?vQjgh+92HVcL8p9uPu9rhNNzzGAgDlzwkSB0FTrMi+WuAD5uVTdiPEql2K+w?=
 =?us-ascii?Q?OY6Ggx6HF0avTKrsiBik23hCBlFJq83IhtwiA2WmbTbMkxs62XrkBusARF9N?=
 =?us-ascii?Q?IPDZGIcT11bt9t11hQ9KkJWbzFfQUeI40Y6S+3Hbw638daBh6s2K7LYeu/Ky?=
 =?us-ascii?Q?TIevdfaXR4oDUDd7hTgSbwvxRHBAkeeFvB9GFDzsOhelaXP6QwBlyHNVwczF?=
 =?us-ascii?Q?67aOPgYvdOe6efvgg2j0tyJLyuPnK0yZL/srxxu7ivDMqB/wTHV54yIrP9eH?=
 =?us-ascii?Q?zG59wABsoMoHzcg1yTtl/MtcJanzWPY4aSwa4r3ahUqY1g1shCTYdlAnj0/B?=
 =?us-ascii?Q?4vpYSShhC2NFFHX60wQxbYUwFrCbbh3AvvcmUJ+bqE1x+KlT+XUSJH77RAvy?=
 =?us-ascii?Q?OCOHD6zVt21wOEeM3KfwWD+OrN5dDHh/0voaxBeF/cnLI5/ZXuW18G0/CvNE?=
 =?us-ascii?Q?wcpVfkL5iN0jRcAE0OEyNzq6VrlPftpjmCVvClxgqO56T31GqO0YosvuJME7?=
 =?us-ascii?Q?uXiGjgTjVviH5DFnjaO0zcGPM6j90VeTgJVMTiFNwtP7GsxH2VdtMtjJQLzb?=
 =?us-ascii?Q?JXL6UzIyKjowUsGdkCfA6Fd0pSgrBrL1tYGOBVyj5XWCKZ+CTsQrLNI0VIlo?=
 =?us-ascii?Q?8kwI7guId3+flWi7GUCywoAcfcgYG2iyhPlxsZIz88xTvS5sesBOUg9GsZLo?=
 =?us-ascii?Q?xURozbL+ljLcF42KxCpV4zq/fxfcGELoNuzuUNJ9YS/EBtZAadhRon3gc1i6?=
 =?us-ascii?Q?hd0ELAsE3lHC3jSAEK1xKYoBmdgFvQMVpxbVPq4AHE9MTOKNuhya1lUIFxIp?=
 =?us-ascii?Q?OY6FcPIXRxIY921Jl23I2oAMjup7Gaz1O9tkfBmCMslVkpJBLmQkU5t4X7fV?=
 =?us-ascii?Q?92V9VosYpsLjJKGIWm5VezuCr1I9c5zcQUlZz+KJqH8+w+q26bphhw9IfjM/?=
 =?us-ascii?Q?4uMih/O3wlaME/MF3QnXczgkkR29Cq6ygYThteyeJfRwB1+2u+PdSyX7qRHx?=
 =?us-ascii?Q?XT/LY4C+xx56cZ7QkEWCZaj11iHjELuWi5rpSq/1NvaG+c3t6HisJigiOge3?=
 =?us-ascii?Q?P668E8V/XWc+OkE7s8HB2vbOgvSYxwbmK2P6XE9tEHPoDQFOxoBAxq8pz9bT?=
 =?us-ascii?Q?XycyiQZEtD/9XtqBL8UtKc3z0vLI7kVUbRJiLs234tw/PcFlaZl02orlfJ3p?=
 =?us-ascii?Q?39Qh4jPjzR7iiOvn924LVK25BwyXh7vnm8+Ti29seYAhoXW4eXFA?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9b88e2-a232-4d65-703e-08de5320a427
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 03:54:39.2457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKy1BWa5Ea/FRtt5L80gQvab9ENKXaAwe69/j89tUC2OrXwtsxp5HeeEHoBdOcjT2ZdTWH2z0I1ejme6CnadMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1476
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
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
> +/* Inbound mapping bookkeeping for Address Match Mode */
> +struct dw_pcie_ib_map {
> +	struct list_head	list;
> +	enum pci_barno		bar;
> +	u64			pci_addr;
> +	u64			parent_bus_addr;
> +	u64			size;
> +	u32			index;
> +};
> +
> +static void dw_pcie_ep_clear_ib_maps(struct dw_pcie_ep *ep, enum pci_barno bar)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct dw_pcie_ib_map *m, *tmp;
> +	struct device *dev = pci->dev;
> +	u32 atu_index;
> +
> +	/* Tear down the BAR Match Mode mapping, if any. */
> +	if (ep->bar_to_atu[bar]) {
> +		atu_index = ep->bar_to_atu[bar] - 1;
> +		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
> +		clear_bit(atu_index, ep->ib_window_map);
> +		ep->bar_to_atu[bar] = 0;
> +	}
> +
> +	/* Tear down all Address Match Mode mappings, if any. */
> +	guard(spinlock_irqsave)(&ep->ib_map_lock);
> +	list_for_each_entry_safe(m, tmp, &ep->ib_map_list, list) {
> +		if (m->bar != bar)
> +			continue;
> +		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, m->index);
> +		clear_bit(m->index, ep->ib_window_map);
> +		list_del(&m->list);
> +		devm_kfree(dev, m);
> +	}
> +}

I realized that I missed one case in v7.

I think dw_pcie_ep_clear_ib_maps() should also be called from
dw_pcie_ep_ib_atu_bar() to tear down any existing inbound mappings for the
same BAR before re-programming it in BAR Match Mode.

This matters when updating inbound mappings for a BAR without resetting the
BAR in between. There are four possible transition patterns, and pattern #4
below was overlooked:

  1. BAR Match Mode -> BAR Match Mode
     As the current implementation does, the mapping is simply updated
     (with the same atu index)

  2. BAR Match Mode -> Address Match Mode
     This patch series already ensures the old BAR Match mapping is
     torn down before reprogramming.

  3. Address Match Mode -> Address Match Mode
     Likewise, existing Address Match mappings are cleared first.

  4. Address Match Mode  -> BAR Match Mode
     This case was not handled. The change below adds the missing
     teardown so that stale Address Match mappings do not remain active.

     --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
     +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
     @@ -148,9 +148,12 @@ static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
             u32 free_win;
             struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
     
     -       if (!ep->bar_to_atu[bar])
     +       if (!ep->bar_to_atu[bar]) {
     +               /* Tear down existing mappings before (re)programming. */
     +               dw_pcie_ep_clear_ib_maps(ep, bar);
     +
                     free_win = find_first_zero_bit(ep->ib_window_map,
                                                   pci->num_ib_windows);
     -       else
     +       } else
                     free_win = ep->bar_to_atu[bar] - 1;

Unless there are objections, I'll include this fix in v8.

Thanks,
Koichiro

> +
> +static u64 dw_pcie_ep_read_bar_assigned(struct dw_pcie_ep *ep, u8 func_no,
> +					enum pci_barno bar, int flags)
> +{
> +	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> +	u32 lo, hi;
> +	u64 addr;
> +
> +	lo = dw_pcie_ep_readl_dbi(ep, func_no, reg);
> +
> +	if (flags & PCI_BASE_ADDRESS_SPACE)
> +		return lo & PCI_BASE_ADDRESS_IO_MASK;
> +
> +	addr = lo & PCI_BASE_ADDRESS_MEM_MASK;
> +	if (!(flags & PCI_BASE_ADDRESS_MEM_TYPE_64))
> +		return addr;
> +
> +	hi = dw_pcie_ep_readl_dbi(ep, func_no, reg + 4);
> +	return addr | ((u64)hi << 32);
> +}
> +
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

