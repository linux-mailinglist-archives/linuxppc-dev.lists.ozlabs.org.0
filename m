Return-Path: <linuxppc-dev+bounces-16922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPJwG1vklGnhIgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 22:57:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA53151361
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 22:57:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFtmP2vvXz2xJ6;
	Wed, 18 Feb 2026 08:57:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771365461;
	cv=pass; b=KAZFfhuuemq3IbLDmB710n0pDk2Ll1dcbgnW6LL6SzLGBedarSARZmCExZbxE4gqC2hif8CKlk0Kja23HKnzOb57RDroRbrbg67oj+go8QAFdY08K0BpuHfMXSFCGO7MIogJzZPzIU9hYoHjinnUhZ74lIJvOLHGf5iGH426qsic2AATBTowcxdUu5MARwZ3wXXwwhJUcYpdWGyRdN/lXYrJ766Zp82415bQmvFjUVBXkXIVmmD9GMNaOPjh3PQmgFWuOVOg5Wabf5jf9sAr5K8Zjze9bKYpT52eUyAemjDgaeHj7ct6aweBNPfcJoOwa0j3g4w2B+7dy71FKpWN7w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771365461; c=relaxed/relaxed;
	bh=IT/ejAKDcYtFgCuPi5uaggileS+RexFVEVkFQ5r+TsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZCfYhnk4HYoWeyPkqHfgsssYC2f8EYnN9Hed+7bsZeMaLy3mb+q4+4+cNQvYjgN/ZRJexrnKFCi599jUAjiWLOaVrK6lqgHNKIFFS0I4rK6P7PCVS359eM110iBvW4bbIRRex4hSXUbRzejvR+ivhktjNmbl7yr9KOZ1+gSBpHAjhQYZxtPcmAfa8AiWCL52gb7o/lPbRFEeVj/O/fBXFxxMPT1lQJkHKPBesR5ukJcslQWewxCvqG2oRjYpib51IlHJUFwT4Z6nprrkXuNxMKwF70qpivJ2CwsWaMKjN93Y0wZahm15S80967JUwsHdG77pghiijeCjzygsEJSM8g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=npMPLIwI; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=npMPLIwI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFtmM1F9Cz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 08:57:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJjm26Cw5j7w27oDTuzt7GqAdqsMaM2mA6cfI8sK1HWCugSBDVN5zr46DKHjBtDYJ5SL7euMBCktZEfEGFRKcoKwHtn99O9vibwgcWefrL5EW75UeN72cb5w1YomgvJ1+H/yAoBoMRB5nqWTVDQAmImurpC/h5VvDQuMCBzG8sO9ggK9C7hSlmLe9EjkSRsyYIn500sbsJBLB6/TkWPmFPEwh8HPRbDbAzz5Hh0dxcqz4UFyEDrDuv0xVprIShSn2M5Ch8SgZJ++VgFMqBTCsrawflkYcsOzxJ6a0S2z70FkuP3VkU8skg/nBQWK7DhN8Bh9D+3VpWX1WKK1fiKkLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IT/ejAKDcYtFgCuPi5uaggileS+RexFVEVkFQ5r+TsI=;
 b=uw0Pg0BBKiEtA+F4U1YygQLQO3izbbQwUhQ79LH+IIoQQ2P9245t+537bhDcL/ecWNfGUiYsmKxXc6ppiVn1368QzmQgG+O93pivkUglPi4T+6YMcUJ5PXeRyDfNO/Qjo9nTmrOX45vcUXK2s+CraPHZw0jbisuvXFxeOzQZEOUs/yZsV53S9c4Yln6edKFAB5lR9ETC4E54REnO8WtLR8Oe1h984ORjEEAlvFYhn5hzcmkyVbeB+5RAnj49SzCtJYp7O9tlUgA10ZWPM3r6dxFJtdhKWxC645oqRtBWnk9uuP2KpGRmhkOv6KL7bTGDT+dd9oLCs79XL5DwFuVheA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IT/ejAKDcYtFgCuPi5uaggileS+RexFVEVkFQ5r+TsI=;
 b=npMPLIwIF0dHdxypQLm1ZRFWJftdgcylT47TmKNAFnefIxzJVoSdp4THcgOxSt9p4JMFbIphZfnvXO8Ivm2FSjUFlX1KbU5Tld2gfwjbdsJTz81OD0Bo7EP833FhZmIUHfSeaZl0uDgs3gxsriXIgYbOQBvUJWf5cWMWU3kjYO3p48iu7AthAASXEWzM4I/raI2Ls40E46QbKhbDkJlPNoFtuL2pKMKFpgtBBCNauTXRhdsPjfrjYU8nTqYSPPHNzvEQOv1M1/3gd0aG95oQRgsjK4juOwul3oOkl5F7hUFJC6cnpK17TEj8YVi4ek657TFdUnrJz4wuNeQEEa99lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7658.eurprd04.prod.outlook.com (2603:10a6:10:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 21:57:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 21:57:12 +0000
Date: Tue, 17 Feb 2026 16:57:02 -0500
From: Frank Li <Frank.li@nxp.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/9] PCI: endpoint: Introduce pci_epc_bar_type
 BAR_64BIT_UPPER
Message-ID: <aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810>
References: <20260217212707.2450423-11-cassel@kernel.org>
 <20260217212707.2450423-12-cassel@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217212707.2450423-12-cassel@kernel.org>
X-ClientProxiedBy: PH8P220CA0038.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
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
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c21af4-04da-4cdd-e2e1-08de6e6f816b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OZLjuEkbLDlTnPu41HxC6HgZ+QyL9jbLC5oT9L7iIfqxsyR+zzq4dBHdoTNP?=
 =?us-ascii?Q?IjE0x+5bPTOg7bRH6oX+PcCIdWVG6PoifbzCS0yyzdi29nkjwSlDYaPiIXi6?=
 =?us-ascii?Q?WMBHt27Z2qTHZPbykvydBjg/trgef0531uy5U4i1YXXvBmJgegg82wRzDEzY?=
 =?us-ascii?Q?4hKHG9JuQ0tFP+4DK0ZH7cCqGBMVyu7xopUn7OGc2p7lhZIrnXiL6yFYHvGV?=
 =?us-ascii?Q?F7ImsA7yGIS7+lcwF5aV7qS7XEpAEJo8mvVUWNaKlY6ELiQ1mcZY3UlLRUMM?=
 =?us-ascii?Q?WJWKzkpajYpMuLNsyTRGlSh/ECCsCaycMXyR7UCm7r58HFH11r0YQdSTyfB9?=
 =?us-ascii?Q?u64PXRAXm1v3fZNpsMxBhweOu7PCFGgVumg58hPQEUc0St6fcSHBsCq7uIHG?=
 =?us-ascii?Q?LLiOmoQcqoGq4Igmp+FNuO3ymxS5fgpyXq1QJVDHRRg+0eJGk/Rs+E/OlIWU?=
 =?us-ascii?Q?6thgCnL+k3ws8dXfcjYhiRmbWgIMqoRq7haIOom+9jE+UGu2CetPhfrs2Y1r?=
 =?us-ascii?Q?W2jqc9WaBFerH1GDOY6IWcAi8FsUEhRr/fNlr7rnKmw1VeW1yO7WnGDMtwSX?=
 =?us-ascii?Q?UFUtsP9V4euHZmg7rsjB42gfEe4x0NbSlhOcMT/GNitjTQM65MeDn1S+Lhe1?=
 =?us-ascii?Q?SU/w8yi5nrrk1rww4/6mn5Vqc5+to7G9gEB0Obsb8LzhD8TM2tFeRqxHHbSR?=
 =?us-ascii?Q?3pglFQvmM/Ocqq91SB5xwrN/daPLuD5URd/z6tANMkoYG7YiLDS54d2kUXJC?=
 =?us-ascii?Q?2XF7zjW74sNwkrGB9myEHdNVxrSaC0a15QATDN1SueP5osbImdQ5c5MlsoxE?=
 =?us-ascii?Q?01Trsj/FmI2bcMcJMS88tdGsQIdTTfjNLspquW6JNd8Bz7OVJa94ExCLH8QN?=
 =?us-ascii?Q?UaumPrSlJhgjpis9LHf80S+jseZbbf/A0PLFVQmi6OJNDOx4q48/2pbMUPGO?=
 =?us-ascii?Q?jcXnAA5x80MVERUrA5nSZ4I1AVIeSdVeqHONiHkDvjqmUwBI6vzFOCS9a7jX?=
 =?us-ascii?Q?2LuYc3NxiKuFAd0aelgc/XcZYJgoWmK+ka4901o9KWWUpbNHEbGP3j+yWCDt?=
 =?us-ascii?Q?f8DuDEUy9tOKNEediuFMUhyTAM40D2lhDsJvgd0OjsoVvOr+tRMwW5NKLs7G?=
 =?us-ascii?Q?gNrhztdKcEUxtUgTJlUoKOsBiz2+vOmPLwsvPysxHyS/+aunPNBJmTmCeJGh?=
 =?us-ascii?Q?t34/81gzn2l88X2B9kJkAoRK0PpgvxwJnQwq0O1OW4QvSs8NEaJJ783aA85H?=
 =?us-ascii?Q?hxQ42gGerAuOoM8n5ZHFX093G14RVSQyGN0n467xuhf84PfNR/IB2RgUg8It?=
 =?us-ascii?Q?8p9VdRpC0GkzqDQk3/SkGi/A0F/NFxnimBazTg6cIUiCAqz/qeOd2oydzaE6?=
 =?us-ascii?Q?Q0dFs0jLHd1Fq4mDPU1C1XtrlCheC5/pj4RVCgO8CnRv9WOPT8Qzgo8CPsu+?=
 =?us-ascii?Q?V1RTAWdk23Y27Wtl7/7SwdBE8q77g8oXbAIgC5FLBuzukHp/WuplSNBSoy1H?=
 =?us-ascii?Q?0zot1Tfj/1vZ00bsQEusr4e1DdsDlPQLP6fWYSgtN/hZD/10Y5LvdsNduwum?=
 =?us-ascii?Q?HX1KK1SPPDKgYU7KDB7lbKcgKW6NaN6EC2XDoEockVt6Qaegj4OmHFconbss?=
 =?us-ascii?Q?+hYVr/ou3alLuoA+b+fbPpA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+U5fHdF5sbdXIBk+PcnqDo4lzXLSAOcNyZzAxnIDE4iBap3ApNO5TgF/lGSJ?=
 =?us-ascii?Q?KQ0hoi6rGIF9wG0Hn+a07yZWSItqaEETw1TDgcIFo2830PXzwLg5D5TqYQOn?=
 =?us-ascii?Q?1mZLVo5y5OJ+iiznLn9FmnwAAn8jHY0rq7fgLqWIvEonUeaLvvovxMM05nXR?=
 =?us-ascii?Q?zHCaDoBnEqBb+nu/l89E7uX0X5u3cUOe4uU03MijYi+AtK2wqlF0MsV7QQQo?=
 =?us-ascii?Q?zaT976N9sl6BdSp0AwrQVp5LOS4wMgokp9WMy9xqKXus6m8yIMySlLP00Zxf?=
 =?us-ascii?Q?Bm6dreboJ/BANB9W0UuKCAdtGd0BdVeSVAGweB7Xjm1dEqKKyjwJumMT68DP?=
 =?us-ascii?Q?dw5uh3lASnmDFC9ZEESGEt+UvJvbiFbNIwWizqXxNI4Wi2PvZL3NmNmsecdW?=
 =?us-ascii?Q?04xYdNXBO4bHALgZ+AGa0g1mffU2dGFpOAfftXtHo9Lo2nqtQ5DPraSHkgd6?=
 =?us-ascii?Q?T2vxREZsusc5MxmRKp4koMPr4OOUoGXYIn5TLMPaSDuMFv2Qo01Ycujy4gIP?=
 =?us-ascii?Q?vqePr8hQpuHQ4Anm0ik9OQDZfWFhCC8rbi7oL3trjceYhbYhBeiLqe0nyJyG?=
 =?us-ascii?Q?KK4+BMv9oxSRPVR4ld+x8d4OmBr5U2YbH9JCe//K2ZjhvaMXcFBYDT9Uvv3l?=
 =?us-ascii?Q?UqaStU1U4Swy7plhvZBIBDzjZYeNm39wXK9NrHPfjApQAGVuM+LftxsJ2p4r?=
 =?us-ascii?Q?4teDX615sSQnmSb804NukhiT8WX02vXVnSV72krFoE9wNjHn1GUPI8gLV2nr?=
 =?us-ascii?Q?FlG+xD5cVpK5pijaEgTNmcgOUZpiizFsJp5mz8Gv5DSFuMiLY+mIRZQj5pKz?=
 =?us-ascii?Q?jyv+E0oywatPWoya0p6flmsXWQpRq0K9+lBYwxnR8ke2UZ87UVCCb9okUlFn?=
 =?us-ascii?Q?e/QNlYGzUQGdlgVgzK+lJFUYSbDmmIWiUJs6XNnX0YILrjO9Pnqnj59mV4jy?=
 =?us-ascii?Q?ZpemmpzfRZF0DbOJ/ndUdldLss6Eqq6AO/ba2sRHJLBkyuF0zfdr//xAcPxo?=
 =?us-ascii?Q?acv1Qn1ZbFZSC0c9lOVNjysWPBBV3m6PVTiSvtsCbcW0iFo/OeS/D241zd8q?=
 =?us-ascii?Q?y7IyPq/J5tGCdTTfEAophSqGMsi0mTwP4nJ3Xuoxflq968mwGdZH/COkXbgO?=
 =?us-ascii?Q?aFZGbEhNOk/zqnTTPzx2MZ1mSeETD/nrjf/NqIgy0l5/q/MLSIjTqvia8wO6?=
 =?us-ascii?Q?vXIBy0qRtNaLHeiz2Z9M1umcXBnqDC+UYdUhZNlMvXp8amN2xFIscqHoD+Oa?=
 =?us-ascii?Q?3HBJGqgupzr30IPUSPxCCHdbG6CC+fxbJuBV5vw1eZs5O3GIPXd7GU/jx9fI?=
 =?us-ascii?Q?19N+EEI5heWCTSZ3xtjgS6aYDDkzxhXGWvaAcRuLfNPlswcz+t8FJ9WX0zec?=
 =?us-ascii?Q?XD/8VZKSLVGgyf2FDl74V6fR273hfVkNER5gSSUgLVJk22hphihVozYUOT6G?=
 =?us-ascii?Q?BBMsHzPZLlEm/8VcvzKjeHvtpxyZEw07OPg/w53AJhNOTHpsL5evMqA+EQlB?=
 =?us-ascii?Q?Yy2I0Zfpvi6rd53B3VgfpxMPX/FhHnfE+3PshNiq6/4stHowMYH8Vkh4eQsa?=
 =?us-ascii?Q?rq2o+R+zXUjUs6PMYcpznXJuu72P7iJpVS7TdnEbU1lgknn7PfJNcyDuxnDB?=
 =?us-ascii?Q?tqCqQhMlAe6Sj2IQevXQByv3e/rOV7y8ypJzZBnZSHME82xFF0ztuaE4KffS?=
 =?us-ascii?Q?sNy5hU5QKMId4u4OGT3NldNHHYCW5zItme1dGdJWy5v2ShwM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c21af4-04da-4cdd-e2e1-08de6e6f816b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 21:57:12.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJiBk40Yl7deUHezeCf1P0cUtHlc427iDr5dsO0oxSbjczCFiSTuuwhuoEMt4v4VX5ouyIENR5A3ym4uresO+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7658
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16922-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:cassel@kernel.org,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:srikanth.thokala@intel.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kishon@kernel.org,m:mmaddireddy@nvidia.com,m:den@valinux.co.jp,m:dlemoal@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:thierryreding@gmail.com,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,google.com,intel.com,gmail.com,nvidia.com,socionext.com,renesas.com,glider.be,valinux.co.jp,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: BBA53151361
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 10:27:07PM +0100, Niklas Cassel wrote:
> Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate
> BAR_64BIT_UPPER from BAR_RESERVED.
>
> This BAR type will only be used for a BAR following a "only_64bit" BAR.
>
> This makes the BAR description more clear, and the reader does no longer
> need to check the BAR type for the preceding BAR to know how to interpret
> the BAR type.
>
> No functional changes.
>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/pci/controller/dwc/pci-layerscape-ep.c |  4 ++--
>  drivers/pci/controller/dwc/pcie-keembay.c      |  6 +++---
>  drivers/pci/controller/dwc/pcie-qcom-ep.c      |  4 ++--
>  drivers/pci/controller/dwc/pcie-tegra194.c     |  2 +-
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c  | 10 +++++-----
>  drivers/pci/controller/pcie-rcar-ep.c          |  6 +++---
>  drivers/pci/endpoint/pci-epc-core.c            |  3 ++-
>  include/linux/pci-epc.h                        |  5 ++++-
>  8 files changed, 22 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index a4a800699f89..5a03a8f895f9 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -251,9 +251,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	pci->ops = pcie->drvdata->dw_pcie_ops;
>
>  	ls_epc->bar[BAR_2].only_64bit = true;
> -	ls_epc->bar[BAR_3].type = BAR_RESERVED;
> +	ls_epc->bar[BAR_3].type = BAR_64BIT_UPPER;
>  	ls_epc->bar[BAR_4].only_64bit = true;
> -	ls_epc->bar[BAR_5].type = BAR_RESERVED;
> +	ls_epc->bar[BAR_5].type = BAR_64BIT_UPPER;
>  	ls_epc->linkup_notifier = true;
>
>  	pcie->pci = pci;
> diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> index 2666a9c3d67e..5a00b8cf5b53 100644
> --- a/drivers/pci/controller/dwc/pcie-keembay.c
> +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> @@ -313,11 +313,11 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
>  	.msi_capable		= true,
>  	.msix_capable		= true,
>  	.bar[BAR_0]		= { .only_64bit = true, },
> -	.bar[BAR_1]		= { .type = BAR_RESERVED, },
> +	.bar[BAR_1]		= { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_2]		= { .only_64bit = true, },
> -	.bar[BAR_3]		= { .type = BAR_RESERVED, },
> +	.bar[BAR_3]		= { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_4]		= { .only_64bit = true, },
> -	.bar[BAR_5]		= { .type = BAR_RESERVED, },
> +	.bar[BAR_5]		= { .type = BAR_64BIT_UPPER, },
>  	.align			= SZ_16K,
>  };
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 18460f01b2c6..e55675b3840a 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -850,9 +850,9 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
>  	.msi_capable = true,
>  	.align = SZ_4K,
>  	.bar[BAR_0] = { .only_64bit = true, },
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_2] = { .only_64bit = true, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>  };
>
>  static const struct pci_epc_features *
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 06571d806ab3..31aa9a494dbc 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1993,7 +1993,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
>  	.msi_capable = true,
>  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
>  			.only_64bit = true, },
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_2] = { .type = BAR_RESERVED, },
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
>  	.bar[BAR_4] = { .type = BAR_RESERVED, },
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index d52753060970..f873a1659592 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -426,9 +426,9 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
>  		.msix_capable = false,
>  		.align = 1 << 16,
>  		.bar[BAR_0] = { .only_64bit = true, },
> -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> +		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  		.bar[BAR_2] = { .only_64bit = true, },
> -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> +		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>  		.bar[BAR_4] = { .type = BAR_RESERVED, },
>  		.bar[BAR_5] = { .type = BAR_RESERVED, },
>  	},
> @@ -445,11 +445,11 @@ static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
>  		.msix_capable = false,
>  		.align = 1 << 12,
>  		.bar[BAR_0] = { .only_64bit = true, },
> -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> +		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  		.bar[BAR_2] = { .only_64bit = true, },
> -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> +		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>  		.bar[BAR_4] = { .only_64bit = true, },
> -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> +		.bar[BAR_5] = { .type = BAR_64BIT_UPPER, },
>  	},
>  };
>
> diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
> index 657875ef4657..9b3f5391fabe 100644
> --- a/drivers/pci/controller/pcie-rcar-ep.c
> +++ b/drivers/pci/controller/pcie-rcar-ep.c
> @@ -440,13 +440,13 @@ static const struct pci_epc_features rcar_pcie_epc_features = {
>  	/* use 64-bit BARs so mark BAR[1,3,5] as reserved */
>  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = 128,
>  			.only_64bit = true, },
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = 256,
>  			.only_64bit = true, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256,
>  			.only_64bit = true, },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_64BIT_UPPER, },
>  };
>
>  static const struct pci_epc_features*
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index 068155819c57..8de321e1c342 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -104,7 +104,8 @@ enum pci_barno pci_epc_get_next_free_bar(const struct pci_epc_features
>
>  	for (i = bar; i < PCI_STD_NUM_BARS; i++) {
>  		/* If the BAR is not reserved, return it. */
> -		if (epc_features->bar[i].type != BAR_RESERVED)
> +		if (epc_features->bar[i].type != BAR_RESERVED &&
> +		    epc_features->bar[i].type != BAR_64BIT_UPPER)
>  			return i;
>  	}
>
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index c021c7af175f..c22f8a6cf9a3 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -192,12 +192,15 @@ struct pci_epc {
>   *		   NOTE: An EPC driver can currently only set a single supported
>   *		   size.
>   * @BAR_RESERVED: The BAR should not be touched by an EPF driver.
> + * @BAR_64BIT_UPPER: Should only be set on a BAR if the preceding BAR is marked
> + *		     as only_64bit.
>   */
>  enum pci_epc_bar_type {
>  	BAR_PROGRAMMABLE = 0,
>  	BAR_FIXED,
>  	BAR_RESIZABLE,
>  	BAR_RESERVED,
> +	BAR_64BIT_UPPER,
>  };
>
>  /**
> @@ -207,7 +210,7 @@ enum pci_epc_bar_type {
>   * @only_64bit: if true, an EPF driver is not allowed to choose if this BAR
>   *		should be configured as 32-bit or 64-bit, the EPF driver must
>   *		configure this BAR as 64-bit. Additionally, the BAR succeeding
> - *		this BAR must be set to type BAR_RESERVED.
> + *		this BAR must be set to type BAR_64BIT_UPPER.
>   *
>   *		only_64bit should not be set on a BAR of type BAR_RESERVED.
>   *		(If BARx is a 64-bit BAR that an EPF driver is not allowed to
> --
> 2.53.0
>

