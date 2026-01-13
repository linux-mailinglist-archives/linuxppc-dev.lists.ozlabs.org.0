Return-Path: <linuxppc-dev+bounces-15606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE4CD164F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 03:38:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqthW47gZz2yPM;
	Tue, 13 Jan 2026 13:38:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.125.133 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768271883;
	cv=pass; b=oxCshKf3e5tCgtsIX7wtgehMEAJL9hUOPhMl3KVGCrxgfAF+HHrzno86nFBSvXVJ7Lo3kkVfVS9UPWaLuFHehgfOp6onk/vL020kUxcs6Fv9SuL9XKTN+M4ycMkyu84lB23nU59MzfVHWK0VaWglmteAOUiL2xn+fcv2//Re2Al2kUDYH2za7TBKr/FswwhG3GaYGqUf//BprXSjpxeJdD/6HMGF//hghKTr4V9gO5fvkIxbQ0LE+WL1+W3FK0e8dBqt05TKUEWrN8rDciakVxucL0eSbXIfupRSY6864uLiEWIbQjYLzCYP89xgcO20SfkDUeffI4woFp7shB+RPA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768271883; c=relaxed/relaxed;
	bh=/pFuu5/Hd+jyHcgaC3SNioFk6QItp2OSiT3o6PDf39A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ILXfx03Fa5rvTVj2fJtwaHPWaAhzb5Y53n3WfnG/eEBtexwgQ3qy8v1J8Wn+lTxlPDtXV4sSsXclglU9J2eNVVVY8abMpoeXUKw/XBhar9xmp/O8DNqHpmg+JfbQSMecGvwTg1UgXa7laRhJSipbhwSgXrf/nAc8flyfkfR7SKXTjdUPdXtUfxqPIZMc+3TEfyqT9plFSQ13lnYcYzjz/k7k7HOM1dJVHA05F8TOHoJ3Hgsn6fTclrPxIEOMDc17a6erwrQrVDXO1Nr5D7TjWtHHkMC2QqfAQvrA2PbUnBfC+Hfkpzg7Cdc8mRusZk1rphAKFuh0KsswIA7tHOa8Cw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=ryUfLDUG; dkim-atps=neutral; spf=pass (client-ip=52.101.125.133; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=ryUfLDUG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.125.133; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021133.outbound.protection.outlook.com [52.101.125.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqthV3K3Pz2yCL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 13:38:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXUioy9bs0P22/WXftSf1mlMz546rZ6fm+UZXSG4zg+Dlq0w6CpzAJXayOJSgcOiE+iQBilrhFQjUTb1H4cf96HZ8eNlfiwk53cU5pYwjFWwUtlMP6pc+auZsc52evsPVxjB4WkdK+wNRF7CxGVM8aTmE8QPymsUyOpUTMtep7FX0QHBPvs4AlXU/jUrK5XIuGQoMXB1+G90/wKaM6QVRgTaOFOp+Yd2XMOUcL58nm8sb3/OOE/lWl83ED++PJrYiXtgDyMfQoC/6sWuSaPqi4nnSZXlBavd+GHO9t8uVWlydNO10eRwteIATAeXpMvt4qmNLm2Y1UarU8OmXvXpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pFuu5/Hd+jyHcgaC3SNioFk6QItp2OSiT3o6PDf39A=;
 b=g64l6sKAJy77FdRLPP2wSw5oudVGCWk7fqpozuehwXW/G2KP3+thI5R3G72UA2T59e+VvJ6yAw59qiiYhPfkXspVDmmEmTgkPOgoC0mN8zCrgN56I4mVxzhBw6gL2Sw9Q9J6OgcZhS3JegIuPOinBdVxSHgiXZDcEh5dWx9sJMTK1aS+n1tRst2VVYc6mtYcWQzGDhKP+L4d43HicRFHCPjJv6linXS/aefWvQK6Aip5KUth6wjK4qWRDQ3aCAcF/aIkW1rzNUMoAkF+DG+XYdNuKlKGkCUX7BWOHtZod8hHh71dMTL/H0zHw6fwFVWG6gbg4/TgvjxQs8ZboJyGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pFuu5/Hd+jyHcgaC3SNioFk6QItp2OSiT3o6PDf39A=;
 b=ryUfLDUGODtqXAd22makCtxktbf3hI1Fr8sVZl4YGo4a80NI6J0gc7c4Sfx2FjhhMLASAMgz73w0ZVvvYWTrdSG/QsMw1KJMHJLrmfK1QFOB1Q5ABTZeqS9aiNpodk6sYD2xUjIfVAYrqgF2ke++5NptEXa1nKJo29HfYqVGUzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6708.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 02:37:22 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:37:22 +0000
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
Subject: [PATCH v6 4/5] PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU
Date: Tue, 13 Jan 2026 11:37:14 +0900
Message-ID: <20260113023715.3463724-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113023715.3463724-1-den@valinux.co.jp>
References: <20260113023715.3463724-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0353.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 66cea0fd-c989-40d3-4a0b-08de524cadd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YWwNCSyU1Dpu4B7Qj5+YWkbaaC6mLuK/HCEpAne5rIVzcfUGDJQnRQlK5q0/?=
 =?us-ascii?Q?8LWtutT+OaNVZA4+VG9m2X8BhwilYW7nmzTaJJoyO5+OLQhyKrRm6y+1Ai9h?=
 =?us-ascii?Q?KkZeDHYd/LvHx39nX7vfmf/VxSsTYwo69Gv5uebeq2zMD57PXG/oDcafH5lG?=
 =?us-ascii?Q?TqBRrtIxeFB1LfgcapVJcAqNf0tm3LAV5ZdnGfPRxAqLga0JD6jx/3G6r7Kz?=
 =?us-ascii?Q?3ZoCNMnj24UADt6xV5v3M041mLcgRhbHdrohD/aRJ92DNYkYy24fEFecKT9b?=
 =?us-ascii?Q?HDDl1Ms5R2sMk1FEVY2ap6fUQlfCS8lJgljGMGqAL20YmYLi5TbenxYx0+A0?=
 =?us-ascii?Q?8ExU/eEOQVN4Lnv/UlO7NthyIhxX+cITIfr1RAlT53YdJybnH7JGGcRpNYAk?=
 =?us-ascii?Q?JD0DT5k1Xwq/u/yw9JcUoKSxlTgvVVraCICtOMKK7S/7zVJlhPj40qvx2Ogt?=
 =?us-ascii?Q?21Xg3FLd9O3Y/dJ5JZaZow9QtGFPlgdNV1VW9wwMFnLv5Qfqg+BlE7FtXiRQ?=
 =?us-ascii?Q?IOGRoi9Io65p7SO/1Mp1PdP+HDcttfhrex2Cp3N2si5f326vltYltjwklUdo?=
 =?us-ascii?Q?oWX3dJmeumsmgB87Psz6UnNlUq7Moo5nyISK6iYVaaPMwANO+9hDVKMjsQOC?=
 =?us-ascii?Q?puo2G/EDyoRYJ+/uKB/Hg5+XzLDf8NpEBEFOgKW2DKSlBOQ0scfysxMexJMj?=
 =?us-ascii?Q?tMkkvnQiCwJINIXMjqmNbrGVhwdoVGuJPov/q+GIryfd3OXnlWd9CYsw1ElJ?=
 =?us-ascii?Q?oDrjm7kt+A8dHU4CHXO4Xq4aUXwva3ZlSxVLFoY2qiWFbMBfeKahuXw2KAXt?=
 =?us-ascii?Q?FH1nwI2HBzgBsLpZjuIV7LN6CIZZg3FxKG2Y2jhGf7Z3fXFFqRbW6tYqpofD?=
 =?us-ascii?Q?UfxsqKy9ZWkXfPzeSvPDatEQwijR22/ZumdpMEyuKB1xMQ6sPdhlmK+QyPc3?=
 =?us-ascii?Q?1XDBrCMc42idIUbyE/CF9Ok5bSy4loUSutJwKH/E4hy2oLxqStGrftEX2Oqa?=
 =?us-ascii?Q?iCftOAICHCr7d5P4ahwOlR5+C30xoEih0GpMxsURN7zB4Pn7U/9N4fcmdwGU?=
 =?us-ascii?Q?N7hNz5ISOzcA3BxjWLL5ylrX/haHFESdEcglY5dWs/iIwtPBgwGYBIUmritD?=
 =?us-ascii?Q?x3Hol17sXBJJwx73VKar33qS26MHPzbrDVtv61nXuSO/iUZpzlWFMVE0g032?=
 =?us-ascii?Q?nccKfpHoptpP3gWN8dqB1t3JJ8SMFbNKMZ5uJMUjX+kqd9FCMO+QLmHi20bj?=
 =?us-ascii?Q?qg0H301rEmgGgCDtd5yHaa08ycM/iewvTSiqfB7OwmE31e8oDE2YkNfvtrrm?=
 =?us-ascii?Q?E0ITXmT4nnRVZ8damv5mVZhoibQ2M2oL/C/l4/a4BCavF9lhB6a/8jr84ZAc?=
 =?us-ascii?Q?26Steuow18ZAE/WpTJeR0SCCKMy9tFjtxM4eOiABUlp1pLgrbHGzMZ8G6Efx?=
 =?us-ascii?Q?AyE6iQ+HJDQg+d+xgYArCZSaeu1ifKdy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wvse0MZ4AtID4ZAVKZ6Z0io8kMLqBy2mNeNf0uy085rww0/aYZJaOnCuLUaO?=
 =?us-ascii?Q?4SjiJjl7c2jK0MKBkTKCgBVSkBlJy6gugT/OLmDozDZXgDCCXYAw13Js06Li?=
 =?us-ascii?Q?XOdXILwSq/ksgDXy9bnI+SZ7MknjyljpAN7Fc3Y9jPxf5mjn7tnnDuOX9qer?=
 =?us-ascii?Q?Fx7gQlOOfxdWz9XYuo2DSjJSshe7j7GiShOAPfqQviunoWIEhAr9b+ffZT/l?=
 =?us-ascii?Q?19MFxoDdhH9t3rNnLvMmaDv39/zXWx3N6Y7gy3BFdlkWCWzDXIqCbVkpi5UL?=
 =?us-ascii?Q?R9Fm8exOA+CYl4sFkItSAtQmcPnzE1rmG/K5Xs9nWiqt4Ty1PS47EV8YVdKS?=
 =?us-ascii?Q?30SPajeVGvm59qJ5K5E2rHAji+kwXn/qho9g+fqeoaEhyI/0+21Bmt7ueIX/?=
 =?us-ascii?Q?ASVYvCc5lnl3NsesWgWQCASlbXmQVuGwTIa6PLO7qUC9sTDmFRQeVMFovh/I?=
 =?us-ascii?Q?zRYu9qY6B2f3fKrMQH7qQif18HOAUgsGikCwOgoe+QIg2r1HXa6WbLc5PjhS?=
 =?us-ascii?Q?VN5RohmYXsRwzWWgIGqCX0NwsfaoJGrwGAPrKwKgW1DeL7UE5uBqS4F3GvvO?=
 =?us-ascii?Q?e1k52lugsI4e3Zk8VCQf4OxYDGpKLphCtRa9sGY0V0M2wufFf11WRktGE54B?=
 =?us-ascii?Q?1ihETLP4wT8FehZiVP70k0dVHvpvV8j+gjyrOYfoteK5yPtQmhLAx0SS3uZH?=
 =?us-ascii?Q?DeV2GfIa/8Z0hheoNhvthmI/+aNoguMjViPuKFCmnsf45BfI17h0O5G5uPEI?=
 =?us-ascii?Q?LwF5OpbyoMr0iARoVoXEppYYFeEMgFGDR0T5cfl+4PygjkbCOvVkGzf3tHk7?=
 =?us-ascii?Q?RI1TsSxLX8AkYz15ISQbcgN0Z1/tPTMxzSjVIAA0rBlDtXnhVRXQhwSbZEkS?=
 =?us-ascii?Q?D0gnNq/wE5iNP6PzNqEY0sYhC10mq7cF0127BdmNLgnfJIdIS1lZ8uQTlLIV?=
 =?us-ascii?Q?S3Mia2cl4x5bLV0lsjEgre6QOV0APuESIiilCaRq6eNHhGdFvxDEOJkkIMS5?=
 =?us-ascii?Q?h0EpLVCDZbxXUeOVVRrsune741VyDSCW+2JQNdUN1TSFrhJqdQQcSl4vcgBn?=
 =?us-ascii?Q?FQO0mlf3YRgd9F+UvnTSdI7UJHj5ln9ly9fNtrZvblPx/x7aPKuejS8YXMbK?=
 =?us-ascii?Q?EvRH8SQ0qp5OSCuEa7KbxXHwbPJAUkv1Grpm3Y2UfCCO3cpuAhdo5I0Ye1lG?=
 =?us-ascii?Q?eHAWFPIs1AnjJP6mZC9xUEQM72F8WpvpkRFiZQLazOp4FKEnjqmdz0cVLvTa?=
 =?us-ascii?Q?IU58CYpWdzox5pC4vJxCtslCw7gicc6a4js7Eqw5qhLEssD8JX+AXbokZ1wy?=
 =?us-ascii?Q?HXtY4//LmnDuf5K6bdKBgW/oQZpYzsKkAh4acZNiFmIBsp9yDDl8cxxTaX2M?=
 =?us-ascii?Q?l1/g0rIngQ5MMJhgNkErEx036naDMGbx2RjYxa8NVET3JKhnwkFaOU+sfjRV?=
 =?us-ascii?Q?Qej0ga4EV/0VptpFGfyzhVPwcpxZENXyMJ9uRAs+LAxeo7Rx6Vqho++DFR0/?=
 =?us-ascii?Q?X08OO+Qxs1YQuHB2oSC7ctPdgjAaZT0n3c0uv2jZim8zu2h3nqK7TH4qLFRa?=
 =?us-ascii?Q?7/lMK+jC7UtnoaJT2OG2NLuHaeaEMHCs0sLrJ5IGZ7q4sGbiLu9McPekL6O8?=
 =?us-ascii?Q?DDoFykDOCyyo/ywqGTywWsbbv2zrAk3xSL9opQik83rBw0MOrh2lkziKnz6k?=
 =?us-ascii?Q?wCeUTBjtBFbivssuFKWhqzd9Gwh/EGpBXtdv1dDK/zJLLUjBHvnz1y2JfP2W?=
 =?us-ascii?Q?Scklpxjwv6RMSjs3NvQPelMy/1JAO95RnfREu2y6lgW+1ltVdGpP?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cea0fd-c989-40d3-4a0b-08de524cadd7
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:37:22.1608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekxEvBcYrpBnDcTRrlBBOwVKLwo3R8WRWUqPd6z9K+c5YJOOhvnfucDgGtsgcyyRsgzUPyNn4oD8RGZ2ZV3x1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6708
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
features returned from dw_pcie_ep_get_features(). This also sets
dynamic_inbound_mapping, which is a prerequisite for the subrange
mapping flow. Note that vNTB already relies on this dynamic inbound
mapping behavior.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 .../pci/controller/dwc/pcie-designware-ep.c   | 240 +++++++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h  |   2 +
 2 files changed, 231 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 1195d401df19..b2ea2c2c986f 100644
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
 
@@ -626,11 +831,22 @@ static const struct pci_epc_features*
 dw_pcie_ep_get_features(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
 {
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
+	struct pci_epc_features *features;
 
 	if (!ep->ops->get_features)
 		return NULL;
 
-	return ep->ops->get_features(ep);
+	features = ep->ops->get_features(ep);
+	if (!features)
+		return NULL;
+
+	/* All DWC-based glue drivers support dynamic inbound mapping */
+	features->dynamic_inbound_mapping = true;
+
+	/* All DWC-based glue drivers support inbound subrange mapping */
+	features->subrange_mapping = true;
+
+	return features;
 }
 
 static const struct pci_epc_ops epc_ops = {
@@ -1120,6 +1336,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
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


