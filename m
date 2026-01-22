Return-Path: <linuxppc-dev+bounces-16125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Hb+Ar3kcWngMwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 09:50:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A67636F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 09:50:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxZWJ1Bw0z3bfG;
	Thu, 22 Jan 2026 19:49:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c407::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769071787;
	cv=pass; b=oTml3xxvoZpbp737N8oQA0a5rJUf0ZvOHTbiBU1Fqr3SBoPz4JjwHxDKglmko/zE0Sv+8/+4Qbv+yrDCfFOCAlBNeaTGS/Ae3kbfeVuXvyMHprpEdp/s/iUn+/3aWzmM8Kx+114sQazTRaP0z3qnlWfsgW5iL84vMtW5N5sqkJeSUFD+nGb35rj1TXJ0a2IUtmL5S4bAzFi+kQfDADjjjD/gM6pGzFbh6Tjbeqx9/qzdsSa/btprAMe8waCz46+OU4SvhfRjzw1Or/bwnMa4WHh28nPeWRXA68kfLvLku3/QyxYZliH2aP/HkCm8E86NdI47wnVXgFg8ck3X6rK3vg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769071787; c=relaxed/relaxed;
	bh=MSfDgrnt2cCrEyyJfuZXWDOIGtQenskOC5SrPBW2Y1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZBj51bDlmtrEUMV93X20Os7pMR973jA43sl43G6p5+4T0PFMJBIusEOslqWahzrsvyvtKWDp6V0bs2Qeb3CWFiTZv/fzsj6HmZz3rnj+lmAC2xZwLGN7ZVVE39eSigqyL79Tkw5QbTJXj9Ln7nUPqT2jw8zD1GCly+h3s+/d9nlFb0HwsJuhj+wiatXHzXoZXuuyRM9yn4RWZU3XPo7Ch+gliXqAF5CKpytHAUOQYU05He6UkHo2bIJ7GdmxpTffnKOgMUZDHVIGWZAglaWKTIMAAlU673anuaGGK3EvKtHZGAI36oWskuhZqUwNgi2q9B6hjItdS3jdozePch2Hew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=oYZYIQd1; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c407::3; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=oYZYIQd1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c407::3; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazlp170100003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxZWF4Fp1z2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 19:49:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ifg+ev79Q4V2XJQaYpWhjnY7PNEKfbYX6rwfhOnQYN3riE2ym+ac1ngC2PONwNhSCbni9KS3qtSDROTwzS162bQXGAo4w4V5WhjFyl/BKIDTtWePVZi3nuWOUivLCvwNw63UTR4020l3UuEnOSaSsgpgghCadY0dxdH/qp9c5wNezzaFS1f+J1L0fBeQ2CqIEUqNEclwdnmJrJ5Ic4PmBMhF4GgXfl5Y4BshoW71R//CTEAzVkI3PxboUxFDUZZjNTe0iYER70xGxVb3TfFO5gh6qFxmAHRMpgUhpHLZChbJ/Y2L9CJQfLcQ4WQJn50V/4gDCBMk2ZsfNCR1I+2JyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSfDgrnt2cCrEyyJfuZXWDOIGtQenskOC5SrPBW2Y1I=;
 b=lw3PUGT7KYN7kPzmavFo/lBfTA0fRQrv84Sc/yza4pNKtpC3+zj0AbViB1D2KMTJPOwaXRDZuwGHRAhb+QeMPYemVtjlvruzDfrhcN4PAKWsY01A7pvHzAZa5HzgrWtjldbhPlGWI5jpOFWTj+1bz1WiSg5HXJFswxJ5p25Dc1U2wzsWAHeLNAr5He2gr1u3RT6Ds0yDMfNkzKwoLL0ErPHRagYYeSBHHTn7Ei5wLi1Oz1/bhM5gJ+WyP/CqOhqwe7LVHMp2UDC++P8i9dvj49/gHsnm6MpQzhJMgLmSMEWD00OXadXji97R6P9y/QH2UlYhk3dgBT+1Fiv+ESYjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSfDgrnt2cCrEyyJfuZXWDOIGtQenskOC5SrPBW2Y1I=;
 b=oYZYIQd1DQTVbn+ZGISQAsWF+tH7klkGOjMt07/Z+YfdxPIF7DEIb3ohuync6l8Fsd/jtoGkpHtuWSPqz6hmqtC60moZyaYZVTnCvPhN9ySm0m3JCmgjPv+SKvoa39x3hljPpO+bzeHqFK0+BsFXc9OoB+ajKpclRnGv1UOti5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB5719.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 08:49:22 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:49:22 +0000
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
Subject: [PATCH v9 5/5] Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage
Date: Thu, 22 Jan 2026 17:49:09 +0900
Message-ID: <20260122084909.2390865-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122084909.2390865-1-den@valinux.co.jp>
References: <20260122084909.2390865-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 34817503-ba2a-42a4-7747-08de59932338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Ij7jb9hP6KJCT/p3Y3sslO39PkjS682v276wP7dsmzK+5Gy6z8DZYXeOFlm?=
 =?us-ascii?Q?WbR0XS5Ni3q/91wTJs/5o1+hPsVm80cqybP3R1rjQM7sTwqmLgUOEqrgPDaU?=
 =?us-ascii?Q?m6vGDSpzZBLY+jsH69CZ9z4VwCZkeM3CSEWgM2GNEOmvkA7Pbv5IvbiWs5XW?=
 =?us-ascii?Q?WDrVLwCxrMvFfStkOtu3elqrSRv3xYkN2NLGOhmp3twaUofYcTXGKAJJK1iy?=
 =?us-ascii?Q?aqC6H8eQ6BnxEAGFKngi4X3zuQqdqM4RhxC6HAYVByN/x9dF/8DO48r3Ysle?=
 =?us-ascii?Q?gCBqYTZZaYn44zjVhOVuCRJN/5JhiYK6IzgdAWArIrXQ760fQ+OxtnWd+6yj?=
 =?us-ascii?Q?q3eMOS1gT4yYNIUBE/zt0K5WmHa0LvW5kHCi6KpeZyvVR+FC7jpzW3Bc1+Q6?=
 =?us-ascii?Q?rF+ms2dkwqUhgDT7pZT/Iu5sIWn0Dd0fYw063fBgFViJrSyGercnK1fB1wwU?=
 =?us-ascii?Q?YB379ldC9zl7nqPpT9Ad0FSCrb3/JXRvBdIH1TvhPLFnRfvO8arWzP2zw3VR?=
 =?us-ascii?Q?FxyzUkk5SK24AT/b4h0K2UGXQQmgeWdXp8oLAkSOimJ0+c5eCR+nEiXW8RLH?=
 =?us-ascii?Q?e0QLBACrQnex5SNWy/Fzs9nnTzaoNE6uYAPBRtWmEosCyyyBrxgcqATQ3+uY?=
 =?us-ascii?Q?Q36NKtM6O+rnXwN71Be2z+9PKgzGjdpC2V5B8IdNL5dOPCTafBGDdLzWwuWe?=
 =?us-ascii?Q?/VqYSjn4aRofItoJFLM1Di5LxYPVuNBGrBUHTm6necswZT/mWyM6LE+FU9lf?=
 =?us-ascii?Q?oNYXYHeZ6gfPYAuEfkBXNiXOnbo49E04HoVEE6Q6yDt+qfJmtlY0Fvcdz9Zt?=
 =?us-ascii?Q?F7HikxG4NtXYBuqo530SCCJKE5Kv1bM8XDNI6r5nLSY9Bs++6XoA9s+qtXvH?=
 =?us-ascii?Q?6CFSmEz9VAWoHkT0Zrq6nD1R6Mq+acF3ae9eTv8sk2JTQJG9Fhup/3uJFbo4?=
 =?us-ascii?Q?11BeZPro1mydBjyXxCsf87FKs59fgW+mW9xPIyBFBf7XLMddAEnHhkNVjDao?=
 =?us-ascii?Q?YmU+B/GzcAg+FpvwZ0Ji8CW8KuD7aRt2UADN5d58eiMdjRYzhCzkdn3OiHgn?=
 =?us-ascii?Q?oByuOYvxL7yHWRPhG6SAx5JABhSZVu7lVp3X2JkeQK3RTVsJaz9tzaGth1Rl?=
 =?us-ascii?Q?/5Csm9gUHSRm7C2d7NV7JPDAzp+UUKEZ3wZDXkDcka3GdMDMRM6wpWjVcRce?=
 =?us-ascii?Q?FqbXLFCM7/H7uCbHWVEA1bALOUzkDcz51C8D/QGzythpHwAKuYJ/7kPewofo?=
 =?us-ascii?Q?iTdVOctzPORsS16IfTQyvYgUJWIyuHT/a6xL/ML9mWtS2OfXO4etRuIVB+En?=
 =?us-ascii?Q?f+y8x12OdF2rIJ1WTS/XjHkvSDQBrY4CzATJTzpEfxppO1PL2SHx7KujuqD/?=
 =?us-ascii?Q?LzYPwzipHCKhHvMS333eGnPHtLzzGUv5AO13kuK3hXv15ZqfnhEGO1d0ogEN?=
 =?us-ascii?Q?IIWw3e8Q5AQ/5teXfZdBhDZtTaJTovw9S0KlXr3gHpCuPZ/GiyLm4M997Ls7?=
 =?us-ascii?Q?P7NV0gCwkFRFjHMIaHpJAtAio6DYazo8ujwHTi2t658YAHtjrpJNGtTktOdr?=
 =?us-ascii?Q?Q3wqONmCXxg6dPM69Jo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(10070799003)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p7k+e1NHMI9tkdSxF8NJ1NSiOWbnDoFhLSsv1cvj6fmLdSTs3voM43KHqGAm?=
 =?us-ascii?Q?C7zsquK/Z/8rP4pByE8qqymF8awCO3iUIOtYSE+a2lrfENWXhXip/Zk/MsMp?=
 =?us-ascii?Q?1ooWvM7Qgn8j7wx3r8v6Gy3hNcBp6qfaqCgnJvNwnZUrYxnZScdfpkn2IfIh?=
 =?us-ascii?Q?1HVzt5PkwCzNRfI94fuHL32ikeumUtLOKxC7al0ZGalAY8URAaVJbiZFWVVb?=
 =?us-ascii?Q?LCOJlnpEcoBdRkBhrenDcQdWCQCE72sjmIZZHTHxMrVDVocuTLjQiTmESf4E?=
 =?us-ascii?Q?OQ7NGwPtoaDTI223NHO3+1fvd8xv05zq99jcPcWbly36dtFd+MhHDJ5N2+r4?=
 =?us-ascii?Q?p6QOSOE0ZBY6kVRAbgRfYkJT51T9np7Kup28NTVpkA3QOqHcdGbOraSZralm?=
 =?us-ascii?Q?d+stBYrlKzJwEk68z6Hq0cgoZO6/E2WyT7OiT96BzlR8ve7Gz0OceFP2xdvz?=
 =?us-ascii?Q?6rMhhwQfZL54pJqIEhdTWLKQTbuv3wa65F7TRUCqLpDrFxLxNufCPH9J0hUz?=
 =?us-ascii?Q?5/VbhbH9IwduTNUjWLNoCZYPEoEQ759SLm0Uzq2096LT7pm3a2RZUSRo1QPP?=
 =?us-ascii?Q?56mgddfy2H0Vj0loaMdJjUrlaEzlSPQlxXCMFP847catmXzAOO99eBpImrSQ?=
 =?us-ascii?Q?m7sDoUtCsar7k/viKaihU58OI7HdHCZ9PfUBTKlEJ0802sAXO51WoC8g9DAj?=
 =?us-ascii?Q?lZI0DeAnZ8zco/z7GcK81S91u/npmtUHZe229ftsSq5pCtF2y71w0snbuyob?=
 =?us-ascii?Q?FeIcmgU0SSUO6xZkjHMcLbif+xK97JGwyMZ1vCo4QPm/9cGJHoBQqarsM70k?=
 =?us-ascii?Q?injTzwQhCns3ZRSRbSeHckVzGek9y0ftrDTUu2etd4+pwy8lG2CvfPAyOrr/?=
 =?us-ascii?Q?Fh8coC/TXAOJ1W0BkcROCO6pnaLKYEfSmDw5lB2esvzQv7UepK7S24wc5J4p?=
 =?us-ascii?Q?1m0Kog8CvsZa8E3+ZSeqdrI9Y+Rtw1IRgHXP/eyq0wTo7S/OdJkqsZTdBhEN?=
 =?us-ascii?Q?Q5XOi88yhYW4uRJ9lbZa3V1xXZBwqrhNGgh4IXm84wiFAgt1OZKVLzCQY3hJ?=
 =?us-ascii?Q?jTv4Ozrr5tzW2kSowvAry5DJOv8bVBXzHQv2XfAy2Ad2NkKRYnNM/d943R+B?=
 =?us-ascii?Q?NSH2G8tX3ieSVUVg2iLt92xen+LIGr+UoHzGN9vnpF2Uu61TNoVHwQyrf2eK?=
 =?us-ascii?Q?UxvNboosh2dL2kT+7xB2+Yy4k48+glMPVDObPeQenM76IPeGmy+ty+33FxW1?=
 =?us-ascii?Q?1mPwyX/VFLTTtHBU9cEogG7gTunTxl7UUn93xb+C8DA3x8jF6Au8n5Fy289q?=
 =?us-ascii?Q?gojwyLc1lwgGWRqvBpCgqiOWc66U/m7D1VvMwIhYe/TyrsV943mEZ+p9ITq5?=
 =?us-ascii?Q?ARcNO1s0MXsioaB2Zk5eyCBmIXPMf4uUYFu4C2TlrJYdzH6pzZlipcDNHuec?=
 =?us-ascii?Q?vEm0BU1rHKLg/vjKzDr2Nhjp3JPXX2agYBt+7IGw3V1cty0kwSTI06fzgahM?=
 =?us-ascii?Q?yOmEffEE1T7k9q5qvlQS9pknLn8b14RVcDpZ39IWtc+cf69nYdjEJOePi2Rj?=
 =?us-ascii?Q?xYZdUeKR5y0B88lestAZNZ2JqXDq+F88215R3nbWzyc3AUsAwIPq6dtVaUnD?=
 =?us-ascii?Q?kW4Y36VnR6bGd+PZ1c1OLdFJo4q43KOHAxPWqC6WkBjkAo0H8LidqJi+/MNr?=
 =?us-ascii?Q?CQghwuOcH0/yeog8xyr00F53p/cIEvZrqjvMbbjjg8rB3VBGqBpuEPsNflgw?=
 =?us-ascii?Q?3Y6viTuTUj1DR/+gvY//ubeDVEgt7gzFDND2Zin7HMo9oFD788oz?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 34817503-ba2a-42a4-7747-08de59932338
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:49:21.9827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qg7U82yx8Pwqn64imMogtQ1OiEbB49d932mPHmGxS5TiGArDGUnvcwHhjg7qjikkBHptsOYPWG4nZhBjm6T6Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB5719
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16125-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,valinux.co.jp:email,valinux.co.jp:dkim,valinux.co.jp:mid]
X-Rspamd-Queue-Id: 21A67636F3
X-Rspamd-Action: no action

The current documentation implies that pci_epc_set_bar() is only used
before the host enumerates the endpoint.

In practice, some Endpoint Controllers support calling pci_epc_set_bar()
multiple times for the same BAR (without clearing it) in order to update
inbound address translations after the host has programmed the BAR base
address, which some Endpoint Functions such as vNTB already rely on.
Add document text for that.

Also document the expected call flow for BAR subrange mapping
(pci_epf_bar.num_submap / pci_epf_bar.submap), which may require a
second pci_epc_set_bar() call after the host has programmed the BAR base
address.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 Documentation/PCI/endpoint/pci-endpoint.rst | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
index 0741c8cbd74e..4697377adeae 100644
--- a/Documentation/PCI/endpoint/pci-endpoint.rst
+++ b/Documentation/PCI/endpoint/pci-endpoint.rst
@@ -95,6 +95,30 @@ by the PCI endpoint function driver.
    Register space of the function driver is usually configured
    using this API.
 
+   Some endpoint controllers also support calling pci_epc_set_bar() again
+   for the same BAR (without calling pci_epc_clear_bar()) to update inbound
+   address translations after the host has programmed the BAR base address.
+   Endpoint function drivers can check this capability via the
+   dynamic_inbound_mapping EPC feature bit.
+
+   When pci_epf_bar.num_submap is non-zero, the endpoint function driver is
+   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
+   the EPC to advertise support via the subrange_mapping EPC feature bit.
+
+   When an EPF driver wants to make use of the inbound subrange mapping
+   feature, it requires that the BAR base address has been programmed by
+   the host during enumeration. Thus, it needs to call pci_epc_set_bar()
+   twice for the same BAR (requires dynamic_inbound_mapping): first with
+   num_submap set to zero and configuring the BAR size, then after the PCIe
+   link is up and the host enumerates the endpoint and programs the BAR
+   base address, again with num_submap set to non-zero value.
+
+   Note that when making use of the inbound subrange mapping feature, the
+   EPF driver must not call pci_epc_clear_bar() between the two
+   pci_epc_set_bar() calls, because clearing the BAR can clear/disable the
+   BAR register or BAR decode on the endpoint while the host still expects
+   the assigned BAR address to remain valid.
+
 * pci_epc_clear_bar()
 
    The PCI endpoint function driver should use pci_epc_clear_bar() to reset
-- 
2.51.0


