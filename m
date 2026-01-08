Return-Path: <linuxppc-dev+bounces-15434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC75D0628C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 21:46:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnH5C1Zf2z2yKp;
	Fri, 09 Jan 2026 07:46:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.74.132 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767893092;
	cv=pass; b=kzgu6PqxlklHaObPI67tc8gLa4BU76PxoBeL4wT3oQgwjIZW5bS2YCZQpuJKfRrdu0IUUxTKpPc16uDyrFNp3Q23hB/GRGlz3/Ov8sYPSJpVSdDHfcVXYM7cGkDTavlx0FPbbNDZpwp3Ek5Ob2mS3dVyi55AwUUtANmXxabOa9LRsAB+mqky1ZnWqm3bxGV+Ek97tPNDBZP2xyYCJNbvYLZziMGkTl3YC/6y35jLuNgtHwswJGSoqi+6AKLAj0rGttWoH2iuXvZAgMSjCl5IM1GMmyi19EMGeVjfS5VXux4UHzvwig8GxB+r5aMK4A8rE6bZv4tdhSZ8m7oSW2aEAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767893092; c=relaxed/relaxed;
	bh=UTvS07QhbBwOYP6RTqT6qqRP57COTnbZccNyqvpj+3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jhT7T8cg83ymJU3XnnfBfKcqhLDwsE2kFxp6iiXENDUU0DivvVwcnxOS/GpzZepXYvfXOhYnHHxxDsY++3A+kqN8oBYowAWwyL6mwNX5BfvfE1f/DwKtSqkztw83FCRTYEwjfbxML7Kk7SDox4eFJh1+Ed6hAuiHiVUNALzs8M2RFxwDNlRw4DDPorSrUhfV/C40hD4r/GuadHlhj6poyWr16pRGO8jC1DVRzhRSvXu2MdhhGCUv6zYPq4kHsePj4+2Fu0C8eRLS9NCvZwjDcu2widIFqMjJWVKhZ/kPGhHj9vUTl1sF2wAKQ51OS6YTMBwgXAy0qNlX5vn9LNAlYw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=DEUV7uRG; dkim-atps=neutral; spf=pass (client-ip=40.107.74.132; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=DEUV7uRG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=40.107.74.132; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021132.outbound.protection.outlook.com [40.107.74.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnBc345vNz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 04:24:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3CnL+IJF8ni0hCsBC1k2zbjrIyIC7RupIBmX3pwgafU1Vd9TCc3yZ8XLlnVZjz6t+1neGMYrxk/NbHw29KBEkdv/ObhXmcfkQF8+zoN1/atsVUrzbf7UX92rgHqVWGI4nL9vFlKno0CtBS5NlSVOkRaocYldtc1UUaa6V8erUypBn9nuPK1WRsZRccpRz+M40LPW2slmCV8YhmBKwlnhq98VrdVguRtX4bpPMogUyHSRMZmhCDWENnlljEIq9gQhK16ZCYJD7baFvwuzNTMkxoZHEhofYKxudQIVPi2J3hVCzRTppu2f73xLRAEMTwAY4QtTaZo60/M4U3aqnNkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTvS07QhbBwOYP6RTqT6qqRP57COTnbZccNyqvpj+3A=;
 b=EmBzpLKFMAWxDhiuqdnWMW5UWfs9y4cLWq65gT2oS0K9khwXTCH7JGkoGoZwo2h1wwi19MZQcNg1U6HBNYp+D8vC0q13r2ZONib75jT++vWCORap/hbGSWaiy7dzfGfUTUB0hfnUG1bfNuUkrgm6eoTZ5OQq4G80t5N2q8bAiSjH2hsy3lnyiqkUDBaUuauikqLKmv2C2iH+g6qDUCGo4RKahVMt+wPecfhjHgJswt7ejY7FrngFFM5mr9xg/bjpoDsklOI58qMLcsHxkV96RClBP/K/Rgo+nixfhjEmngYI+F9jOwH0eawHbthDWBYuvybF5Q5Tp0T/h0psyH/l2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTvS07QhbBwOYP6RTqT6qqRP57COTnbZccNyqvpj+3A=;
 b=DEUV7uRGKWSQxUUsm/5crXXWzsHCsC5rKdqj/rbnCn9xZNW4XpQ2IBdiXgyqT3rvMi0LYVOQF7hb7LdjFe8CSVjP7EQnb766R6Gn7r876kAZqox9mhmt/GreJLM/ST1+bnrYv+VhaS7LYurH0cAfRRzbXEnRZVdbp+Gj63z8I7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5284.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:24:08 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 17:24:08 +0000
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
Subject: [PATCH v5 2/3] PCI: dwc: Allow glue drivers to return mutable EPC features
Date: Fri,  9 Jan 2026 02:24:02 +0900
Message-ID: <20260108172403.2629671-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108172403.2629671-1-den@valinux.co.jp>
References: <20260108172403.2629671-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 47541226-3677-4072-b941-08de4edabaf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UzYy0JxyeBrulZlcc2O7m41UobUK57yJ1c2FrrRNUfPDangpLP00RbY1/awc?=
 =?us-ascii?Q?q8vZuUiD1tjtdjfZlPuO1fzVqEaSDayb8NX9DPfeWXtVaNBZfzbEd8H9EZN6?=
 =?us-ascii?Q?pY3IZglc2HNBprqNd24HA1IFNfp4xuYpI9FdthtxmF/yfsu6hofUafA00QjO?=
 =?us-ascii?Q?iHRxLUr1vWEUvDNcKfdplvWU6nHp6KjonP57+xKOgzFvn49tCtGgGoUTZuIQ?=
 =?us-ascii?Q?I6+Y9pPHDlPcfzdxCnxyDT8LNII9CwSA/IWH4hMUvniDB7wiFgBPszRR95gf?=
 =?us-ascii?Q?6IEC21o/QhU1JLBSbFkqmR8SzdhyJsowq+dmTkRRf6MqBjETwOk9OZJpAzhs?=
 =?us-ascii?Q?wNed/LpbxOTgSR/Ar4r003kvRDLCvcSUHUeqbeJY+aeUnzuscvHd7MIrgpig?=
 =?us-ascii?Q?sbCSJFSjmyKnXzx2H4P5zgBGYTWMblnlYT/H0+VPrwv0RjodNM7iDPsjD19j?=
 =?us-ascii?Q?raFD+fio5nCaEWOOYSGgNOUdBHlua6nzQod9/VamYn1ByBMtxDNnwTSwpTv7?=
 =?us-ascii?Q?X0CmD5JtB+R5TAakscD0DHh5DFja3bB9Lp8O9bh5YOVeugtc8rGFypEnfx1H?=
 =?us-ascii?Q?sZGTaUPB1nEPq024/lYJeJpp+zU54Kirx+qDjOtcgzBDojCfjcBy6b0XjNT1?=
 =?us-ascii?Q?kxAgLHaS6eG7hb8fupqkOwBem+A6GfhzOWAR6oJarK7jekILAMMNmEkXQsjU?=
 =?us-ascii?Q?39jbUnPy6Kmq0vFVvaRw/3NyXY2jlcoEt6QQvimNuMYJLSiULuTB3FJ3JjCj?=
 =?us-ascii?Q?TR8/njuabTQwUed73PK8rN/ioN2TNU+JDHrT0MUMuwAhpG3EOd9xoaXdrWhX?=
 =?us-ascii?Q?UpxKwACdumn2j/0wswnAHXvYYcOJ4lGGbpjop2nKeE0Z3FKgwBULFOEm7lQC?=
 =?us-ascii?Q?kQfQ4pr9L1/bpoiSXfYBFpfo1xazyZqa8zrTUbJw/RgSKdkcCQz7eRExYUhR?=
 =?us-ascii?Q?cp+57ZeOUYXOyw8hsPE3RUejWlUd2LWN1/x8Rfs+ig2BMQEwNTdI7mtZud09?=
 =?us-ascii?Q?jbOcKPQsE1BpLnO+JIwh7WXVxkg0w4cbUij98WDztjm9EaA3p3hXh8ezukDt?=
 =?us-ascii?Q?+BFcrKvZbsidCSPse6h5+G3wpH4lc3EJzvfbdbFdIS0U0mYRW0iBEkYHdtfn?=
 =?us-ascii?Q?i0UglteQyhZfJ7+CfJpJkY7DPF0tjBZy3fgf/ZqLLMVmH2AtLpHUXBU4L+9k?=
 =?us-ascii?Q?WhcVfeVkBmKEdU7r4G1ORBjBwrSiqh03OJxD8XTXgeNZfLTGrERl/YR1Pfxi?=
 =?us-ascii?Q?g/RKyzmrcURD+ZwUhMxGijh/zPSBqVcFJ7vanqFTu71wArZFau0nv9K9s0hu?=
 =?us-ascii?Q?p3SYyURaZTkbL3Jc7ucOjB5I4UbMRmHR3sLvpjKPYxF5f5H5L3MH+4Iikk7l?=
 =?us-ascii?Q?EhvvKuejSKbIRjf954D13Wt6fzTvq+XWBn9BqMF76sJWnHKaY8oWw0Oa2JXM?=
 =?us-ascii?Q?fur++RG/xrhCm1lz7w5BqiyEbCmV/rTV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SxkEjWwYEtkqMRIHrnK4RgPisWHI2p+6HvwLbcex87jR/ZAb9o7JAE4tanGH?=
 =?us-ascii?Q?4XjRva+fcLcDECIddlq41wgk/5/Vgs1blVBUFcHXvwT0lo7l4mvlNrD+Bkmd?=
 =?us-ascii?Q?duSTPjOelaukfqYx6WStToHi/8dYW3isUfd3Vb4idaftoKJ8Ah/xgfOIXVCa?=
 =?us-ascii?Q?dJIBx+lN9ILHJRJj0did5I4R/L0ulUvHriAtnTv9tHZ3XNLLgy1wQ0fSQTly?=
 =?us-ascii?Q?fsPCg/n9g3Wb7Ke+z8FI2Ur2FpgyKNp3Y4PbhIGDRKFgZzOoA0y6icUr6nI+?=
 =?us-ascii?Q?XOMOv9oyVWGdG0WqIEujz4IxNuaJuqTOwghB6OAsGf5nqprgD4nWXP7c2KTO?=
 =?us-ascii?Q?Nar4H992QaYUUMvWi8L0xcKZxgCnXOg1wg49t8ax4DDcp5/rpXDuAHOHZvZ9?=
 =?us-ascii?Q?dhf4Vx4FL5vD72YhU2X2lre2RQRDqV9qTtlgYJSbnCb9iG1C3djGK0rPCnDG?=
 =?us-ascii?Q?NCQcG2g1x1s/Ovp2VPHLI1Zaa8mbkB9Mr76HdAEJeWSaJLJiVRxzfLlDsp5T?=
 =?us-ascii?Q?wKtZq2ZHefWPi/LGZJ60SRkc912izkjrJrCiJx0LQKQC/1ckG7Plzy8hgJyb?=
 =?us-ascii?Q?UNFCpWi/toUmwwDT9YyMvjWwm/MzzZ6u4tJCO55O/ELE4I6JBIQfTWcMKIIF?=
 =?us-ascii?Q?LutJ851v5vUYjDafVHAiBEvj6RX0k3O3imQTBwFzFv6nEYGnTAsiFu0fOgX9?=
 =?us-ascii?Q?9txgj69JXNydVxyKRUQ2Ur4yFW5DW8MNdozknwFif7rygFkqFm8YM1CuPp6l?=
 =?us-ascii?Q?Rh+NmHyNt5IUedli90TQSrQ2AJ2fa7bpfXvp4ldU6JBWGcPu1znW+ClDuqiI?=
 =?us-ascii?Q?6oobLNzllJ6ZxzGdPMN56xfQ4qQ0QrAT7deBZIjLXBu5FwAejyOFg3rwwFIS?=
 =?us-ascii?Q?EetnU6mY3j/3dh0XcgUQui6f5lTSO25pom28Nt3YJPFZgpm0sd2NxUJd+ykC?=
 =?us-ascii?Q?WMbe5Ffx7NEjkm86wevhHbbnVJE86SpZMPUxISk62TecUJ8WNeVMv4HSH29P?=
 =?us-ascii?Q?CO7lSLIPHMnZI1nurnLhLjxbZpUyN5O4u0jI3OGUSLo/lDmFRNTfneVHefM0?=
 =?us-ascii?Q?GKRRfk590X35/yBgbmVOhKWMS/2hPGgoKrB9OV5SA9qN/qCI9JhclAhsTEo7?=
 =?us-ascii?Q?7EAJqva4Ph7QNhuRn/iJsuDklpT3w8IAIApaazn5zWYhRBuZvTZ1oW90C2Aj?=
 =?us-ascii?Q?kW4R9vM8dbdZU8TGVYm2oGOO15MEQuDNYfFRwEtZgP8F/MN+AC88N0Xk4cv+?=
 =?us-ascii?Q?Rh6CNBcYs0t8BitH5f+OXWXMgOTa+U5ElRX3N54ZoR4qNKD93bdDw5zOLds1?=
 =?us-ascii?Q?SCJ3+8AZ8Lwyj5DlyOGM3404w6eLOIbSGN1BwkW0l0VT2xBrN0IRad1QG9n6?=
 =?us-ascii?Q?UoPeLqZuvgI/aYjAhDC9qKhY61h8DKE8ZUmboxoPoP/iLESCmItv8659Cy7a?=
 =?us-ascii?Q?Wl63Cz7H68m8hNzN11PYBNYniatY0y968gNgB39gHuzFThOyx6JUZ5c/kS/v?=
 =?us-ascii?Q?ZjflYG+cIheOjtz8u2ZRIQmjGLv3oZQG5oPRlM0iKGBG5Ax0nrlITxGMBbD1?=
 =?us-ascii?Q?o1ZmrgQDDVuXtFoIdMP9iEddlMdqPuamacVtlHOb8w0FlPHAP5rpnH1NZBuD?=
 =?us-ascii?Q?L0auIL7vUXPWu0gJqoGFKYjaCvEdR3D1j8iAf6Q5HTwol/L9emFsfbtaLjpi?=
 =?us-ascii?Q?h58YHdl9jiR4vV6TfxT9uxdHkhalyc7c4YPkrvJZaJZ1GrfWSmPJ8XWkS0dT?=
 =?us-ascii?Q?zTfp4hwdizIcS5ii9ThFdtaC1AeZ6JsXhoZgXF5PyxJfBGG8+ahT?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 47541226-3677-4072-b941-08de4edabaf6
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:24:08.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AakVy/xO4CvsffWErWZgGiAgEZ8slBaWLp/B02ZyI0Xkr1I05TfHRZNFbyiX8XRUxoQLrPW6Kfk/9h1lcM5CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5284
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The DesignWare EP midlayer needs to advertise additional capabilities at
the DWC layer (e.g. subrange_mapping) without duplicating the same bit
in every DWC-based glue driver and without copying feature structures.

Change dw_pcie_ep_ops.get_features() to return a mutable
struct pci_epc_features * and update all DWC-based glue drivers
accordingly. The DWC midlayer can then adjust/augment the returned
features while still exposing a const struct pci_epc_features * to the
PCI EPC core.

No functional change on its own.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/controller/dwc/pci-dra7xx.c       |  4 +-
 drivers/pci/controller/dwc/pci-imx6.c         | 10 ++--
 drivers/pci/controller/dwc/pci-keystone.c     |  4 +-
 .../pci/controller/dwc/pci-layerscape-ep.c    |  2 +-
 drivers/pci/controller/dwc/pcie-artpec6.c     |  4 +-
 .../pci/controller/dwc/pcie-designware-plat.c |  4 +-
 drivers/pci/controller/dwc/pcie-designware.h  |  2 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 +--
 drivers/pci/controller/dwc/pcie-keembay.c     |  4 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |  4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
 drivers/pci/controller/dwc/pcie-stm32-ep.c    |  4 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |  4 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 58 ++++++++++---------
 14 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 01cfd9aeb0b8..e67f8b7b56cb 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -423,12 +423,12 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features dra7xx_pcie_epc_features = {
+static struct pci_epc_features dra7xx_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &dra7xx_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 4668fc9648bf..fe1de30b3df6 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -131,7 +131,7 @@ struct imx_pcie_drvdata {
 	const u32 ltssm_mask;
 	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
 	const u32 mode_mask[IMX_PCIE_MAX_INSTANCES];
-	const struct pci_epc_features *epc_features;
+	struct pci_epc_features *epc_features;
 	int (*init_phy)(struct imx_pcie *pcie);
 	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
 	int (*core_reset)(struct imx_pcie *pcie, bool assert);
@@ -1386,7 +1386,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features imx8m_pcie_epc_features = {
+static struct pci_epc_features imx8m_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1395,7 +1395,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features imx8q_pcie_epc_features = {
+static struct pci_epc_features imx8q_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1415,13 +1415,13 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
  * BAR4	| Enable   | 32-bit  |  1 MB   | Programmable Size
  * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
  */
-static const struct pci_epc_features imx95_pcie_epc_features = {
+static struct pci_epc_features imx95_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
 	.align = SZ_4K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index f86d9111f863..4292007a9b3a 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -929,7 +929,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features ks_pcie_am654_epc_features = {
+static struct pci_epc_features ks_pcie_am654_epc_features = {
 	.msi_capable = true,
 	.msix_capable = true,
 	.bar[BAR_0] = { .type = BAR_RESERVED, },
@@ -941,7 +941,7 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 ks_pcie_am654_get_features(struct dw_pcie_ep *ep)
 {
 	return &ks_pcie_am654_epc_features;
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index a4a800699f89..8d48413050ef 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -138,7 +138,7 @@ static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
 	return 0;
 }
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index f4a136ee2daf..84111d8257f2 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -369,11 +369,11 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features artpec6_pcie_epc_features = {
+static struct pci_epc_features artpec6_pcie_epc_features = {
 	.msi_capable = true,
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 artpec6_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &artpec6_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 12f41886c65d..60ada0eb838e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -60,12 +60,12 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features dw_plat_pcie_epc_features = {
+static struct pci_epc_features dw_plat_pcie_epc_features = {
 	.msi_capable = true,
 	.msix_capable = true,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &dw_plat_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f87c67a7a482..4dda9a38d46b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -449,7 +449,7 @@ struct dw_pcie_ep_ops {
 	void	(*init)(struct dw_pcie_ep *ep);
 	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
 			     unsigned int type, u16 interrupt_num);
-	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
+	struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
 	/*
 	 * Provide a method to implement the different func config space
 	 * access for different platform, if different func have different
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 352f513ebf03..1f3c91368dc3 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -100,7 +100,7 @@ struct rockchip_pcie {
 
 struct rockchip_pcie_of_data {
 	enum dw_pcie_device_mode mode;
-	const struct pci_epc_features *epc_features;
+	struct pci_epc_features *epc_features;
 };
 
 static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
@@ -383,7 +383,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
+static struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
@@ -403,7 +403,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
  * default.) If the host could write to BAR4, the iATU settings (for all other
  * BARs) would be overwritten, resulting in (all other BARs) no longer working.
  */
-static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
+static struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
@@ -416,7 +416,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
 	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 rockchip_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 60e74ac782af..e6de5289329f 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -308,7 +308,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	}
 }
 
-static const struct pci_epc_features keembay_pcie_epc_features = {
+static struct pci_epc_features keembay_pcie_epc_features = {
 	.msi_capable		= true,
 	.msix_capable		= true,
 	.bar[BAR_0]		= { .only_64bit = true, },
@@ -320,7 +320,7 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
 	.align			= SZ_16K,
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 keembay_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &keembay_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index f1bc0ac81a92..6ad033301909 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -819,7 +819,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
 				    qcom_pcie_ep_link_transition_count);
 }
 
-static const struct pci_epc_features qcom_pcie_epc_features = {
+static struct pci_epc_features qcom_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.align = SZ_4K,
@@ -829,7 +829,7 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
 {
 	return &qcom_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 80778917d2dd..ff0c4af90eff 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -419,7 +419,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
+static struct pci_epc_features rcar_gen4_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -428,7 +428,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
 	.align = SZ_1M,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 rcar_gen4_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	return &rcar_gen4_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index 2cecf32d2b0f..8a892def54f5 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -69,12 +69,12 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	}
 }
 
-static const struct pci_epc_features stm32_pcie_epc_features = {
+static struct pci_epc_features stm32_pcie_epc_features = {
 	.msi_capable = true,
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 stm32_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &stm32_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 0ddeef70726d..06f45a17e52c 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1987,7 +1987,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features tegra_pcie_epc_features = {
+static struct pci_epc_features tegra_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
@@ -2000,7 +2000,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	return &tegra_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index d6e73811216e..ddb5ff70340c 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -82,7 +82,7 @@ struct uniphier_pcie_ep_soc_data {
 	bool has_gio;
 	void (*init)(struct uniphier_pcie_ep_priv *priv);
 	int (*wait)(struct uniphier_pcie_ep_priv *priv);
-	const struct pci_epc_features features;
+	struct pci_epc_features *features;
 };
 
 #define to_uniphier_pcie(x)	dev_get_drvdata((x)->dev)
@@ -273,13 +273,13 @@ static int uniphier_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 uniphier_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct uniphier_pcie_ep_priv *priv = to_uniphier_pcie(pci);
 
-	return &priv->data->features;
+	return priv->data->features;
 }
 
 static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
@@ -415,40 +415,44 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static struct pci_epc_features uniphier_pro5_features = {
+	.linkup_notifier = false,
+	.msi_capable = true,
+	.msix_capable = false,
+	.align = 1 << 16,
+	.bar[BAR_0] = { .only_64bit = true, },
+	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_2] = { .only_64bit = true, },
+	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_4] = { .type = BAR_RESERVED, },
+	.bar[BAR_5] = { .type = BAR_RESERVED, },
+};
+
+static struct pci_epc_features uniphier_nx1_features = {
+	.linkup_notifier = false,
+	.msi_capable = true,
+	.msix_capable = false,
+	.align = 1 << 12,
+	.bar[BAR_0] = { .only_64bit = true, },
+	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_2] = { .only_64bit = true, },
+	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_4] = { .only_64bit = true, },
+	.bar[BAR_5] = { .type = BAR_RESERVED, },
+};
+
 static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
 	.has_gio = true,
 	.init = uniphier_pcie_pro5_init_ep,
 	.wait = NULL,
-	.features = {
-		.linkup_notifier = false,
-		.msi_capable = true,
-		.msix_capable = false,
-		.align = 1 << 16,
-		.bar[BAR_0] = { .only_64bit = true, },
-		.bar[BAR_1] = { .type = BAR_RESERVED, },
-		.bar[BAR_2] = { .only_64bit = true, },
-		.bar[BAR_3] = { .type = BAR_RESERVED, },
-		.bar[BAR_4] = { .type = BAR_RESERVED, },
-		.bar[BAR_5] = { .type = BAR_RESERVED, },
-	},
+	.features = &uniphier_pro5_features,
 };
 
 static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
 	.has_gio = false,
 	.init = uniphier_pcie_nx1_init_ep,
 	.wait = uniphier_pcie_nx1_wait_ep,
-	.features = {
-		.linkup_notifier = false,
-		.msi_capable = true,
-		.msix_capable = false,
-		.align = 1 << 12,
-		.bar[BAR_0] = { .only_64bit = true, },
-		.bar[BAR_1] = { .type = BAR_RESERVED, },
-		.bar[BAR_2] = { .only_64bit = true, },
-		.bar[BAR_3] = { .type = BAR_RESERVED, },
-		.bar[BAR_4] = { .only_64bit = true, },
-		.bar[BAR_5] = { .type = BAR_RESERVED, },
-	},
+	.features = &uniphier_nx1_features,
 };
 
 static const struct of_device_id uniphier_pcie_ep_match[] = {
-- 
2.51.0


