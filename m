Return-Path: <linuxppc-dev+bounces-15607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 400DDD164FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 03:38:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqthX2CFVz2ySV;
	Tue, 13 Jan 2026 13:38:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.125.133 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768271884;
	cv=pass; b=oj7XsfifRkO/Vv5uYk49HzDx44tAy8r1WakP9AoDGcnI/UoUA3Wk9ns2iHgXTyRF/zEeibHxSZ4OOukX/hRZ5dqamS3YhzryolbKSqzvaVAo96RvudOaBcXXDKgA3bjDzCIMwX6E3ZKX5XbWECmWLa2JOKp/8OPbXXehvuJky3KsUVQ79lE0Vhs6s2Voil4xu4t1bZPdNHR8AmBjaa3wlOW9MmMriWzVfG3Rris3JipJ0VnJxNeWSnRxVy3hpNIgYir9OHRQWbuEBaRsLZJakT5bbP302lTy0mcZafRLCx8g8f6zM+T4jmnieyCa0fJGkWguv40DQptq/jzVVQO9IA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768271884; c=relaxed/relaxed;
	bh=FExY/XjqZ10rc1mRAqygS9qh2D9I+rGxRxKi8EKlBig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EFwise4ZqvWDo6qRFT9JEmS5k4jgizIENWeCmqw+rZSeO65g2p8+Y7TARjW8nXHaVcnLhPgJ8Pg0x5k4qCbKJrGQVCUF+OVfPuQwTxwQJXaeNSX3TpI9pAcc8UBdnHjUNxWqD8P08I5mh3ai5HbKVqPgoppsH+Yf9FSU+KKrO/S8cpdadRAQC74jn/TI+fivnqat6HgJvMBuE6AUdbAXMksvGeUDZ80hU4tIspuUeOXZjfaYi4tD5vmg60tt2SvkOL9S+ebfrTQ3001I/zlDm/Uz9wxHZ3RwJBHmme/moFlMlm4Rb8Wth/ojgjhaMnBucxre/nADNrWShN4HyBhWtg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=RcnKzWGw; dkim-atps=neutral; spf=pass (client-ip=52.101.125.133; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=RcnKzWGw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.125.133; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021133.outbound.protection.outlook.com [52.101.125.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqthW3n1wz2yNv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 13:38:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwI+sPeieTYA4YtbbpyBeFtF79VdLm8tGBCQiW6oXMtikdm8Bs8GtDd05zF91thjFmOTvojwdDVeDrAES/dpDBre2/kTJQQA/5TgLcHYSlvGqcXTfM8F67rZQA1a7vdj1UELk5tpE58UV6NzRPd/vlM9l74w7MqafcN3S8g7m+ZL5p19aD43/7qwPgMx9/HHGJwLnp3o6DMXSvHE2p+wsY9Jpt9OskLxx4H9frjW5okKFLmc7SdJKk7jYFLE1H0B0EbqkKIa0nvcPivFSSV15re4bz9pddCwynQPxQ0s+EdD9YM5oWRE0hjpxpK8GxkaLZpT4ht3Y0U1dxTSv5s3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FExY/XjqZ10rc1mRAqygS9qh2D9I+rGxRxKi8EKlBig=;
 b=clXzk5OQwm+o263MQV0zA6Jp7lt9mkn0AW6ze1xITeFP/ldRC9jtebUDdeyR+RNPiDA3bS3wBbicefwUX/ODErg+G56uhmF+h1v/9VddX9gYrp2oDMCnR1Sgr5RH13eZ1kkckyZ1ihBGdBcggLWmCYMGdkttXACZtsYE9JBg0gSnI8RpB1ryI7JRXaZSrvsQsIMIvOg+F33EOGQkGYCEQFaLuzq9Jmf9aRlmUeZVsUHQGoHS1mjgm/H4jSjcBxj0ERBoJVnCjYjpjSDd8iKuKiJ0ZE3iwWZbIs6t7yqBrDxwY8TMig1qwRmSa6gFIlT97FVnhjHbSCHhoTCvNynm4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FExY/XjqZ10rc1mRAqygS9qh2D9I+rGxRxKi8EKlBig=;
 b=RcnKzWGw/zCoXoEQWr62xeIs0TGF2Kvtu1ygdDICRTY7hmf/qH3wqwCl7iFPTpLVywc95YAQ/vsg1GgUjT9AjpIBOJLJ8V/5UI+zNVPZMp6FJamtfv2ksZP79OiFXuyS6YfSNt1kGqu2KxLPLlTzeB1wZi/K0eKiJt+YFppVMgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6708.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 02:37:23 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:37:23 +0000
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
Subject: [PATCH v6 5/5] Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage
Date: Tue, 13 Jan 2026 11:37:15 +0900
Message-ID: <20260113023715.3463724-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113023715.3463724-1-den@valinux.co.jp>
References: <20260113023715.3463724-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: a50bc101-480a-4150-9159-08de524cae62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k9L08/gG1ZfrkVeV+YdayJ4SZSPK5+4Z//13JxosFgmwAz092jL3Q8lQB3p8?=
 =?us-ascii?Q?f0r6NxKkdX+Oh05Uwf70A/BwNhRlB5Q1xvQTYiKGdinHuHSF+aEZCk09gaOq?=
 =?us-ascii?Q?Tkyz1D8+sfZ7rr0eC/MaL+pn2h21e9UQFi60hMb2tddne7LTZa9OMWR9xBQn?=
 =?us-ascii?Q?5WMJpMbY0BJZLWBjX5z7aH0KyYj3cMSmS4nsDOjE3IiImXcDWGQCvKDPKBY5?=
 =?us-ascii?Q?IOk+gk78v/uxtmClz1/cGm9F3vQehe3WfyebCRLXzyK8I0LBIpiNcSzEXfi1?=
 =?us-ascii?Q?b2U7Cj93x0VW9GJchOPyM4xjuh/G9NjKJlB9jJ8E9YwBzGiNpRx4YWy9g2oW?=
 =?us-ascii?Q?i1YT70kSfa3QwQ1S57UYokbzMcmFtN1f0HjpZKpPVrRp6tXBntuxi3aSnQdK?=
 =?us-ascii?Q?vNH0EkEMuWOH/AMN51hWz6lwyVO+Jxw9jxppgxRBmMTHY+qOq2tdy38BXWte?=
 =?us-ascii?Q?WCajQvuYh0zsc6G9YD/4+pwepvg8DGkeqVtVKeDNB6tN6gS91OssWWzKtYZo?=
 =?us-ascii?Q?0dwSlBvCW9iIjtROCpwpae3L7rLSTsOQsZBnAcd0sC7M/ZoXpGrd8XHGoBCX?=
 =?us-ascii?Q?2SFrlHmqHqLCafAlfzCnweZhcjMLXgAn2uKaeC0h20yOIIh3lSP4eXqpqB2b?=
 =?us-ascii?Q?iZn2lnG6H9leeyo3a/rX0qHPwm2bk7adwHQeYsg44W4fyerKPbDtu3c1AAiO?=
 =?us-ascii?Q?h0ThiysYEMeh2CZMjiWQ5IUoqJnARD0PeRZgMqkZcN85pi5zjdVRfIwkJOX+?=
 =?us-ascii?Q?I40Dd98Z/rG+tYMv5Ff++fwbmrTc+vmfZFUCb3E/r1fdmeNw7m2E0m3R4tUL?=
 =?us-ascii?Q?mneQNoCWU6ByGl0Fdaq3i5KaGWd9V6yXkC1VTE1IcvhCwpLNPrj82S6IPgVc?=
 =?us-ascii?Q?g8P36hq57P31P0a69K3CwZZZS3nGTxkliUpc8jgofDkksMAdOerGQzg5ESJK?=
 =?us-ascii?Q?h9nt+sCl10qadBlLNlE89eT3PtDg8L1Ls6oyrhSprFOZJ1QyjCDrWaX8uler?=
 =?us-ascii?Q?1scPUfDv2Eel1qQOdcv7OpaNUhT6IX+eo8R4L+TPYDc/qM1zIb/zMq8OOMEo?=
 =?us-ascii?Q?7k6bqKhcvaT/3TsQ7qVCeCEWuRrxn9idXq4BlNKPisGVXd6SyrzaP+f5THYz?=
 =?us-ascii?Q?/NIXS33e7o73eB1EOj+3km1DkYC2zlSm76cViYGqwwVET429zhAIqeiV3ZQs?=
 =?us-ascii?Q?/WPX7tdXrBhjQhfwjpSzJofGv6Zkjzypyns3p3BaX3l5eXsIXAzKbZWZUQ33?=
 =?us-ascii?Q?4yltNDyiaDpvvYXypO0DOegvrtP+7T47k5H7ElxyWTLhLyuKYHEYFor1Vi3N?=
 =?us-ascii?Q?so2QJOThDuPnDhALPtutzJthB63tiUeVEI5PmKpxHidBIXMDhvMludJPUu56?=
 =?us-ascii?Q?Tn39rWt9gCtGq/nqvaVBRrAvFvF/nKU6L+h8Yr5bh4sfSbAjidTKMi2Z5Zjw?=
 =?us-ascii?Q?uIFBmJDiKi5OoYx2RwooO7PI+l1/qXc3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fiw5YgmeNsqJp718Y3m3214IdjtY4HdUMZIB1f0dL8H1V1XjgE5ZSuTAimX7?=
 =?us-ascii?Q?Ciw/EOVdPWQVudh9ZYXa4T9znUGPKXTIIgAPKARZ8WNGQ6eCo9wQ/LGNBd0Z?=
 =?us-ascii?Q?nbjdjVDDcJCxpGYovYsOCA39Ef/1u7CFTbLbENLpEadsJeyTIJD66X0kXxuo?=
 =?us-ascii?Q?kFNgYmmG1a4/Li1H/RcNrZfAFR1OoROKRiFH2BT7GqYItfGahM9/6gnJjggZ?=
 =?us-ascii?Q?q90tD263LyAYPyRiuNPgxZkRS1sK5J7GMpm98J7tSx0ltc37kSl6DWi5t+jH?=
 =?us-ascii?Q?dTK5vfLhl/nwc5CUgqXdGipCguS1SD364CrjnMSzpwL6P9cnoWYIp7Yuga8P?=
 =?us-ascii?Q?vm3YCdZxCGRFqug20Aqeva12BmF7EDUOSfG0Ei21cNrHq9T4dAwTCg61Ex7O?=
 =?us-ascii?Q?H1y2j07d3OFqu1idXTdoB8dO8V/3gG1oi6wxkcLKDyePsU0IiLWx9mKGt3oK?=
 =?us-ascii?Q?TzwkSqqZNhAmWDE2aNCECoF8SB1mnxYGUp1ID/qAWrDoSgk/tasljYmw/Y/y?=
 =?us-ascii?Q?OEbMclmWPw2Rr0+M9bExGoaFCZVTL3m4M3kYPWp9p356dsLh6q31wzkX8gEj?=
 =?us-ascii?Q?Q7kMqd7O0LL2wPzWhpi216PikhZF3h+6DZy+Br0HG0pWaxCzQkc0XnVm95Fu?=
 =?us-ascii?Q?TGsHeJj5ftG5TBgW4Nba6/4755+RAQHmPXJG4ME+7wKucULDoO1KE0QxkYSQ?=
 =?us-ascii?Q?BEaj+IYGUZfnZXgb0Fwl4Ptiz1TqxNOBbYJOYZgIPVuaa8C+6EpJ1tPMHfit?=
 =?us-ascii?Q?KsnYXHmjjY1L8Tmp/Uj70Juwhx46oqkt0dpp5a0C8+a22R/FPrU5oSGbgt5J?=
 =?us-ascii?Q?snvxf0ttoGJPENkX8N0p1oPmvoTDHFVOfBvDxi/YGLdq4VqGn+RJq2C9gpNl?=
 =?us-ascii?Q?zUz9LQmpCi+EUlq6SF5kbZk7mhpzKvFn3CaTSS9VE1/I5KOd+TTou82fbC6i?=
 =?us-ascii?Q?n3hwrPI407Oe1bcMtAHCB4o2RYCBcZFt7qpXuS1h6gdhSPLGlEE9Dcyluh3q?=
 =?us-ascii?Q?1TISGrK74T4tw4JeceVFUZDvZBrQk5bwBHOy8B70vvpJJd5ZMbiC59AUOqf1?=
 =?us-ascii?Q?31/13daXY4t/j14ca+J9Roo1xn5Jd3+NsAmiHY4DqQmfYraFyB8apqE4JFdl?=
 =?us-ascii?Q?M4Bc6ESwRpr8+UZDlkJ+AdbyB56is7GBHVdpLfsRy0jChFGUYRpRHjh+ARoE?=
 =?us-ascii?Q?T6YNawPn4zdZ3WDH2QHio1LwjtlLX2tvzwsIcXemA5eZqjbrzFvYqgTwwcPL?=
 =?us-ascii?Q?LQQTO6GL6GRwOe7xO/3Uze2hFH2rEW/rYZWKEDLPdddhhW7F3oujYnY6n3JN?=
 =?us-ascii?Q?iPk8etk6k39K4gqwrKLLeNZ6mYpQ+14sGtgnaV5Zpu3cDa40HvEM9mXOEi24?=
 =?us-ascii?Q?15U7dYmG3c3XFAt2tcc4mg7xeLQ8ZFAdikMAtJDCMNq3bpxNbnmtUPAhnw89?=
 =?us-ascii?Q?dM4w6MYE4hWgf4/yCMdH+VZqSFEeaF3Cr3BqT8K19RsgZ8RQkmFVs9sitmC+?=
 =?us-ascii?Q?LRyFngU36RcdVvWTHUMPWF1Su/O1OXO2XVr1wm0/RR2Hp9BQN83GKProjddS?=
 =?us-ascii?Q?hFxE/P3RqbuWQNabfV7mZY35r+5CRGMP3ZHUNYk/RkaMsJhZhB6K0GaQORQP?=
 =?us-ascii?Q?jzqQ8HixfMZIootnkydr10QlOLEWdzxOjKHd2zaOHSQjxOTSDxTraNhEg1+U?=
 =?us-ascii?Q?eC/37THnuu00io3ed1mEPLiDu8qsb74Trzs7XVnhtcjvOesK6T1djk8itJTr?=
 =?us-ascii?Q?5F5t5iUrKCWyMAB7puUglXtci2i+k9B15gqXE17NiAOeaoczNGdi?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a50bc101-480a-4150-9159-08de524cae62
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:37:23.0555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iD21qc3SHetmEjYawQISyj22zhOGTp6qtL7rZNZ+nA/2HKLWbxw2GJqc5Fsba/Rh+DIXherQHu9YGqmxu+jZeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6708
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The current documentation implies that pci_epc_set_bar() is only used
before the host enumerates the endpoint.

In practice, some Endpoint Controllers support calling pci_epc_set_bar()
multiple times for the same BAR (without clearing it) in order to update
inbound address translations after the host has programmed the BAR base
address, which some Endpoint Functions such as vNTB already relies on.
Add document text for that.

Also document the expected call flow for BAR subrange mapping
(pci_epf_bar.use_submap / pci_epf_bar.submap), which may require
a second pci_epc_set_bar() call after the host has programmed the BAR base
address.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 Documentation/PCI/endpoint/pci-endpoint.rst | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
index 0741c8cbd74e..d3d9abbbc71e 100644
--- a/Documentation/PCI/endpoint/pci-endpoint.rst
+++ b/Documentation/PCI/endpoint/pci-endpoint.rst
@@ -95,6 +95,28 @@ by the PCI endpoint function driver.
    Register space of the function driver is usually configured
    using this API.
 
+   Some endpoint controllers also support calling pci_epc_set_bar() again
+   for the same BAR (without calling pci_epc_clear_bar()) to update inbound
+   address translations after the host has programmed the BAR base address.
+   Endpoint function drivers can check this capability via the
+   dynamic_inbound_mapping EPC feature bit.
+
+   When pci_epf_bar.use_submap is set, the endpoint function driver is
+   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
+   the EPC to advertise support via the subrange_mapping EPC feature bit.
+
+   If the EPF driver wants to program inbound subrange mappings that are
+   based on the BAR base address programmed by the host during enumeration,
+   it needs to call pci_epc_set_bar() twice for the same BAR (requires
+   dynamic_inbound_mapping): first with use_submap cleared to configure the
+   BAR size, then after the PCIe link is up and the host enumerates the
+   endpoint and programs the BAR base address, again with use_submap set.
+
+   Note that in this flow, the EPF driver must not call pci_epc_clear_bar()
+   between the two pci_epc_set_bar() calls, because clearing the BAR can
+   clear/disable the BAR register or BAR decode on the endpoint while the
+   host still expects the assigned BAR address to remain valid.
+
 * pci_epc_clear_bar()
 
    The PCI endpoint function driver should use pci_epc_clear_bar() to reset
-- 
2.51.0


