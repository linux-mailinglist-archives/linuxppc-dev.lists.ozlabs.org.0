Return-Path: <linuxppc-dev+bounces-15774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB00AD23439
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 09:50:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsGs53fWpz30MY;
	Thu, 15 Jan 2026 19:50:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768467017;
	cv=pass; b=YvyxzfD/nLqzTo6k0eFZIld2uSrls27YCUWN+mvCHm88A66DzAjiiTzaGyPhvt5hM/VV3DiSaL6vjRlcLXrs/K39d1vIjb8kHmBn11VSQkg/fUKjk+s+gya15N/z++2rBHA38v8SJBPPE2FDBs+SW1FVF1ilx6UWBXYy9Yn0iwb76oLBa7P1m2Xdt8Mp78K/k+tKGhrpFVP704UItNaQrnb8Gsoe7ACMoS2xtW/YpdXXZVQAs6/sRk7aXpfufJe4VbXjhLvW+vVhMcpFw1va77d32OXwbKWxTmwZR/Dbtf7ntCmFu7d+vlkEqVwbGdGpe3mbjXve9iR+cqWrA8GuIg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768467017; c=relaxed/relaxed;
	bh=+ZvEqup9Bll6oFEav0AQNrO1te0MmOqZl5YoycbbOsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GYkUCiLpX1bu/6ascvNpZXIsEAeDy1ybKbIEdueldczOSwGl4RrAj07oQkAfL9FGYnIDCPUw0S1CpbYCh0/UpKvLvl72SvH1D87w0PTourZSxtPfa9izgXe7DRTydnzGdEgp+8C4Zdl0fg7Uu4Hc1T5e4pGaUOZ30luSLLbtTbreIAE8qyc9sfvHXY7gHe2ZXDiGSnX41/wCwuCc5K6LvGtLaMe1LYIRWU0C5m8bhsSWmb99Mjk3piYAW/Ymv2WGdM/IccBVzRB3mCr5b/+JriX1h0LImdmQ65QDIkcvdWmnp8+iZsCw1NIQhDkK3amDR7Z4pWramf1dcdEN1frbmg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=rd88aRjg; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=rd88aRjg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsGs46z6Tz309N
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 19:50:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RR8I6OmmAkzSupqtNwSIYXtolMefb2NvkbJbUGfQatmes2c7opa4rHJkIfo7Q6TIf6pFxmbeZZl0EXFKtvvrbpK02GL2v6wA5TGdRDuC88Y2v/UevBvh/o0Hk3xsWPROIPfLPonU+wsxDEUjPGRlsjn3TinizwaJcz5cZfRCX+zBBKN/Mtg0p00n4xSgxWvfcO/IsXUwyi2dEx93K7YvTUcJBV0ihUyxOnzQo/t8+fKMWF6nTMmS+uKpBkyUPUPTv/ExYX5Hsj1Ic/G4TnISfAQL8ROqKia98NcVGZPtRrhTe3bsVmocse1gXIMLmXdSk/+zomNl6NUQUBR28hZ9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZvEqup9Bll6oFEav0AQNrO1te0MmOqZl5YoycbbOsw=;
 b=od8VpRdBmUkbqJvRcQvBPzVU0uTxRo+xWMxrfUBpSs8npwUGZLNjneJMUjil3eRqEinpXTFmisRJOWTjUJCbAHhyNASGSozKhvRkQ+gapzguxU5Pvu13Q9PMwei/0pel9IoJzzkbd1xUo4sJkoG5J+/gX+vGElpCI5RWOXDrHEb3rVNsbalSn9+Wc1p74CVpHJvqXkkxxP3ZCbS2nNAfjv7AVZ74l+UHRX5ZnaFCKA8t1IBGKWUrXDH5a32v+uDvzHHAoBX/c+PkBIeob3g6gu6PNJWpGEkNzEFWdinEIOc8Wr5HYnt9PSg/DaymqDO6pZKup4t4LUsWPiRk/vKgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZvEqup9Bll6oFEav0AQNrO1te0MmOqZl5YoycbbOsw=;
 b=rd88aRjgcBhGEUs+17i6dk/LlcNkd2cAKiQd3NU9yrJM6N0fA/9JtbJ1DC73fkOMqHt5BXI/ypPRKcP6sEGly3r3QRdp0rQ/MsygLwx2hcJr2TKL6ce7MBVrFRZaFeSFJGITQVBonTcLoXaUlJgxiaIhiYeblk1krSJjESGrgUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4454.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 08:49:57 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 08:49:57 +0000
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
Subject: [PATCH v8 2/5] PCI: endpoint: Add BAR subrange mapping support
Date: Thu, 15 Jan 2026 17:49:25 +0900
Message-ID: <20260115084928.55701-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115084928.55701-1-den@valinux.co.jp>
References: <20260115084928.55701-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 9cd8d9bd-bd6e-48cb-452c-08de54130f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fB6RvZ6Fpopf8cOxhiK+OPXNdGE0y00HaaoOlUjjPUqU74hUaoiQbpT+hB4Y?=
 =?us-ascii?Q?Kb+ZznxO1A+W4BAo1a2VuwePDB0Q17E2tc82DunxIxeRey3wCjDwGiY2vEv/?=
 =?us-ascii?Q?QQiacKkMpuUR9UeMANA2HzB+XL/BibdxUxE8nyP2J6KCsZBod43aS+hQe9lI?=
 =?us-ascii?Q?sj6t/5eB+KtvZv/qa0nc7LWxFk1/DQhaD92rLfCfM4xtkPHs1H4rVmNN49+5?=
 =?us-ascii?Q?9QhyYMcQ4C7Bpchdb6ZY2URqb3quuKgtaJm/+eV2eV/bEebuA+gJpr8vNAR7?=
 =?us-ascii?Q?4n7pK9k6Dji4YlBVtUb9UO6f/WUuvI57dBBJsn3CkqXqGL9nvtIGTYGtEC1/?=
 =?us-ascii?Q?12TpL7bCGNkzywDrQjBbibhcn9WRofWR390hKQlgBc3q/JoizY/m0ufJSODe?=
 =?us-ascii?Q?RRfpM6J/rArhjZeoFI1ZI40jVEyOktcZEYe3ZVG3tp+BaQGgXak9SxNFuxIW?=
 =?us-ascii?Q?ENRa96qzFNl/KvooptXRRpRMxX/ePRdbXs/d+DbAQo+L5oqgxX7teXOMWi5N?=
 =?us-ascii?Q?KHyASsi/4cFWIjpJS7H2JIWNvMmumnd0ztX3i7NV2/f0A/p6Uaci3tZWzEC6?=
 =?us-ascii?Q?QZkr9zitKfmUnWZ/JNx8rVsW9tKlOUPGtFOF1UgC1ij2IpTDpbJLSFgD3MeE?=
 =?us-ascii?Q?3zSe72GyXwbjIMegLmhyBbrG5fiJ9SuWQl/PO92C7OlKS+IqKAU2ctp9UD+j?=
 =?us-ascii?Q?As0I6JSwrn41T3eJ9zOZG0TwE4BkM5qoNDfnCIHfqDCMYLel51ObAlVQ/ZF1?=
 =?us-ascii?Q?1V5BwnXfYL7y1F7TDOl2obd3pVLTNBfPOcx5KofAkvEWLEry6VnBo6lgR/tb?=
 =?us-ascii?Q?CV8eKihd3Det/2Q4hgBSEP6u9s3uzkmk5tkD6meUNiQmPVvhSLCaDIT0ODwi?=
 =?us-ascii?Q?ujgUWTF7MCUnJSoGPmCgrZNa+xfemfeJTJGidsfLgvhkDHNnC0M4dH0bhHAZ?=
 =?us-ascii?Q?4GBAmwvnq1wdUSI47tg5kbynBL9xQ7y6NJjKqpMJJCcv/jD2DBROvFLkR7/D?=
 =?us-ascii?Q?7uJsErnWoIX9EiSb+aqgPa0lW7/b3T7zXltpwjbm7ix98NjejieqwptPDATZ?=
 =?us-ascii?Q?r0iUxFVzHQ4zOb6KV14UKffIpWIsHiu2mdhQ+PZ8Vhd1EqAyk+HvzCop6q5e?=
 =?us-ascii?Q?5w/qrC/mHHHOhH+IePvgbbBkPmO0fhbrvu04qWI8aaZsgMuLBGCr8lIELAia?=
 =?us-ascii?Q?JfD7bPk7M7/eRKSTVTK/YQZUtzRHsILnldy9aw10TydwqHt5bm1dK6MwUhRg?=
 =?us-ascii?Q?JxheCz++CxVZDWxXjF2BoTZNguEPLTm3QlhKd5Gmy7ayi4cJAMZt38sW5PQg?=
 =?us-ascii?Q?eHjSaN4JV+FMugb1EFwkYnwfOae3bNHj4luBneustm7X4iH4aa8Tcz09W3Xg?=
 =?us-ascii?Q?4mxDqpTuHvwDPwuDKEIbBxN07RvPJNG6utx9709ARP0l47YBTSbUoTftoWeo?=
 =?us-ascii?Q?FZRyrB90Wx9BTToqI1jYhCzFWhoeznKbWIpAftRC0LCxUIQUfW0ei6lF7sxX?=
 =?us-ascii?Q?sFnZvHyl81Jg+cqF9JU2xBKj5F0AnrNWm1Mz30phCP2HM+NXBny9rCIETsFy?=
 =?us-ascii?Q?WNltXiDsTBECzjzZNqo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iZB9U/aZL5ATQIZAJxCov8+pSUjAiosws9V6iFuzxUc9S8PGeBAkRLNFPQVn?=
 =?us-ascii?Q?9DVUiuiDEFkMLzPWOKFKd0sTYwjdGMy+bg2eUaiy9efRqL68n97N7+fGlpQq?=
 =?us-ascii?Q?a36ckR3oqxA8NvcAtJtyDO2ww+G9MahWt6o/eE1vY5ppEsC+KP2m4ej1mkrJ?=
 =?us-ascii?Q?Ca2hggfFm2kbIpjGaO28yRXJJwVUhBBNHFrchB8ORqYLuyz0b8FHanyO1add?=
 =?us-ascii?Q?AMPiOTjwa0wT097xgh7lZsSsLLoU7KIUPVZMK5L/+6j1tLY/TQPLcCJV6v/K?=
 =?us-ascii?Q?CjttcAxyJ4rmHW+sV7qIdhzJYJQINENogu02oLF33/J13z1YZk4GhEbiVtd4?=
 =?us-ascii?Q?Jx0RuGA7m4Jgt1b5ToA+TdUCt0F7ATtz1ayRYO8RVr3GyfoT3QfnNZr31+3N?=
 =?us-ascii?Q?ftPL0O8w7Iymkg73AM+SXFOkWuQBHXTAD8bQ3p3cQZ1uZUwP9h5y6ZndZ82V?=
 =?us-ascii?Q?P+fNJ/bnfX9mVRVkTUJS0HPYloqrbMHxt8anWsP3w6HrJY3bT6//45mlkTAD?=
 =?us-ascii?Q?KHwDINz815IWv26KgN6wIOsw24FGpMhxVtGwVGyUIOv7uKJzRYAZXDYzpDa8?=
 =?us-ascii?Q?pAOKIgPJUXvuf7gf2ZTGXVfaW/f/A73L4AkpfjyFcKmsaUm+PS4+MrlGQrZY?=
 =?us-ascii?Q?M4hYQJ7YfU3MEfyMGRQbFi45aPnsUb1wmXebzTBwEsgAV8ywDU3ftco5ZvK+?=
 =?us-ascii?Q?EjI8ZuXRoy6TjVpgsrdr6X7KAxqtEBrR8IPAqPoVN8tDe9XEY/GkDj5XPCtB?=
 =?us-ascii?Q?9HXPoEF46yIOCTMzXfY0fhr/g3Z6RJKWlvalrk76jFVLTww/R4G5uzQXUcnl?=
 =?us-ascii?Q?ygcyBKKYaONWArunED9UB35teiTNv5F1vUKMrrRrLj8nzTIYsK+aigRM+yqj?=
 =?us-ascii?Q?m4cGftmlUt3s1Wsbvt1qL0nIwnbSe5o7as4tVFCzcuIanvapWGGo62BYvxT0?=
 =?us-ascii?Q?gEs23whIbRkUoTN+y8kvy1tm1TM53718tatfRcbtEclM2+7YbXEHWRdk00k7?=
 =?us-ascii?Q?Q3wa5WdL7fR/riMceGpizDYRf1opONF02pRCN/5QhXdQof3D4VZZsVvwiE89?=
 =?us-ascii?Q?TzXocSgJ8EJCz9tcKxW92BLLMGPAv7oTPymOJYgtcJkIQeqUPEJNRakOwxSK?=
 =?us-ascii?Q?MjhVKEubsecWHaW87u1+/tNjDvJeVL83owB3dmoDikEJFBXFSpcMHqV+zwtY?=
 =?us-ascii?Q?/RKGzsr1l5X+1xVyYoOe30KwkGucdSXE+woKkwpBXGRFaF03VlaJfiuwStNS?=
 =?us-ascii?Q?BxZtN4AApzieiyjguaaJYOeZDDV+2pbRb0Vgr3zFEKkZZ6/mEkCTf4KsZNfs?=
 =?us-ascii?Q?94XCPOSfrx1N+ilmYPjsSSF8RQSII4YRnta/smu+4wsXjdgcLdQjfq1UUDnI?=
 =?us-ascii?Q?ipXbLGSLxl7ilFlEn5kO1ar/OwoOY1Ps+rErEZ2XiZQlv2Me0UtEs4zy1a+b?=
 =?us-ascii?Q?c7xtNgV4M72FbkLi2HDhbn3ObZf0fXkQ8U5rByMaKC0kAWya+Qk65rPQg3Bh?=
 =?us-ascii?Q?AtUd73XXo9O3P02ssCM44GY8IkKj5xySe3gKXeIhCM3Uti0nt4X1FvKiFIss?=
 =?us-ascii?Q?SziDToWO8jTXUPVJzfmmjvnG4rK+d2RhOL7/vkS+R+v4O/npjwpehg9mHQaM?=
 =?us-ascii?Q?WR2CBIwDhU62dMQIae6nTeBgoSyQX/ij8gCiFbNYQpjQX41GfovzsxRkN00F?=
 =?us-ascii?Q?v2FYLEKarzOuSR76GlpdGgdIAG5hO8WpXrzYcoqiG3yYjaWRwbSoAVhPrldR?=
 =?us-ascii?Q?5MXYGIDQQyhAh2+inSBcUcRtCJcdfTNbsJrONKMhg7TvSspDqE4x?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd8d9bd-bd6e-48cb-452c-08de54130f49
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:49:57.1231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFK4k+iD4zLsngq+GEVMrD+i0e7gGZZDNAq8nLyM0g49Z4Z8c3ElOxdSByxJQXlTcOY9iZ4ZCjBOfuN4r/de7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4454
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extend the PCI endpoint core to support mapping subranges within a BAR.
Add an optional 'submap' field in struct pci_epf_bar so an endpoint
function driver can request inbound mappings that fully cover the BAR.

Introduce a new EPC feature bit, subrange_mapping, and reject submap
requests from pci_epc_set_bar() unless the controller advertises both
subrange_mapping and dynamic_inbound_mapping features.

The submap array describes the complete BAR layout (no overlaps and no
gaps are allowed to avoid exposing untranslated address ranges). This
provides the generic infrastructure needed to map multiple logical
regions into a single BAR at different offsets, without assuming a
controller-specific inbound address translation mechanism.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/endpoint/pci-epc-core.c |  8 ++++++++
 include/linux/pci-epc.h             |  4 ++++
 include/linux/pci-epf.h             | 27 +++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index ca7f19cc973a..068155819c57 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -596,6 +596,14 @@ int pci_epc_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	if (!epc_features)
 		return -EINVAL;
 
+	if (epf_bar->num_submap && !epf_bar->submap)
+		return -EINVAL;
+
+	if (epf_bar->num_submap &&
+	    !(epc_features->dynamic_inbound_mapping &&
+	      epc_features->subrange_mapping))
+		return -EINVAL;
+
 	if (epc_features->bar[bar].type == BAR_RESIZABLE &&
 	    (epf_bar->size < SZ_1M || (u64)epf_bar->size > (SZ_128G * 1024)))
 		return -EINVAL;
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 4c8516756c56..c021c7af175f 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -227,6 +227,9 @@ struct pci_epc_bar_desc {
  *                           inbound mappings for an already configured BAR
  *                           (i.e. allow calling pci_epc_set_bar() again
  *                           without first calling pci_epc_clear_bar())
+ * @subrange_mapping: indicate if the EPC device can map inbound subranges for a
+ *                    BAR. This feature depends on @dynamic_inbound_mapping
+ *                    feature.
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
@@ -236,6 +239,7 @@ struct pci_epc_bar_desc {
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
 	unsigned int	dynamic_inbound_mapping : 1;
+	unsigned int	subrange_mapping : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	unsigned int	intx_capable : 1;
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index 48f68c4dcfa5..46f817da6e24 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -110,6 +110,26 @@ struct pci_epf_driver {
 
 #define to_pci_epf_driver(drv) container_of_const((drv), struct pci_epf_driver, driver)
 
+/**
+ * struct pci_epf_bar_submap - BAR subrange for inbound mapping
+ * @phys_addr: target physical/DMA address for this subrange
+ * @size: the size of the subrange to be mapped
+ *
+ * When pci_epf_bar.num_submap is >0, pci_epf_bar.submap describes the
+ * complete BAR layout. This allows an EPC driver to program multiple
+ * inbound translation windows for a single BAR when supported by the
+ * controller. The array order defines the BAR layout (submap[0] at offset
+ * 0, and each immediately follows the previous one).
+ *
+ * Note that the subranges:
+ * - must be non-overlapping
+ * - must exactly cover the BAR (i.e. no holes)
+ */
+struct pci_epf_bar_submap {
+	dma_addr_t	phys_addr;
+	size_t		size;
+};
+
 /**
  * struct pci_epf_bar - represents the BAR of EPF device
  * @phys_addr: physical address that should be mapped to the BAR
@@ -119,6 +139,9 @@ struct pci_epf_driver {
  *            requirement
  * @barno: BAR number
  * @flags: flags that are set for the BAR
+ * @num_submap: number of entries in @submap
+ * @submap: array of subrange descriptors allocated by the caller. See
+ *          struct pci_epf_bar_submap for the restrictions in detail.
  */
 struct pci_epf_bar {
 	dma_addr_t	phys_addr;
@@ -127,6 +150,10 @@ struct pci_epf_bar {
 	size_t		mem_size;
 	enum pci_barno	barno;
 	int		flags;
+
+	/* Optional sub-range mapping */
+	unsigned int	num_submap;
+	struct pci_epf_bar_submap	*submap;
 };
 
 /**
-- 
2.51.0


