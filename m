Return-Path: <linuxppc-dev+bounces-16590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKfeJj90g2mFmwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 17:30:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F3FEA424
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 17:30:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5m7B39TDz2xpk;
	Thu, 05 Feb 2026 03:30:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c207::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770222646;
	cv=pass; b=CSZK3XfOFu6rTGmcLBaYIh58SLngen7mzGpBseCKiXjHJMfwKTNDSrV76T+O8GCjuiOqw4RlYozqf9G9+bgTeMsL8mZhfJG4jkqDqEt0m1xI4G83+QR5Apz//sqIk7rAmuLS1gzOj95CaXZeYf+dI1MTuncWDx4phSKbflyRNvXZnN14DMocb3HaTA1RH6FyYQgmCIxGnDoLaA0lEAFQzttIVvccfVr1qsxK8h6AOv7NozF+Ka4JuI8W+HS5xqWc1em1X46lahdL/M/0FInT2/BYv9nkuJUpodagHYDpFh1lcBXQdExNIj2SU4TbArSTDt+V61pKHsUF1xlblDXydw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770222646; c=relaxed/relaxed;
	bh=PLVplZmPHunVyWv5CwpRO3KoJ+AKrXUPIjKQCewFypY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kdsFJL2oeD3120eI4uLWAsB61qpKV+RYFcvQK3/hDq5i/cqunzV/7Ifm+wWMNJyESGT+9sOY+fLuk+Q4A055PPszZiet8oBNNa4H3BFXCdWRv3habmO0AzVQSKN6EP5q5/CtF/wmmFygd68dJQt1YKVQI1xEssLMUPglewHmmqC/F/RrQVcCAwp+ounm2nNwh05nzFzly12WoyXwCO02a/WfKCIN0lAWZvL0mwWX4l+kwoh8mmj8RlWde2Xg5YSyf5MFnV+hP8zV2bhMCJlYg4UpfUXjb3d38BpKRRtnqJYZd77CtC2Vdvmyv1aYn75ZXubYWLBNUZwKFNMrDzBDuA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Vl6ZjDJr; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Vl6ZjDJr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5m77339lz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 03:30:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmLqKrip9ACitUj9Lj+Jye+REwNDAydxK7LUFQTzWvYqxwZtHUqwhwvGFZREGBPC1VRBvMHjnGjmkKGJ/I8V8hYJDoCpQAy9NN277f2lieNBnwOYnWSK1E1WuTVMUGFA8vDL1TLWgLSiFgBV0hWTjvG47qsz4nkdfhe59mYsyovCXy62Uu7vpwVst3JnzZFCBYtBx3bp0ZjfEz1OdmvOHPZ5J2QdGNKWDOvhxJ/wPucbw7HHjAP8JfN2Bh1/8zIU1BalvKCrCx/uqSQmzZ2w2ixuFx84mHz5o8KgCPuxzVJ/ZSRp3KrtIJYOM53dymxWdQmEpOwb5F9zG4isYyE7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLVplZmPHunVyWv5CwpRO3KoJ+AKrXUPIjKQCewFypY=;
 b=F7hn/uYpbMjBV1283JkPLNgjD6+v3GGVGX0UB32qi23MJKnXY9v2aS+vwKlXc0jtJ9EyHNXhWC+dEohnoNdVaJcXcSuFpsCZ8H0VqiH3naVotGSQ+y7NCyTBrCFt7ZmidRc876kHro2I5FXPUo+MPjW5/hd+bVSCNCrvQBIERbRlxR0OSrRZA6LkJrEhRhFOGaeLODIGd6y+hYBo2MTPtHkVFAezw/t7C5iso2aX3r/7LIwhF5/3pSeKUK45BBJ9KD0j5O6l1TVa+iZYVv3hwyUWmRbHKU+D8xPngGcRjfF4Gtw75MWjAzNqG/FF0Qmu+cBNhPBraT//XEMKIIU+AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLVplZmPHunVyWv5CwpRO3KoJ+AKrXUPIjKQCewFypY=;
 b=Vl6ZjDJrHo6d+F8XQtvCQ7njkoSoA5bX1fO2iTtejpzbDbXFO6KRz5UTfSWYdKRgsWw5W+6Gvo63G9wmKcGLiuzn8963M310tyKqR6IZtI88Ik17PKGc4g6ZIfYNyeAg7Wsys4+7O+Dq/t6u6PSjfzJ6wytpfwfW7iO9bUmcGtG6T3/zUuaF8pvPXglFTZIRtyZnK1uGgSoXaKOogYgs0/vTL+1i0jAlnpdWdS+LRs9kSRlppdw/R0o157S+IQedst7vyYKHL5Ag1azFFSXhuDYnRM/w+WuQUjrjg0CP5UZvjc4b14PevbmguAFD5gw4Gal7evR3dCbssvYSrIwbWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB12175.eurprd04.prod.outlook.com (2603:10a6:102:562::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 16:30:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 16:30:12 +0000
Date: Wed, 4 Feb 2026 11:30:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC
 before DMA device for M2M
Message-ID: <aYN0CQbRwyYJDlJn@lizhi-Precision-Tower-5810>
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
 <20260203031345.3850533-3-shengjiu.wang@nxp.com>
 <aYI2KZE8/MGQ633A@lizhi-Precision-Tower-5810>
 <CAA+D8APXwucOLhhnZF7ASPufWyQs4tbxtR46UFdpm=4wRyHOyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8APXwucOLhhnZF7ASPufWyQs4tbxtR46UFdpm=4wRyHOyA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB12175:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f2c1a4-99d1-41a0-931c-08de640aabc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnBNMUFCZGFCUTliWndkd1V4TDVPczQ1OTliblp4MGtLL1pMd3MvWVJyR3Ro?=
 =?utf-8?B?aDltajMrOFk0MGJsb1hxYjMzTnptcDFRcVJHNjBZZS9SYU1lbXRLb3Z1bjYz?=
 =?utf-8?B?OGkrYmd2eFJrekNzbHN6RWVrbDBVdUdoTUNUK2pHc21vOHdOK2dHVEpKa3o5?=
 =?utf-8?B?dzFWZmNRa05oQmdFNUNhVFVTQTVhaXlhRGs1OXBYNElUUTVVdDFuRlVGUmRX?=
 =?utf-8?B?cERTZ3pOU2YycTBmN2JTbyt5UHRvQit1cmRRV1FRYUczQ0MzTHAvWWltOTRs?=
 =?utf-8?B?T2ZmNTJEdUI3bUE0Q2hUK1lhVDJvQXZQV0M3MjFwYURrczQxdnlTU3c2MHFh?=
 =?utf-8?B?aFZJNEJ1aFRiU3FRdEUyY1VzZnRMa1QwTk9yNWhkQ1VRUTBJb1pXT0lybjlT?=
 =?utf-8?B?NHorakVxeGZkaHZobERTOFNuT09BbTdJL0FJd2FUa3QrZ0xpaWxBemNMV1ly?=
 =?utf-8?B?bTVEQ2RSMTNnWEtzWEU1dEN3MGcvdUZIZ3VueHY1bjh6VGJyVmRjZG5zYzBH?=
 =?utf-8?B?cFdlYlN6SzBaeUxoa2VYNFhnTjhJc2g4TW5YUy9zTzR0MFJGVUdNd1QzVGVM?=
 =?utf-8?B?V0lTamNxMTlTbU94L2FxVW41YkZrUkxvZzdKcThGcHdiUzIyTjNhWTZicm1H?=
 =?utf-8?B?dVlHcldnc3h4cDc4VytlM29DRUVsbXJuYUZSbGxXcS9ORWZUNWl3a1NtQ1h2?=
 =?utf-8?B?UDNWdEFJTzBpVXNoRlBPMUxMQ0x3Q2x2VjZXd3NDN1FSWmwxQ2hzUHZhSFN3?=
 =?utf-8?B?cklrejVWcFo1ODBTcmg0L2JUa2hEU3dXWEhmOGFXT0I5Y2djelRtbTcvV2l6?=
 =?utf-8?B?Q3h5ZjA1RHo5NDFucE9INXZkVzF0Q1lvWk0wd1lqbzYydEt5a0c1eWFscnVX?=
 =?utf-8?B?Y3QrVWtpNDhhUnpSTEdlb0xISENWK3IwV2hlRVEvOTIvRnAxZkUvM0phTHhj?=
 =?utf-8?B?a1R6Q0ZPbEhJY3UxRTJocWJvT1ZueHM0azZKcVVHQlE1OThrYU1ha3VmOTZo?=
 =?utf-8?B?NGY2UVpLc254blRBaWxRU2ZoWnEzekZsalJsYS9scUpiYWlSaUQwVHdNMm8x?=
 =?utf-8?B?T0dMUmpwbVZSV0krZWhhZ2ZKQjVqMGF6QVdRVmdRdUtUYytJOXA2UEhvb1BV?=
 =?utf-8?B?UGxQbVQ3UkVMYXI4bVdLdlBSSlkyU2gxak5RblZibkU4d2MwTDJ3Uy9wa2ly?=
 =?utf-8?B?ZjdKOEM1a1R5U3VUeTRSbXVvVDdwWDFhWDk3dUNETTVlRys5VjFlakljSXNU?=
 =?utf-8?B?SmlpVTV5c1FlbEpWTWJKKzIwZVcwdy8xWTE5NDJZV0xyYXg5TGM3cVhYb1l2?=
 =?utf-8?B?Nm8xa1FYTFNBaXEzRDg5a0g1K1dwdGVRLzFlQ2x3ZzZpczVVOUk0WE5MVlZT?=
 =?utf-8?B?TllvcEJZYTNKVzZJQ1JHMUdaNFlveXc3R1BmSlU5anBROUpyZW1MVm9qSlBF?=
 =?utf-8?B?NGRoM0txSXptL0Y4d0hVUEtxSEpXcG02MStBaEdCTEJrSEZ5STFDQ0szYjZx?=
 =?utf-8?B?RmFBQ0ZqOVcxakpxbXN1dXpCS1N6MmlMNlVFcDBZajdSdEhZaWVSZjliaWg1?=
 =?utf-8?B?aHV4MUNtTHdtU2g0clVsblBPWklTWTUwL1MzTVppaitLa29wbkl1ak1RVUY4?=
 =?utf-8?B?NHM4a1cvMHNGbHlGd3AzRlJMNDV1UEhEZDVqMzZpSkw1dWZVemNFT3pmUXpp?=
 =?utf-8?B?TWV0MERUY2xpcmRIQ2JFNGFGZllpb2s0UFNpajVpamdDSFhtS0lIVFd4bzNK?=
 =?utf-8?B?MDNBOHBpV2h6enllZWR5MEd3TlQyMGtNRm5uVUsrUlFOV0ZQcEUveDhRVEI0?=
 =?utf-8?B?bW5RSWtiSERJQ2FUcWU2SVFBSlJlS2ptMHJkdW50dEJLUFpnaVMzRVdQb1Ba?=
 =?utf-8?B?eVZ1WWN4MmNvZEtNaXdqVjRESG1Eb2RnRlVGNUpnUmpFSXZCWGI5Ni9ERGta?=
 =?utf-8?B?T3hvV1RTZXo4Z25XRStMcVpSK3pBMy93TWQ2a29hdUJMMWpyK0hHUEI2UDJR?=
 =?utf-8?B?TWNnS2VjcFpsTGpFWWxXcHdEOUh5YmdQS280NmdmWXFpVlB6ZDE0N25oQ2lO?=
 =?utf-8?B?emk0OUVOdEdrZUo0S29HcVlmY3ZoZUI3ZEpPcGdaTkh0YkJnaWJmUS9YeW5t?=
 =?utf-8?B?U1BQbFordFlhb0ZORjFrMmlzUDc2SCtUSDloUlVzUzRKSzBQZXU3U2dBb0JV?=
 =?utf-8?Q?DnH/t5OTfGVplkABJp77+FU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU1lZHkzRXNmU3VXU0pWNFFXQUN5SnBJdGxMYXRBeTZiTVJUbG83aWlaOTJ6?=
 =?utf-8?B?QzV6MXVWVnFEUVB6eUZub2wyZkYzYjRDUkpwWlVSM0thb1lwcHJHUlptaXdp?=
 =?utf-8?B?WnVEWlhib3ZhdnNKRHFGbkxJQXFVK3VwUWFsemVGZG5oakZjUk83QUZFQ0hm?=
 =?utf-8?B?MVZIOXE5NGhDd24xUitUb3p6QWJBUmNVVXQwMktCdUI0QWhjRTJlOW5KUnVo?=
 =?utf-8?B?YlhGUEkzYk5ac2NYMEVuMzBja3VDeGRoRFJaNEt1UzdBSHNNMFpkcDhuRGc1?=
 =?utf-8?B?dm9PZkRmRTBFUWdpcFBmTStmemI0cjJFSEVzdnV5OERiQk1yaVMrclEvL012?=
 =?utf-8?B?R1hUUjFBT2w0cjd0NndtK2ZtNzJrT3d0eUZSMFd0T0p5VUlYcjZrWUlDUWtM?=
 =?utf-8?B?OUdGeUVwUWJIMXpQeldtZGMyYzJlWkdjSXk2eDMrQVBDdGR5cnduS2k2dFJz?=
 =?utf-8?B?NWNPK1JrbjZ5MjlZQVBOY0dmQXFmT1Y4Z1p2RnIrUWkyV3VBVnArcVNKdWtN?=
 =?utf-8?B?TU5Mb3hSdjJhOGMzZGIzSzFtVzRPZlY1SUFJK1IzSUxBVTdpdWtndzRDazla?=
 =?utf-8?B?VWxqeU9jRnpkbk1ReVBQdlBBRzRNSkNuL21IcHlsM2xWSVVpb3Z6dXlxd2U3?=
 =?utf-8?B?d2xKZ0wvT1hiZFpTcE04UDRqWjZCK1NuWnRLOEN6cEFWcytGbU5rNTV1b2x6?=
 =?utf-8?B?bnovaGlCcE81eldsOEtVeFhLVGpHYVlmZFRVMDdaWlR5UGZxajUvUkk2NHdk?=
 =?utf-8?B?Umt3Z0tpbjl2alV1akV0enR3Q3ZRdWNRK0gwNVpWbHVPdmw5dHdXaUxDYjIz?=
 =?utf-8?B?cXRrK0hMYm4xUnV1RjRKMU5QMVd3RktVM1I0Ly92OVdzc3FONG1pa3VKd3VG?=
 =?utf-8?B?akJHU3E2VDdIL1ZXSXluUkt4b3ZjZ0dlYjlHNkZyLzZpZk9CZnBJaUNmaWw4?=
 =?utf-8?B?RzFrVzN0NDczUmhnTWZHaXZCUGsvTXg5aHNGVEhSVFVEbGU2TlZMcWhNalNV?=
 =?utf-8?B?RHNBNVkzZ0hKblhwZ0pRS1B5RU1yTm83TjhITG1oZFdUbTZPbVIxa2lkWlBC?=
 =?utf-8?B?dzJlTXJvUEt5VTQ2a05kcm01dE05ejZlNjlDQmovLzNWcVFlL3ZSTzZCaHhr?=
 =?utf-8?B?Vy9RQitTNnZZVGlsWE0vRURkVm1IOTVCcE5SZGhjL0h1SEZqR2FWWWJHQ0V1?=
 =?utf-8?B?L1B6clBweUNFZkxWdlV6VTNXVTU0WW5OYVhrN1R3VGxrRXh5eTJ2U2p3SWVK?=
 =?utf-8?B?V243WG0xcG9uZDFPUHBrczd0djFLS1M4cEV6MkwrOVIrcFAvc2EvMGJ3bnU2?=
 =?utf-8?B?R2x4OGFhQzNiOFl1dW9FTm1nZlpxRGNLd2RWOGF1RC8zNHVIeXpCQmxqTGxK?=
 =?utf-8?B?dVIwQzZqbUpVYUdFcEgya3pnUWxWMGRPL2d6a1llRmlML3FpK0c1cjNwYmQz?=
 =?utf-8?B?MklIeW5NYjJ1ZFJia09iTFJEcVk0S3FWRTN6cnhDMlFDRW91TFpVUnh4cUNi?=
 =?utf-8?B?Uy84emhXVEtpSXZxdjhsZk1aMjQ2aHMvZmVoWkhiaXREKytUSTNTNDdNOEZn?=
 =?utf-8?B?N0Z0UWp1NjY3bFVaV0VKM2s5b0lLUFR1Y3BiMzVPbnlUOVZpTlBuSmdNeGV3?=
 =?utf-8?B?MW9UY1d3b3FGUzcxQm9VZmhGdnQwOU9oUTNXVkxXY2psSjlRMFQ5a2h0Vk1P?=
 =?utf-8?B?eWFJYjF4WlFOSFVHeXFzcTlkbHBEdFAvRENQZkJ0WG9hSTB4a2ZqcGxnNXVp?=
 =?utf-8?B?bnNBaW9Cd241cExZVVdVOTZ3SHNTbGZBMDgyK3RZNDIwQXBUbEJzU09YeXVj?=
 =?utf-8?B?VVkyREZKd0EyTHFrbTRKaXAxaXNPbGxDUWx3dGprOUQ1S0hhV25aVG9ITVkw?=
 =?utf-8?B?Kzh3Y0Q2dUdXemFRRWpEQ1BlamFhM3FobGxlZDdCZVo2d1lTK1RLRnVMaUdy?=
 =?utf-8?B?YThMc3BNVUdtS3dUQkpISlNUZUhaM0cxN3I0OTZnMnNBR3BWSWxZZ013eUJu?=
 =?utf-8?B?d1EwaXlWa0ZoaTl2cjR4ZXYxdHNBNDJuaDV2cFpoNHZXWG1WVk9wcmx3NFlj?=
 =?utf-8?B?ZERYUVpoMmJ4SVprdnUvdXB3R1lIbDdrT2dualFwZWhTQ1BkUDFPSlM0VTVT?=
 =?utf-8?B?ZnB1emtoVVFPM1JheEVCWDdtM1Q0N091ZFhhOFpWNllZTFJBb2xmRkhwVk44?=
 =?utf-8?B?MGlsQjB0STFjN0ErYlJndjAwOWJqeUhSN3N1OTRKWWxmSjFkakZmVSs5Zy9u?=
 =?utf-8?B?S21YdzlmVmxvNVFuN0o2bmt5YnlXcjhZSDBqWmx1MnRvYkFZTUhpZDl4VVYx?=
 =?utf-8?Q?ntmbeYOKzrx6u/Kq95?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f2c1a4-99d1-41a0-931c-08de640aabc3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:30:12.8656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NMqYi9ipd8AfINX6fYSEjOmZcUIBc4b/ZxwfkZi1JpuFlE6PetmLyaNxHBOgSgZQq+e14XGI28w+BRHVIFUbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12175
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
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16590-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:shengjiuwang@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 38F3FEA424
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 09:41:55AM +0800, Shengjiu Wang wrote:
> On Wed, Feb 4, 2026 at 1:53 AM Frank Li <Frank.li@nxp.com> wrote:
> >
> > On Tue, Feb 03, 2026 at 11:13:43AM +0800, Shengjiu Wang wrote:
> > > There is a limitation on i.MX952 that dma request is not cleared at the
> > > end of conversion with dma slave mode. Which causes sample is dropped
> > > from the input fifo on the second time if dma is triggered before the
> > > client device and EDMA may copy wrong data from output fifo as the output
> > > fifo is not ready in the beginning.
> > >
> > > The solution is to trigger asrc before dma on i.MX952, and add delay to
> > > wait output data is generated then start the EDMA for output, otherwise
> > > the m2m function has noise issues.
> > >
> > > So add an option to start ASRC first for M2M before ASRC is enabled on
> > > i.MX952.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  sound/soc/fsl/fsl_asrc.c        | 23 +++++++++++++++++++++++
> > >  sound/soc/fsl/fsl_asrc.h        |  4 ++++
> > >  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
> > >  sound/soc/fsl/fsl_asrc_m2m.c    |  8 +++++++-
> > >  4 files changed, 38 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > index 92fb16f7be45..b6d4f1e09e2e 100644
> > > --- a/sound/soc/fsl/fsl_asrc.c
> > > +++ b/sound/soc/fsl/fsl_asrc.c
> > > @@ -1078,6 +1078,27 @@ static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
> > >       return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> > >  }
> > >
> > > +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> > > +{
> > > +     struct fsl_asrc *asrc = pair->asrc;
> > > +     enum asrc_pair_index index = pair->index;
> > > +     int retry = 1000;
> > > +     u32 val;
> > > +     int ret;
> > > +
> > > +     /* Check output fifo status if it exceeds the watermark. */
> > > +     ret = regmap_read_poll_timeout(asrc->regmap, REG_ASRFST(index), val,
> > > +                                    (ASRFSTi_OUTPUT_FIFO_FILL(val) >= ASRC_M2M_OUTPUTFIFO_WML) ||
> > > +                                    (--retry == 0), 0, USEC_PER_SEC);
> >
> > are sure need "retry"? there are timeout, which should be equal to 'retry'.
>
> Yes, "retry" is what I want, timeout is not what I expected.

Okay, but it will be strange. you polling a register, you suppose it will
be finished below 1000 IO read, which is certain time in SoC, for example
1ms. Compare to timeout us value, 1000 is hard to understand why you choose
this value.

Frank
>
> Best regards
> Shengjiu Wang
>
> >
> > Frank
> > > +
> > > +     if (ret || !retry) {
> > > +             pair_warn("output is not ready\n");
> > > +             return false;
> > > +     }
> > > +
> > > +     return true;
> > > +}
> > > +
> > >  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
> > >  {
> > >       struct fsl_asrc_pair_priv *pair_priv = pair->private;
> > > @@ -1275,6 +1296,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
> > >
> > >       asrc_priv->soc = of_device_get_match_data(&pdev->dev);
> > >       asrc->use_edma = asrc_priv->soc->use_edma;
> > > +     asrc->start_before_dma = asrc_priv->soc->start_before_dma;
> > >       asrc->get_dma_channel = fsl_asrc_get_dma_channel;
> > >       asrc->request_pair = fsl_asrc_request_pair;
> > >       asrc->release_pair = fsl_asrc_release_pair;
> > > @@ -1289,6 +1311,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
> > >       asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
> > >       asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
> > >       asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
> > > +     asrc->m2m_output_ready = fsl_asrc_m2m_output_ready;
> > >
> > >       if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
> > >               asrc_priv->clk_map[IN] = input_clk_map_imx35;
> > > diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> > > index 1c492eb237f5..60b6865ca952 100644
> > > --- a/sound/soc/fsl/fsl_asrc.h
> > > +++ b/sound/soc/fsl/fsl_asrc.h
> > > @@ -257,6 +257,8 @@
> > >  #define ASRFSTi_OUTPUT_FIFO_WIDTH    7
> > >  #define ASRFSTi_OUTPUT_FIFO_SHIFT    12
> > >  #define ASRFSTi_OUTPUT_FIFO_MASK     (((1 << ASRFSTi_OUTPUT_FIFO_WIDTH) - 1) << ASRFSTi_OUTPUT_FIFO_SHIFT)
> > > +#define ASRFSTi_OUTPUT_FIFO_FILL(v)  \
> > > +     (((v) & ASRFSTi_OUTPUT_FIFO_MASK) >> ASRFSTi_OUTPUT_FIFO_SHIFT)
> > >  #define ASRFSTi_IAEi_SHIFT           11
> > >  #define ASRFSTi_IAEi_MASK            (1 << ASRFSTi_IAEi_SHIFT)
> > >  #define ASRFSTi_IAEi                 (1 << ASRFSTi_IAEi_SHIFT)
> > > @@ -432,10 +434,12 @@ struct dma_block {
> > >   *
> > >   * @use_edma: using edma as dma device or not
> > >   * @channel_bits: width of ASRCNCR register for each pair
> > > + * @start_before_dma: start asrc before dma
> > >   */
> > >  struct fsl_asrc_soc_data {
> > >       bool use_edma;
> > >       unsigned int channel_bits;
> > > +     bool start_before_dma;
> > >  };
> > >
> > >  /**
> > > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> > > index 0cd595b0f629..c8a1a2b5915d 100644
> > > --- a/sound/soc/fsl/fsl_asrc_common.h
> > > +++ b/sound/soc/fsl/fsl_asrc_common.h
> > > @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
> > >   * @asrc_rate: default sample rate for ASoC Back-Ends
> > >   * @asrc_format: default sample format for ASoC Back-Ends
> > >   * @use_edma: edma is used
> > > + * @start_before_dma: start asrc before dma
> > >   * @get_dma_channel: function pointer
> > >   * @request_pair: function pointer
> > >   * @release_pair: function pointer
> > > @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
> > >   * @m2m_start: function pointer
> > >   * @m2m_unprepare: function pointer
> > >   * @m2m_stop: function pointer
> > > + * @m2m_output_ready: function pointer, check output fifo ready or not
> > >   * @m2m_calc_out_len: function pointer
> > >   * @m2m_get_maxburst: function pointer
> > >   * @m2m_pair_suspend: function pointer
> > > @@ -143,6 +145,7 @@ struct fsl_asrc {
> > >       int asrc_rate;
> > >       snd_pcm_format_t asrc_format;
> > >       bool use_edma;
> > > +     bool start_before_dma;
> > >
> > >       struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, bool dir);
> > >       int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
> > > @@ -154,6 +157,7 @@ struct fsl_asrc {
> > >       int (*m2m_start)(struct fsl_asrc_pair *pair);
> > >       int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
> > >       int (*m2m_stop)(struct fsl_asrc_pair *pair);
> > > +     bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
> > >
> > >       int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
> > >       int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> > > diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> > > index f46881f71e43..77999526dd9e 100644
> > > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > > @@ -253,15 +253,21 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task
> > >       reinit_completion(&pair->complete[IN]);
> > >       reinit_completion(&pair->complete[OUT]);
> > >
> > > +     if (asrc->start_before_dma)
> > > +             asrc->m2m_start(pair);
> > > +
> > >       /* Submit DMA request */
> > >       dmaengine_submit(pair->desc[IN]);
> > >       dma_async_issue_pending(pair->desc[IN]->chan);
> > >       if (out_dma_len > 0) {
> > > +             if (asrc->start_before_dma && asrc->m2m_output_ready)
> > > +                     asrc->m2m_output_ready(pair);
> > >               dmaengine_submit(pair->desc[OUT]);
> > >               dma_async_issue_pending(pair->desc[OUT]->chan);
> > >       }
> > >
> > > -     asrc->m2m_start(pair);
> > > +     if (!asrc->start_before_dma)
> > > +             asrc->m2m_start(pair);
> > >
> > >       if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
> > >               dev_err(dev, "out DMA task timeout\n");
> > > --
> > > 2.34.1
> > >

