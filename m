Return-Path: <linuxppc-dev+bounces-15648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD22D1A17C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 17:08:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drDgW6twPz2xl0;
	Wed, 14 Jan 2026 03:08:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.228.138 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768320503;
	cv=pass; b=Q0ERvcW6L3ZwZq2jKIGcfEJDEuxLSi/i0b4YXFufgsgqEO+hrYWPqAsnknwPDLhD9jeoGXeEmf2EPSCQCIY+UrbAdMqC01v44cfkikclWVhAopmCpjTT01YUNaLbKK57GBvpVysUoIYgxcS91raH3N13UhxUkyXDybcjxBfSOZ3Ft6/L1Rze0Ee2CNwjSU1ED6R3aaFxB+mRFhtQ5vcAUrav4FnEAmQLEJeDyeS6FrQfbs9WmLaKfp5Y3tjx76HEleUY0XvY9lO+jGtqwL65It5KxNX3/k+PMHkvC/5PX32jmhYN+QIUw04DmjMCm5LQfDEcyLRrP+EWyH81pAiIaA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768320503; c=relaxed/relaxed;
	bh=949QPzK8boFEecRA0fKPbQZdTAJAIVuK3CJTgsdmwBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nd6t+NaruhV3AOfir2Lck4lte4pzJhsYTftL3LsLBNj3gxRo733aOrJzPtQGS/SNmfb6Oq6jhE7UmNV5WoOCFL4oOqNCHxMUnWMse/iIa+NNpc8fVS5T4VOeUC2zb4N1qT5d+n24for4HcP9Wh1Qxe8Mva5WBy5A/2OUdorpxomdh/oYLO6qJ2W8dT6VlkE4yNgPDHg5EmcZ9Jm4v6exyTmoyiC/GjBPdTjoMIp+QtR0EcjmAzMj4eRMCrqOLmMadFcpzszawNVh7aexVW1cyA+wR4AOjx1xADkM7k/A2XcJ37DxbEEEE/obwJ9ZBrCEW/F46sfgg8ndDw8/BijK8w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=GkD+pgie; dkim-atps=neutral; spf=pass (client-ip=52.101.228.138; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=GkD+pgie;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.228.138; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020138.outbound.protection.outlook.com [52.101.228.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drDgT2k47z2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:08:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOtGEw3bha7rHQpTKF8I6Muy58zcgZY7aJa9YXemyTT/vP0Lil1vEWUrFradiqhMJk3Ivhaz1LRudk1f8he7sTo2DCJEcYQID59lXHFcYO1TYvXykZARJghfp2pcA4B7NITbq948RlcHFRpP0tw16OmULDHDroJ3XtEFJJ44Hlb2vuoUHnUCht4N6pq/kFhAFHp11PiEdL5G+wfrvzWWcGafhjw9xJ6uSFwrBdu6ZnCQr6TDLU49J2syzl9kPC0HB+otzq9WLxhOO3IVMmPTAh9TSCusjJoCij6P85IfiEepho7Gt+s/FrLtWTwDTtYam4B73EY9CIXORCP9Ofev3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=949QPzK8boFEecRA0fKPbQZdTAJAIVuK3CJTgsdmwBo=;
 b=vsOkY8Mq2U/9uot1H6WwPKq8jD+ksefNnZfi3RHpkkIP0FZGjqowanzzqSTwe0C5APC3W7bIxL3+Ep0wsMR06gMmdQVQcx7a5xPmdleGZObuJvDgzwpi7UlwRG+qYEPTWIQ43Q1b4yICbAj286kaQLOR1h/fG593ELW9BSrUe11kVQD0ksW8u6KIDulHXC6rH23xxBaKfLTuXkaq91ZONia1KBEOYaAAu7xT2E+m6cvyNxgYvo1aPWHghDIrngFhYozJQxwXlpoU4l6sCrqKL6xiRclZZLYwb6ikUTVmPJc8K55KhoCeRy/sVilGdLNi7TXeFlud6fSQA+BUGnqG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=949QPzK8boFEecRA0fKPbQZdTAJAIVuK3CJTgsdmwBo=;
 b=GkD+pgieXHvxFxKFRQAXrhQ08Wp3rGPqWzuMAa3f8veNb7ofvTCDj6WbZdZDpIJ9bP5EtbbZX7lbfJQTOCUWNJAYdkn5jfXI47MYhMGCNMKP6G9wjoRaz/3RCZXOERaYHRf1q7Xq0Zt7VGfziFvVA3pppOVJxe204mCI4tLf4XU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1689.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:112::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 16:07:39 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:07:38 +0000
Date: Wed, 14 Jan 2026 01:07:36 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, vigneshr@ti.com, 
	s-vadapalli@ti.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, 
	jesper.nilsson@axis.com, heiko@sntech.de, srikanth.thokala@intel.com, 
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be, 
	magnus.damm@gmail.com, christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org, 
	rongqianfeng@vivo.com, 18255117159@163.com, shawn.lin@rock-chips.com, 
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com, vidyas@nvidia.com, Frank.Li@nxp.com, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v6 1/5] PCI: endpoint: Add BAR subrange mapping support
Message-ID: <6dplmb2csjthlzbzqrca34a5px5osavj5ziij7snfyxbhpumlb@b4wupbsld7ph>
References: <20260113023715.3463724-1-den@valinux.co.jp>
 <20260113023715.3463724-2-den@valinux.co.jp>
 <aWYa59GgcB7jOfQq@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWYa59GgcB7jOfQq@ryzen>
X-ClientProxiedBy: TY4P286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1689:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d2828d-457f-4884-d2cd-08de52bddf37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2FYQ86KB6a1ICrgGLto/G0aJHzbgC0StDWrNo3KjexOwKW2M7dKMK84DMq1X?=
 =?us-ascii?Q?HeX0dDAlFfMuqhG1Mf8ic5rd0dot1Nfz18T/KFXiHHg7lf6IYuGkNawQNePq?=
 =?us-ascii?Q?DnHrWGsbFvCB/6w3w+XCVfjtYHRXhXWeTn0IGtTil3P7O+9Nj/MgmHGNPH8j?=
 =?us-ascii?Q?ITB70FfsqFWKwy7Huoz/junG0n/T3gP5IhdBe937l6J4JLEVHjLa6RqcRnQ8?=
 =?us-ascii?Q?bXNEmIDrtf7prQfVORfkAsQ9dLO47R9Nbx3crwb+Hk4D8l4e9Ntd0TD5KSud?=
 =?us-ascii?Q?8kZMaSShgegZi2Oqj2k2Kns8qk8jHLZWH7MlWG3JtT/if7AMIeoISzN7L3yD?=
 =?us-ascii?Q?UMLgXs+oN8Jw+ALFzW26YIB8tcc5Hn2X804Car8jYnu7iOxPauVnd/CsQV9n?=
 =?us-ascii?Q?4MuPamlCtSmHHURtaGhIvAPUOegcNCNEHdAWs4V2ywIfjZgqRWVmbwDwrC+S?=
 =?us-ascii?Q?FNzcvc3R0noD0t9YV1X6Q9a0fhQxTw8Ojpt2F0eVlg8SmhH0mAVfEb4mlFi7?=
 =?us-ascii?Q?uFQOdXycYJNpWIUTqMbrkMGSjFBlIZ7omn9lvKdvB7aSkSk2O4XOLksZOC2A?=
 =?us-ascii?Q?V1Z0bZsQbD+mvmEkgie3khc6hxgkVWUfSxDYPTGPgEmwbmTXh6TXvBXjeHvH?=
 =?us-ascii?Q?X46we0FrU0EtkJO4tfL0G+yWxZAFzmM7bbny/ANcYDsnuwW1o4z1Bg3W8NO7?=
 =?us-ascii?Q?IuYF/TNDsyHIMoyLl865UUanfuGiIoshfeFj3Ic1lI4AyD6y1q9vpmho8/QG?=
 =?us-ascii?Q?eIpD0+dECePaF231eZ7AJAu37i9lkTSYfVCAujbkXM4ZEJOFpeuKPS0h+KnU?=
 =?us-ascii?Q?Clx3FZIhzglsaUtKbPVr4KaRZMRTkxgrKdmbhyvBoU7hW4jBxFOUSOUVMYRs?=
 =?us-ascii?Q?Jeh8H+B8csrxdk//hIZ711s8AReJPdHCCCbm42nN3uXNWNfU0G8LQHUTjdyu?=
 =?us-ascii?Q?oLajPGrQ3ucJU5aKRdoptR3EoAObVzFuzBqHZs6mgTdH22CLBThjg40sbIyn?=
 =?us-ascii?Q?sHph/Z+4CVGg/1Zh6YLo7duK/Lh6IXjkuv2a/qh2L4ggwYr34Yc/pbYaSSih?=
 =?us-ascii?Q?UOjse9BoXJDhZnO1LhXcLpwKGdDuegnW14JaLfEaqv5ngdCYpvqm1+PjgftW?=
 =?us-ascii?Q?J9icuda7nelB+PxJWTRAdlHYupMLUjnzzMswtVV5evo+idjKrkcev7gliUSs?=
 =?us-ascii?Q?iZ0zXy2FCR/xcBRKBR/s8r18DbaHGKbMikur7mYlWK5zd4/Dz0WzdMMlrSCo?=
 =?us-ascii?Q?C7/T+vRn8SoF5pZPuWoUOS77OcZsfsi3bUH+hf497JutWloURfhJI6oQyWgU?=
 =?us-ascii?Q?ydLGnjoEzvdL15tCdlVbF5YVwqjivbe86lvNR+0jvH4hhM1Qs1yvwWgOsSSD?=
 =?us-ascii?Q?dWbEEwlODlQtZwqwMU0CByL3sD6tm/U0zeVR1eQnEXH6yZLAJJtmSMBLcTk3?=
 =?us-ascii?Q?2XKDtaocHuE/i8UlJVYoS4iS5ZYuDmk7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EcwK6tDPM1zmZ/x2FLZIsr1Y2381zUx/kFrngCnKSzpHo3SFJtGdctv/FwRh?=
 =?us-ascii?Q?Xq1yEiDqnoXxBPRVyJ4DsLdPcyfp/A7aL7x6vpryyTw8YvkAtIU4B3FtEv1P?=
 =?us-ascii?Q?sBVmh2hwJFEvXDk+fjjY+S/XuPBeuv27W5RZ4JJdL0WkcDu96/oaAzsefSY/?=
 =?us-ascii?Q?AncoBAZRQnsiWa5XP64uykRRzPkF6zU2fjuYN2ulB9HLiSOCGvCg0MkqdUeR?=
 =?us-ascii?Q?3Qso96lMp40KxdEKWa/iojLgPzHCf6i2koRg0sH1nIeW4siw0/DKE4WfTvRs?=
 =?us-ascii?Q?ipQ8nCSeICmUyuwgSGlsvpaRLU9Zk7MxBQGaXSEzXROjLU8jInvKDYcee2tz?=
 =?us-ascii?Q?gQJoM7xwlQak2ATkxrIXnL+G8LwC8JB37ewj3L+s/P6qb3GxWes1apD1rUQJ?=
 =?us-ascii?Q?BCTXjCI5dA6D5jwMt1tD5xc0O7UVEYXcS/l/34vyB6eBFbJrRk4Go3aT5AOG?=
 =?us-ascii?Q?6740JcYMzrk0nDA8v99wy/4dmxhAeNUaz4upWrTLIG737u2M9r4vfh427OhJ?=
 =?us-ascii?Q?IUGnn5zHNUr3PiqljEepgHMELg7u2bFaZufi+9KOrBPKoKxuLpS7KHnjsWnD?=
 =?us-ascii?Q?Wxyh18QZXp2LjAIhQsZafSeZEUjvBNoTV/uyLHUCffL3POy1rka6MR9NIR6w?=
 =?us-ascii?Q?HG2pxUazXxkky8Jlc45U0SqZj6eSamqQCXRKBAa1gjs/cbEXpQk0QNpAdE1A?=
 =?us-ascii?Q?vbaOztygHUoi944t0aKzI2ORpZ6813ZN+VxAiled6+wPhkbd5V6t1VNSuOYY?=
 =?us-ascii?Q?tzzDNFGADwsyqUnJUKiAp6A/ptAXZ01ENvsKF0ZJOqMnlbAj8vbRfBW2ByxM?=
 =?us-ascii?Q?xwcJiY9XIly7VW+FdWwgqLjB+9l6CROgOLU7PT/hjJYf5LV3sajf5h0QtkWj?=
 =?us-ascii?Q?iRTEtY/gB0gYBW6ry3qbKY9sVA72Efk9wskM7Zg/WJB4iImWCcfW9zH7wKWN?=
 =?us-ascii?Q?LtfuJpBZIltXLeD4XjoWN3/8jzpOIe6qgXovVULvQsbU0N24sbAufHKM0yn9?=
 =?us-ascii?Q?Angtw5jJiuh64jK/4g7zjuZfvv3Hx1gvjiqsVU3oQM9bblVk+VUZpxjypX6J?=
 =?us-ascii?Q?YOukMufXZgM1SjYipwYWpC4tBDqb3gkvKf/hyw/LpewUCgZ/uAk79ANpjMKl?=
 =?us-ascii?Q?qG6bJKMrCWqPl26r8QIvWykL174eQLVcQIB8yKEXwASJkr+S/nw/kPbZJSDC?=
 =?us-ascii?Q?neji35gNTAh+wXKLohxeDeMbgyrJoG4e4unnZJsyP+0CTk8GMP/HB1iiW4P5?=
 =?us-ascii?Q?ugsqmEMeJVMlv6o+sYeqpk47JN2FCh8tx5/xI69/f2YvvqSIKL/EIuQSMH7D?=
 =?us-ascii?Q?7OfG2zelkA0T2UA/nULKGoEkpY4JR/5HigKWa0LsuV0hZWMwvvLNInPUUiL7?=
 =?us-ascii?Q?X5IWqQKKdQ/I4uD/aGprDkeJp80IWqWKAm7kY4JIfhTydAMP99JhjNv4iw+S?=
 =?us-ascii?Q?9VqH12glt0x7e8AmTuVOA1LSa24v5hGzCgE7wN/yEBIALOGI2xLkC0NcgYkT?=
 =?us-ascii?Q?A7rmaSSKDVm9aKbclGvGt+B87lGTa1zERQhGOw8d1SRlmWYNIZkDLBgPb2BF?=
 =?us-ascii?Q?dewq/nEgY/vJ5WN56HpR6I3fpRneaFfKyLxxSSMgw/8OFQR6LVyZJdw0EFTm?=
 =?us-ascii?Q?RGtYH4E9qt3zm5kjw1r6xsDqcCh1h8U95vIt0KTk3m6DxoeRwaEpFGczcjAA?=
 =?us-ascii?Q?qFJ8J7kePc1a4bshGBDC8EXv/Fze6EhSWnq0gVtD0SaUA9YXw1LWGupJVbkk?=
 =?us-ascii?Q?BCVdLmSr5joMk47nPdksdEa8S/GaJizmF5gJGe9QaoBnU0VzUnL6?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d2828d-457f-4884-d2cd-08de52bddf37
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:07:38.1216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76x3HgFb1Ocxk0pCD3R5z0ToHQF0Yw+EDK9VwP4Ckw0qIGeEM+/3ItJewOmn93bhK8e2OPupapsFd0FKoE/kgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1689
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 11:13:59AM +0100, Niklas Cassel wrote:
> On Tue, Jan 13, 2026 at 11:37:11AM +0900, Koichiro Den wrote:
> > Extend the PCI endpoint core to support mapping subranges within a BAR.
> > Introduce a new 'submap' field and a 'use_submap' flag in struct
> > pci_epf_bar so an endpoint function driver can request inbound mappings
> > that fully cover the BAR.
> > 
> > Add a subrange_mapping feature bit to struct pci_epc_features so EPC
> > drivers can explicitly advertise support. Make pci_epc_set_bar() reject
> > use_submap requests (-EINVAL) when the EPC does not advertise
> > subrange_mapping, to avoid silently accepting a configuration that the
> > controller cannot implement.
> > 
> > The submap array describes the complete BAR layout (no overlaps and no
> > gaps are allowed to avoid exposing untranslated address ranges). This
> > provides the generic infrastructure needed to map multiple logical
> > regions into a single BAR at different offsets, without assuming a
> > controller-specific inbound address translation mechanism. Also, the
> > array must be sorted in ascending order by offset.
> > 
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> 
> I think this patch should be after the:
> "PCI: endpoint: Add dynamic_inbound_mapping EPC feature"
> patch...
> 
> 
> >  drivers/pci/endpoint/pci-epc-core.c |  3 +++
> >  include/linux/pci-epc.h             |  3 +++
> >  include/linux/pci-epf.h             | 31 +++++++++++++++++++++++++++++
> >  3 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> > index ca7f19cc973a..8d809a2c3ce9 100644
> > --- a/drivers/pci/endpoint/pci-epc-core.c
> > +++ b/drivers/pci/endpoint/pci-epc-core.c
> > @@ -596,6 +596,9 @@ int pci_epc_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
> >  	if (!epc_features)
> >  		return -EINVAL;
> >  
> > +	if (epf_bar->use_submap && !epc_features->subrange_mapping)
> > +		return -EINVAL;

Hi Niklas,

> 
> ...then you can change this condition to:
> 
> 	if (epf_bar->use_submap &&
> 	    !(epc_features->dynamic_inbound_mapping &&
> 	      epc_features->subrange_mapping))
> 		return -EINVAL;

Somehow this slipped my mind.. Thanks for pointing this out.

And I don't have any objections to the rest of the points you left comments
on v6 (patch ordering, splitting, and doc refinements).

I'll address them in v7.
Thank you for the detailed review.

Koichiro

> 
> 
> > +
> >  	if (epc_features->bar[bar].type == BAR_RESIZABLE &&
> >  	    (epf_bar->size < SZ_1M || (u64)epf_bar->size > (SZ_128G * 1024)))
> >  		return -EINVAL;
> > diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> > index 4286bfdbfdfa..898a29e7d6f7 100644
> > --- a/include/linux/pci-epc.h
> > +++ b/include/linux/pci-epc.h
> > @@ -223,6 +223,8 @@ struct pci_epc_bar_desc {
> >  /**
> >   * struct pci_epc_features - features supported by a EPC device per function
> >   * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
> > + * @subrange_mapping: indicate if the EPC device can map inbound subranges for a
> > + *                    BAR
> 
> This text should probably also mention that this feature depends on the
> dynamic_inbound_mapping feature.
> 
> 
> With those comments fixed, looks good to me:
> Reviewed-by: Niklas Cassel <cassel@kernel.org>

