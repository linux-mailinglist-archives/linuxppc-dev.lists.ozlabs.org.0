Return-Path: <linuxppc-dev+bounces-15778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03323D2344B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 09:50:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsGsC0Tbtz3c1T;
	Thu, 15 Jan 2026 19:50:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768467022;
	cv=pass; b=aBs/X6TkmNSv9YfEN07l0+pjpXmnEfyNS0L6w24LpgVxadoGXHDABfWUyAFeAFNgiki6m18mkqAgBH20v5wjjskjW7bBsd/M6G0DTYQ6ARKhYVCozOzP+/yuJXcPiruKx5wWc7tMNS5rHB4/vDfYCaF9vAI/NE5HbWy0vQCaP8+aO3sq6b9jeEOOIi30quR/GUcDum8v93dAXCQ/Bsfb5zOtHpOUdbCkE/h5KpUAXCSZy9PcrDTEefFx7Jir7e3ctJP0aKk2w2iO4ANUYNYv6KnzPmzdD4RVcv4hjoqMTdY8aN0rHJTgGhUUrfi+8Rv4m9zfBqy/vu2EBSXbEZ91Og==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768467022; c=relaxed/relaxed;
	bh=oSOa7lwvYj/v8UXgWdEwkRWBMUl1vIwFnICJRAYmAgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oBJwIGNpSfdAQwXRjjQBtET3G/Hko7aHI+xvjk1QD6Ng93mBPNf+5LLzrVrJNnogk5+4SrSOzis9L6qebx4Qzofz0q7VpQ/XydCuyMZczo1LepcQKIm+RCDT+h4xmh9TuUanP17fO825K5dXANngCifEz4SbYk7zfl+A8fi2sTPtSPSJgbeGtD3RIQao0cItGlmI+Ijgs/yGRNmLJ+wXCznkx7JUe0nUce0ezODy7vxWyLE/bXWN/dcFh8boBe7xbQ1tCKGRbmfe+2VqPqbbuabc143cLROXkdjSQmyZpMZPMe6mnyx/o7yV7ZaTsgBV2zVK8u1QBuTpmBj6za3JAg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=o30ODXpo; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::2; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=o30ODXpo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c405::2; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsGsB3Sjbz3bfY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 19:50:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is9LE5K1XV+pH4DkFYPgmVSExyQKSvwROMafmkBuIL6lss+cKx2OP/2BiyK+lnIzi/PFpN/nDXq0KUO43SHWwcTDtf/HqE5FHp2jfaYJxvf2h0Y76D9fcdfPZ41DH4eQqNZM7Fv7jOC8GLPBBLz1Ui+BvXZevbFbp8dR5nCXNw9av67cZC9Sf8bFhXVYt7PmZJLNpyZu+oEIEUJQsKsYsNqZBM5ege4bESw0M2cXgtlqs2H8N4i6uM5Iyenl49E+6tv4388P7Reu/c1Utd0vHfG/a7PJ4k1emyenOrJweN1aww92AOpFTdQQZIzeStivMCRnlE+fbHUpUSc1MrsC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSOa7lwvYj/v8UXgWdEwkRWBMUl1vIwFnICJRAYmAgE=;
 b=L/J38MhxzoMOhVu3e1c8T8KUcBHz7tzka3kimIRO4UQmk6cbFjisVVe7dGFcpRVwcpfoaqarfZDSYuDq+qJWF6ztgbW0DHvZRnBN6uOpwc3R76cVgpx0YB/8kaHBgsUqrJL/Zsho02gUxoDgYJdB1JUtaD0QpvSehacE8aDVpKl3z70ovAEaPzVRZfrUZBuHMH7lIY+XH4WOGD0WctLzuu6MwW4B0U8DtmXuHOb0Uqzn3TDUJka0HPYG4FIHQC7Tur+kZxsrUCHChgBSqDNhZ2vTHx9xj+t14026f2Kir4Pcdk/n0XS5Zfo2v/kjCi2tA7ZrI1Z02RB79F9YTHq93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSOa7lwvYj/v8UXgWdEwkRWBMUl1vIwFnICJRAYmAgE=;
 b=o30ODXpoUYQ/a3czwoRA8zk8YjWe+SZyY59fJCQhiqCW4gtjyRGPqaC8ZqsoBnO9xIok3ap2pkVFn6MscfSYcMBleGMazFi6wuCnrqr0pgMu4rrcHfcBJKoc9pol9lrH3UQdbeNN5cXiiQcrD26uFHaC88BGFhqoZWVC8ma5AFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4454.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 08:49:56 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 08:49:56 +0000
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
Subject: [PATCH v8 1/5] PCI: endpoint: Add dynamic_inbound_mapping EPC feature
Date: Thu, 15 Jan 2026 17:49:24 +0900
Message-ID: <20260115084928.55701-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115084928.55701-1-den@valinux.co.jp>
References: <20260115084928.55701-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0145.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4454:EE_
X-MS-Office365-Filtering-Correlation-Id: d87b8216-e090-4141-8d64-08de54130ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uVIDvKCaWif37aI/RjMYinqCcKQ4QnWuK2GltXHzccNnnJkRRj7402zLobRM?=
 =?us-ascii?Q?VgSAcvugR1mJb7v8S/uuIcTRK0yS3LMA+/eaycEGcuMfSjvyqW68uERfUibf?=
 =?us-ascii?Q?O/6utLvC+WVHNIFQtontYhX1uzXVEk6aBycUN69Fbh/iqaHYEJ5wRni6omPo?=
 =?us-ascii?Q?olBUQggzDo6F4/tu4spBl8+0XDv7cyU93372b9nk7fCG6aEyo7AwkdV/vaM+?=
 =?us-ascii?Q?Ap9INzr3nKB1FJG4DwUtyc+xvapL0E9+jwY080oer3i2sm+uzFCSV93bN4+J?=
 =?us-ascii?Q?3xl73mjm2iOzkqxBOjvnPng913+4+MU7C60w9ijJdg4YLTmVn7ia6fhLUGuh?=
 =?us-ascii?Q?MbXgpBo3EjUUIYIkshReZWXgPvCgqoxI5Vg6rMOwCGF33tzU6varGuKCr94v?=
 =?us-ascii?Q?YPonIwX2AiinBdFgF8zzaigD0T+RuJX9Jd+KeDV8uyVVOwiptOgpONC1DKz2?=
 =?us-ascii?Q?+XO5TkWLYSTFUwn4qD2/IugecV5gFNb7XsmO77bbegWITpMs9RZ2akxXPT+X?=
 =?us-ascii?Q?d01TD7u8K/yl5ioKJWdFMxkpJkrcQQQSWe+QoArViWZrC/icVoEaTQF0PSpB?=
 =?us-ascii?Q?mOOCD593ZhZ64s/vVnaAspqb8jL4v4mNXl00FZP55XPZLxfm+ehBMZjo7OxM?=
 =?us-ascii?Q?oE1fmgO5ZrwA5g9HGd8SZmIEXhIH7h34eCLFQsg6S9sue8AEwsIsHZQiJufb?=
 =?us-ascii?Q?Up7cNZWoFp5/WPSADN5g+EERRW6fStoWxAhJmoavBOPo2VsgYrOkCOG1YhvK?=
 =?us-ascii?Q?jV1+F0QWTm4bdh4tNEVGxxBpUViq20HXWT3IIRHVmDwYKCSTMzzjFMYRDnv8?=
 =?us-ascii?Q?H+lYNl226WKtBd8mguRC3sBZTeK1BBPATd9eHRq3JENwh6z/QWzb98eVhaUZ?=
 =?us-ascii?Q?vbsxappGB1uRf+cxiWlfBABCaqU0MK1Xg8vyWqsw3tSJZX0XzOKr81/Z3tP1?=
 =?us-ascii?Q?JV+vx+jGexquUA9uyL/iRI0YcqOwqN3+LfmKVLb11KZvVbBXxc4eIpkXKvhs?=
 =?us-ascii?Q?3RKG2M3LzD7xOQJEf2liw7pB062eebIgfYrFnWJ+BybZqTitnalQ2jbuDybU?=
 =?us-ascii?Q?na4u4ieqqcHPCewhJVQkq7Ez0XKlWMrmMkV6ZuovaPtWGkaYZyOzyST8u/IM?=
 =?us-ascii?Q?w+FgVtrhaTVoaA6+7+W2qV8hooMZAbbCNBrS7quUk8vH3I76dmAc0u8KveHD?=
 =?us-ascii?Q?I8mKwbUTeA9xMn9gLs9S0Gv+1I6dlOfLaPpUuXM21JHt4oZi4KMc4yJ9aec7?=
 =?us-ascii?Q?kphA+c15dBt95M+YU97jp3GhL8VrFpolFNUoPH2ZsJ1fnIqLkFJP9NvdVbJQ?=
 =?us-ascii?Q?Rp3O4q0QAgS91hIvmEh5dfnRxxynDRwKPXKh2WpEEoHMMVX/WQvN5p1KPz7o?=
 =?us-ascii?Q?uStci8c3Sit9M2TsQYTGWsbMLB+P1kzj2MY7EDWRhe7MyXJYyRvWXAcDiG0e?=
 =?us-ascii?Q?u17g7PrHbyRLUk3m/Q22C7/ZUcUoFnABEZ4j6HPUAw5MNQ16PIzmfxEhvdJl?=
 =?us-ascii?Q?yQLqoyiUsL26ZdCArWN8YqfQ0hG8ogXKkZK2ztPjTkpUH9mcIlp21Azb13bG?=
 =?us-ascii?Q?YG5BumtWL/kuqiVaOyE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qov0CPXIGqkdEDPmIIeeQQXV6ty5+YmSa7/kumy7j1vGb+WbEEPNOY6d/hPs?=
 =?us-ascii?Q?FTL2/H3+xcrqrS22Em1TIeSE7C5mx8OQMAVcPjYd8KfqIrXL1pQOk5aExmRT?=
 =?us-ascii?Q?aSj7nOcNNhNNpWQkC4+d12/vPOZj4r7N6tW7ulsWPM3kVfzRbmXZ5MGRq8m3?=
 =?us-ascii?Q?EWdIjGM02X96lMEpcSK6plZBAmZ49l91XZC8Nr22MChgXp3DPuqO8jiiaR09?=
 =?us-ascii?Q?AIyJGF9ahNxle5SdsIt6sB0UoOZiBYuVBLCzI5OODP9ayuizjxNTYNOzoHgv?=
 =?us-ascii?Q?lJxo6BxkemNBFrPB0gmpHIN9QHthJyCxebvBoKpdwtbEpK00O6rBhKvSd9K6?=
 =?us-ascii?Q?fTc19z8MgGtLCGG6eTLw0Z9MSflzULvZDQaoI/GaYKF+CLsWHJPuBaQwbXNN?=
 =?us-ascii?Q?d4UxyvRonTX5yFzejqpXYzbSWRaULQUc3bmttEjea/AYZ4JEqy5LtqZ7KYiB?=
 =?us-ascii?Q?vFfUm3rPh/oYeF9HmRVPLTLEry0wuAXgt4KBLv+prtDTpRR01afV7Ax9oaul?=
 =?us-ascii?Q?AzwWDrrQ8AjjQpILj2LXV6AVY0KJ7Am6YrGDXIncJhHxo1FipnZ3COFuVLtn?=
 =?us-ascii?Q?WlUhCGat71bk/jFo1jQOqr+TIcAHZsbd79++y0NyU7y0hDHAJfmrS710lB9+?=
 =?us-ascii?Q?7kOBEQiddnSL0X0JNYCLUDXQWRNHIFIrlUdszvdoU3WUegtCRVqq1RiC0Bmz?=
 =?us-ascii?Q?Kcuz8Ucyfps5lPCmKRnJCtj6HcQkrV8Avq37duZw3PlvWhV7zZbz0RzKvsxO?=
 =?us-ascii?Q?01XJ9uzm2B6pAIUGVAAIPakKOvK5piD8g+LEOApkvxC6EJERgXcTSJb7RsF5?=
 =?us-ascii?Q?i5ATIHg60/wmdzEDSOGNCD7qB70p1tBJF2CcQDz6AjefGjvrVCa7AO+5I0rN?=
 =?us-ascii?Q?vaB+O09rn5kGBEt80FdKVebpeCdJAsGWfFI56uiUbsbzl3yJY6jo3XFTGu3o?=
 =?us-ascii?Q?SiKO9nT/SWUtNW/tEuEp0coXaL6NaM9TCdamw3XfWJuSpc5Atu0pu2BuYpCC?=
 =?us-ascii?Q?y9YzO/DW/3DH0C1VG/JFUdDj1VsQe+uUYn3FV1vEnbINCD1EEnubODMaAaGH?=
 =?us-ascii?Q?0x0XD9X10EYircRBny5/rAEIRGNhGXQkoykfKguhVx2Aq4VRWDQB6DK/EYH8?=
 =?us-ascii?Q?g3a1/Ykpj+UM6W3JT8BB9lyafA6Vy6iDtzw6ER5k2igzx4wSPY6dtOvU6WVM?=
 =?us-ascii?Q?BAgExfe/ZZsu3gFW0yiZDVtIaPwhEFchHNa86CJpCp5yth8CugaSceRNtAnf?=
 =?us-ascii?Q?TC6ou2yaBmbNEsOAX30AlaQ+NrYexntZerboNqgrLDlt2b1s1vHVLq70E/P2?=
 =?us-ascii?Q?ibNTZsvu1nN1SEEpM5IT0w5K7iyXHvyLxBaaEFr/cRApYYSfSr2uXvLgN0Ze?=
 =?us-ascii?Q?8zUR1shllPtvcHATtgzci4QiFTp0Ohn/olpmD0JsBi3hppBSudW7UNOqPiVe?=
 =?us-ascii?Q?HMixMCrXKWPLdJS6T0rarIguOR+OD9TPcLSUG8mFHTxzABH8WXsyd+WP7D55?=
 =?us-ascii?Q?t2QLuTLh3EJYV2yxJqtNXnaOu49DIgCZGuAvBF++8W7vpwau9/lNmHUOFzX8?=
 =?us-ascii?Q?wjp/ZuBydUC0Xuj+bASAOrF1JKg/slUZP27ZgexStWo5xlSPlCNINyZZGNwU?=
 =?us-ascii?Q?0+isC5IlQVO9MtDueQa4kFCPp1lmoWbF8xygzf/WyxSfWdoO0iFMhu7unW1i?=
 =?us-ascii?Q?oyvHbs9ezr1PQFiOY6RZ+OQCTei52Oa+jmEr8L3DAqY0jqvEUAuxLIBj5E5T?=
 =?us-ascii?Q?zKDRStM3VJKJ0fTnlj6DJh7yGY8AqvgXtqgtWA0/aMMN9myimRba?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d87b8216-e090-4141-8d64-08de54130ed1
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:49:56.3426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yc0nSH+XAnDA/8QyOm0+z9NKHQ3HPn5rO6Klk9AtBehIHQI1qbk0bHrhWHYysW9DkrIXrvX1VFk6hRM0PEUPlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4454
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Introduce a new EPC feature bit (dynamic_inbound_mapping) that indicates
whether an Endpoint Controller can update the inbound address
translation for a BAR without requiring the EPF driver to clear/reset
the BAR first.

Endpoint Function drivers (e.g. vNTB) can use this information to decide
whether it really is safe to call pci_epc_set_bar() multiple times to
update inbound mappings for the BAR.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 include/linux/pci-epc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 4286bfdbfdfa..4c8516756c56 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -223,6 +223,10 @@ struct pci_epc_bar_desc {
 /**
  * struct pci_epc_features - features supported by a EPC device per function
  * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
+ * @dynamic_inbound_mapping: indicate if the EPC device supports updating
+ *                           inbound mappings for an already configured BAR
+ *                           (i.e. allow calling pci_epc_set_bar() again
+ *                           without first calling pci_epc_clear_bar())
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
@@ -231,6 +235,7 @@ struct pci_epc_bar_desc {
  */
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
+	unsigned int	dynamic_inbound_mapping : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	unsigned int	intx_capable : 1;
-- 
2.51.0


