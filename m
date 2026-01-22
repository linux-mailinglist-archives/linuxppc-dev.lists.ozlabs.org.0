Return-Path: <linuxppc-dev+bounces-16124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MxaFLPkcWngMwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 09:49:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69553636D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 09:49:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxZWG5bGdz309N;
	Thu, 22 Jan 2026 19:49:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c407::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769071786;
	cv=pass; b=gTaNOxpSvvbiUQ1y3+VpngXt+ZQmFCIHjoCUhDHMId1+5rbqB5zm2sjHuXz+RCQLIZgtPFRk7NPUxUp+tE14VQabDKFH2GneXB/yj5n5ebvthQ28/gqcEu9biPJdUAu2g2q8wGMSsbHIiusushVlE72TTB6Xxk6ppjMlR0QiPeiiueqC0ZPRaZ2bs8CwrjfPeS+ZktXaFjXarQoc4ujIpe/tKnMduGtazTLGn1ZmoT3yLzjP3ORglB7C1Ec9kHXZL4gN/QSulf8LfbHQGEUd+ihimsXkAL1WylhwXOwxpYfutLaEeZKFbgKFwQv7mYvx9oi2WuqFhjYRXkHCyKecYw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769071786; c=relaxed/relaxed;
	bh=cYXcLh8ClIApsFKw5G6r+xLJBUB6SYAPcwVUrpe5D+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vnmy+0F5NtiXrvhhJt6o1V8MsRqEd0rq3ydkaH4mOLGV2Bzn65mrTXrJpRWouNSlU1wpF3OopxqH4q+lBp7Q8cltrsmzPj7zMOmMFOv53CE6lBQox1PPRKGnwrZokh+nlJGtU7FDYmkTnGRhz0XNUdlmpqx/V4yWTXAJbig1/mmJFoFu9Shsh5dDx2Bzhymt9YsPPYOue7Vf63pvy/ISPxbZAVHi66yxee1i9MsLoAzwNNmzOeHLQaBL7nQF/VxuW8bV9vG+BbBjtIxAamTqdThhuVZd3z+X8sprjzsK7s/iOjazgvRhlHBk24rE/224H42ZLF74OM9EsOZ2T+GUSQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=a+CUt17J; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=a+CUt17J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxZWC341hz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 19:49:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAnGZtfOvgoB7MRK1VfHNjp0nI8x3h8ckR5XT0DDOWMMXgXt0BO/9C0R8zocdUZZ6RIFKpf/97KApYROw08gcAqypDk2myjGwfvbEHIqXYVeORMlxNRDMTtp6IJzo6WW/XraCwEOdBbP/nIbwqGlNrYmMsGT0pnjICvtzXtP9g5PRr0qEzOA7/wo/Re8Ep8B/qQ73FPwM1b0BlxygR6tjvSDCH3nrWOazgF7SURCMjriCjqvWnYUcaHD/bck6nLPqGxpQ7XMmPbr8s4MaP4v0SrczZrvmx7Vp9j1GaDMx/h4UJhdjdtZsNfwTY7fckpONWaRiT6JmkauAVEHoaCCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYXcLh8ClIApsFKw5G6r+xLJBUB6SYAPcwVUrpe5D+8=;
 b=GYKJDowQCFS2MvTCuyIN55yCZBFs1miOceGAdc3KuzB8M3mZddsQjbaxCklFJw+pGduVEY3LLJ0ZvYjGvLD9fGsmXkghXcnZfWoIUmAh9mhsccl4QzcE7Rmj/Emrg9DEafnYm0vT+Q9hxvFFSdXfqjRLIHO9x/xzrwhLPIFs5zCRqoSZeZdEX4cLjRmDuTcoWUZqzco9CKtNO/Fyo9N3gToHyHRPm+rZh5eh94v1VabLWzrxmMB3j/bAvFFyz6Etc3vYMuV2xz5ZdbiD3G9UPH9y7myLjfyJjcy1jOHZRE5DKvUiSimFoe8iyqpgTiPagPYYi/sdKZosHgnvryaqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYXcLh8ClIApsFKw5G6r+xLJBUB6SYAPcwVUrpe5D+8=;
 b=a+CUt17JsADl+bf17ZUWBclUGhLMM0S1Ahjx7M/fADHWt9hykBTwyl3zwC7WMY7EnuYqXHUYeLKrZVmUrzGvODH7gbpw/He3F8r97xnMhsqpdvbYFWElA0YBFlHbKjoUAd/Q1aYFOBNYs4YcZDZWA1C9TtMlQere60MFQzAbGfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY3P286MB2547.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:22a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 08:49:20 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:49:20 +0000
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
Subject: [PATCH v9 3/5] PCI: dwc: Advertise dynamic inbound mapping support
Date: Thu, 22 Jan 2026 17:49:07 +0900
Message-ID: <20260122084909.2390865-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122084909.2390865-1-den@valinux.co.jp>
References: <20260122084909.2390865-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:372::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY3P286MB2547:EE_
X-MS-Office365-Filtering-Correlation-Id: 810b11aa-3eb7-4177-dc5f-08de59932219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vgrb6N7MSuw1KkD6swap0Qeo8d97tuXvpb0vz0LOASpLg2GhsCltB+Plg+gQ?=
 =?us-ascii?Q?cBl5nq2OMeFRinsArTpQEA5+2ijY3ohaVvpsvRt5uxA+X34sa2Q9EV561lyt?=
 =?us-ascii?Q?oDFNl57X5mGFNyH5OX8FjhFTD0hwnwP0II/bmT7NEJanumg40Tmgj8ZWKdw1?=
 =?us-ascii?Q?THzPCl9yShnN3LAn9TtIiH41DDGuNXRlz+nBLt5kU9Z/HNjgbLjU/xhyiDxK?=
 =?us-ascii?Q?886ZfCVyuha99vsZEMpRtvMi0YSBrZTw3pR9Tkvzf5Yz476qfv3iqgTOZ7zr?=
 =?us-ascii?Q?FgKUYHx3mEdZJtSEqIZLrgIXSTPO86IlehlYOJ614ErYQN4v6hZ7nek/ijvX?=
 =?us-ascii?Q?1+xmWtiF68nIX0d3GUgGasfXhn3Bzmh1TMRC/yvdd/T8mfcsz0OnW5hbuMt9?=
 =?us-ascii?Q?SLURDUJAkBZpfR6uxTpZsRmjJeoE3x+1q3jYxRV75PicgwwsaYYsZkJcuW4Z?=
 =?us-ascii?Q?lg9GFUE8VJCTHZzIeOB3BblMn4BviK2anDKVki+l6oSZQf/kzeKCwrd8ksbt?=
 =?us-ascii?Q?mzU+Z2DgpyJV2tYz/p1Py/DSEJjeIDII3EzwvJUoiTv+t68zxVEhrBqjTnj8?=
 =?us-ascii?Q?KfjfQHAVFLozd7L09KQmabPL0kGZ3AwkgcBqSHF1/6gAIBWr/YOpyO67ByQO?=
 =?us-ascii?Q?raK+65G2cAVNo03EA5dyR9ooBIUiISWI+hXcHxVwLsdZKEySecjsNpf7yRyC?=
 =?us-ascii?Q?N8hMusEwYHx0ctN2dgJeONsZfGMrpI/XEP3RhgSVAm2RvY0VQJuy8oCD5iyz?=
 =?us-ascii?Q?VwgQ2tan4tD/C0qO+CTj9rld4XOQLyTDg/ERh4irp7qpe3ONGSWJkKrtyFnH?=
 =?us-ascii?Q?BrcTjQPtTpagCmLZvX3dbkV5KZKPOuIEDdZn7PhUE5jRDB+C3IOzzQObcOCa?=
 =?us-ascii?Q?IkgmmiQkr8E5Ditrhz1k1ZKBVZT2UGzH23L9/qh5pFoQY4AiqDiSsfP//HPf?=
 =?us-ascii?Q?bVppQsSO/lJWTZHufR8baBs2Iu3Sa1bPzfysr/jpYFRUlTVIxxf5BCucOKfs?=
 =?us-ascii?Q?e+cwZKGVrwu8daIBxlJoVpuvAB+ufZBshnqflqz5RpATaYfRyyoj1pKKxFQN?=
 =?us-ascii?Q?NzYIcnA/23UKS3cPpSeHXiSd4+cBR07P/QH8JT0Aoyi0CspEFfKopDDOwesI?=
 =?us-ascii?Q?sBcpuDlNpVOfBUT7rf6RhWk5n1CQtUnA/g2RKrDQvlZxiqQOWC/kH8b8X1pU?=
 =?us-ascii?Q?SufrZSLP2eohaoodUklXMG+/zzvOedCXvbOGsxcBp2iDa4/mx99g5dJvbGpx?=
 =?us-ascii?Q?u32Gt3Nf5su1jPMNxJUFd+3WHvajqVie9gELb0SMPCniSOXW8GZwhieGNgu3?=
 =?us-ascii?Q?cVCaunwmpTxEEquR8wqib+c1K1Xg5buhWz8ZB0P5feCOgTll+ub4UVLLg+pB?=
 =?us-ascii?Q?xHNKAhgBpul+URRzXiFu1adQq+iMTv+Dgd7UhS5ASJmFbCJ7JndgOaHEd8jP?=
 =?us-ascii?Q?iUfND87H5NXj0eRF6HP1zFFCBNjkUNHE36FgWFHN+Sk4VIykt7fkHOhQl3o0?=
 =?us-ascii?Q?l/52y7krtb48tU8wxFnjkZiKG9yQnoGDbNBYVi7fO+kpqQGzwtHPyEgPHpa+?=
 =?us-ascii?Q?kwqQsWYdsq2INmnJ/yA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2PZIG/8vTdPfmJIdF6Cv3srj9S49uFOnrC/XONhio788h6A3ksYTv/FaaE7a?=
 =?us-ascii?Q?GwANZPl1q/rxfOQzCLu65jSif1PZ4Sgp6/sGSleVzsLbaflxetdJxdBku+oj?=
 =?us-ascii?Q?LCmMMfP3tAE/j9aqECT4scF4T45iK4tC85TUNoDsE5GbLCTm00Zwx6hjGE3g?=
 =?us-ascii?Q?Vi8do6H8MglF4MpKQE/2osJKwayjw3rptiy7LleOELsLXHDGqd3JuDHT4Gjl?=
 =?us-ascii?Q?2yiKO0VAHjpPsCpwdlgw3X1N/f8F1RUW24obfyKi8iFlE37oeRJSdIIa+ZNc?=
 =?us-ascii?Q?5jp7POzDQC9ZhG3NIui0b2vVTN07Ev1hBreL8ZLkpdjdKngKbaN0MOdek+SS?=
 =?us-ascii?Q?cBxwO+EzDaQdBamK940G+BXQmz6NCvZEwO7DIAtawyPP9ZidAr4BvyZ64Tph?=
 =?us-ascii?Q?gmYU7SeDbHrOStck+f6Xh/vnCKh50ktB4a5tnOjhNIeTX1N1Vxa3IP/swPGA?=
 =?us-ascii?Q?IOKeh5ZfYQ8WN1lXj/v7jgdIAA6SKEsYy9PZTGeT+mLLF/sPLqwaL7TJu4a5?=
 =?us-ascii?Q?DIBRFpEWnKfbEhvPWN5GLr8WSKOWk1pp1UuLO2xQFkrB7eKLYfBh9hDuefsF?=
 =?us-ascii?Q?uOQhvuu8FSl64h2gdpyt/KGt0i0PLd+2jnRJBxUZWWlE6yFY7dbCtHe13rBt?=
 =?us-ascii?Q?Iu4jr/pGsmMRQLkc7WE17eSWFSP02AtaTBGUEr5BMsJkxvSdWKuhiBt3pg4i?=
 =?us-ascii?Q?WXULIXozpaghIDU2a/tzwSlruRlhUw3inhyz3SbNcaYkR/X3ai4I/LLtsugV?=
 =?us-ascii?Q?A4y7SXH7FbxYokYg8nY7y2tSVUrp5DqHNrM0eRdDFZY7G6k5o5FQHlMHEv12?=
 =?us-ascii?Q?fb/5VxLvXFI4QCFke/1kjur8gr8vNn9eDGyVkZhuXlfr94OF/rgvNs0NLtl/?=
 =?us-ascii?Q?W5oX2Iaxnt11X/7PzpJnUcrFMBcuUoye0LKJe9g5elLuLNgKkjfNvzbDvMNo?=
 =?us-ascii?Q?e7tmzuAoPoInLQTtgNq0fk6qi3/UZVdZ5I0LvrgwI9bG9TnEd3lyQ/eH3A28?=
 =?us-ascii?Q?xB4f3ctsaTNY5lrHZmv0N+INOsv1apHYJudrsNImJpx2Tv6cbavAa6A0lfiQ?=
 =?us-ascii?Q?f1A7mfb4vdUsmkcJ4WGWr6tgr1i9aMDiQH28kM170hS9gOs7zXmf4X3HwSGh?=
 =?us-ascii?Q?FpAAnx6CluIhvtyLbrnLe3IG9tKjirPD9FB0fZfUyL3ki9rsDUfd7wk1j2+1?=
 =?us-ascii?Q?gxgsMKv7tvgjrtIu7ScnglpH9vXYRvr9tpCMZUV1i4fq9VXkyUL66vEz1HIe?=
 =?us-ascii?Q?uTbH9FSoXdKF3oKxe/Q9EFvUBLuz5VgbYiInXpMlh/g17t3E2Di30+UVzr9/?=
 =?us-ascii?Q?REErY4xB2XgtJHXeRjE5edCRbU4yulYCxzEEt38Z97qO07uBQz+Xb8SgpyNz?=
 =?us-ascii?Q?242obguSdHdRwaB1wNR2hImGnOQJuR14n+zE2yyGVB5XoEQ9ckKnyiCQruBo?=
 =?us-ascii?Q?1QIIdcVLx1XFNkEwPV2fG/vSK51j7S3UW+sr/aBvhMPev+5/tBhSL18MwSl9?=
 =?us-ascii?Q?l+OCdD9TXjmBvO6Nj6ca95YKStBqOo2XeuEOLhV+hwH/y4/zEX1wyCUkZ2f9?=
 =?us-ascii?Q?Agr5nRC7I5HbtZQpy6JOdzCNsSWPeanCN6Aa4TJuRqWJEawkisXPWh3xaFPa?=
 =?us-ascii?Q?gocGCvTY20nKhzSjnrnYLG53MpLHt6AxiD1v18nMP/18Hk0i8FhV9t/Baa8v?=
 =?us-ascii?Q?NGu3WQc/FokP/4tMyYipJzXSai5lnm2oWm0ihLcLF4L3nHcEvkJ9LVp5SpTt?=
 =?us-ascii?Q?lSGIaPrJPxalbTIf/QKJro2H/Dm0UOPWdag48qqU2s9/O9hVzX3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 810b11aa-3eb7-4177-dc5f-08de59932219
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:49:20.0984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2AETTOLXdLOeVIjKanXE/Zj3EJs7rWJfzbrtzSB9HBflpYbG/4qltLUSQwv93rDFGMu1KJ+bPbAxGQWiWPhFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB2547
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16124-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:heiko@sntech.de,m:srikanth.thokala@intel.com,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:kishon@kernel.org,m:jirislaby@kernel.org,m:rongqianfeng@vivo.com,m:18255117159@163.com,m:shawn.lin@rock-chips.com,m:nicolas.frattaroli@collabora.com,m:linux.amoon@gmail.com,m:vidyas@nvidia.com,m
 :Frank.Li@nxp.com,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@axis.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,valinux.co.jp:email,valinux.co.jp:dkim,valinux.co.jp:mid]
X-Rspamd-Queue-Id: 69553636D8
X-Rspamd-Action: no action

The DesignWare EP core has supported updating the inbound iATU mapping
for an already configured BAR (i.e. allowing pci_epc_set_bar() to be
called again without a prior pci_epc_clear_bar()) since commit
4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar() update
inbound map address").

Now that this capability is exposed via the dynamic_inbound_mapping EPC
feature bit, set it for DWC-based EP glue drivers using a common
initializer macro to avoid duplicating the same flag in each driver.

Note that pci-layerscape-ep.c is untouched. It currently constructs the
feature struct dynamically in ls_pcie_ep_init(). Once converted to a
static feature definition, it will use DWC_EPC_COMMON_FEATURES as well.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/controller/dwc/pci-dra7xx.c           | 1 +
 drivers/pci/controller/dwc/pci-imx6.c             | 3 +++
 drivers/pci/controller/dwc/pci-keystone.c         | 1 +
 drivers/pci/controller/dwc/pcie-artpec6.c         | 1 +
 drivers/pci/controller/dwc/pcie-designware-plat.c | 1 +
 drivers/pci/controller/dwc/pcie-designware.h      | 3 +++
 drivers/pci/controller/dwc/pcie-dw-rockchip.c     | 2 ++
 drivers/pci/controller/dwc/pcie-keembay.c         | 1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c         | 1 +
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 1 +
 drivers/pci/controller/dwc/pcie-stm32-ep.c        | 1 +
 drivers/pci/controller/dwc/pcie-tegra194.c        | 1 +
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 2 ++
 13 files changed, 19 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 01cfd9aeb0b8..d5d26229063f 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -424,6 +424,7 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features dra7xx_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 };
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index dfe814469993..06f45e009d7d 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1388,6 +1388,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features imx8m_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1397,6 +1398,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
 };
 
 static const struct pci_epc_features imx8q_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1417,6 +1419,7 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
  * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
  */
 static const struct pci_epc_features imx95_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
 	.align = SZ_4K,
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index f86d9111f863..20fa4dadb82a 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -930,6 +930,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features ks_pcie_am654_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.msix_capable = true,
 	.bar[BAR_0] = { .type = BAR_RESERVED, },
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index f4a136ee2daf..e994b75986c3 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -370,6 +370,7 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features artpec6_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 12f41886c65d..8530746ec5cb 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -61,6 +61,7 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features dw_plat_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.msix_capable = true,
 };
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 53b65428fadb..be47f34b49ca 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -305,6 +305,9 @@
 /* Default eDMA LLP memory size */
 #define DMA_LLP_MEM_SIZE		PAGE_SIZE
 
+/* Common struct pci_epc_feature bits among DWC EP glue drivers */
+#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true
+
 struct dw_pcie;
 struct dw_pcie_rp;
 struct dw_pcie_ep;
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 77c4e6a4ddea..03ad8c242366 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -382,6 +382,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
@@ -402,6 +403,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
  * BARs) would be overwritten, resulting in (all other BARs) no longer working.
  */
 static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 60e74ac782af..2666a9c3d67e 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -309,6 +309,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features keembay_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable		= true,
 	.msix_capable		= true,
 	.bar[BAR_0]		= { .only_64bit = true, },
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index f1bc0ac81a92..5e990c7a5879 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -820,6 +820,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
 }
 
 static const struct pci_epc_features qcom_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.align = SZ_4K,
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 80778917d2dd..a6912e85e4dd 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -420,6 +420,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index 2cecf32d2b0f..c1944b40ce02 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -70,6 +70,7 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features stm32_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.align = SZ_64K,
 };
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 0ddeef70726d..06571d806ab3 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1988,6 +1988,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features tegra_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index d6e73811216e..d52753060970 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -420,6 +420,7 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
 	.init = uniphier_pcie_pro5_init_ep,
 	.wait = NULL,
 	.features = {
+		DWC_EPC_COMMON_FEATURES,
 		.linkup_notifier = false,
 		.msi_capable = true,
 		.msix_capable = false,
@@ -438,6 +439,7 @@ static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
 	.init = uniphier_pcie_nx1_init_ep,
 	.wait = uniphier_pcie_nx1_wait_ep,
 	.features = {
+		DWC_EPC_COMMON_FEATURES,
 		.linkup_notifier = false,
 		.msi_capable = true,
 		.msix_capable = false,
-- 
2.51.0


