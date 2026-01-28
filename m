Return-Path: <linuxppc-dev+bounces-16357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEeZMur9eWm71QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 13:15:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A251A10F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 13:15:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1Lny2stxz2xm3;
	Wed, 28 Jan 2026 23:15:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769602534;
	cv=pass; b=J2/94oEL9mRnclNR7azerycFa8bu/yShQJg4Z8Bl8ShQXQwt/y4kOeP/SEsOnBT6befgIH8owoPiJ16s2YKRkOqyLoiMkiUyTZYevL6RGI1Xo9hZ6cDInskASejm3ib7DoU06MbFAjnirtJS9OSCJTL/rGYoqAAUM68HHg84zn80GlkkHAF10R0rkA5ZCwLUkqsY+1zJguJbWQVnYhxaVkdg/eDB8DZbOjozsa4idIqSixxpM+0g23cjsH0ebGK5SdvcBejo7n9SRxQxmk7LTE3uZlZfud2PU6vRA7d9EOFQPcpMc42QoIdzo6lz78k4VYiVKsieL7tACfY9+LoItg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769602534; c=relaxed/relaxed;
	bh=hGUCGEUTZmV9NkDi4ZfW/afjM7L4Zp8bGdcT+I9l8lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LAaSF9+Wo4PpXfoKzHtA7h4206sDPx6ehFXgY2dyfgPxkhK8vu6PWAHovJlHpkF9qEjo+6H6e/63Z2MjUW+9aeMxB2ffXjajEJk17RuPUP0bSpNY+2CffELiazK5Hfw/tNYMQOIqungIE4IzRDIRda9vN5fJZO+uH2KgHICGjzG1YoXPXElZXESS3cKuMvkV0xMSt+lkjp6gWLP3Yfn6EuzLcgfbl13GYDInT3am0Chqtffp9jRWq9/3qnGJxBb1x83Qxg/OweURulvolWH3hKV/VAhlexfqGgMeihQ2/lUHBbKTixxo+sNA1ixLUJIepY4/22PC/BgE/giget5KKg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=edSuEtH6; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=edSuEtH6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1Lnw2HF7z2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 23:15:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElBRP1RU7q2UGQ8DX8wcwd8vSs+vuU12jdZoYFUuFV44hqfITroAuMuIk5JC2pTPmarErlmZG2wu8A15Y4zrjHf76beMfu7vhyLtGMfSAcgyeR+Rn+Y6/wywpoDzCHUoBU7s6ICRinLnLG0ldJOUjqkX2HFTwn1lo7WFLui7iAyQE7mv+ZpilnffNf7wqg0meEcOpE7N9gg9HuW2l+QHMD5GScqyZ0WqxEPPXwwjQgIOvlMFxkpUfmOHxnHQKon4BcpND/EtN2hyYj4myTcqafssMGjVKWzOpipFpq44XPDYmxW9UvuebFFmVMCHq5BunEOQDkxpFGnp4jkmjEgb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGUCGEUTZmV9NkDi4ZfW/afjM7L4Zp8bGdcT+I9l8lU=;
 b=SrKz42cr5ZX4gOLdPAdHv6+YIj6qYshzxiKDqfn4Fww/jVVchycmh0OxC32QqAk/rJd6TNweGeExqYPEbBFXLplAysu9ojahUv3s1Qp7+jh/ZUWeAtVa6Tbb/hiCtQDX1Q4BOy/MKjIfHbtHTL7Yup5qEHtYtMtFhm/Lcv6tiOnlxoHYp54U7Zi5DGuC3elBevvQtpBhBl7jc8axtGOXutK2PIytgnmFFVn19za8J8bdnKjj2R/zXgE1d+SFtpSqoVQsgxYM73J0gbtyhwjpTOebZbgK/t/sFc422ddk/f5gkwEcxJRGg3cNR40pOMB2j/yy7tuBRg0GLhnI12hiiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGUCGEUTZmV9NkDi4ZfW/afjM7L4Zp8bGdcT+I9l8lU=;
 b=edSuEtH6fCUHFjSaHsvB1F22TVjChqHI+KV1UjqEtRBR+MlEVR8Hvrlrz7dX4pi2rqevsuG6IdSdWydl5y26g+dp00+2U+C32Z1yLjwLIn/V3E6NWecgyir9KuJHP/Q4odDrLr2mVmmyk/7wz3/AmmWOL9vvcjjqE2gqc/zyoI/idweWP7KUJoiFOD+ZWTPUaZ3A0HOvMWl9L5GOEApVYBDmEQMcXrII4oo4asZSBPE6Wf3yDyuU6YLwNU55sN9VguDPCnOqKDtqT3/+WRhZZZSAFA8ilGERYyOD2/t+yH6CZPGocj1JqIjTe0sleHdgcBJoJu7T8J5NOKFl4bq3Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by PA4PR04MB7920.eurprd04.prod.outlook.com (2603:10a6:102:c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 12:15:07 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9542.009; Wed, 28 Jan 2026
 12:15:07 +0000
Date: Wed, 28 Jan 2026 14:15:02 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: stuart.yoder@freescale.com, agraf@suse.de, German.Rivera@freescale.com, 
	gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
	Su Hui <suhui@nfschina.com>, Christophe Leroy <chleroy@kernel.org>
Subject: Re: [PATCH v3] bus: fsl-mc: fix an error handling in
 fsl_mc_device_add()
Message-ID: <2nwskmo3gta3fkharhzeg5fj66pymj5az7wiv7wfa4gfa3mrid@iswqizf6qhrg>
References: <20260124102054.1613093-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124102054.1613093-1-lihaoxiang@isrc.iscas.ac.cn>
X-ClientProxiedBy: AM0PR02CA0189.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::26) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|PA4PR04MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a9cce7-8e46-49c0-f672-08de5e66dfe3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?KXp2AWLTgYVzA9ltqL77+Sd7N04Fz+a9GqySSQdUQCXvM7EKw3P40BOcnnU7?=
 =?us-ascii?Q?2HT2zH6gZMDec5ijtN5/WQ1da17nk8nIPY4ew26M+NA3N+XFYiG83nyYYZq3?=
 =?us-ascii?Q?XW7ctNPYMAwP8kTjy6g6F5Ob/LepnJ40Bd71RCF3d+UnW2HFHjIREj/tnGVH?=
 =?us-ascii?Q?oekT0+23NZDRdIYxHJ3N+WtERWHu5Ko/3jsrl4MLszw999k2kwCqwyyvHUfh?=
 =?us-ascii?Q?vP0rZUtZtlb6gcR3NDyN6qjGRnQODyl/Yf+68850PcW8NbVa4ScUdiJxmC81?=
 =?us-ascii?Q?0TbP/3B2elVqPmfQxSZOAauuMwD3qhQ5WqHCN38wzj5CJefkMSOnVAjvmEGi?=
 =?us-ascii?Q?jMcTp1BF43z5v+jg3hzsy5XRK8jicOoeUDXvpuTEsj9D2i0uLXRubkUNROJf?=
 =?us-ascii?Q?mwhSR2X3HWhmlKYVfrFrtzxZjv/NqCM6MKAhePE69OYQtArsUvu5tEwM9Fec?=
 =?us-ascii?Q?FzartvrbJl2hO70PF2M173j0z3i+sY/m5FFOecFAFzw5pLkiAGbPuGtxYEsq?=
 =?us-ascii?Q?SkaerG2svqiygOGuMcl3R7pi3/bUwR+w47KqNaTbBs3IAU5hYgoq1Qjw6x8S?=
 =?us-ascii?Q?vkaPqYlQELXZYPcNxOPWuN0ZQoOGEm2dIRIEMYhecmYFm+qJd/lyeoCI4h5R?=
 =?us-ascii?Q?IKir5BKdbs2oLbiBuui2028NDHBAC7nAZqv5geqtYb7Nrwnpl5BC/84cEWc/?=
 =?us-ascii?Q?dkcXuT6cgStqWQxfrvQMpK/O4wwB3B/pVYfvyAnwLe+PgHlDww5rBmcqpMjH?=
 =?us-ascii?Q?L2n0ZvwV03hrfv3pfLG33ef1XvFnN9/YR31jwehyY4FvNCrf+x0iOu5RF0aB?=
 =?us-ascii?Q?zTd4dDKoIx2iAidV64GsAwx5lc11LEdG0CMJ6vJjzUlBhwHus91LtNSpfBHA?=
 =?us-ascii?Q?6ZgMjxJ4Xo4P9yJWz2x+5PlTWO9cRhYXhY2gAU29XZAPxdcwSLHqOTMhu+s/?=
 =?us-ascii?Q?f54+pguxuxDJx70JkaC8ewVCx6eULJ/wesv+s01IS1wJeNMIXPEYdWdsISfh?=
 =?us-ascii?Q?uG4gtiql0YdxFDj1G5CrCzOXTtWb4mhQq9G29M5ZpEq5B/JLgNnBSU2l892S?=
 =?us-ascii?Q?nhRi9gmsIT3GV+MFO7Ax9abxVzmMlwdFwj9R/rXjPEquE8Z79MKeSaVPPnD8?=
 =?us-ascii?Q?Uc2xHC6ieMjsmv/QpyiKyGgk9ZUGweAKOw64hJNZSg6jwhuYovve3QcArN4d?=
 =?us-ascii?Q?jpGdqyg7DPqdRzbRpwtlpWHgDVsC2puqRFzVoFyb6E/TgiTl+PCVRJisY0n9?=
 =?us-ascii?Q?OUPWjfPuxRq5RD/8T3d/sfrLlEZypzkzVPMb1UYo9JfnTVudRmcPoVhnkZPq?=
 =?us-ascii?Q?PHX9nUb5C1Om5phBh7QsQQgcYPnQH0ko2C1PN2VRQAP8QEyYUyq/gBVx7TF9?=
 =?us-ascii?Q?LCCFWMWydv7Gwm0dCwWoNujZBlsfoZO0/W30gPBVE+EqndK6gCl8AZk+OxRK?=
 =?us-ascii?Q?VPHpRh9bm402zs+gLZDvP4NtdxuLyBsUyGD7nbG6DHAJzZ9HWqOMn/UJnzsH?=
 =?us-ascii?Q?PcEScxthuEvbNWafy9ym31VxPtg5Fhr63nGLmRZWY61qaN31G8VvUKcn/GkH?=
 =?us-ascii?Q?mcfQOODGwJXVHzYra1tJbSHC1PTOSFqpxJEzcT8i?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?v5aW6+MehiQcMIPD1qoxM9pWtAHmuYdRNqTRFbuAA+bGFlzXFWhBJKR41qwo?=
 =?us-ascii?Q?wNaFD2Xj8PDdKMs/05kz7UXHHGlpbw3lS4Gr31LaJza7hssDJ0X44uXjf/kk?=
 =?us-ascii?Q?GnfsMAbpwr/rJFv1L3lQjZkbqEqyxemhPjYwuA8Sfj+HoQGNqKHG00piunOB?=
 =?us-ascii?Q?vj4zBCy0eqHXa7/N5KwyFjylKZ/fwMhn5rYp5eM969NCju8ca604olhsshtQ?=
 =?us-ascii?Q?c8SrOHT/xRtbMkwGxM9g/4on98J/IiVh60XASkMPHmsUEzdpKnDggEBVmHE0?=
 =?us-ascii?Q?fEVviOFB0OzyLsxnW3k4JSduusEWHRh3734t4T9PZBuJpuAwmDKVT3sbF1Nt?=
 =?us-ascii?Q?YZbzhlAibkNAkEPkIB8JrtciyE7DxZMgr03qtT56vaZg/SmTmXYAwTC8dL7J?=
 =?us-ascii?Q?Moj6NpTStmMJsn69ylyGenPVQ6nSgSuP/gnjIB4aJMFU1CoK1tkvaW99r5is?=
 =?us-ascii?Q?49OEnYh916YnYuycGP+fc/Q08eu1Wk2RpVlmnkpCd4BPDwKe1urR8Kuk0wCQ?=
 =?us-ascii?Q?kAsZAmPfThVXuaRYeBHr3k0HGMdzUFVyFQE96zlXlKtLfbW36e0siVi0ykJT?=
 =?us-ascii?Q?S8fC/vLQoBnNiFOhpptgKgnrf6eSO8MC+KIEjpdOFKeFvGs4UJ7GZ9fUaPk6?=
 =?us-ascii?Q?cmLUkoIL7M2j7KszWsriLGe8SEg3WTe17qa1RQboGIrErxRQAxfITIcf8zI6?=
 =?us-ascii?Q?B1gzzhrIFxcqSJc/SdQo7BcNRiXpxNvNspk6cHag1ciezP9LSG0Ai18ARDJM?=
 =?us-ascii?Q?zYX3GdPH/Y1DHCs+mBRHtuUReiyf8H2+i0eVNSwsGdusCzp8EbaKRLcARg2U?=
 =?us-ascii?Q?ITYODa/qTroABAjchosTpxl9366IlMlkJZW6VBOD2OoCwRp8pBc61gG8xGkb?=
 =?us-ascii?Q?AI7sQCOTdCyf5GCtRKpgTxL4yncEF1fGmb8DwTevecKizRmV2LxWJqn19x86?=
 =?us-ascii?Q?dXLta3okwBPDIJhHCZ+ofXn6bdWZL1DbSDe6HTyI3tGlcwHtY4LF8b6UAys1?=
 =?us-ascii?Q?t1GM7Yy8Qk97MPeGEcEVznZQsYwNw67iVHEMe4jqjZ2iU+pnkb/T2izS2c10?=
 =?us-ascii?Q?rX2r0/X+guvC5QigqXqA4j3/UfY8iZcDs95W2LURyryDIaLkeYD+O1JFxgdJ?=
 =?us-ascii?Q?0Fc0csBbvTVl8PrnIvTvJFL7mQp/bpiC6bAlNWT4CbwwLnrjeJVNPqpjvAMN?=
 =?us-ascii?Q?MaSnVa0ma636XjH1YofFEAzYPxbRhv7JanwLvibv7B6NVKMMKJZOovaN0Ap+?=
 =?us-ascii?Q?u8YY4ZBRz1yiUbJmSJTGsRG6x0YZNkxVpqJrf9uh64kS4I3L+oA1xPK+gLHQ?=
 =?us-ascii?Q?xKZVr902xNuD491B2JgDUYdk/8v78IPufmeakChVannDXdZXfhFcan0gyuWh?=
 =?us-ascii?Q?62PVWxxudrIB7pFB6IRENwfq8wM2rBuQ+i6oz2nZ2yRDVmWLtbBGng2w6Xph?=
 =?us-ascii?Q?NYHLj0glf/Qg/IdLdB5J+F9o0aoTK3HIVGqwED4iYtuPdR+bIr1Gq6C3MApy?=
 =?us-ascii?Q?TERzgTLGkFVxT0217OgLfD10qmpdQmUMPWuuogNUjRaiCkb4gi/r1s5dAVcb?=
 =?us-ascii?Q?QgJzswcV29ngMZtyqpo+U5J9gnrXJp5QUV9cz6qTpA4rDYiHni3PqCSFymbW?=
 =?us-ascii?Q?HGaqyZ138of7RNKRRq9CfbJmB0ENk3Yu5sDtvyD16QsvCBGdzVdhxk+92iV1?=
 =?us-ascii?Q?1RXKwBDMCXjBBLmUvTjlbN0b5tjPfQZFn6nFIvK2h8GfNfVwSOfronUypbOJ?=
 =?us-ascii?Q?qCZumSVgKw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a9cce7-8e46-49c0-f672-08de5e66dfe3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:15:07.0529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pusNfzR2y4YseyrlRTqaOLw7JsnC6Rb8TU2CNLKZ7ZwzsTPB2LyGQhs+f/5t5T/5uO9lOvUlIZUT+O2A+w2GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7920
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lihaoxiang@isrc.iscas.ac.cn,m:stuart.yoder@freescale.com,m:agraf@suse.de,m:German.Rivera@freescale.com,m:gregkh@linuxfoundation.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:dan.carpenter@linaro.org,m:suhui@nfschina.com,m:chleroy@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16357-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linaro.org:email,iscas.ac.cn:email,nfschina.com:email]
X-Rspamd-Queue-Id: 3A251A10F8
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 06:20:54PM +0800, Haoxiang Li wrote:
> In fsl_mc_device_add(), device_initialize() is called first.
> put_device() should be called to drop the reference if error
> occurs. And other resources would be released via put_device
> -> fsl_mc_device_release. So remove redundant kfree() in
> error handling path.
> 
> Fixes: bbf9d17d9875 ("staging: fsl-mc: Freescale Management Complex (fsl-mc) bus driver")
> Cc: stable@vger.kernel.org
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/b767348e-d89c-416e-acea-1ebbff3bea20@stanley.mountain/
> Signed-off-by: Su Hui <suhui@nfschina.com>
> Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>


