Return-Path: <linuxppc-dev+bounces-15852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE202D25172
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 15:54:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsQxr4smWz309H;
	Fri, 16 Jan 2026 01:54:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768488896;
	cv=pass; b=U6VC/FD0CxBItGxZTQ/qpS/BL0ZdpQ7hrC5KULgdAdz3q/4Zw6RPSaSGU5q4VR8Fp5X2ZZ4wccRbg1QntR3SLylYIu9Q/4x1KNKM3MMaYCbq3edDj/ushN6Sevmvb3lq4N8agMftBp8jaqvINwFRGDnYGBpn6+hl0Ym35mkGWDaYN/400/qDH09fELQ1uPsqvHeCpgF5oUHBLZGc3F1K0y1P4T2ZId/A6KQwH3dWzjUNTa6zQewwZlVKiDPKBdvr/kuqMl6eD+AC4rr6Mqxg85PFinhCWU4LIK9ZPX8MKirq08KwVSQ55ZActXO+l4FAs/AGMLeBxCAFiV3BfkctYA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768488896; c=relaxed/relaxed;
	bh=jR1+HqszB6LPDXyqJ7cAUBRhItq5U9Myw5yWwyX2gc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W/l9x5NcgDUmbmhFJzvAzg0dQvb5Bi28q49MUFIFPMCKpMqaWQc4dOEuemT0zG27vAvqMcI32EMBk92cK17GdRAPPHbnlEgdkQPJ+bva5kK6ZF7ewC0ljArASLiy7tcq50c1LwCZMnnlwYmbl/zt9S1uCAT1IqwqgUTuvdFIswQ2x9Hz8OpB+AmlG8NYogZXc9tkelhtdIQepBv4vqE3rLYMIvzs3vt9xjHeYwQMP56XjBy8o0HJeulcViLXR4vCfXfsCiLHt1XyaXv8Z+kIc5SS9dGmS1M8zVd23K0HNs9VtRHlDdPyPzbEFV0yX6dR1Yrg4EQPWOiUnvyj+pPDsA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AEYDrxqF; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AEYDrxqF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsQxq4hfsz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 01:54:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7D7KGZ4aV799U0YH7iTXvHr6V0lmFXGZ46lJaO9yL6eD3Ri/5YICaOa1vGplvq8+AA/cnQqXfcA2rBNjyWVcfCvzdHtULdoZf8fYee90w6YMNkSUcS66JIA3E8JblUA2EXK7ZVI1jf4xYkES5lCgytubpAibEVqByqLZFSALl7Ech2tuHWp19QD+7wdydCREgr8vsYvqXmMaw1j0jp1pVWliInlC+TbTVpY2XHQwZ7IpE1kQDfknhaPeXa69VfiTs38EAlGKg1y4nYj/Bmm013Cx+tSgSGxGX39Db2v/W7RcX8MlXPAlGGePNfna59e0yPJcjjwb0SPBDPLD2Hkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jR1+HqszB6LPDXyqJ7cAUBRhItq5U9Myw5yWwyX2gc8=;
 b=oDHxlKMoi4ECsh2ziA/6zS/Gd7qpbBSUN0Na9coUcrRvjRVgqYf9iCX1TvYyKJ0GV1iuRBXhaCbBL3iZh3/PXJ4Nmg+8/j/TWZAQPARtcj2SXzBYN49iREmsrAlnwY10JOHiCWphmfIQ7pGEGLK2LpW6CQeIuo1M30YWaMam9/hfEC/qRW7aBz+bGqupaac/rAqcYo0LuOs+BfeP3OYCuTtWXxtKVwEJAoARfAAXoQNF7sw+wnh6G6NF3Y+PCuqpwXqKRN3+Mztj+Waokzg7NCteMP+ps7y1aUYHlYQCGWaFbExqCA4Z5NXPXYDn1wwGVzZD4Hs6QlEmn/NYmbNObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jR1+HqszB6LPDXyqJ7cAUBRhItq5U9Myw5yWwyX2gc8=;
 b=AEYDrxqFY9E5nD4SXRZChEbHocgg6apCLLqOxKhcIQ0/HEjRJ+bsZWxOOib/GULZb7o+Um2yMzHUf5EVomqdy6BLvqA+XCPODhgCsBIZfovF9EzSdkNBhZDZjfka/czFAURRhNlTNmn0vtVmCkq2O1eFqgvc88dA/dcgKpQoXaDSvsKPU5lsLM9DNah9klWsX2ZpE/KZPIt0A7iTWH6KT6E0lPqMX5T6NH+vsfXGHLa7QdFfZebdZav3JoIMn6gxDCgU8g2/A0gP8iX/jcv2iu3tO9vbs1zyjycL4AWSNvr6JZJk+VNVprzt0TgUZZALtZKRf/MYB8dMmT6RyE8iJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by DB9PR04MB11557.eurprd04.prod.outlook.com (2603:10a6:10:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 14:54:32 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 14:54:32 +0000
Date: Thu, 15 Jan 2026 09:54:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	cassel@kernel.org, vigneshr@ti.com, s-vadapalli@ti.com,
	hongxing.zhu@nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com,
	jesper.nilsson@axis.com, heiko@sntech.de,
	srikanth.thokala@intel.com, marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	kishon@kernel.org, jirislaby@kernel.org, rongqianfeng@vivo.com,
	18255117159@163.com, shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com,
	vidyas@nvidia.com, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v8 3/5] PCI: dwc: Advertise dynamic inbound mapping
 support
Message-ID: <aWj/loNWNNNQTLPQ@lizhi-Precision-Tower-5810>
References: <20260115084928.55701-1-den@valinux.co.jp>
 <20260115084928.55701-4-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115084928.55701-4-den@valinux.co.jp>
X-ClientProxiedBy: PH8P220CA0044.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::11) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|DB9PR04MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d59c8fe-ae91-4f6f-5ff5-08de5445fd7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|7416014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZHqzMfg1PiINh4WG6R/r4Nhw5nY0wUt3QjHLkfuCr4RbrZc6TfHYk/8qmGs4?=
 =?us-ascii?Q?5mBigkWpMW5UraB2u5Tic41lVEo5qy+UMjJMKN7egbQA/QtvyDmlxkTnYgPo?=
 =?us-ascii?Q?RQ3pT9VyU5MfNww/ny5LkdNoXh6zs6d7LXq9Ri/OzbR1/337Q0YMPsNaH5nb?=
 =?us-ascii?Q?pZ1IVzGY0/C51RtApzDe0vm/E8POfohXcGSoE9mqIp6jvv6mR00J8yeGzcGy?=
 =?us-ascii?Q?wN+M0uBOjDb/Zgc2oODS/oNIMeWA/PolFpNxAQ5bw52OT6o60tLjHF+8vEzA?=
 =?us-ascii?Q?eAVwamNekcBhzXDLUcwYKVLdEyqGCaXT0NyJFHJHS6/qw3aAjMSJcyxLFqq0?=
 =?us-ascii?Q?uokmZsNnqVF1zF/R2LumyPL6o28ssnKItxZUW7Zzh1NKYds7lSebgLA5yEAl?=
 =?us-ascii?Q?bL9yV9uSwnPH0jtgypkQlWtIggFlsLkE6+H2TdlgYned1MtxceL5ncOJcxNY?=
 =?us-ascii?Q?tBZ44onkjUApm0t0nBVgtqCeHEklIoxzyFATfacS3vEa+qfL2eFYsndXXWsz?=
 =?us-ascii?Q?U32jSqIYlYHpXJoXsA9HcQa2AUW95AJBbFxmoDLBJTwwsVwsfQKQqPPhIaMs?=
 =?us-ascii?Q?dUkqsRR4P9KC0TFfqeIcdmJ4cpW/0KtncyHkzyfHm4lqvzNR7zml7ie8cliq?=
 =?us-ascii?Q?5A5ztJGdbS8nSVbtZwcCoCAJgMfT0M+DyFbzdJ7mpeNhoxskNQEWBwIYVvfb?=
 =?us-ascii?Q?5WtLbWC8hpuq/u+/cs3H9qKNjpGU+pGIWwJ5PpJ2BRd8o8p6k453kc8tttgv?=
 =?us-ascii?Q?K8qOC7ARj1ITuH10UuTcy4mwXSRpxeqdSfGMC7xx8rBgGLeA5BD/hMfxXYv5?=
 =?us-ascii?Q?FwZGeaSboq/6BjrQRALmrR3wT5ZEgjwvyAkruWhC2gbGxhMQ1KwbnOEeTRX7?=
 =?us-ascii?Q?D9Uj4gdK9jVWQ194JsdgrHt8+Y3G4UrPrAv2W+fAyxJXMxZQQtxIzTU+/2PH?=
 =?us-ascii?Q?piNenDBdcFpBb0pdcwnY51he9wZuGCX9yAAhNZdUIu4d5/Jm1bO+s6m8h64y?=
 =?us-ascii?Q?1L02xGdPTIlyaWb/SEmXMWZgRoS9Zd7kgin0VY1nL/zNqwvNR21Xpt+2LpoF?=
 =?us-ascii?Q?a/W/bocAyaXqCsjljK/De/d/HJbGRNy/HOjLBu+eJakaa8wCbX39Uvd5+Ai2?=
 =?us-ascii?Q?02YQCIlLBzzTq+m7Yb5mKQ3nXmhDKmGZ8EYoyypK+kn4IXM+CFY0evyk0Usv?=
 =?us-ascii?Q?N6DR9+GL2QxJ2gVWJd+SKhyyvS7RzqYJ+mqaYin7P2uDQbsYHhmPakBjHmNL?=
 =?us-ascii?Q?fQwVPhHGW34LnLfENmKbhWcEyWvkb8QtGer8890DNO4Q01HWfAOtkmUcO1rX?=
 =?us-ascii?Q?dca+x3B8f3NLgbXt++1I3dwAte3G0CBSKh964rT3CG9K+q605Wy62gFtMhJw?=
 =?us-ascii?Q?2wHZ7lgE/dHPG0ZCoF3dJ8msoWefGcwARPkuRvQ754t+mbEVhsF0dJwAHW4J?=
 =?us-ascii?Q?fyq7ThLVLbhb3iiahIj0O0uZEvYNf2l5I3+pBZB/Vt6RFiyp4JpntSPJVrSM?=
 =?us-ascii?Q?sl5YnURUH+0SniT+OWTiXv9ax3zmy0PB+DdyD8XaC7dAhDTlRzGrTN9/vLEp?=
 =?us-ascii?Q?bkndrCYPuAXoYTQCY6hj6SbHVvwvSAlfThwt4oqD4H44ZcPpEUmwvd04c6P+?=
 =?us-ascii?Q?bSSfMCBeDf+f1RP/VZOJazI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(7416014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?au7D6pqd0H6Nmo412zhxO1BdxNxS8VMbFr01tUw0kIC/Tq6XiEZBPCmJDtv6?=
 =?us-ascii?Q?CYPxGicOwwEuz8kfW/UxLzAO+s1nLBX0DdVtihfKGf6GKtltyFwYFaVrvIL8?=
 =?us-ascii?Q?DJhFrPL89tmcaGzDAnO3KAOvr0kbu8scUqb/NbnIGjDv70njWcEpEcP+xU/w?=
 =?us-ascii?Q?QMmGF4CESnGqUNxxHlr1xfO/SSqCYlbEXfQ1BPbCfEJqZ6Z/YeQbdB2FqddV?=
 =?us-ascii?Q?SykU6N+HaD5TqPALmUHxsJ/S6nJ/8s673RIrAqjAyFv/MUYUG9mvRHxbfyC/?=
 =?us-ascii?Q?nAhYKIE1EVDFuiyMhqLL6/AOpwRVb0HEGqajm/CsshqJkXrVo27l8zstFK/S?=
 =?us-ascii?Q?NLF2lftbdFOpsxpXt7BiFC/ifFJ0hdvXvtIE0GSVUUzSHhPq47GX5WV6qZRi?=
 =?us-ascii?Q?DPb1aWzTPGbj6qHejYthFMeerJMXzRP4kJuzqz7y+vjlbgKzyP+cuaYGAu8m?=
 =?us-ascii?Q?YUCYfSg3lfwU7CXpqIOe0t0nxKKNVNNueFqcycOGaVN3hy2e2qhtPKOWZ23f?=
 =?us-ascii?Q?9S7uFf9KazVgmSKPHNP2H0gI7diD1WwtUUlmS3uw76kU5Ea4Fl91/muvbtZ9?=
 =?us-ascii?Q?L2NPFZFg77/WKnf2bY6MxyXTY3cxSBsBNmdRdoCB1LLKCKSmbWcYruERfxsz?=
 =?us-ascii?Q?k9jstvKpM48wCqUIiE8YhaSw1Rbo4VjZ0KpfX+NQtYtFF+5RxfNqNEgW/7yz?=
 =?us-ascii?Q?/gcjzFgZvdqdlgqVnwWTxLzx4aF9KnOlOx1VMoIMZptS0UUV9fE91tBjydbZ?=
 =?us-ascii?Q?xKXTn5qCkLMYc+j4ZG8d0sh+sgQZedzx6AN+TgagPjlcXBYxtPweJjNitLRQ?=
 =?us-ascii?Q?7vDXp6J+ExeGLs6dbX8dgLtjM1WfXk5U1nvYm1nmccN41NiuSIHjS38LC2d8?=
 =?us-ascii?Q?SD4RvDRlRexdFzc6Us69gQjGHvfO5fgrDXY/fAQawhZQHT64yN25yYEEDPg2?=
 =?us-ascii?Q?9LJvpsgCXCHsl7trVnicfkNpxvyK0NqK/bcvC6dZajMEXUiF2uF3uurOFb0m?=
 =?us-ascii?Q?gY/RmzmTE8g2MDP7TUGHylZJlYOK7GFeX+DtKoSkW0Q4y6AcuSpifru0oBqV?=
 =?us-ascii?Q?H8Gz4lqypVQxBu2Y90AgDT/2ATWAajNHDfCn6lzCJwtIIqrhHE0sVyXS2DAp?=
 =?us-ascii?Q?PR9DWf8dR+Jt27lylUJEv6Fa9y//5fLQwoTeGoX4Vuznl5Jr3m9ZVR5gRvqG?=
 =?us-ascii?Q?DbNwfX6p1KFpwg3XIt02sHBtJl66BZ0hUcuqc74EZVNlNOMPJnFzM2LSZ8Mv?=
 =?us-ascii?Q?Bx1jvZpwMWMzlLwCx9PJPlwdHst9GQ00VWYCEKV+KICKGobb1oig4cLVjfIq?=
 =?us-ascii?Q?LvjOxgBGnpkujKUFDeU/0EjYHxedOoDWWKKYNRlW0oYVq4VQpXB7eg1iByUV?=
 =?us-ascii?Q?kfIbHR4z7Az+CXEwO2u6xBk5fGXzd+Yf1GmcCsdiMOdElWAycuKcD6KBDSuI?=
 =?us-ascii?Q?G08EOFdPk7hB7d5/QgSlqXrMj9Q0QIXh3gW3ECT0WRB+I8oCaf3XzPLT2e9F?=
 =?us-ascii?Q?ORQBxjh4GmI3+pp1krOVlAF/QPoFWzQ7cfd83yKT2bvsgmuewsEZnMB9pXMU?=
 =?us-ascii?Q?l0dSfEWQwqsRYQC1+l6xBggQ8kgaI5Ccxv/Un1pgT+x44PqMZ+8xx297F06P?=
 =?us-ascii?Q?L8ZKr9yRp4id5Vz93jr4S5SoSWSknsmAALhgtB+D5sSFQUIOdndVHDk+qu5k?=
 =?us-ascii?Q?pl0OMMJNxhOLmKXxUZFqXLxn3ipYJapk8vCclfX0+2fruH7mqfPXoTcY37ih?=
 =?us-ascii?Q?2mvqR3SK2A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d59c8fe-ae91-4f6f-5ff5-08de5445fd7f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 14:54:32.1642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aiEGGjQB6i/4kIcyd+8iOtxH0sFzTdBUQBCYgt5ThTD+ZzqALAKWplXv2LLEO+KZnVceP6yGOgb210f1nno7cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11557
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 05:49:26PM +0900, Koichiro Den wrote:
> The DesignWare EP core has supported updating the inbound iATU mapping
> for an already configured BAR (i.e. allowing pci_epc_set_bar() to be
> called again without a prior pci_epc_clear_bar()) since commit
> 4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar() update
> inbound map address").
>
> Now that this capability is exposed via the dynamic_inbound_mapping EPC
> feature bit, set it for DWC-based EP glue drivers using a common
> initializer macro to avoid duplicating the same flag in each driver.
>
> Note that pci-layerscape-ep.c is untouched. It currently constructs the
> feature struct dynamically in ls_pcie_ep_init(). Once converted to a
> static feature definition, it will use DWC_EPC_COMMON_FEATURES as well.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/pci/controller/dwc/pci-dra7xx.c           | 1 +
>  drivers/pci/controller/dwc/pci-imx6.c             | 3 +++
>  drivers/pci/controller/dwc/pci-keystone.c         | 1 +
>  drivers/pci/controller/dwc/pcie-artpec6.c         | 1 +
>  drivers/pci/controller/dwc/pcie-designware-plat.c | 1 +
>  drivers/pci/controller/dwc/pcie-designware.h      | 3 +++
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c     | 2 ++
>  drivers/pci/controller/dwc/pcie-keembay.c         | 1 +
>  drivers/pci/controller/dwc/pcie-qcom-ep.c         | 1 +
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 1 +
>  drivers/pci/controller/dwc/pcie-stm32-ep.c        | 1 +
>  drivers/pci/controller/dwc/pcie-tegra194.c        | 1 +
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 2 ++
>  13 files changed, 19 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index 01cfd9aeb0b8..d5d26229063f 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -424,6 +424,7 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>
>  static const struct pci_epc_features dra7xx_pcie_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.linkup_notifier = true,
>  	.msi_capable = true,
>  };
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 4668fc9648bf..f28e335bbbfa 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1387,6 +1387,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>
>  static const struct pci_epc_features imx8m_pcie_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
>  	.bar[BAR_1] = { .type = BAR_RESERVED, },
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> @@ -1396,6 +1397,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
>  };
>
>  static const struct pci_epc_features imx8q_pcie_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
>  	.bar[BAR_1] = { .type = BAR_RESERVED, },
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> @@ -1416,6 +1418,7 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
>   * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
>   */
>  static const struct pci_epc_features imx95_pcie_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
>  	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
>  	.align = SZ_4K,
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index f86d9111f863..20fa4dadb82a 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -930,6 +930,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>
>  static const struct pci_epc_features ks_pcie_am654_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
>  	.msix_capable = true,
>  	.bar[BAR_0] = { .type = BAR_RESERVED, },
> diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> index f4a136ee2daf..e994b75986c3 100644
> --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> @@ -370,6 +370,7 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>
>  static const struct pci_epc_features artpec6_pcie_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
>  };
>
> diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> index 12f41886c65d..8530746ec5cb 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> @@ -61,6 +61,7 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>
>  static const struct pci_epc_features dw_plat_pcie_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
>  	.msix_capable = true,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index f87c67a7a482..4df0cc44faab 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -305,6 +305,9 @@
>  /* Default eDMA LLP memory size */
>  #define DMA_LLP_MEM_SIZE		PAGE_SIZE
>
> +/* Common struct pci_epc_feature bits among DWC EP glue drivers */
> +#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true
> +
>  struct dw_pcie;
>  struct dw_pcie_rp;
>  struct dw_pcie_ep;
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 352f513ebf03..f985a934a137 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -384,6 +384,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>
>  static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.linkup_notifier = true,
>  	.msi_capable = true,
>  	.msix_capable = true,
> @@ -404,6 +405,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
>   * BARs) would be overwritten, resulting in (all other BARs) no longer working.
>   */
>  static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.linkup_notifier = true,
>  	.msi_capable = true,
>  	.msix_capable = true,
> diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> index 60e74ac782af..2666a9c3d67e 100644
> --- a/drivers/pci/controller/dwc/pcie-keembay.c
> +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> @@ -309,6 +309,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>
>  static const struct pci_epc_features keembay_pcie_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable		= true,
>  	.msix_capable		= true,
>  	.bar[BAR_0]		= { .only_64bit = true, },
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index f1bc0ac81a92..5e990c7a5879 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -820,6 +820,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
>  }
>
>  static const struct pci_epc_features qcom_pcie_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.linkup_notifier = true,
>  	.msi_capable = true,
>  	.align = SZ_4K,
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 80778917d2dd..a6912e85e4dd 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -420,6 +420,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>
>  static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
>  	.bar[BAR_1] = { .type = BAR_RESERVED, },
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> index 2cecf32d2b0f..c1944b40ce02 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> @@ -70,6 +70,7 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>
>  static const struct pci_epc_features stm32_pcie_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
>  	.align = SZ_64K,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 0ddeef70726d..06571d806ab3 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1988,6 +1988,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>
>  static const struct pci_epc_features tegra_pcie_epc_features = {
> +	DWC_EPC_COMMON_FEATURES,
>  	.linkup_notifier = true,
>  	.msi_capable = true,
>  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index d6e73811216e..d52753060970 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -420,6 +420,7 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
>  	.init = uniphier_pcie_pro5_init_ep,
>  	.wait = NULL,
>  	.features = {
> +		DWC_EPC_COMMON_FEATURES,
>  		.linkup_notifier = false,
>  		.msi_capable = true,
>  		.msix_capable = false,
> @@ -438,6 +439,7 @@ static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
>  	.init = uniphier_pcie_nx1_init_ep,
>  	.wait = uniphier_pcie_nx1_wait_ep,
>  	.features = {
> +		DWC_EPC_COMMON_FEATURES,
>  		.linkup_notifier = false,
>  		.msi_capable = true,
>  		.msix_capable = false,
> --
> 2.51.0
>

