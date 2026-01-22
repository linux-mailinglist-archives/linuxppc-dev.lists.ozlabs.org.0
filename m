Return-Path: <linuxppc-dev+bounces-16127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIeHDs3kcWngMwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 09:50:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C5D63719
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 09:50:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxZWK5dQkz3c5f;
	Thu, 22 Jan 2026 19:49:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c407::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769071789;
	cv=pass; b=f9/qJJdquKZpEG69gKv3CfFyj59FvELmJ+TA0bmQ+y052THLeaFy2lCGaxb8kCwfLSnEZGUFKN6uLSxAi0Oj0/3ZcIQCnAkaKUcE0sY9lXO1Whv6BLKSCwDbMgBZMVu5qvLdh4f53Q8FT340EWIlJ1C3KL+vMpRxnbIRJ+x7+g23LuDitrxlJHBvp0n+adTHZRytTNgReXIYi6Emlxkh+NAALbfuxiLEf/tRAzw8LUlqArxprI40HP5OQmErf7fCFHOBVSVNDogua/bmLA4/8YYHfKoM1iEh0YQLAeeUVH5XfbV8H7P8brpotmM+z7oeAttnOzqpU2MmX+uwH8fe3A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769071789; c=relaxed/relaxed;
	bh=vQmSd5Kr7DJhTVJ55qxMM6xPlOh5DwFI1WbTsmLYbyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=drKoedqvUvqKqXhnPRQ8qCyogNjA4b9gtLzd6TvpwNB/PE5+SfuS3Wl8SZiaFngYWNhnUpJHfkIpf8LLuf0CkwYHSTQk+PZZQFpSgCubEqJHuI2CgorY/zQOOikY1SXCjIvWEAAmSprBtH5WLI8Ef9+CuSptYqzg8SvTFCY/x0QzvpoU6AE/+lcr5CuGRmfGlNMr8P04qxTua+ZKakmlY+juhijDpveXcCl/Cbs2vhCMXp++lFOXvj48bY8VYjFTMHQZXoMhfB2ge534Rhh2efv63QjMWPIgOYR+xOO4NQB6tmh9DIIq3vgp4cow+Br+AhV4L1Mnu51eECsy+Nxkog==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=oDvJKOBA; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=oDvJKOBA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxZWG5wyJz309S
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 19:49:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1FMFDzghpCCsd2PairXIGyMYQ+k1I+plDn/fPZsy6iIR12XwiV58fN8Z5QPwv89pniExFc0QiCmdEcIBi2nfz5GD5DKxHHQwTgHrl2fT3ww7f2IYeVZ+U46Rmh0NlhT42epzHI/20L1S8q7xAHVSlblLyOdTC1dlwZHwOk+F8usnS1yYAY46as063+2fI5vSVcvUDEX0JIosOa8aIgXXXD7eCX3Quyg8Y+2FTWcKPOq9/e6vC51o0CVA4LPuK4aFRTWZXn2bXVXHm43SjSj93ukAB4dBimBsAuw1WT/IbIbFHT8DLcd2YwZpTDdqba2SLTthGNlavGWPSh8JK9XDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQmSd5Kr7DJhTVJ55qxMM6xPlOh5DwFI1WbTsmLYbyA=;
 b=A/jLo1sh0rPi+q5yF74/N7gjfsNOhbsYVEshE0QaHk4f/IpuNA3+4PhpAr69wmDuonLNo2UBCmfh4kC8ZmalXYgi4qouzjs3j+BGMgm6E34/PziTS9zxbjmeRSTYWP98px6OtP60lEuj6BcHZXHTo2rZKWX1JjjJZddngE5LIpD3lX+xooER9A1ltLnASNde/DH2DHY+LfOSMmsJ/6Ur23rKgzRn9tZr8BaNMgd0soU0weCwr7bBypBFvM/S/sf2ZbX+h7UrGMKMldRLDCbzsglvbDfG8Zh2N2OTVhwcg7DKofuSlA2dG80OMHvRCQzssWo7OTWjgEJeRN3iT0IZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQmSd5Kr7DJhTVJ55qxMM6xPlOh5DwFI1WbTsmLYbyA=;
 b=oDvJKOBApZ/kV1ZmsVbLFjzjkJ9G4KYZU/Cb+PEC1IrVffeJIwoVknmOIodNiboYyu+gUfKXb4aFOyZc8R/F+OduHEzP8v+xLK66vErW3e0cGW8gSAvKhIo7jQYB3cnVf7AS/wxYRmzlcmDraIfbFGV3EzlZlTaxvq/2BsC6+bY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY3P286MB2547.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:22a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 08:49:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:49:21 +0000
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
Subject: [PATCH v9 4/5] PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU
Date: Thu, 22 Jan 2026 17:49:08 +0900
Message-ID: <20260122084909.2390865-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122084909.2390865-1-den@valinux.co.jp>
References: <20260122084909.2390865-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 23cd9c8f-9578-4091-c13e-08de5993229f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iWyu2bqH9w+Iw//ULFSDF/N4Y66yFGc5ukym3NnObv/fyWqr/KmXFJiTsl+F?=
 =?us-ascii?Q?mD3VFvVnF8pGW58LhNOFwftamawrh3QDDAfDG9OC+a3jbnLu9Nmnx0Q/6/0l?=
 =?us-ascii?Q?9QV3SSBK7yj0BcLRI+s24zgaBZox/y5vR9huUQT0X0ZEDH47O2Lpwf7vR9rv?=
 =?us-ascii?Q?lR2CU0DKxtYPE6KEFHF0wdjAF5BbW6pWj+URZThrnDO2NKsSvYVmxlEbwqlz?=
 =?us-ascii?Q?dijb5Pc0VEWWQCdBpEXXnyEZskPFd8tI4NO5S62tH5AhhX9tTvaH5EtyS7uW?=
 =?us-ascii?Q?ORUsyaWaz6az08ptoSey9SoK+mVewlxJaGs+yIh3GWas7pKAT8WMFf5u8KCN?=
 =?us-ascii?Q?LNyrWY/esmEjoJBQjKVZSWpQcc/y1RHkqf2d0QkCnGsleHwcvEiKi9JLqKIS?=
 =?us-ascii?Q?H0uFp2HShYULibj0WzwcSjT+Zc8D0IrXLG4jhtxhWkuFuuUd64Idamw3dOQx?=
 =?us-ascii?Q?CyxQ8LwC5Tj9rsF6iwPlZY0MnvhOIcAeaWVzHXTE8BWrrqlgUQiHx9weXKQi?=
 =?us-ascii?Q?Kpe/YWnN09GFC9vBlnWBYxizxoGWvc5oBaV8rnI3c+eykgBLYjJd7d5pKLmD?=
 =?us-ascii?Q?QuR9RPjTYtJknuilaxE/sTGar23BIfWJz6mNcowXXBRIZsgY/Kk7ZyE91FdP?=
 =?us-ascii?Q?TALLA4bUnxhdS//qf01w/1rF2kwJ61EvC3ufMeAb6vVPLnfXxxZ9lIwCLxum?=
 =?us-ascii?Q?N0K47fyJYU1pbYyCUZSuZikQ963WNO6F2bSHVHsfAyAd4zv6GSvY/9QIu22b?=
 =?us-ascii?Q?JTlfo15Dh/lXmP8eS4NuVOH4b1aYSQZNpgZrZ75R1Arna7xw++ry7LbBXp4d?=
 =?us-ascii?Q?sE8Ho9kc2dI00SLHtvbDEyulSaPFnEByLj5wmx0HQy3efSAhpGNM9VwcqDqe?=
 =?us-ascii?Q?/KIRNWMyTFZhNbLay4U/hSwaBOMUEsmf5IskOEPbSJJ4ZhpFIGZdrTaoqhEz?=
 =?us-ascii?Q?ekQi73AeK3IgI+zNg2lmGrJjbGmvFzgVFyGvGVdftu8zxhvcP//aYW7C50J4?=
 =?us-ascii?Q?eTNbcK9yHGBU8Z0RTOfPUrRjv5ix77UsCpr+MY+6S7HFwVmsr67iLtQiEteq?=
 =?us-ascii?Q?fO/7W5EOhipSVFmojwHaBD8E8BMdVL7FodxOohP4lRmvPU15qh1HqFVL3xxT?=
 =?us-ascii?Q?LWwNW8QiMS7uK3J2TXyS036/qiAdKF/47lh3h3CVp32XVsk72Fp0q2Dfqq+J?=
 =?us-ascii?Q?4Z8QGrPgoltsU0M6yb021smQBmBpigtAzJQd3LjMtbOML42+IPjtE7Mw/MXU?=
 =?us-ascii?Q?Ywafxt1eD7kQrMVxj8qJ5Em6ppBAS7bPFTw8bP3L2PuxGM6/MaoJmMdxy1RC?=
 =?us-ascii?Q?1GkeLgT46FDCfpMvUfryuhd8+/JktWfRwjAA2KA8Cmzz6vgc2TAiyouLU0Et?=
 =?us-ascii?Q?OX4ElTU3/vpJ9CPq+PY9culY6HZ7Sis0vKW94+uJg+dS61UOjk4xp2YojdYq?=
 =?us-ascii?Q?YnANfr5MUVskgs6iTFV6PCR0mxlqpo4GfiJLAdEQsP9qXQ/M8+pmdDxMZRMe?=
 =?us-ascii?Q?mf+3hOQEND4V5Rh9P1sAzpoFVKVKITSzIeAGGZS+/odfQf6wnucPJp6Mdo56?=
 =?us-ascii?Q?eFFf0Rh7FfGzfWdQZ1w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4XWWNQZeey+U5ediZ+k1K9XzvY71FtKyO9eVB076n9ugr960UOThoylgDQDA?=
 =?us-ascii?Q?sxzQlVY+RoHopvLST4OmSNyOh/T5XN1JlQabRPbPAqUHY/XEvMDsg38aMBpv?=
 =?us-ascii?Q?+ot8bjc6jVvGzE54ONgUQNn0tuWsDKSGj0PPpBfM0XL3OkVW8+m4wIe1+2g3?=
 =?us-ascii?Q?a7FCLZOPKWMkJVR6CZuynQSxVrcHeZX6DRnQ1xL3qAGHGi4XcbwMSRooEnmI?=
 =?us-ascii?Q?eCc+Fn4G/FYtEGF2knwHBTKEd+lHocLV6ogG4iFgkm+Cz14CxKvfCudAKsxq?=
 =?us-ascii?Q?6Xet6Ql1fTP3r52tHNwVU9mJyWb8Sw0JKpgpJ3XOupPAfJWFANl7Pm2uWnlw?=
 =?us-ascii?Q?RCIw0Lxk6vmXhcZ3VXCBQO/KRikK9/FBqX9+4PHmqtQC5a8Rtzvt98U6ygGe?=
 =?us-ascii?Q?1fWo/KL/DoydJhV8fi0OFacET4ZWa+0m6TP8GYNYKCwhOTs5TUBInDK6reVo?=
 =?us-ascii?Q?bFhaucQizuQGaRXmdNx2DKHnlbEkp3AQcEdefxwJd5GCFuL64VSJU5W/0PRM?=
 =?us-ascii?Q?WwWEVMN+OIKUJxd+XywZugpeG9+OQRGaAT2KUT7qzf+nGdHLFwZOaqaeIG7r?=
 =?us-ascii?Q?bmJ9fuiXwdam3JfAvSdsnJZaR4LSiDv8/QUus+j8/a8R6yV5mMObeewiZLrW?=
 =?us-ascii?Q?RTC9jocunjo/seLCZkuxNtKKtE7L4W/QK+6DTzl4im22VAGmqKq1gm6+ellw?=
 =?us-ascii?Q?wnH5PIaIerPA6NPGSGwuVzPUyGdNzAgPa4NCD2fll5gzQjmWcaa/oUZFp6dZ?=
 =?us-ascii?Q?KqV5w7zCTgOc5nPfqdK0ZRcrXxR8GsYiHg0k0HKVyHQ8SUBSNjeJ8VF6+Dw3?=
 =?us-ascii?Q?+QQzK1jhPIFwJayRRg0+yHCXfPzBdLj9TWFxyQyO/ISfrDB6zt/3KlmCHNTb?=
 =?us-ascii?Q?r5QRqlYGNVTXiZjtscPSjnXaO3q67NRvQDYhSxp9+w7pqGskqlMRLHGEjTFF?=
 =?us-ascii?Q?llDNq++VzzuLiyXs81nPoffulQfjOlTbS3U2UWuEDhA+o3DNphwJO1W3Xt5i?=
 =?us-ascii?Q?IRrFH5nPOaQpyi10c+VD/3Nk1RnCpTrMDc5B0ya9YBfSxAGyZf3BO8NCgSIE?=
 =?us-ascii?Q?8teOvtDYGL3u86lB0ksXmpJXFXUMFTJRIACBBrOlXqpy3unNF4fRDcyYOlDz?=
 =?us-ascii?Q?v1HgGxmoK7Kwv6aCr3upBMsffTi+unWWEt85+z/LRzbsHhXOvTdzWJw1gmmr?=
 =?us-ascii?Q?9jnZzMc3T2YrDVFIgwmp0KVXQiItB/dQ6r1MC4Ov2Uw/yEirQfTqE029L3bW?=
 =?us-ascii?Q?dH89lkLqb0fZ9YZb3rxJDAYuuQHfloFhOxmQlOIxhnZcWXoYlJ2A3UQo4TSB?=
 =?us-ascii?Q?1cpjXIeLSSalskShBIqENEW4RUdXpzQY3rF41/IVpWK54vy27xtovfyjmeME?=
 =?us-ascii?Q?Gp01TgpPdPxhuWByQU4rJZp/rzSn1pO47B1EVPpKOxP8OZpeli4nifjUSxG7?=
 =?us-ascii?Q?n1RjEC6DvZEWiQUBE+EyG2pbO/92nsQXrO/IajBMQN/AxdadkWRP41qZbiA4?=
 =?us-ascii?Q?Wonq8reksSt3jHdSjEwPmIcU9ZGItZd/3pCT+jCrvqBeIQm/T4vcMTyR69z0?=
 =?us-ascii?Q?NEbl1kluTG8Skz4ToJbVyh/hqPxjUBiFXTwzT3MPXGyKS7WP0b8aMGzvWNx6?=
 =?us-ascii?Q?XQuIY8TFnMjHmnfFgfRNiiSx+rYbHABrmCDRQp97jcgeT3zVMLtM2z8Dv+O6?=
 =?us-ascii?Q?qBPP2XWcFEr7YYt4UYPuXrZnFnWLNt5w7tp+7EgFbWCMBUFLLdrtOHrk9ckE?=
 =?us-ascii?Q?bkIvNuuDdW9wJARUYIt0eJoYFujn4OQcSGWU9INzditU0iZopVi9?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cd9c8f-9578-4091-c13e-08de5993229f
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:49:20.9766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaUdgeP2kl1IWxSc1AT8iRX3vMo3rHXg8zMAAYzuhwDlXbv5yVlNMs9pyCU2Eyo6r6h9NvH1HenZHvWV3gLKKQ==
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
	TAGGED_FROM(0.00)[bounces-16127-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 73C5D63719
X-Rspamd-Action: no action

Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
subranges using Address Match Mode IB iATU when pci_epf_bar.num_submap
is non-zero.

Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
num_submap is non-zero, read the assigned BAR base address and program
one inbound iATU window per subrange. Validate the submap array before
programming:
- each subrange is aligned to pci->region_align
- subranges cover the whole BAR (no gaps and no overlaps)
- subranges are sorted in ascending order by offset

Track Address Match Mode mappings and tear them down on clear_bar() and
on set_bar() error paths to avoid leaving half-programmed state or
untranslated BAR holes.

Advertise this capability by extending the common feature bit
initializer macro (DWC_EPC_COMMON_FEATURES).

This enables multiple inbound windows within a single BAR, which is
useful on platforms where usable BARs are scarce but EPFs need multiple
inbound regions.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 .../pci/controller/dwc/pcie-designware-ep.c   | 203 +++++++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h  |   7 +-
 2 files changed, 199 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index cfd59899c7b8..0567552b784c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -100,9 +100,10 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
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
@@ -135,6 +136,179 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
 	return 0;
 }
 
+static void dw_pcie_ep_clear_ib_maps(struct dw_pcie_ep *ep, enum pci_barno bar)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct device *dev = pci->dev;
+	unsigned int i, num;
+	u32 atu_index;
+	u32 *indexes;
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
+	indexes = ep->ib_atu_indexes[bar];
+	num = ep->num_ib_atu_indexes[bar];
+	ep->ib_atu_indexes[bar] = NULL;
+	ep->num_ib_atu_indexes[bar] = 0;
+	if (!indexes)
+		return;
+	for (i = 0; i < num; i++) {
+		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, indexes[i]);
+		clear_bit(indexes[i], ep->ib_window_map);
+	}
+	devm_kfree(dev, indexes);
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
+	size_t off = 0;
+	unsigned int i;
+	size_t size;
+
+	if (!align || !IS_ALIGNED(bar_size, align))
+		return -EINVAL;
+
+	/*
+	 * The submap array order defines the BAR layout (submap[0] starts
+	 * at offset 0 and each entry immediately follows the previous
+	 * one). Here, validate that it forms a strict, gapless
+	 * decomposition of the BAR:
+	 *  - each entry has a non-zero size
+	 *  - sizes, implicit offsets and phys_addr are aligned to
+	 *    pci->region_align
+	 *  - each entry lies within the BAR range
+	 *  - the entries exactly cover the whole BAR
+	 *
+	 * Note: dw_pcie_prog_inbound_atu() also checks alignment for the
+	 * PCI address and the target phys_addr, but validating up-front
+	 * avoids partially programming iATU windows in vain.
+	 */
+	for (i = 0; i < num_submap; i++) {
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
+		off += size;
+	}
+	if (off != bar_size)
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
+	u64 size, base, off = 0;
+	int free_win, ret;
+	unsigned int i;
+	u32 *indexes;
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
+	indexes = devm_kcalloc(dev, epf_bar->num_submap, sizeof(*indexes),
+			       GFP_KERNEL);
+	if (!indexes)
+		return -ENOMEM;
+
+	ep->ib_atu_indexes[bar] = indexes;
+	ep->num_ib_atu_indexes[bar] = 0;
+
+	for (i = 0; i < epf_bar->num_submap; i++) {
+		size = submap[i].size;
+		parent_bus_addr = submap[i].phys_addr;
+
+		if (off > (~0ULL) - base) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		pci_addr = base + off;
+		off += size;
+
+		free_win = find_first_zero_bit(ep->ib_window_map,
+					       pci->num_ib_windows);
+		if (free_win >= pci->num_ib_windows) {
+			ret = -ENOSPC;
+			goto err;
+		}
+
+		ret = dw_pcie_prog_inbound_atu(pci, free_win, type,
+					       parent_bus_addr, pci_addr, size);
+		if (ret)
+			goto err;
+
+		set_bit(free_win, ep->ib_window_map);
+		indexes[i] = free_win;
+		ep->num_ib_atu_indexes[bar] = i + 1;
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
@@ -165,17 +339,15 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
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
@@ -331,6 +503,13 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 		    ep->epf_bar[bar]->flags != flags)
 			return -EINVAL;
 
+		/*
+		 * When dynamically changing a BAR, tear down any existing
+		 * mappings before re-programming.
+		 */
+		if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
+			dw_pcie_ep_clear_ib_maps(ep, bar);
+
 		/*
 		 * When dynamically changing a BAR, skip writing the BAR reg, as
 		 * that would clear the BAR's PCI address assigned by the host.
@@ -369,8 +548,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	else
 		type = PCIE_ATU_TYPE_IO;
 
-	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
-				     size);
+	if (epf_bar->num_submap)
+		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
+	else
+		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
+					    epf_bar->phys_addr, bar, size);
+
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index be47f34b49ca..938dcb541ce3 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -306,7 +306,8 @@
 #define DMA_LLP_MEM_SIZE		PAGE_SIZE
 
 /* Common struct pci_epc_feature bits among DWC EP glue drivers */
-#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true
+#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true, \
+					.subrange_mapping = true
 
 struct dw_pcie;
 struct dw_pcie_rp;
@@ -487,6 +488,10 @@ struct dw_pcie_ep {
 	phys_addr_t		msi_mem_phys;
 	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
 
+	/* Only for Address Match Mode inbound iATU */
+	u32			*ib_atu_indexes[PCI_STD_NUM_BARS];
+	unsigned int		num_ib_atu_indexes[PCI_STD_NUM_BARS];
+
 	/* MSI outbound iATU state */
 	bool			msi_iatu_mapped;
 	u64			msi_msg_addr;
-- 
2.51.0


