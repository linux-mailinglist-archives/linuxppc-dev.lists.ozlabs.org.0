Return-Path: <linuxppc-dev+bounces-16281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGymD23cdGkV+gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:51:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D447DE4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:51:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyyQt3rJHz3cCr;
	Sun, 25 Jan 2026 01:50:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c407::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769266246;
	cv=pass; b=bHLVzro/FQv9I95es8cJskTQ9N0eXobsaHldc5FgPvlevjFmPr+aub8mhpGsSfpBXmi6EPz3RsAKpC4llwifIavHSWcyuAJO6HxHsuoeubdxFiRD1Ut5SGNSeW/ghkEEHT7kQZ/9vqqxSym7porlnMj2zVtJ7kDGo/ETyXzoWgZRccVmDUmMiFh14tVMvZ2SrE8TyiI5AMLaQ3tKeKOlszVtioEjZZUy3LxR4g8S346ZEqhHusrJCsJkVjOQOMk14HXlKEVcq7kAuuabIkDenzm2E2kHmd66j0LlYNdQaOJXlmwwpRAV+7qnedGV+6rQjr8dKqchNOXdSUMkOhnqxg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769266246; c=relaxed/relaxed;
	bh=cwlnVdKcfkr9c7S4oJTSjL+q1DJaft4DhvY6E8TLbBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I2SGBnKvR1n1OI3FSsU/5Fpu4cg4lTlkn2Y+EPHx3qQFgRQmtzuF2x2w60Knh8tVxZI3pnGlLccv16Uoi6a8/Tvjyi5V15uLJBmYdJTrjpGZmJvUxzsdLmnVVzJNP0bkeqHF9so3WPJbKSV6y0TY5+pDaOkCcgONWgVJqBy+H5dnv05WaBhZ5sQes4OFjhSoQmxQLcjv7YpgQWr+FyaFPO/oFtGA4IPBlFVHvMwQ7WgTzNI2mbVUizTylrxso6sn/SN/ZPWsE6aJ/jwe5DYlZbjykl7Wdp4GVMiPglJTRGj82XuvcQPKTlkun5pPyNJtDfCmrge0EcLbIBNmAxadcg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=LrZR7ms8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=LrZR7ms8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyyQr5g8Cz3c5y
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jan 2026 01:50:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPzsodHMVbNnGzekfoGi+VBmGDmuz/o6b+/RlcIBTnxpPoja4EIcLtvSzRrW1Gwk8vpNyjlyrQfAB58unPApee65boSAoDnAWVuV33hk3VFjFPir1x825IGC6HQxq+pAMEhab1RpVZb1Tmlj8vB8ngFPw+a1MpwKgJS55stmyonKup85asjR2W4B0Gq7znP+MHH7yooDqKirj5yBrpqOO52GMepSH2v5ed9+iaCm63stj/Rt/TQSg+2IvFQr+mMXh5wowox991ftr5lBAKJHY3CASyxF+Z1BGEPamcVBZBO4ow6ff4DF0fAyC7V1Lc3NMUvEh51iCvh5dW/b2iKhaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwlnVdKcfkr9c7S4oJTSjL+q1DJaft4DhvY6E8TLbBs=;
 b=CcpJOwLPnyXjfml/tDARIN8jTHMVPolqXKmZ27RteocKvM8Y8fauBHv1hegxyi/jmr0hmLZfCFtlGmoiQaMQouE8nkeTNPM6juFz6rGhdEZQYAgTEiGO+hK3m10g5cr+ypq9PwTcznISaxLb40897CR/FgxH6eMjNNg7n1y3O9VRsWvw6dNNNtyq8NiaMHjN/QRQNPU7HmnSusSk2GXV0q1PCNoms00G2AjiIXjsKQuhWGG9737hmsYP0cxa6eTdf0iyq2vNWdg258QocUJGeBW2wD3wlrpyURBcg4/u1xYqzZK8bMnmkIEETMLdkPtDB6nAGhwi++i25pcss/fTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwlnVdKcfkr9c7S4oJTSjL+q1DJaft4DhvY6E8TLbBs=;
 b=LrZR7ms8Xz+MBvOEvtBJyz9Q99aJNzdW9x/AEuMF3DrPMyr4E4dq7JjTcGmAFh/WYFDl4hp1fFMz2xg8mJgD/PdLgBkXLrgl6NMSR2pTQkAq6KiG3ez8v342onp+ceJeAXx0Us53qMC/n6VaXwvotn/I15IswifWazgI+CfhNe0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:22 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:22 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org,
	Frank.Li@nxp.com
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
	shuah@kernel.org,
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
	linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v10 7/8] misc: pci_endpoint_test: Add BAR subrange mapping test case
Date: Sat, 24 Jan 2026 23:50:11 +0900
Message-ID: <20260124145012.2794108-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: e04e3b49-5ba9-4f49-fed6-08de5b57e69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v5smrveKN1YYeM1rL13lAC1QscakRpJMZokCvB+kCFIO0adh2ddMNasd9kcQ?=
 =?us-ascii?Q?GscSyUURuQt9cjzdtbtiOgBsnD7H3RPvoq04hauiDDvEIGPDYcgMAqqTTrTg?=
 =?us-ascii?Q?7pvXFaSIwH28FeXxdt7WUvT6oaGYC3QyuI2SarZp3w0L+bNeRF6+cJijE1Nq?=
 =?us-ascii?Q?NR8W3DE/nmbEIlwtQntX/nqndwCosZoYSEIPJ+Lq3fSQ/UQzLF62eHCb1eOo?=
 =?us-ascii?Q?gdak0rsdr18IGj6PSJpKPDhSs2R6D1kMjzDzolnSY7dypi/n6gwTE/Wqb0lD?=
 =?us-ascii?Q?CBT2Uy2O/khqrJRU6njmcNkqRytl2BDV1XFZtrHHjEm9dqvP1om2yHfI0Pp3?=
 =?us-ascii?Q?exUx5WHk2sy6Mp/GWHTkCBA+F8JHdzj4UA4EvcqqRn3xxGcdjq46qC7/Kgf2?=
 =?us-ascii?Q?FoeZUeCne3XEiTgHWPfT5jtMlB23pb9MASekH66dUIKU0j8l9gHbKTVEUsA1?=
 =?us-ascii?Q?n6QQh2qGgnhB3r+H9kb/WZFt10s7bq6lqt7SeLVMIu9IXZzuzWaneRcbMH7Z?=
 =?us-ascii?Q?4fQfVUm4XqQKFwYPUM4s7w3RZhSjCOC/GjJCcpzOjX3VAns7ZQUeC0BCDkEZ?=
 =?us-ascii?Q?lmt8zSc3oHawWHlRbiDI6HR29OsnA1lNhnCEltCNnIiZatwI5FQ+uEkc4RyP?=
 =?us-ascii?Q?LSSwocPht83EN4rpOnUWFaSYiRYXaQ+tJ7zDGoMH70oMotOfQh6gep6kpEUT?=
 =?us-ascii?Q?lhD2Tu5iFp2Dm5y34j8Xdt4jn0kX9ts1IL7JvTy0ioydM/rudGQ+weOk7gX2?=
 =?us-ascii?Q?iPdwdJpsQi5A24BFUA7/42/PiJxD6jDNhO/aCBtfz+END1ViBZsOea72wunI?=
 =?us-ascii?Q?/jv9UbqQNc4MjxO6MEh//PJA6xBSnNU+TehM5x7FVMgq/JMjwx5ieHsMR0Kr?=
 =?us-ascii?Q?hvgp+QU1LzAudlrduvmd1kLB7SBhHlPbnMqaRYBsu5g/rb+hV1bN9mA3sHau?=
 =?us-ascii?Q?8ewAi/YyH6C70GTrmKESBRXv+f9iMHcnVKu/rzRIawlTtDcb5hrK1iC4HaVJ?=
 =?us-ascii?Q?qKECFe7vNx/GsFU/hMPa/edY0iA+Sox0gnYSDwQ2ytYLG+MlJA5j07HoVvb5?=
 =?us-ascii?Q?GUJ61Q+CxGsXs9MgH9+mAtdTvcUf78g6kxDrWAdMIvtgn2waMrYj9viJx/TK?=
 =?us-ascii?Q?p4qcVQPJixNtPm7SMOKh84RrijTCNMh7URXBeYUZuzlJy+GDHb1ZICX65EGn?=
 =?us-ascii?Q?hpljeEN4c3ON8DoyiZmVReh/uyS26h/O4pFEgN9lZSdoMiC3IIe68VA8TH3S?=
 =?us-ascii?Q?c7AUVL7d7ELQEslK77aCFoH48Fma6r3rJRWyZMS/YaLTJCPv16LutSPdjCLh?=
 =?us-ascii?Q?g65HoaMy30NLL4yS+bHKC/44SWTglFFTABzobLGhfbjRRMhafGbLmtxUjUys?=
 =?us-ascii?Q?rHhoMzTmSQ0eLDlzdql9gPGBLeA6zDA5bKwfMWpZHxzDydUYdffXMuGHjlUI?=
 =?us-ascii?Q?TXTF+ltlWOUGnnbCMsveL6+ICNDfelbbo5kN9uN/4CDbLst1N+d9NngZAdPR?=
 =?us-ascii?Q?k47LjLq95inTH1e6WTc685atEne7eVyUkFxoWu8+/eLW09LOXl0dg2kCjt8N?=
 =?us-ascii?Q?nWNAD8GRuG78OPt+f2w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VTTRKBIZBGf2iO1nFUXN2Znxq3TyNTl0poCjNq+JZluL/fcIKk5JLB+dU2Ni?=
 =?us-ascii?Q?cKDeSr7GBiHLOl1pHhO1cm0ZR6nhKsBBdTNpGiIzLo1ipqrkelO9VgHsaV/s?=
 =?us-ascii?Q?Rtn2tAmwxOwLYf8SOPni7BfW/BBpI3KhPpnDTMxTYRdKAStAZOiz2TlorzpR?=
 =?us-ascii?Q?DYxgYQijF4y+JblPgsaXSfTh23lcy9RefZ/BUQykfKNUWDfUg9IWVRsE76Vi?=
 =?us-ascii?Q?ET/CFgxJXtIi4apih4AiZuWKc9ilwnMnHNWFHsSD7N2z/1QnfLDN0cYqmemb?=
 =?us-ascii?Q?FTR9OELUZ3Yx1XDBk1MyXZ2D1E6uqZ5n7ZqoXwPQM5pQ72G9QD5Fcl3g5tvX?=
 =?us-ascii?Q?QS0zmgqTKXLWO+79S2Ykt4mrP73T8571ZsaFn/wInfJF743IN47VMQO59Yzq?=
 =?us-ascii?Q?sK1FjevSgvT5DNskmZJvGOZX6EDBe00+pytOiMByHICpAEyeilDOAadw9uBN?=
 =?us-ascii?Q?FkUQp1xq8+cF9DhPpforXrEH+FzbZem8kSjsQQ2XAtNnNzZWthYS42lNg+dS?=
 =?us-ascii?Q?Tm8Po/J+pUldYJ8fnJjxCMNEAuwkzD4WIHfvL77mpy7jL6+zxq6dYzaUi4vx?=
 =?us-ascii?Q?2lsRgDN2rkaBkgs61FHJkU1VX7dpEGyK8wtYH8RK0ISB3CgwhXaoNWtkZau8?=
 =?us-ascii?Q?JxsiCKGdEkGa79IFfAwqWfHC7ZNTeapCRvj0WDUTxalCBMUn5SLQM25qbK1K?=
 =?us-ascii?Q?vu8mydss22jMrgfjZFBjLP3Er0NAe9opa33fG7/3zDMYO/cQn63IxLQOnQlJ?=
 =?us-ascii?Q?1F8P0WyUT921WPta9jWMu8zFfqpCNcJMFxm3dv9ypvHk1Qfuu5zTSapNGu3k?=
 =?us-ascii?Q?KiDa9jhCj3LmGBnd6ogmqMyrBptaCGkokooxZtvRdJVPx+R6hjQwVdSIMH2W?=
 =?us-ascii?Q?LIARzonKdo5v8Qh9nVIlo8bpQAu4/K28WcU/kYh2EgZpyIOiefBcAINxF7Ga?=
 =?us-ascii?Q?0Gx243lQAGL1R18j2bMBZf9FfpJjo4DD+hngOv06qZbn2sOfKc4QYN1ilVhP?=
 =?us-ascii?Q?rwPtjdrZ3pJfp6PiVKfZ6xmv6ucoQgspp7XDHDBxzKN1OM7WHS76BzB3r3Md?=
 =?us-ascii?Q?/SLNyK1H4EDPTWs7ucaLeQtYf46nR7jkzv9ziN2kF8J3AkqfEfns0PC//MJu?=
 =?us-ascii?Q?Y/Yj4m1nGeLFccK1Cf1lp3IbtRgYGzN7MNKFgU795H3ZtHQfoOGtZp6kMbLK?=
 =?us-ascii?Q?8txPaCDvq8CEefReGE4RFQ9yjMGyLlmF19RT/rRWtotpqtBkiBoBBUQPQAk+?=
 =?us-ascii?Q?izfDf4tP+rztA9zTjjBTd+Ryt500TwJdNa435k6kcKHLgusN/3GsjnTt+Lul?=
 =?us-ascii?Q?ZGlTlMOUojG+c76JXpyuVMuhti5H6gdo8LY1dyiTBRY7wStbbdw3pvDai8rB?=
 =?us-ascii?Q?Mow7bTbAzL6/9ldNhgyFvw6Vz3iQX8ux37KJykcOhrdx6iszvVMpR9tM1UjW?=
 =?us-ascii?Q?pVU5b4WXTHzHHRGnY7fUz7kZSFncIaQERcQ3UhSux4jRjCsrTUA1JUXSKsEJ?=
 =?us-ascii?Q?EBGi8Xl98XnrM4k4OU/60plyhdOPOPSGwQn2FgPBZeKZDKmUFmDbyOR/UHBf?=
 =?us-ascii?Q?ts6444jCaOXYRyBwWZ6iWdd2O7mxi7Bv8A6LlqQQ+ldooK98ymcj6a8tI1BI?=
 =?us-ascii?Q?QHh7vz69qaPQ/BZ7MnviDcOg9eqc61rElfakp+J+CEelY4Io73gBxcZNVnGk?=
 =?us-ascii?Q?6Z2YgU3T6DXzC21I5pvoPteZOwBLZD0pHEI/tMoCcLPSorTxhIDzj9dgDKyn?=
 =?us-ascii?Q?RDGcAb9afvrHXLd6qdX9OQXRImW3fsF01T0BUwv5/ePfUT0j77Ta?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e04e3b49-5ba9-4f49-fed6-08de5b57e69f
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:22.3201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AFuoSA4HsZaImMwkf6WCA8udOOHG2J0IxGr/2odHlQhqV5/9ZjIfX0nEx+mgXzX5eZh6Sso4P4R011YpduXvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4692
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16281-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:Frank.Li@nxp.com,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:heiko@sntech.de,m:srikanth.thokala@intel.com,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:kishon@kernel.org,m:jirislaby@kernel.org,m:rongqianfeng@vivo.com,m:18255117159@163.com,m:shawn.lin@rock-chips.com,m:nicolas.frattaroli@collabora.com,m:linux.amoon@gmail.com,m:
 vidyas@nvidia.com,m:shuah@kernel.org,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@axis.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_GT_50(0.00)[55];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:dkim,valinux.co.jp:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 53D447DE4C
X-Rspamd-Action: no action

Add a new PCITEST_BAR_SUBRANGE ioctl to exercise EPC BAR subrange
mapping end-to-end.

The test programs a simple 2-subrange layout on the endpoint (via
pci-epf-test) and verifies that:
  - the endpoint-provided per-subrange signature bytes are observed at
    the expected PCIe BAR offsets, and
  - writes to each subrange are routed to the correct backing region
    (i.e. the submap order is applied rather than accidentally working
    due to an identity mapping).

Return -EOPNOTSUPP when the endpoint does not advertise subrange
mapping, -ENODATA when the BAR is disabled, and -EBUSY when the BAR is
reserved for the test register space.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/misc/pci_endpoint_test.c | 203 ++++++++++++++++++++++++++++++-
 include/uapi/linux/pcitest.h     |   1 +
 2 files changed, 203 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index 1c0fd185114f..74ab5b5b9011 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -39,6 +39,8 @@
 #define COMMAND_COPY				BIT(5)
 #define COMMAND_ENABLE_DOORBELL			BIT(6)
 #define COMMAND_DISABLE_DOORBELL		BIT(7)
+#define COMMAND_BAR_SUBRANGE_SETUP		BIT(8)
+#define COMMAND_BAR_SUBRANGE_CLEAR		BIT(9)
 
 #define PCI_ENDPOINT_TEST_STATUS		0x8
 #define STATUS_READ_SUCCESS			BIT(0)
@@ -55,6 +57,10 @@
 #define STATUS_DOORBELL_ENABLE_FAIL		BIT(11)
 #define STATUS_DOORBELL_DISABLE_SUCCESS		BIT(12)
 #define STATUS_DOORBELL_DISABLE_FAIL		BIT(13)
+#define STATUS_BAR_SUBRANGE_SETUP_SUCCESS	BIT(14)
+#define STATUS_BAR_SUBRANGE_SETUP_FAIL		BIT(15)
+#define STATUS_BAR_SUBRANGE_CLEAR_SUCCESS	BIT(16)
+#define STATUS_BAR_SUBRANGE_CLEAR_FAIL		BIT(17)
 
 #define PCI_ENDPOINT_TEST_LOWER_SRC_ADDR	0x0c
 #define PCI_ENDPOINT_TEST_UPPER_SRC_ADDR	0x10
@@ -77,6 +83,7 @@
 #define CAP_MSI					BIT(1)
 #define CAP_MSIX				BIT(2)
 #define CAP_INTX				BIT(3)
+#define CAP_SUBRANGE_MAPPING			BIT(4)
 
 #define PCI_ENDPOINT_TEST_DB_BAR		0x34
 #define PCI_ENDPOINT_TEST_DB_OFFSET		0x38
@@ -100,6 +107,8 @@
 
 #define PCI_DEVICE_ID_ROCKCHIP_RK3588		0x3588
 
+#define PCI_ENDPOINT_TEST_BAR_SUBRANGE_NSUB	2
+
 static DEFINE_IDA(pci_endpoint_test_ida);
 
 #define to_endpoint_test(priv) container_of((priv), struct pci_endpoint_test, \
@@ -414,6 +423,193 @@ static int pci_endpoint_test_bars(struct pci_endpoint_test *test)
 	return 0;
 }
 
+static u8 pci_endpoint_test_subrange_sig_byte(enum pci_barno barno,
+					      unsigned int subno)
+{
+	return 0x50 + (barno * 8) + subno;
+}
+
+static u8 pci_endpoint_test_subrange_test_byte(enum pci_barno barno,
+					       unsigned int subno)
+{
+	return 0xa0 + (barno * 8) + subno;
+}
+
+static int pci_endpoint_test_bar_subrange_cmd(struct pci_endpoint_test *test,
+					      enum pci_barno barno, u32 command,
+					      u32 ok_bit, u32 fail_bit)
+{
+	struct pci_dev *pdev = test->pdev;
+	struct device *dev = &pdev->dev;
+	int irq_type = test->irq_type;
+	u32 status;
+
+	if (irq_type < PCITEST_IRQ_TYPE_INTX ||
+	    irq_type > PCITEST_IRQ_TYPE_MSIX) {
+		dev_err(dev, "Invalid IRQ type\n");
+		return -EINVAL;
+	}
+
+	reinit_completion(&test->irq_raised);
+
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_STATUS, 0);
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type);
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
+	/* Reuse SIZE as a command parameter: bar number. */
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_SIZE, barno);
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND, command);
+
+	if (!wait_for_completion_timeout(&test->irq_raised,
+					 msecs_to_jiffies(1000)))
+		return -ETIMEDOUT;
+
+	status = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_STATUS);
+	if (status & fail_bit)
+		return -EIO;
+
+	if (!(status & ok_bit))
+		return -EIO;
+
+	return 0;
+}
+
+static int pci_endpoint_test_bar_subrange_setup(struct pci_endpoint_test *test,
+						enum pci_barno barno)
+{
+	return pci_endpoint_test_bar_subrange_cmd(test, barno,
+			COMMAND_BAR_SUBRANGE_SETUP,
+			STATUS_BAR_SUBRANGE_SETUP_SUCCESS,
+			STATUS_BAR_SUBRANGE_SETUP_FAIL);
+}
+
+static int pci_endpoint_test_bar_subrange_clear(struct pci_endpoint_test *test,
+						enum pci_barno barno)
+{
+	return pci_endpoint_test_bar_subrange_cmd(test, barno,
+			COMMAND_BAR_SUBRANGE_CLEAR,
+			STATUS_BAR_SUBRANGE_CLEAR_SUCCESS,
+			STATUS_BAR_SUBRANGE_CLEAR_FAIL);
+}
+
+static int pci_endpoint_test_bar_subrange(struct pci_endpoint_test *test,
+					  enum pci_barno barno)
+{
+	u32 nsub = PCI_ENDPOINT_TEST_BAR_SUBRANGE_NSUB;
+	struct device *dev = &test->pdev->dev;
+	size_t sub_size, buf_size;
+	resource_size_t bar_size;
+	void __iomem *bar_addr;
+	void *read_buf = NULL;
+	int ret, clear_ret;
+	size_t off, chunk;
+	u32 i, exp, val;
+	u8 pattern;
+
+	if (!(test->ep_caps & CAP_SUBRANGE_MAPPING))
+		return -EOPNOTSUPP;
+
+	/*
+	 * The test register BAR is not safe to reprogram and write/read
+	 * over its full size. BAR_TEST already special-cases it to a tiny
+	 * range. For subrange mapping tests, let's simply skip it.
+	 */
+	if (barno == test->test_reg_bar)
+		return -EBUSY;
+
+	bar_size = pci_resource_len(test->pdev, barno);
+	if (!bar_size)
+		return -ENODATA;
+
+	bar_addr = test->bar[barno];
+	if (!bar_addr)
+		return -ENOMEM;
+
+	ret = pci_endpoint_test_bar_subrange_setup(test, barno);
+	if (ret)
+		return ret;
+
+	if (bar_size % nsub || bar_size / nsub > SIZE_MAX) {
+		ret = -EINVAL;
+		goto out_clear;
+	}
+
+	sub_size = bar_size / nsub;
+	if (sub_size < sizeof(u32)) {
+		ret = -ENOSPC;
+		goto out_clear;
+	}
+
+	/* Limit the temporary buffer size */
+	buf_size = min_t(size_t, sub_size, SZ_1M);
+
+	read_buf = kmalloc(buf_size, GFP_KERNEL);
+	if (!read_buf) {
+		ret = -ENOMEM;
+		goto out_clear;
+	}
+
+	/*
+	 * Step 1: verify EP-provided signature per subrange. This detects
+	 * whether the EP actually applied the submap order.
+	 */
+	for (i = 0; i < nsub; i++) {
+		exp = (u32)pci_endpoint_test_subrange_sig_byte(barno, i) *
+			0x01010101U;
+		val = ioread32(bar_addr + (i * sub_size));
+		if (val != exp) {
+			dev_err(dev,
+				"BAR%d subrange%u signature mismatch @%#zx: exp %#08x got %#08x\n",
+				barno, i, (size_t)i * sub_size, exp, val);
+			ret = -EIO;
+			goto out_clear;
+		}
+		val = ioread32(bar_addr + (i * sub_size) + sub_size - sizeof(u32));
+		if (val != exp) {
+			dev_err(dev,
+				"BAR%d subrange%u signature mismatch @%#zx: exp %#08x got %#08x\n",
+				barno, i,
+				((size_t)i * sub_size) + sub_size - sizeof(u32),
+				exp, val);
+			ret = -EIO;
+			goto out_clear;
+		}
+	}
+
+	/* Step 2: write unique pattern per subrange (write all first). */
+	for (i = 0; i < nsub; i++) {
+		pattern = pci_endpoint_test_subrange_test_byte(barno, i);
+		memset_io(bar_addr + (i * sub_size), pattern, sub_size);
+	}
+
+	/* Step 3: read back and verify (read all after all writes). */
+	for (i = 0; i < nsub; i++) {
+		pattern = pci_endpoint_test_subrange_test_byte(barno, i);
+		for (off = 0; off < sub_size; off += chunk) {
+			void *bad;
+
+			chunk = min_t(size_t, buf_size, sub_size - off);
+			memcpy_fromio(read_buf, bar_addr + (i * sub_size) + off,
+				      chunk);
+			bad = memchr_inv(read_buf, pattern, chunk);
+			if (bad) {
+				size_t bad_off = (u8 *)bad - (u8 *)read_buf;
+
+				dev_err(dev,
+					"BAR%d subrange%u data mismatch @%#zx (pattern %#02x)\n",
+					barno, i, (size_t)i * sub_size + off + bad_off,
+					pattern);
+				ret = -EIO;
+				goto out_clear;
+			}
+		}
+	}
+
+out_clear:
+	kfree(read_buf);
+	clear_ret = pci_endpoint_test_bar_subrange_clear(test, barno);
+	return ret ?: clear_ret;
+}
+
 static int pci_endpoint_test_intx_irq(struct pci_endpoint_test *test)
 {
 	u32 val;
@@ -936,12 +1132,17 @@ static long pci_endpoint_test_ioctl(struct file *file, unsigned int cmd,
 
 	switch (cmd) {
 	case PCITEST_BAR:
+	case PCITEST_BAR_SUBRANGE:
 		bar = arg;
 		if (bar <= NO_BAR || bar > BAR_5)
 			goto ret;
 		if (is_am654_pci_dev(pdev) && bar == BAR_0)
 			goto ret;
-		ret = pci_endpoint_test_bar(test, bar);
+
+		if (cmd == PCITEST_BAR)
+			ret = pci_endpoint_test_bar(test, bar);
+		else
+			ret = pci_endpoint_test_bar_subrange(test, bar);
 		break;
 	case PCITEST_BARS:
 		ret = pci_endpoint_test_bars(test);
diff --git a/include/uapi/linux/pcitest.h b/include/uapi/linux/pcitest.h
index d6023a45a9d0..710f8842223f 100644
--- a/include/uapi/linux/pcitest.h
+++ b/include/uapi/linux/pcitest.h
@@ -22,6 +22,7 @@
 #define PCITEST_GET_IRQTYPE	_IO('P', 0x9)
 #define PCITEST_BARS		_IO('P', 0xa)
 #define PCITEST_DOORBELL	_IO('P', 0xb)
+#define PCITEST_BAR_SUBRANGE	_IO('P', 0xc)
 #define PCITEST_CLEAR_IRQ	_IO('P', 0x10)
 
 #define PCITEST_IRQ_TYPE_UNDEFINED	-1
-- 
2.51.0


